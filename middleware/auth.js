const jwt = require('jsonwebtoken')
const db = require('../config/database')

// ── Verify JWT + check blacklist ──────────────────────────────
const authenticateToken = async (req, res, next) => {
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]

    if (!token) {
        return res.status(401).json({ success: false, message: 'Access token required' })
    }

    try {
        const [blacklisted] = await db.query(
            'SELECT id FROM token_blacklist WHERE token = ?', [token]
        )
        if (blacklisted.length > 0) {
            return res.status(401).json({ success: false, message: 'Token has been invalidated. Please login again.' })
        }

        const decoded = jwt.verify(token, process.env.JWT_SECRET)
        req.user = decoded   // { id, username, email, role }
        req.token = token
        next()
    } catch (err) {
        return res.status(403).json({ success: false, message: 'Invalid or expired token' })
    }
}

// ── Admin-only guard (use AFTER authenticateToken) ────────────
const requireAdmin = (req, res, next) => {
    if (req.user?.role !== 'admin') {
        return res.status(403).json({ success: false, message: 'Admin access required' })
    }
    next()
}

module.exports = { authenticateToken, requireAdmin }