const express = require('express')
const router = express.Router()
const path = require('path')
const fs = require('fs')
const db = require('../config/database')
const { authenticateToken, requireAdmin } = require('../middleware/auth')
const { uploadTrain } = require('../utils/upload')

// GET /api/train
router.get('/', authenticateToken, async (req, res) => {
    try {
        const [trains] = await db.query('SELECT * FROM trains ORDER BY created_at DESC')
        res.status(200).json({ success: true, count: trains.length, data: trains })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// GET /api/train/:id
router.get('/:id', authenticateToken, async (req, res) => {
    try {
        const [trains] = await db.query('SELECT * FROM trains WHERE id = ?', [req.params.id])
        if (trains.length === 0)
            return res.status(404).json({ success: false, message: 'Train not found' })
        res.status(200).json({ success: true, data: trains[0] })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// POST /api/train (admin only)
router.post('/', authenticateToken, requireAdmin, uploadTrain.single('image'), async (req, res) => {
    const { train_name, price, route } = req.body
    if (!train_name || !price || !route)
        return res.status(400).json({ success: false, message: 'train_name, price, and route are required' })

    const imageUrl = req.file ? `/uploads/trains/${req.file.filename}` : null
    try {
        const [result] = await db.query(
            'INSERT INTO trains (train_name, price, route, image) VALUES (?, ?, ?, ?)',
            [train_name, price, route, imageUrl]
        )
        res.status(201).json({
            success: true, message: 'Train created',
            data: { id: result.insertId, train_name, price, route, image: imageUrl }
        })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// PUT /api/train/:id (admin only)
router.put('/:id', authenticateToken, requireAdmin, uploadTrain.single('image'), async (req, res) => {
    const { train_name, price, route } = req.body
    if (!train_name || !price || !route)
        return res.status(400).json({ success: false, message: 'All fields are required' })

    try {
        const [existing] = await db.query('SELECT * FROM trains WHERE id = ?', [req.params.id])
        if (existing.length === 0)
            return res.status(404).json({ success: false, message: 'Train not found' })

        let imageUrl = existing[0].image
        if (req.file) {
            if (imageUrl) {
                const old = path.join(__dirname, '..', imageUrl)
                if (fs.existsSync(old)) fs.unlinkSync(old)
            }
            imageUrl = `/uploads/trains/${req.file.filename}`
        }

        await db.query(
            'UPDATE trains SET train_name = ?, price = ?, route = ?, image = ? WHERE id = ?',
            [train_name, price, route, imageUrl, req.params.id]
        )
        res.status(200).json({
            success: true, message: 'Train updated',
            data: { id: parseInt(req.params.id), train_name, price, route, image: imageUrl }
        })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

// DELETE /api/train/:id (admin only)
router.delete('/:id', authenticateToken, requireAdmin, async (req, res) => {
    try {
        const [existing] = await db.query('SELECT * FROM trains WHERE id = ?', [req.params.id])
        if (existing.length === 0)
            return res.status(404).json({ success: false, message: 'Train not found' })

        if (existing[0].image) {
            const p = path.join(__dirname, '..', existing[0].image)
            if (fs.existsSync(p)) fs.unlinkSync(p)
        }
        await db.query('DELETE FROM trains WHERE id = ?', [req.params.id])
        res.status(200).json({ success: true, message: 'Train deleted' })
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message })
    }
})

module.exports = router