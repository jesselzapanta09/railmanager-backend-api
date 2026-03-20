-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2026 at 04:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trainappdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist`
--

CREATE TABLE `token_blacklist` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `token_blacklist`
--

INSERT INTO `token_blacklist` (`id`, `token`, `created_at`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzM2Njk0MzQsImV4cCI6MTc3Mzc1NTgzNH0.2LRz8hcRWCrHVrJkaFLSKDse8hDGxGhZsgFgiXY1PQI', '2026-03-17 07:56:38'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzM3MzQyMjcsImV4cCI6MTc3MzgyMDYyN30.Qe4HZEj_P5kzoW-taDxAqXHl1-KzzSeM-n0K_GEdjPY', '2026-03-17 08:05:38'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJpdHNtZS5ub25hbWUxMjExIiwiZW1haWwiOiJpdHNtZS5ub25hbWUxMjExQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzczNzM0NzQzLCJleHAiOjE3NzM4MjExNDN9.gJ9kgMEWAfD2t6lpEtcjMC0qepXZyV80RjYOJNmM9UA', '2026-03-17 08:05:47'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzM3MzQ3NjksImV4cCI6MTc3MzgyMTE2OX0.L68Duq91l_FUITY9jOvkPI57pdh92odfZzBt5w8JQ1o', '2026-03-17 08:08:56'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzM3MzQ5NDcsImV4cCI6MTc3MzgyMTM0N30.6OUskGdh8Qit-h_M9eqiZF7njx3wh5oIIWefrDCbm-o', '2026-03-17 08:10:12');

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `id` int(11) NOT NULL,
  `train_name` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `route` varchar(255) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `train_name`, `price`, `route`, `image`, `created_at`, `updated_at`) VALUES
(1, 'LRT Line 1', 20.00, 'Baclaran - Fernando Poe Jr. Station', '/uploads/trains/train-1773669515669.jpg', '2026-03-16 13:56:58', '2026-03-16 13:58:35'),
(2, 'LRT Line 2', 25.00, 'Recto - Antipolo', '/uploads/trains/train-1773669521202.jpg', '2026-03-16 13:56:58', '2026-03-16 13:58:41'),
(3, 'MRT Line 3', 24.00, 'North Avenue - Taft Avenue', '/uploads/trains/train-1773669526372.jpg', '2026-03-16 13:56:58', '2026-03-16 13:58:46'),
(4, 'PNR Metro Commuter Line', 30.00, 'Tutuban - Alabang', '/uploads/trains/train-1773669530184.jpg', '2026-03-16 13:56:58', '2026-03-16 13:58:50'),
(5, 'PNR Bicol Express', 450.00, 'Manila - Naga', '/uploads/trains/train-1773669535558.jpg', '2026-03-16 13:56:58', '2026-03-16 13:58:55'),
(6, 'PNR Mayon Limited', 500.00, 'Manila - Legazpi', '/uploads/trains/train-1773669542139.jpg', '2026-03-16 13:56:58', '2026-03-16 13:59:02'),
(7, 'LRT Cavite Extension', 35.00, 'Baclaran - Niog', '/uploads/trains/train-1773669548262.jpg', '2026-03-16 13:56:58', '2026-03-16 13:59:08'),
(8, 'MRT Line 7', 28.00, 'North Avenue - San Jose del Monte', '/uploads/trains/train-1773669553483.jpg', '2026-03-16 13:56:58', '2026-03-16 13:59:13'),
(9, 'North–South Commuter Railway', 60.00, 'Clark - Calamba', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58'),
(10, 'Metro Manila Subway', 35.00, 'Valenzuela - NAIA Terminal 3', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58'),
(11, 'PNR South Long Haul', 800.00, 'Manila - Matnog', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58'),
(12, 'Clark Airport Express', 120.00, 'Clark Airport - Manila', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58'),
(13, 'Mindanao Railway Phase 1', 50.00, 'Tagum - Davao - Digos', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58'),
(14, 'Panay Rail Revival', 40.00, 'Iloilo - Roxas City', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58'),
(15, 'Cebu Monorail', 25.00, 'Cebu City - Mactan Airport', NULL, '2026-03-16 13:56:58', '2026-03-16 13:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `email_verified_at`, `created_at`) VALUES
(1, 'adminsadsadsadsa', 'jesselzapanta9@gmail.com', '$2b$10$00aZRmgabxOPt.SpMJuXW.JrmcCh9Hk2zUxn.4gGzPN1j1B.FUXOW', 'admin', '2026-03-17 08:10:58', '2026-03-16 13:56:58'),
(3, 'jeszapanta9', 'jeszapanta9@gmail.com', '$2b$10$FOF7qLJ7ec9EDO0auQ91aejHpBIXa19cbHYD/WF8hl6sG/PmIpyrO', 'user', NULL, '2026-03-17 08:07:19'),
(4, 'jeszapadsadsadsanta9', 'jeszapadsadsadsanta9@gmail.com', '$2b$10$unVKSEo7HsTFVqrYbfhKSO/Rts/X6JdnT9l5daf7D76YmeSQu/iLS', 'user', NULL, '2026-03-17 08:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `type` enum('email_verify','password_reset') NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `token_blacklist`
--
ALTER TABLE `token_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
