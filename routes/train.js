const express = require('express');
const router = express.Router();
const db = require('../config/database');
const authenticateToken = require('../middleware/auth');

// POST /api/train - Create a new train
router.post('/', authenticateToken, async (req, res) => {
    const { train_name, price, route } = req.body;
    if (!train_name || !price || !route) {
        return res.status(400).json({ success: false, message: 'All fields required' });
    }
    try {
        const [result] = await db.query(
            'INSERT INTO trains (train_name, price, route) VALUES (?, ?, ?)',
            [train_name, price, route]
        );
        res.status(201).json({
            success: true, message: 'Train created successfully',
            data: { id: result.insertId, train_name, price, route }
        });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message });
    }
});

// GET /api/train - Get all trains
router.get('/', authenticateToken, async (req, res) => {
    try {
        const [trains] = await db.query('SELECT * FROM trains ORDER BY created_at DESC');
        res.status(200).json({
            success: true, message: 'Trains retrieved successfully',
            count: trains.length, data: trains
        });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message });
    }
});

// GET /api/train/:id - Get single train
router.get('/:id', authenticateToken, async (req, res) => {
    const { id } = req.params;
    try {
        const [trains] = await db.query('SELECT * FROM trains WHERE id = ?', [id]);
        if (trains.length === 0) {
            return res.status(404).json({ success: false, message: 'Train not found' });
        }
        res.status(200).json({ success: true, data: trains[0] });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message });
    }
});

// PUT /api/train/:id - Update a train
router.put('/:id', authenticateToken, async (req, res) => {
    const { id } = req.params;
    const { train_name, price, route } = req.body;
    if (!train_name || !price || !route) {
        return res.status(400).json({ success: false, message: 'All fields required' });
    }
    try {
        const [existing] = await db.query('SELECT id FROM trains WHERE id = ?', [id]);
        if (existing.length === 0) {
            return res.status(404).json({ success: false, message: 'Train not found' });
        }
        await db.query(
            'UPDATE trains SET train_name = ?, price = ?, route = ? WHERE id = ?',
            [train_name, price, route, id]
        );
        res.status(200).json({
            success: true, message: 'Train updated successfully',
            data: { id: parseInt(id), train_name, price, route }
        });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message });
    }
});

// DELETE /api/train/:id - Delete a train
router.delete('/:id', authenticateToken, async (req, res) => {
    const { id } = req.params;
    try {
        const [existing] = await db.query('SELECT id FROM trains WHERE id = ?', [id]);
        if (existing.length === 0) {
            return res.status(404).json({ success: false, message: 'Train not found' });
        }
        await db.query('DELETE FROM trains WHERE id = ?', [id]);
        res.status(200).json({ success: true, message: 'Train deleted successfully' });
    } catch (err) {
        res.status(500).json({ success: false, message: 'Server error', error: err.message });
    }
});

module.exports = router;
