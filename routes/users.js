const express = require('express')
const router  = express.Router()
const bcrypt  = require('bcryptjs')
const path    = require('path')
const fs      = require('fs')
const db      = require('../config/database')
const { authenticateToken, requireAdmin } = require('../middleware/auth')
const { uploadAvatar } = require('../utils/upload')

const deleteOldAvatar = (avatarPath) => {
  if (!avatarPath) return
  const full = path.join(__dirname, '..', avatarPath)
  if (fs.existsSync(full)) fs.unlinkSync(full)
}

// GET /api/users — all users except the logged-in admin
router.get('/', authenticateToken, requireAdmin, async (req, res) => {
  try {
    const [users] = await db.query(
      `SELECT id, username, email, role, avatar, email_verified_at, created_at
       FROM users WHERE id != ? ORDER BY id DESC`,
      [req.user.id]
    )
    res.status(200).json({ success: true, count: users.length, data: users })
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error', error: err.message })
  }
})

// GET /api/users/:id
router.get('/:id', authenticateToken, requireAdmin, async (req, res) => {
  try {
    const [users] = await db.query(
      'SELECT id, username, email, role, avatar, email_verified_at, created_at FROM users WHERE id = ?',
      [req.params.id]
    )
    if (users.length === 0)
      return res.status(404).json({ success: false, message: 'User not found' })
    res.status(200).json({ success: true, data: users[0] })
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error', error: err.message })
  }
})

// POST /api/users — create user (admin, avatar optional)
router.post('/', authenticateToken, requireAdmin, uploadAvatar.single('avatar'), async (req, res) => {
  const { username, email, password, role = 'user' } = req.body

  if (!username || !email || !password)
    return res.status(400).json({ success: false, message: 'username, email, and password are required' })
  if (!['admin', 'user'].includes(role))
    return res.status(400).json({ success: false, message: 'role must be admin or user' })

  try {
    const [existing] = await db.query(
      'SELECT id FROM users WHERE email = ? OR username = ?', [email, username]
    )
    if (existing.length > 0)
      return res.status(409).json({ success: false, message: 'Username or email already exists' })

    const hashed    = await bcrypt.hash(password, 10)
    const avatarUrl = req.file ? `/uploads/avatars/${req.file.filename}` : null

    const [result] = await db.query(
      `INSERT INTO users (username, email, password, role, avatar, email_verified_at)
       VALUES (?, ?, ?, ?, ?, null)`,
      [username, email, hashed, role, avatarUrl]
    )
    res.status(201).json({
      success: true, message: 'User created successfully',
      data: { id: result.insertId, username, email, role, avatar: avatarUrl }
    })
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error', error: err.message })
  }
})

// PUT /api/users/:id — update user (avatar optional)
router.put('/:id', authenticateToken, requireAdmin, uploadAvatar.single('avatar'), async (req, res) => {
  const { username, email, role, password } = req.body
  const userId = parseInt(req.params.id)

  if (userId === req.user.id)
    return res.status(400).json({ success: false, message: 'Use Edit Profile to update your own account' })
  if (!username || !email || !role)
    return res.status(400).json({ success: false, message: 'username, email, and role are required' })
  if (!['admin', 'user'].includes(role))
    return res.status(400).json({ success: false, message: 'role must be admin or user' })

  try {
    const [existing] = await db.query('SELECT * FROM users WHERE id = ?', [userId])
    if (existing.length === 0)
      return res.status(404).json({ success: false, message: 'User not found' })

    const [taken] = await db.query(
      'SELECT id FROM users WHERE (username = ? OR email = ?) AND id != ?',
      [username, email, userId]
    )
    if (taken.length > 0)
      return res.status(409).json({ success: false, message: 'Username or email already taken' })

    // Handle avatar
    let avatarUrl = existing[0].avatar
    if (req.file) {
      deleteOldAvatar(avatarUrl)
      avatarUrl = `/uploads/avatars/${req.file.filename}`
    }
    // Allow removing avatar via remove_avatar=true
    if (req.body.remove_avatar === 'true') {
      deleteOldAvatar(avatarUrl)
      avatarUrl = null
    }

    const fields = ['username = ?', 'email = ?', 'role = ?', 'avatar = ?']
    const values = [username, email, role, avatarUrl]

    // If email changed — reset verification status
    if (email !== existing[0].email) {
      fields.push('email_verified_at = NULL')
    }

    if (password) {
      if (password.length < 6)
        return res.status(400).json({ success: false, message: 'Password must be at least 6 characters' })
      fields.push('password = ?')
      values.push(await bcrypt.hash(password, 10))
    }

    values.push(userId)
    await db.query(`UPDATE users SET ${fields.join(', ')} WHERE id = ?`, values)

    res.status(200).json({
      success: true, message: 'User updated successfully',
      data: { id: userId, username, email, role, avatar: avatarUrl }
    })
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error', error: err.message })
  }
})

// DELETE /api/users/:id
router.delete('/:id', authenticateToken, requireAdmin, async (req, res) => {
  const userId = parseInt(req.params.id)
  if (userId === req.user.id)
    return res.status(400).json({ success: false, message: 'You cannot delete your own account' })

  try {
    const [existing] = await db.query('SELECT * FROM users WHERE id = ?', [userId])
    if (existing.length === 0)
      return res.status(404).json({ success: false, message: 'User not found' })

    deleteOldAvatar(existing[0].avatar)
    await db.query('DELETE FROM users WHERE id = ?', [userId])
    res.status(200).json({ success: true, message: 'User deleted successfully' })
  } catch (err) {
    res.status(500).json({ success: false, message: 'Server error', error: err.message })
  }
})

module.exports = router