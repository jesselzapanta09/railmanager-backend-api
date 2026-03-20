CREATE DATABASE IF NOT EXISTS trainappdb;
USE trainappdb;

-- ── Users ──────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  username          VARCHAR(100) NOT NULL UNIQUE,
  email             VARCHAR(150) NOT NULL UNIQUE,
  password          VARCHAR(255) NOT NULL,
  role              ENUM('admin','user') NOT NULL DEFAULT 'user',
  avatar            VARCHAR(500) NULL DEFAULT NULL,
  email_verified_at TIMESTAMP NULL DEFAULT NULL,
  created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ── Email / password tokens ────────────────────────────────────
-- type: 'email_verify' | 'password_reset'
CREATE TABLE IF NOT EXISTS user_tokens (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT NOT NULL,
  token      VARCHAR(255) NOT NULL UNIQUE,
  type       ENUM('email_verify','password_reset') NOT NULL,
  expires_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ── Trains ────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS trains (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  train_name VARCHAR(150) NOT NULL,
  price      DECIMAL(10,2) NOT NULL,
  route      VARCHAR(255) NOT NULL,
  image      VARCHAR(500) NULL DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ── JWT blacklist ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS token_blacklist (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  token      TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ── Seed admin (pre-verified, password: jesselzapanta) ───────────
INSERT IGNORE INTO users (username, email, password, role, email_verified_at)
VALUES (
  'admin',
  'jesselzapanta@gmail.com',
  '$2b$10$2Y/vKNqzuoXYNofyNQpIkeaUCCw7aJZ2wqZEMjfI78rUN8Z4LbvHm',
  'admin',
  NOW()
);

-- ── train ───────────
INSERT INTO `trains` (`train_name`, `price`, `route`) VALUES
('LRT Line 1', 20.00, 'Baclaran - Fernando Poe Jr. Station'),
('LRT Line 2', 25.00, 'Recto - Antipolo'),
('MRT Line 3', 24.00, 'North Avenue - Taft Avenue'),
('PNR Metro Commuter Line', 30.00, 'Tutuban - Alabang'),
('PNR Bicol Express', 450.00, 'Manila - Naga'),
('PNR Mayon Limited', 500.00, 'Manila - Legazpi'),
('LRT Cavite Extension', 35.00, 'Baclaran - Niog'),
('MRT Line 7', 28.00, 'North Avenue - San Jose del Monte'),
('North–South Commuter Railway', 60.00, 'Clark - Calamba'),
('Metro Manila Subway', 35.00, 'Valenzuela - NAIA Terminal 3'),
('PNR South Long Haul', 800.00, 'Manila - Matnog'),
('Clark Airport Express', 120.00, 'Clark Airport - Manila'),
('Mindanao Railway Phase 1', 50.00, 'Tagum - Davao - Digos'),
('Panay Rail Revival', 40.00, 'Iloilo - Roxas City'),
('Cebu Monorail', 25.00, 'Cebu City - Mactan Airport');
