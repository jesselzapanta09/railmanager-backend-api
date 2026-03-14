const express = require('express');
const app = express();
require('dotenv').config(); 

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
const authRoutes = require('./routes/auth');
const trainRoutes = require('./routes/train');

app.use('/api', authRoutes);
app.use('/api/train', trainRoutes);

// Root endpoint
app.get('/', (req, res) => {
    res.json({
        success: true,
        message: 'Train Management API is running',
        version: '1.0.0',
        endpoints: {
            auth: ['POST /api/register', 'POST /api/login', 'POST /api/logout'],
            train: [
                'POST   /api/train',
                'GET    /api/train',
                'GET    /api/train/:id',
                'PUT    /api/train/:id',
                'DELETE /api/train/:id'
            ]
        }
    });
});

// 404
app.use((req, res) => {
    res.status(404).json({ success: false, message: 'Route not found' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});