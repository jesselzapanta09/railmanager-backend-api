const jwt = require('jsonwebtoken');
const db = require('../config/database');

const authenticateToken = async (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1]; // Bearer TOKEN

    if (!token) {
        return res.status(401).json({ success: false, message: 'Access token required' });
    }

    try {
        // Check if token is blacklisted (logged out)
        const [blacklisted] = await db.query(
            'SELECT id FROM token_blacklist WHERE token = ?',
            [token]
        );
        if (blacklisted.length > 0) {
            return res.status(401).json({ success: false, message: 'Token has been invalidated. Please login again.' });
        }

        const user = jwt.verify(token, process.env.JWT_SECRET);
        req.user = user;
        req.token = token;
        next();
    } catch (err) {
        return res.status(403).json({ success: false, message: 'Invalid or expired token' });
    }
};

module.exports = authenticateToken;