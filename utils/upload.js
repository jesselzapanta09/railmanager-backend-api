const multer = require('multer')
const path = require('path')
const fs = require('fs')

// ── Train images ──────────────────────────────────────────────────
const trainStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        const dir = path.join(__dirname, '../uploads/trains')
        if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true })
        cb(null, dir)
    },
    filename: (req, file, cb) => {
        const ext = path.extname(file.originalname).toLowerCase()
        cb(null, `train-${Date.now()}${ext}`)
    }
})

// ── User avatars ──────────────────────────────────────────────────
const avatarStorage = multer.diskStorage({
    destination: (req, file, cb) => {
        const dir = path.join(__dirname, '../uploads/avatars')
        if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true })
        cb(null, dir)
    },
    filename: (req, file, cb) => {
        const ext = path.extname(file.originalname).toLowerCase()
        cb(null, `avatar-${Date.now()}${ext}`)
    }
})

const imageFilter = (req, file, cb) => {
    const allowed = ['.jpg', '.jpeg', '.png', '.webp']
    const ext = path.extname(file.originalname).toLowerCase()
    if (allowed.includes(ext)) cb(null, true)
    else cb(new Error('Only jpg, jpeg, png, webp images allowed'), false)
}

const limits = { fileSize: 5 * 1024 * 1024 }

module.exports = {
    uploadTrain: multer({ storage: trainStorage, fileFilter: imageFilter, limits }),
    uploadAvatar: multer({ storage: avatarStorage, fileFilter: imageFilter, limits }),
}