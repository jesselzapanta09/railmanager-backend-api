-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 02:11 PM
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
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzM3MzQ5NDcsImV4cCI6MTc3MzgyMTM0N30.6OUskGdh8Qit-h_M9eqiZF7njx3wh5oIIWefrDCbm-o', '2026-03-17 08:10:12'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQwMDU4OTMsImV4cCI6MTc3NDA5MjI5M30.4o3MtlzeOr1TyEBt58Ve03A89WHcT9kV9fIf2ZfkS28', '2026-03-20 11:24:59'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbnNhZHNhZHNhZHNhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQwMDU5NTksImV4cCI6MTc3NDA5MjM1OX0.OocnCMrrmAj-UUqP8WfDVlONSUj3VkU7wM4XZfWGAS8', '2026-03-20 11:51:31'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbnNhZHNhZHNhZHNhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQwMDc1NDQsImV4cCI6MTc3NDA5Mzk0NH0.CymNvsQEAAw6GTojBbPa85QzIzIXOE3qGr1JcEbBncs', '2026-03-20 12:04:02'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhOSIsImVtYWlsIjoiamVzc2VsemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzc0MDA4MjUzLCJleHAiOjE3NzQwOTQ2NTN9.9VjtH11Kq4l983GaGIMYqKKQ8TlAWCIELviLwO26-ZM', '2026-03-20 12:08:43'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQwMDg1MzcsImV4cCI6MTc3NDA5NDkzN30.L-d1kIuC7jslBpTXLRuPRrtQlP3eRM2ja1H3EGSaFYY', '2026-03-20 12:19:51'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQwMDkyMDUsImV4cCI6MTc3NDA5NTYwNX0.nI7A0YHYdkogLFNv0eEcT-qizEiFeWS7DVLpVAiTE90', '2026-03-20 12:20:48'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAwOTMwNiwiZXhwIjoxNzc0MDk1NzA2fQ.PmXA0JkcAjD36msh42Ju1UVtL604XTSlmf6XlVVstIg', '2026-03-20 12:31:59'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQwMDk5NDUsImV4cCI6MTc3NDA5NjM0NX0.JbJ6qL0f-OUdSMfUZr8PJqk8y9jBUF30_p_K_MDQbqY', '2026-03-20 12:33:02'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAwOTk5MywiZXhwIjoxNzc0MDk2MzkzfQ.o9esDATy0ttQvNp7IdCSWTpxbHPC-QdFy27lpT1a_N4', '2026-03-20 12:34:08'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxMDA1OSwiZXhwIjoxNzc0MDk2NDU5fQ.l6oT6Qh6dgbYKzICssgd7VQ2XBgAp-CE_1XyApPULZk', '2026-03-20 13:25:40'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxMzE0NSwiZXhwIjoxNzc0MDk5NTQ1fQ.nwOw257AJ1qQNfLFdmeV9Nev8E8iW0PvNSQ3KZu6FAM', '2026-03-20 13:26:11'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxMzE5MiwiZXhwIjoxNzc0MDk5NTkyfQ.nr6WoSu5yGABk_FPJKajCsyKnori2-01Tn79PLMWTJ8', '2026-03-20 13:27:59'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxMzMwOCwiZXhwIjoxNzc0MDk5NzA4fQ.r49kd50-tZ_ymq8WYCtnC_vV--3Y5nsC6Jt81fhi0OI', '2026-03-20 13:32:03'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxMzUzNSwiZXhwIjoxNzc0MDk5OTM1fQ.s39YoKJltGrM30V37wSa3VOPKoEvIHVw-8pUaEyVKM4', '2026-03-20 13:56:23'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxNDk4OSwiZXhwIjoxNzc0MTAxMzg5fQ.IYWDqRDrAWPyif8I04QICkmfm1YZ-7LCoprXJwHzE6A', '2026-03-20 13:56:30'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxNDk5OCwiZXhwIjoxNzc0MTAxMzk4fQ.IhhSCniB4N4GcNlt5prs0jgaJ0uWzDIJu0qU1mNq-4c', '2026-03-20 14:11:32'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxNTkxOSwiZXhwIjoxNzc0MTAyMzE5fQ.ANswhtGkP8gw46xGluHNK8MJSRYaeZByUjJUj3cRv-E', '2026-03-20 14:12:52'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDA5MjM1MiwiZXhwIjoxNzc0MTc4NzUyfQ.Si21SZ6l2TPJBZG1GDDbgycWhXyYB2WRnWrFGeqH4Mk', '2026-03-21 11:28:18'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDA5MjQ5OSwiZXhwIjoxNzc0MTc4ODk5fQ.5O3bH-J8MuMa9bdVSBFGJ3ViX_ILli7pH2OXDl2gRcA', '2026-03-21 12:05:13'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDA5NDczNCwiZXhwIjoxNzc0MTgxMTM0fQ.zP5jjDzIDR9dFblSgqR_-9i4fucVDJcUdBZck8G5Jpg', '2026-03-21 12:10:28'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDA5NzAxNSwiZXhwIjoxNzc0MTgzNDE1fQ.sObrkoOeZaqd3RJO67eMeiT4o1nJYg8QSeo44SSK1Fs', '2026-03-21 12:43:46'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwidXNlcm5hbWUiOiJqZXNkc2Fkc2Fkc2Fkc2F6YXBhbnRhOSIsImVtYWlsIjoiamVzZHNhZHNhZHNhZHNhemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQwOTgxODEsImV4cCI6MTc3NDE4NDU4MX0.iGh_z6FzxHYINgTwt14yuVg0Ij03oZG-rJb_q-Ejc_g', '2026-03-21 13:03:08'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQwOTg1MjgsImV4cCI6MTc3NDE4NDkyOH0.C9DC6IvK6jG1m0S3t4cz1h68Emx8WDhUcj6FZZhYbGY', '2026-03-21 13:09:16'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQwOTkwMzQsImV4cCI6MTc3NDE4NTQzNH0.CC39oMgmv6_gRzHJFmRmeh26AR36HodlzwtEYuwfeo4', '2026-03-21 13:17:20'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDAxODUzNiwiZXhwIjoxNzc0MTA0OTM2fQ.usmpV_jY9SKJ7hSsecidthYWrkBKfNFIjYI2g7nnUVk', '2026-03-21 13:45:38'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTQsInVzZXJuYW1lIjoiamVzemFwYW50YTlkc2RzYWRzYSIsImVtYWlsIjoiamVzemFwYW50YTlkc2RzYWRzYUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTc3NDEwMjEwNywiZXhwIjoxNzc0MTg4NTA3fQ.KUF_VgMl8zZZsBUcq5f6NMY5ts2dPH56nIFO15odgOY', '2026-03-21 14:08:29'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxMDIxNzksImV4cCI6MTc3NDE4ODU3OX0.SsCSLo4odKu1YC-4WWSKo52p2uIl7BIORUT7xVGnyOA', '2026-03-21 14:30:57'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoibWVsZGhlZWNsYWlyZSIsImVtYWlsIjoibWVsZGhlZWNsYWlyZUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTc3NDEwMzU2NywiZXhwIjoxNzc0MTg5OTY3fQ.v3QHKsq3J55smitfTkIiHSaC3SGP8mf3pTBep2_T-Sc', '2026-03-21 14:32:56'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoibWVsZGhlZWNsYWlyZSIsImVtYWlsIjoibWVsZGhlZWNsYWlyZUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxMDM2MDksImV4cCI6MTc3NDE5MDAwOX0.4NhgNy4PfmaikgHCZoTZBAYbg6cpUVNDRB5rn1AsIzw', '2026-03-21 14:37:51'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsInVzZXJuYW1lIjoiamVzemFwYW50YTY5NjkiLCJlbWFpbCI6Implc3phcGFudGE2OTY5QGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0MTAzOTE0LCJleHAiOjE3NzQxOTAzMTR9.OQd04nGIx3wKrE-jGY5Amecr7jPuC5_Hts2W5QiSh9Q', '2026-03-21 14:39:17'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxMDUxMDUsImV4cCI6MTc3NDE5MTUwNX0.bXLVMbDRQIWITKyATFq9Wma319K-dBEMLksfrSH3hEQ', '2026-03-21 15:00:23'),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQxMDUyMjYsImV4cCI6MTc3NDE5MTYyNn0.M1v_iEHG57lwPiIqZN1ykW8W2bXppF4los9vkMUdD94', '2026-03-21 15:01:36'),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQxNDM0OTEsImV4cCI6MTc3NDIyOTg5MX0.uyPrT89R6o_msncgL0IcYYZGqS6CC43D67zf2KPdDqw', '2026-03-22 02:03:39'),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNDUwMzEsImV4cCI6MTc3NDIzMTQzMX0.9cGmwlo-dCM___jGzIkWPmflzNu0FzlKJP8AeAK1VO0', '2026-03-22 02:07:51'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQxNDU2MDgsImV4cCI6MTc3NDIzMjAwOH0.SThh3kNUDVzQjZujpPLNc6KxYd0B0kxAQtkjWckt7AA', '2026-03-22 02:16:30'),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQxNDYxODUsImV4cCI6MTc3NDIzMjU4NX0.ZmGuabOYB7-BguN32IOYnHy45xoIZs5eTbPwv74UhA8', '2026-03-22 02:32:21'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQxNTIwODgsImV4cCI6MTc3NDIzODQ4OH0.yRMsZ9Myh5Fei7j2UsCiMZJavvryWsjsLSZE5pdmG_Y', '2026-03-22 04:01:31'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJuYW1lIjoiamVzemFwYW50YWRzYWRzYTkiLCJlbWFpbCI6Implc3phcGFudGFkc2Fkc2E5QGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDE1MzM5NSwiZXhwIjoxNzc0MjM5Nzk1fQ.db0Uxn9d9a6dGvMxOFDF7rYj01CDkWmR_Jf_cldCVNI', '2026-03-22 04:23:19'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsInVzZXJuYW1lIjoianNzc3Nzc3Nzc3NzZXN6YXBhbnRhOSIsImVtYWlsIjoianNzc3Nzc3Nzc3NzZXN6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNTQwMTIsImV4cCI6MTc3NDI0MDQxMn0.CvRl0fF3Yzh_3qjhxAgFhgwIPg94wOycHf06iJlxj58', '2026-03-22 04:33:34'),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsInVzZXJuYW1lIjoianNzc3Nzc3Nzc3NzZXN6YXBhbnRhOSIsImVtYWlsIjoianNzc3Nzc3Nzc3NzZXN6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNTQ3ODUsImV4cCI6MTc3NDI0MTE4NX0.T7vmBWTEonq--u-aUiclW_Kac1meD-gI_P_K3CfK5dw', '2026-03-22 04:46:27'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjIsInVzZXJuYW1lIjoianNzc3Nzc3Nzc3NzZXN6YXBhbnRhOSIsImVtYWlsIjoianNzc3Nzc3Nzc3NzZXN6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNTUyNzksImV4cCI6MTc3NDI0MTY3OX0.91dxl2SPZhKPeK-D3FOsAQufECLt6CzXogRP5jR0JHc', '2026-03-22 04:55:12'),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNTUzNDksImV4cCI6MTc3NDI0MTc0OX0.QVTy0KPf-Kpzhl4etLiJ3bpULmevdR7XZvyu-6P30rc', '2026-03-22 05:13:33'),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNTY0MjEsImV4cCI6MTc3NDI0MjgyMX0.mhv06akGxxuZ5EAbbR3Xn0-gAJZmOc3MItjctnubR9A', '2026-03-22 06:05:01'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJqZXNzZWx6YXBhbnRhIiwiZW1haWwiOiJqZXNzZWx6YXBhbnRhOUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNTk3MzgsImV4cCI6MTc3NDI0NjEzOH0.0pbZNQJdLp8d3MU9P26V1RDD97CPrqveH3_KQjtjqDk', '2026-03-22 08:13:11'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJKZXNzZWwgWmFwYW50YSIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQxNjcyMzYsImV4cCI6MTc3NDI1MzYzNn0.3PCfUYx6Nz6DBCBrEk87Q_zo8LMks19OdbFbESCTjjg', '2026-03-22 08:14:21'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQyNjIzNzUsImV4cCI6MTc3NDM0ODc3NX0.A-jqGAY-6WtNFsUTZjr9Sfu7cQpnVjRmmhOXAXkRAVw', '2026-03-23 10:40:09'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJKZXNzZWwgWmFwYW50YSIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjI0NjYsImV4cCI6MTc3NDM0ODg2Nn0.db-UT8jevStQDBjQAygrOEqst2gbTwWqPkgF3aia5WE', '2026-03-23 10:44:14'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQyNjI2NTgsImV4cCI6MTc3NDM0OTA1OH0.IuracA95koMWjuSd27RGpxNg_dFyjyDgydasc1Ahkfs', '2026-03-23 11:29:15'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJqZXN6YXBhbnRhOSIsImVtYWlsIjoiamVzemFwYW50YTlAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQyNjU0MjQsImV4cCI6MTc3NDM1MTgyNH0.OwUewSmcCvv3P8XhxeW5iVHPjhbZMJT0lsckOWonYgE', '2026-03-23 11:36:49'),
(55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJKZXNzZWwgWmFwYW50YSIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjYzMjUsImV4cCI6MTc3NDM1MjcyNX0._tolGLIxWczDBGGivxvpFZsE9ledE3IcENJakrkCuno', '2026-03-23 11:46:12'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJKZXNzZWwgWmFwYW50YSIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjYzODcsImV4cCI6MTc3NDM1Mjc4N30.l1aGe8t_uJgsNDe6zFjPNb2ZTjT5EcrbxLzVJKlcV-w', '2026-03-23 11:51:50'),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJKZXNzZWwgWmFwYW50YSIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjU4MTgsImV4cCI6MTc3NDM1MjIxOH0.S1NtDqvSRCdQVEFGxetHuA-iqLiFsKqCPad-q7-F5uI', '2026-03-23 11:56:34'),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJKZXNzZWwgWmFwYW50YSIsImVtYWlsIjoiamVzc2VsemFwYW50YUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjkwMzQsImV4cCI6MTc3NDM1NTQzNH0.hQcXsCK02X6eggAnvnHy3fNqaU1K42R6hJueSZwtnqI', '2026-03-23 12:30:42'),
(59, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInVzZXJuYW1lIjoianVhbmRlbGFjcnV6IiwiZW1haWwiOiJqdWFuZGVsYWNydXpAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzc0MjY5MTY1LCJleHAiOjE3NzQzNTU1NjV9.W0Yk-5CNpUsEd7_2sUAkO1B7l-grOUuSwxP3or-H7Us', '2026-03-23 12:33:04'),
(60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjksInVzZXJuYW1lIjoianVhbmRlbGFjcnV6MSIsImVtYWlsIjoianVhbmRlbGFjcnV6MUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjkzMTMsImV4cCI6MTc3NDM1NTcxM30.pAcwomq7ZQlSZ4MycCpQ8r1lcpFPDR06h-1kesPT0Ww', '2026-03-23 12:35:31'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInVzZXJuYW1lIjoianVhbmRlbGFjcnV6IiwiZW1haWwiOiJqdWFuZGVsYWNydXpAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzc0MjY5MzM2LCJleHAiOjE3NzQzNTU3MzZ9.lMvMR8GoLhTHhZMRMOs9IR91u_zE8eJUPOgzOT2xaq8', '2026-03-23 12:35:38'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInVzZXJuYW1lIjoianVhbmRlbGFjcnV6IiwiZW1haWwiOiJqdWFuZGVsYWNydXpAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzc0MjY5Mzc5LCJleHAiOjE3NzQzNTU3Nzl9.DLZlllsVnI4KZ3CD1ght832Ou_8zub6xxD5gcZNQHuY', '2026-03-23 12:37:57'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjksInVzZXJuYW1lIjoianVhbmRlbGFjcnV6MSIsImVtYWlsIjoianVhbmRlbGFjcnV6MUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NzQyNjk1MDUsImV4cCI6MTc3NDM1NTkwNX0.Tyq4HRy4MS0H6vStZ7NjcK6gzVW1TsOzEudmzenMdSs', '2026-03-23 12:38:29'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInVzZXJuYW1lIjoiSnVhbiBEZWxhIENydXoiLCJlbWFpbCI6Imp1YW5kZWxhY3J1ejlAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzc0MjY5NTU5LCJleHAiOjE3NzQzNTU5NTl9.EBxtMrFeNVRB9iHCEUdLbTLGH6Nw_0OBxx2v83KQwfU', '2026-03-23 12:39:55'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInVzZXJuYW1lIjoiSnVhbiBEZWxhIENydXoiLCJlbWFpbCI6Imp1YW5kZWxhY3J1ejlAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzc0MjY5NjEyLCJleHAiOjE3NzQzNTYwMTJ9.cF9UMSBGOz6_zI_fXKvzvk2mEKyCB-Jt4HKXd36qDcs', '2026-03-23 12:53:10'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzEsInVzZXJuYW1lIjoiUmFpZGVuIFNob2d1biIsImVtYWlsIjoicmFpZGVuc2hvZ3VuQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTc3NDI3MDQwOCwiZXhwIjoxNzc0MzU2ODA4fQ.HVpX7H-uqLANXki81DiJBTul8oeqq7yJUik8yLt2FU8', '2026-03-23 12:53:49'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzIsInVzZXJuYW1lIjoiRXJlbiBZZWFnZXIiLCJlbWFpbCI6ImVyZW55ZWFnZXJAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NzQyNzA0NTQsImV4cCI6MTc3NDM1Njg1NH0.KSd5hGW_AyELcIBasmhLB_KKNxz_JFWIErdLHpDYwbA', '2026-03-23 12:54:42');

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
(1, 'LRT Line 1', 20.00, 'Baclaran - Fernando Poe Jr. Station', '/uploads/trains/train-1774270237420.jpg', '2026-03-16 13:56:58', '2026-03-23 12:50:37'),
(2, 'LRT Line 2', 25.00, 'Recto - Antipolo', '/uploads/trains/train-1774270227489.jpg', '2026-03-16 13:56:58', '2026-03-23 12:50:27'),
(3, 'MRT Line 3', 24.00, 'North Avenue - Taft Avenue', '/uploads/trains/train-1774270219573.jpg', '2026-03-16 13:56:58', '2026-03-23 12:50:19'),
(4, 'PNR Metro Commuter Line', 30.00, 'Tutuban - Alabang', '/uploads/trains/train-1774270206481.jpg', '2026-03-16 13:56:58', '2026-03-23 12:50:06'),
(5, 'PNR Bicol Express', 450.00, 'Manila - Naga', '/uploads/trains/train-1774270199745.jpg', '2026-03-16 13:56:58', '2026-03-23 12:49:59'),
(6, 'PNR Mayon Limited', 500.00, 'Manila - Legazpi', '/uploads/trains/train-1774270189200.jpg', '2026-03-16 13:56:58', '2026-03-23 12:49:49'),
(7, 'LRT Cavite Extension', 35.00, 'Baclaran - Niog', '/uploads/trains/train-1774270184964.jpg', '2026-03-16 13:56:58', '2026-03-23 12:49:44'),
(8, 'MRT Line 7', 28.00, 'North Avenue - San Jose del Monte', '/uploads/trains/train-1774270174367.jpg', '2026-03-16 13:56:58', '2026-03-23 12:49:34'),
(9, 'North–South Commuter Railway', 60.00, 'Clark - Calamba', '/uploads/trains/train-1774270137013.jpg', '2026-03-16 13:56:58', '2026-03-23 12:48:57'),
(10, 'Metro Manila Subway', 35.00, 'Valenzuela - NAIA Terminal 3', '/uploads/trains/train-1774270131095.jpg', '2026-03-16 13:56:58', '2026-03-23 12:48:51'),
(11, 'PNR South Long Haul', 800.00, 'Manila - Matnog', '/uploads/trains/train-1774270120521.jpg', '2026-03-16 13:56:58', '2026-03-23 12:48:40'),
(12, 'Clark Airport Express', 120.00, 'Clark Airport - Manila', '/uploads/trains/train-1774270108739.jpg', '2026-03-16 13:56:58', '2026-03-23 12:48:28'),
(13, 'Mindanao Railway Phase 1', 50.00, 'Tagum - Davao - Digos', '/uploads/trains/train-1774270094561.jpg', '2026-03-16 13:56:58', '2026-03-23 12:48:14'),
(14, 'Panay Rail Revival', 40.00, 'Iloilo - Roxas City', '/uploads/trains/train-1774270083595.jpg', '2026-03-16 13:56:58', '2026-03-23 12:48:03'),
(15, 'Cebu Monorail', 25.00, 'Cebu City - Mactan Airport', '/uploads/trains/train-1774270068006.jpg', '2026-03-16 13:56:58', '2026-03-23 12:47:48'),
(16, 'OZ-TRAIN', 50.00, 'Ozamiz - Tangub', '/uploads/trains/train-1774103794536.jpg', '2026-03-21 14:36:34', '2026-03-23 12:47:27');

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
  `avatar` varchar(500) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `avatar`, `email_verified_at`, `created_at`) VALUES
