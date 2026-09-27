-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2026 at 07:00 PM
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
-- Database: `wasel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_matches`
--

CREATE TABLE `ai_matches` (
  `id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `match_score` decimal(5,2) NOT NULL,
  `verification_status` enum('Pending','Verified','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ai_matches`
--

INSERT INTO `ai_matches` (`id`, `child_id`, `family_id`, `match_score`, `verification_status`, `created_at`) VALUES
(1, 1, 1, 94.50, 'Verified', '2026-09-12 09:51:16'),
(2, 2, 2, 74.00, 'Pending', '2026-09-12 09:51:16'),
(3, 3, 3, 76.00, 'Pending', '2026-09-12 12:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` int(11) NOT NULL,
  `case_code` varchar(50) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `case_type` enum('Found','Missing') NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('ذكر','أنثى') NOT NULL,
  `location` varchar(255) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('Searching','Potential Match','Reunified','Alternative Care') NOT NULL DEFAULT 'Searching',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `blood_type` varchar(10) DEFAULT 'A+'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `case_code`, `full_name`, `case_type`, `age`, `gender`, `location`, `photo_path`, `notes`, `status`, `created_at`, `blood_type`) VALUES
(1, 'CASE-8941', 'ياسين أحمد', 'Found', 7, 'ذكر', 'المنصورة - حي الأشجار', 'uploads/child_8941.jpg', 'تم العثور عليه يرتدي قميصاً أزرق', 'Reunified', '2026-09-12 09:51:16', 'A+'),
(2, 'CASE-8942', 'مريم محمد', 'Missing', 5, 'أنثى', 'القاهرة - مدينة نصر', 'uploads/child_8942.jpg', 'مفقودة منذ يومين بملابس وردية | تم التسكين الرعائي: أسرة كافلة: بيبي | تم التسكين الرعائي: أسرة كافلة: بيبي', 'Alternative Care', '2026-09-12 09:51:16', 'A+'),
(3, 'CASE-8930', 'عمر خالد', 'Found', 9, 'ذكر', 'الإسكندرية - سموحة', 'uploads/child_8930.jpg', 'تم لم الشمل بنجاح وتوثيق الحالة', 'Reunified', '2026-09-12 09:51:16', 'A+'),
(4, 'CASE-2679', 'Omar Ahmed', 'Missing', 16, 'ذكر', 'موقع مباشر: Lat 31.0290, Lng 31.3902', 'uploads/1789208645_4.png', '', 'Searching', '2026-09-12 10:24:05', 'A+'),
(5, 'CASE-7416', 'Omar Ahmed', 'Found', 5, 'ذكر', 'موقع مباشر: Lat 31.0290, Lng 31.3902', 'uploads/default.jpg', ' | تم التسكين الرعائي: أسرة كافلة: بيبي', 'Alternative Care', '2026-09-12 10:27:38', 'A+'),
(6, 'CASE-5724', 'Omar Ahmed', 'Missing', 22, 'ذكر', 'موقع مباشر: Lat 31.0290, Lng 31.3902', 'uploads/1789827767_ChatGPT Image Sep 19, 2026, 05_22_31 PM.png', '', 'Searching', '2026-09-19 14:22:47', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` int(11) NOT NULL,
  `family_code` varchar(50) NOT NULL,
  `parent_name` varchar(150) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `report_type` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `father_name` varchar(150) DEFAULT NULL,
  `father_blood_type` varchar(10) DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_blood_type` varchar(10) DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `family_code`, `parent_name`, `city`, `phone`, `report_type`, `created_at`, `father_name`, `father_blood_type`, `mother_name`, `mother_blood_type`, `blood_type`) VALUES
(1, 'FAM-102', 'أحمد محمود السيد', 'القاهرة - مصر الجديدة', '01012345678', 'بلاغ طفل مفقود (ياسين)', '2026-09-12 09:51:16', NULL, NULL, NULL, NULL, NULL),
(2, 'FAM-205', 'محمود حسن علي', 'الجيزة - الدقي', '01198765432', 'أسرة كافلة رعاية بديلة', '2026-09-12 09:51:16', NULL, NULL, NULL, NULL, NULL),
(3, 'FAM-697', 'بيبي', 'بيبيبي', '1324156', 'أسرة كافلة رعاية بديلة (Alternative Care Foster)', '2026-09-12 10:32:08', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_key`, `setting_value`, `updated_at`) VALUES
(1, 'theme_primary_color', '#eceff1', '2026-09-12 10:05:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','SocialWorker','Organization','FieldWorker') NOT NULL DEFAULT 'SocialWorker',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `password_hash`, `role`, `created_at`) VALUES
(1, 'أحمد عبد العزيز', 'ahmed@wasel.org', '01012345678', '$2y$10$e8T.qY/gX8Jz8Sg9p9g...', 'SocialWorker', '2026-09-12 09:51:16'),
(2, 'د. سارة محمود', 'sara@wasel.org', '01198765432', '$2y$10$e8T.qY/gX8Jz8Sg9p9g...', 'Admin', '2026-09-12 09:51:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_matches`
--
ALTER TABLE `ai_matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `family_id` (`family_id`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `case_code` (`case_code`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `family_code` (`family_code`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_matches`
--
ALTER TABLE `ai_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ai_matches`
--
ALTER TABLE `ai_matches`
  ADD CONSTRAINT `ai_matches_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `children` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ai_matches_ibfk_2` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
