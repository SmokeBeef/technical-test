-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 30, 2023 at 05:21 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoringkendaraan`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailkendaraan`
--

CREATE TABLE `detailkendaraan` (
  `id` int NOT NULL,
  `idKendaraan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `odoMeter` int NOT NULL,
  `bbm` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detailkendaraan`
--

INSERT INTO `detailkendaraan` (`id`, `idKendaraan`, `odoMeter`, `bbm`) VALUES
(1, '79db8890-46a6-11ee-bad1-3924fe3d57c3', 100000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `detailpemesanan`
--

CREATE TABLE `detailpemesanan` (
  `id` int NOT NULL,
  `idPemesanan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPenyetuju` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('belum','setuju') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detailpemesanan`
--

INSERT INTO `detailpemesanan` (`id`, `idPemesanan`, `idPenyetuju`, `status`) VALUES
(2, '6cf0895a-748b-4d77-8556-2012cd65f78a', '06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'setuju'),
(3, 'ea8b12f1-f72a-4e72-ab67-f651f484f368', '06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'setuju'),
(4, 'e470288d-4b93-4720-a84c-abc1dee135f2', '06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'setuju'),
(5, 'db72c23b-085d-494a-a555-c6f989e5a04a', '1af25474-b657-4713-beed-e6e048e5a396', 'belum'),
(6, 'cbcea4bb-798c-4c05-862c-13f5472dabcb', '06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plat` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` enum('barang','orang') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('dipakai','tidak_dipakai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updateAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id`, `nama`, `plat`, `tipe`, `status`, `createAt`, `updateAt`) VALUES
('6bfbae30-46e7-11ee-822b-e1b501db9a4e', 'pajero Sport 2019', 'N 8908 TTT', 'barang', 'dipakai', '2023-08-30 03:43:45.813', '2023-08-30 05:17:03.169'),
('79db8890-46a6-11ee-bad1-3924fe3d57c3', 'canter 125ps', 'ag 123 er', 'barang', 'dipakai', '2023-08-29 19:58:51.820', '2023-08-30 02:57:48.857'),
('ee9b4680-46e6-11ee-a05d-256b496cd10a', 'fortuner 2020', 'N 8908 TBT', 'barang', 'dipakai', '2023-08-30 03:40:15.468', '2023-08-30 03:40:15.468');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idSupir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idKendaraan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idPemesan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('proses','disetujui','selesai') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `idSupir`, `idKendaraan`, `idPemesan`, `status`, `createAt`) VALUES
('6cf0895a-748b-4d77-8556-2012cd65f78a', 'e8a1db32-8837-4e3d-a406-353dd5917fe6', '79db8890-46a6-11ee-bad1-3924fe3d57c3', '81fabc5c-8a52-4240-93f6-5cf6961f29e8', 'proses', '2023-08-29 21:47:09.556'),
('cbcea4bb-798c-4c05-862c-13f5472dabcb', 'e8a1db32-8837-4e3d-a406-353dd5917fe6', '6bfbae30-46e7-11ee-822b-e1b501db9a4e', '06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'proses', '2023-08-30 05:17:03.155'),
('db72c23b-085d-494a-a555-c6f989e5a04a', 'e8a1db32-8837-4e3d-a406-353dd5917fe6', '6bfbae30-46e7-11ee-822b-e1b501db9a4e', '06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'proses', '2023-08-30 05:16:55.312'),
('e470288d-4b93-4720-a84c-abc1dee135f2', 'e8a1db32-8837-4e3d-a406-353dd5917fe6', '6bfbae30-46e7-11ee-822b-e1b501db9a4e', '81fabc5c-8a52-4240-93f6-5cf6961f29e8', 'proses', '2023-08-30 04:18:49.256'),
('ea8b12f1-f72a-4e72-ab67-f651f484f368', 'e8a1db32-8837-4e3d-a406-353dd5917fe6', '79db8890-46a6-11ee-bad1-3924fe3d57c3', '81fabc5c-8a52-4240-93f6-5cf6961f29e8', 'proses', '2023-08-30 02:57:48.776');

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`id`, `nama`) VALUES
('e8a1db32-8837-4e3d-a406-353dd5917fe6', 'Deva Nanda');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','penyetuju') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updateAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `role`, `createAt`, `updateAt`) VALUES
('06ea6bcc-e84b-4dda-889a-a369bb5c9542', 'Farel', 'farel', '$2b$10$N.VdBQ2wIIX7V3aIQs/QbulfkNrFRh2bKQv7y/eFQxWm4cYIJRbn.', 'penyetuju', '2023-08-29 21:38:58.130', '2023-08-29'),
('1af25474-b657-4713-beed-e6e048e5a396', 'Dini', 'dini', '$2b$10$GKzuwl5VLMkbs2d5UJdKCuNWosDeDfxVvzOhlyRmimFpuIAuxgRN6', 'penyetuju', '2023-08-29 21:39:08.244', '2023-08-29'),
('36398a24-d3f7-47c6-a541-e19b2755aedf', 'alpaca', 'alpaca', '$2b$10$LvpLR.tuMmb34UmzVwrnAeU3q8F/HMA.ZapHl50ik/4H50WuQDZhK', 'admin', '2023-08-30 02:10:35.382', '2023-08-30'),
('81fabc5c-8a52-4240-93f6-5cf6961f29e8', 'Deva Nanda', 'nandadeva', '$2b$10$h1LgyEf8TSms9XdPpfRVGe44IIzpJAnlbqy4bbR/RY00kK0.1usZe', 'admin', '2023-08-29 18:55:23.749', '2023-08-29');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('054e1dde-f609-4701-a7fd-e47976e85e2b', '9dd88b6cba4f5fc24bef0144f52973b98ee2f07e5ddbad9338cb0fd18fe530f7', '2023-08-29 18:49:46.560', '20230829184945_db1', NULL, NULL, '2023-08-29 18:49:45.955', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailkendaraan`
--
ALTER TABLE `detailkendaraan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailKendaraan_idKendaraan_fkey` (`idKendaraan`);

--
-- Indexes for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailPemesanan_idPenyetuju_fkey` (`idPenyetuju`),
  ADD KEY `detailPemesanan_idPemesanan_fkey` (`idPemesanan`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemesanan_idKendaraan_fkey` (`idKendaraan`),
  ADD KEY `pemesanan_idPemesan_fkey` (`idPemesan`),
  ADD KEY `pemesanan_idSupir_fkey` (`idSupir`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_username_key` (`username`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailkendaraan`
--
ALTER TABLE `detailkendaraan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailkendaraan`
--
ALTER TABLE `detailkendaraan`
  ADD CONSTRAINT `detailkendaraan_idKendaraan_fkey` FOREIGN KEY (`idKendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detailpemesanan`
--
ALTER TABLE `detailpemesanan`
  ADD CONSTRAINT `detailpemesanan_idPemesanan_fkey` FOREIGN KEY (`idPemesanan`) REFERENCES `pemesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detailpemesanan_idPenyetuju_fkey` FOREIGN KEY (`idPenyetuju`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_idKendaraan_fkey` FOREIGN KEY (`idKendaraan`) REFERENCES `kendaraan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_idPemesan_fkey` FOREIGN KEY (`idPemesan`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_idSupir_fkey` FOREIGN KEY (`idSupir`) REFERENCES `supir` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
