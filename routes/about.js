const express = require('express');
const router = express.Router();

// GET /api/about
router.get('/', async (req, res) => {
    res.json({ title: "Express JS", subtitle: "Backend Engine" });
});

module.exports = router;