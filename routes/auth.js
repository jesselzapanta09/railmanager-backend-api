const express = require('express')
const router = express.Router()
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const crypto = require('crypto')
const path = require('path')
const fs = require('fs')
const db = require('../config/database')
const { authenticateToken } = require('../middleware/auth')
const { sendVerificationEmail, sendPasswordResetEmail } = require('../utils/mailer')
const { uploadAvatar } = require('../utils/upload')

const createToken = async (userId, type, expiresInHours = 24) => {
    const token = crypto.randomBytes(32).toString('hex')
    const expiresAt = new Date(Date.now() + expiresInHours * 60 * 60 * 1000)
    await db.query('DELETE FROM user_tokens WHERE user_id = ? AND type = ?', [userId, type])
    await db.query(
        'INSERT INTO user_tokens (user_id, token, type, expires_at) VALUES (?, ?, ?, ?)',
        [userId, token, type, expiresAt]
    )
    return token
}

// POST /api/register
router.post('/register', async (req, res) => {
    const { username, email, password } = req.body
    if (!username || !email || !password)
        return res.status(400).json({ success: false, message: 'All fields are required' })
    try {
        const [existing] = await db.query(
            'SELECT id FROM users WHERE email = ? OR username = ?', [email, username]
        )
        if (existing.length > 0)
            return res.status(409).json({ success: false, message: 'Username or email already exists' })

        const hashed = await bcrypt.hash(password, 10)
        const [result] = await db.query(
            'INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)',
            [username, email, hashed, 'user']
        )
        const token = await createToken(result.insertId, 'email_verify', 24)
        await sendVerificationEmail(email, username, token)

        res.status(201).json({
            success: true,
            message: 'Account created! Please check your email to verify your account.',
            data: { id: result.insertId, username, email, role: 'user' }
        })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/login
router.post('/login', async (req, res) => {
    const { email, password } = req.body
    if (!email || !password)
        return res.status(400).json({ success: false, message: 'Email and password are required' })
    try {
        const [users] = await db.query('SELECT * FROM users WHERE email = ?', [email])
        if (users.length === 0)
            return res.status(401).json({ success: false, message: 'Invalid email or password' })

        const user = users[0]
        const isMatch = await bcrypt.compare(password, user.password)
        if (!isMatch)
            return res.status(401).json({ success: false, message: 'Invalid email or password' })

        if (!user.email_verified_at) {
            return res.status(403).json({
                success: false,
                message: 'Please verify your email before logging in.',
                code: 'EMAIL_NOT_VERIFIED'
            })
        }

        const token = jwt.sign(
            { id: user.id, username: user.username, email: user.email, role: user.role },
            process.env.JWT_SECRET,
            { expiresIn: '24h' }
        )
        res.status(200).json({
            success: true, message: 'Login successful',
            data: { token, user: { id: user.id, username: user.username, email: user.email, role: user.role } }
        })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/logout
router.post('/logout', authenticateToken, async (req, res) => {
    try {
        await db.query('INSERT INTO token_blacklist (token) VALUES (?)', [req.token])
        res.status(200).json({ success: true, message: 'Logged out successfully' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// GET /api/verify-email?token=xxx
router.get('/verify-email', async (req, res) => {
    const { token } = req.query
    if (!token)
        return res.status(400).json({ success: false, message: 'Token is required' })
    try {
        const [rows] = await db.query(
            'SELECT * FROM user_tokens WHERE token = ? AND type = "email_verify"', [token]
        )

        // Token already consumed — check if user is already verified (double-call / StrictMode case)
        if (rows.length === 0) {
            return res.status(400).json({ success: false, message: 'Invalid or expired verification link.' })
        }

        if (new Date() > new Date(rows[0].expires_at))
            return res.status(400).json({ success: false, message: 'Verification link has expired.' })

        // Check if already verified (race condition / double submit)
        const [users] = await db.query('SELECT email_verified_at FROM users WHERE id = ?', [rows[0].user_id])
        if (users.length > 0 && users[0].email_verified_at) {
            await db.query('DELETE FROM user_tokens WHERE id = ?', [rows[0].id])
            return res.status(200).json({ success: true, message: 'Email already verified! You can log in.' })
        }

        await db.query('UPDATE users SET email_verified_at = NOW() WHERE id = ?', [rows[0].user_id])
        await db.query('DELETE FROM user_tokens WHERE id = ?', [rows[0].id])
        res.status(200).json({ success: true, message: 'Email verified successfully! You can now log in.' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/resend-verification
router.post('/resend-verification', async (req, res) => {
    const { email } = req.body
    if (!email)
        return res.status(400).json({ success: false, message: 'Email is required' })
    try {
        const [users] = await db.query('SELECT * FROM users WHERE email = ?', [email])
        if (users.length === 0)
            return res.status(404).json({ success: false, message: 'No account found with that email.' })
        if (users[0].email_verified_at)
            return res.status(400).json({ success: false, message: 'Email is already verified.' })

        const token = await createToken(users[0].id, 'email_verify', 24)
        await sendVerificationEmail(email, users[0].username, token)
        res.status(200).json({ success: true, message: 'Verification email resent! Check your inbox.' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/forgot-password
router.post('/forgot-password', async (req, res) => {
    const { email } = req.body
    if (!email)
        return res.status(400).json({ success: false, message: 'Email is required' })
    try {
        const [users] = await db.query('SELECT * FROM users WHERE email = ?', [email])
        // Always succeed to prevent user enumeration
        if (users.length === 0)
            return res.status(200).json({ success: true, message: 'If that email exists, a reset link has been sent.' })

        const token = await createToken(users[0].id, 'password_reset', 1)
        await sendPasswordResetEmail(email, users[0].username, token)
        res.status(200).json({ success: true, message: 'Password reset email sent! Check your inbox.' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/reset-password
router.post('/reset-password', async (req, res) => {
    const { token, password } = req.body
    if (!token || !password)
        return res.status(400).json({ success: false, message: 'Token and new password are required' })
    if (password.length < 6)
        return res.status(400).json({ success: false, message: 'Password must be at least 6 characters' })
    try {
        const [rows] = await db.query(
            'SELECT * FROM user_tokens WHERE token = ? AND type = "password_reset"', [token]
        )
        if (rows.length === 0)
            return res.status(400).json({ success: false, message: 'Invalid or expired reset link.' })
        if (new Date() > new Date(rows[0].expires_at))
            return res.status(400).json({ success: false, message: 'Reset link has expired. Please request a new one.' })

        const hashed = await bcrypt.hash(password, 10)
        await db.query('UPDATE users SET password = ? WHERE id = ?', [hashed, rows[0].user_id])
        await db.query('DELETE FROM user_tokens WHERE id = ?', [rows[0].id])
        res.status(200).json({ success: true, message: 'Password reset successfully! You can now log in.' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/change-password (authenticated)
router.post('/change-password', authenticateToken, async (req, res) => {
    const { currentPassword, newPassword } = req.body
    if (!currentPassword || !newPassword)
        return res.status(400).json({ success: false, message: 'Both passwords are required' })
    if (newPassword.length < 6)
        return res.status(400).json({ success: false, message: 'New password must be at least 6 characters' })
    try {
        const [users] = await db.query('SELECT * FROM users WHERE id = ?', [req.user.id])
        const isMatch = await bcrypt.compare(currentPassword, users[0].password)
        if (!isMatch)
            return res.status(401).json({ success: false, message: 'Current password is incorrect' })

        const hashed = await bcrypt.hash(newPassword, 10)
        await db.query('UPDATE users SET password = ? WHERE id = ?', [hashed, req.user.id])
        res.status(200).json({ success: true, message: 'Password changed successfully!' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/update-profile (authenticated)
router.post('/update-profile', authenticateToken, uploadAvatar.single('avatar'), async (req, res) => {
    const { username, email, remove_avatar } = req.body
    if (!username)
        return res.status(400).json({ success: false, message: 'Username is required' })

    try {
        const [users] = await db.query('SELECT * FROM users WHERE id = ?', [req.user.id])
        const current = users[0]

        // Check username uniqueness
        if (username !== current.username) {
            const [taken] = await db.query(
                'SELECT id FROM users WHERE username = ? AND id != ?', [username, req.user.id]
            )
            if (taken.length > 0)
                return res.status(409).json({ success: false, message: 'Username is already taken' })
        }

        // Check email uniqueness
        if (email && email !== current.email) {
            const [taken] = await db.query(
                'SELECT id FROM users WHERE email = ? AND id != ?', [email, req.user.id]
            )
            if (taken.length > 0)
                return res.status(409).json({ success: false, message: 'Email is already in use by another account' })
        }

        // Handle avatar
        let avatarUrl = current.avatar
        if (req.file) {
            if (avatarUrl) {
                const old = path.join(__dirname, '..', avatarUrl)
                if (fs.existsSync(old)) fs.unlinkSync(old)
            }
            avatarUrl = `/uploads/avatars/${req.file.filename}`
        }
        if (remove_avatar === 'true') {
            if (avatarUrl) {
                const old = path.join(__dirname, '..', avatarUrl)
                if (fs.existsSync(old)) fs.unlinkSync(old)
            }
            avatarUrl = null
        }

        const newEmail = email || current.email
        const emailChanged = newEmail !== current.email

        await db.query(
            `UPDATE users SET username = ?, email = ?, avatar = ?${emailChanged ? ', email_verified_at = NULL' : ''} WHERE id = ?`,
            [username, newEmail, avatarUrl, req.user.id]
        )

        const [updated] = await db.query(
            'SELECT id, username, email, role, avatar FROM users WHERE id = ?', [req.user.id]
        )

        res.status(200).json({
            success: true,
            message: emailChanged
                ? 'Email updated! Please verify your new email address before logging in again.'
                : 'Profile updated successfully!',
            data: updated[0],
            emailChanged,
        })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

module.exports = router