const express = require('express')
const cors    = require('cors')
const path    = require('path')
const app     = express()
require('dotenv').config()

const allowedOrigins = process.env.CLIENT_URLS.split(',')

app.use(cors({
  origin: function(origin, callback) {
    if (!origin) return callback(null, true)

    if (allowedOrigins.includes(origin)) {
      callback(null, true)
    } else {
      callback(new Error('Not allowed by CORS'))
    }
  },
  methods: ['GET','POST','PUT','DELETE','OPTIONS'],
  allowedHeaders: ['Content-Type','Authorization'],
  credentials: true
}))


app.use(express.json())
app.use(express.urlencoded({ extended: true }))

// ── Serve uploaded images statically ────────────────────────────
app.use('/uploads', express.static(path.join(__dirname, 'uploads')))

const authRoutes  = require('./routes/auth')
const trainRoutes = require('./routes/train')
const userRoutes  = require('./routes/users')

app.use('/api', authRoutes)
app.use('/api/train', trainRoutes)
app.use('/api/users', userRoutes)

app.get('/', (req, res) => res.json({ success: true, message: 'RailManager API v2.0' }))
app.use((req, res) => res.status(404).json({ success: false, message: 'Route not found' }))

const PORT = process.env.PORT || 5000
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`))