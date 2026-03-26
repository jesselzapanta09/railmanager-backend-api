const express = require('express')
const cors    = require('cors')
const path    = require('path')
const app     = express()
require('dotenv').config()

const allowedOrigins = process.env.ALLOWED_ORIGINS.split(',').map(url => url.trim())

app.use(cors({
  origin: function(origin, callback) {
    // Allow requests with no origin (mobile apps, Postman, etc.)
    if (!origin) return callback(null, true)
    
    if (allowedOrigins.indexOf(origin) === -1) {
      return callback(new Error('CORS not allowed'), false)
    }
    return callback(null, true)
  },
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
}))


app.use(express.json())
app.use(express.urlencoded({ extended: true }))

// ── Serve uploaded images statically ────────────────────────────
app.use('/uploads', express.static(path.join(__dirname, 'uploads')))

const authRoutes  = require('./routes/auth')
const trainRoutes = require('./routes/trains')
const userRoutes  = require('./routes/users')

app.use('/api', authRoutes)
app.use('/api/trains', trainRoutes)
app.use('/api/users', userRoutes)

app.get('/', (req, res) => res.json({ success: true, message: 'RailManager API v2.0' }))
app.use((req, res) => res.status(404).json({ success: false, message: 'Route not found' }))

const PORT = process.env.PORT || 5000
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`))