(1, 'Jessel Zapanta', 'jesselzapanta@gmail.com', '$2b$10$zb5.7jUvR39pgOqILkodouhXa9aeP3ZB1RNMeXuN/JjZvNHUa9Ir6', 'admin', '/uploads/avatars/avatar-1774092512921.jpg', '2026-03-22 08:13:48', '2026-03-16 13:56:58'),
(3, 'jesselzapanta09', 'jesselzapanta09@gmail.com', '$2b$10$OUf9vBUPpl.TUIZKvV4GEOGoTVIyMbSJa.YeH.fEL5slSAPhjqPPS', 'user', '/uploads/avatars/avatar-1774265341394.png', NULL, '2026-03-17 08:07:19'),
(28, 'Juan Dela Cruz', 'juandelacruz9@gmail.com', '$2b$10$BSJLo5vdyDVuovqdOuCdYOwsRC7TXWFhDiPxbxGw7cH8XBFwR.Uke', 'admin', '/uploads/avatars/avatar-1774269433539.jpg', '2026-03-23 12:39:09', '2026-03-23 12:31:24'),
(30, 'John Doe', 'johndoe@gmail.com', '$2b$10$x10Uji5HF2qNJn9N3f6v1u52Dt/p4RAu85zAgR0lUG/PgG7XgdZfO', 'admin', NULL, NULL, '2026-03-23 12:41:37'),
(31, 'Raiden Shogun', 'raidenshogun@gmail.com', '$2b$10$HZGVOSSsuU4C03.9dnVs9OKzlHPYXd8odLdROPjbRHPm8.3r65JRO', 'admin', '/uploads/avatars/avatar-1774269758313.jpg', '2026-03-23 12:53:22', '2026-03-23 12:42:38'),
(32, 'Eren Yeager', 'erenyeager@gmail.com', '$2b$10$lgFV/r2oowLgjUfvgbjUuOeeHsFAeT9dSZJR3S81651OthjZaHFkK', 'user', NULL, '2026-03-23 12:54:09', '2026-03-23 12:43:50'),
(33, 'Gabimaru', 'gabimaru@gmail.com', '$2b$10$9YGdUCKkpPt97SkjGVNl.OsI8Rrknwx6VwOmBmwQ4ollNOMZg/Gq2', 'admin', NULL, NULL, '2026-03-23 12:45:57');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
