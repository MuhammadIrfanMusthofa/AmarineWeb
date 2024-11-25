-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 06:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amarine`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `email`, `password`, `role`) VALUES
(1, 'bahrul@gmail.com', 'bahrul', 'nelayan'),
(2, 'dodi@gmail.com', 'dodi', 'nelayan');

-- --------------------------------------------------------

--
-- Table structure for table `detail_stok`
--

CREATE TABLE `detail_stok` (
  `id` int(11) NOT NULL,
  `id_pencatatan` int(11) DEFAULT NULL,
  `id_penjualan` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `terjual` int(11) DEFAULT NULL,
  `tersedia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_stok`
--

INSERT INTO `detail_stok` (`id`, `id_pencatatan`, `id_penjualan`, `nama`, `jenis`, `terjual`, `tersedia`) VALUES
(2, 1, NULL, 'Ikan Nila', 'Ikan', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nelayan`
--

CREATE TABLE `nelayan` (
  `id` int(11) NOT NULL,
  `id_akun` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nelayan`
--

INSERT INTO `nelayan` (`id`, `id_akun`, `nama`, `no_hp`, `tanggal_lahir`, `alamat`) VALUES
(1, 1, 'Pak Bahrul', '081234567811', '1998-07-09', 'Batam, Batu Merah'),
(2, 2, 'Pak Dodi', '081243675912', '2024-11-20', 'Batam, Batu Merah');

-- --------------------------------------------------------

--
-- Table structure for table `pencatatan`
--

CREATE TABLE `pencatatan` (
  `id` int(11) NOT NULL,
  `id_nelayan` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `lokasi_penyimpanan` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pencatatan`
--

INSERT INTO `pencatatan` (`id`, `id_nelayan`, `nama`, `jenis`, `berat`, `tanggal`, `waktu`, `lokasi_penyimpanan`, `catatan`, `gambar`) VALUES
(1, 1, 'Kepiting Galah', 'Kepiting', 10, '2024-07-01', '19:38:07', 'Box 1', 'Kepiting ini di tangkap di daerah laut sekitar Batu Merah.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pengepul`
--

CREATE TABLE `pengepul` (
  `id` int(11) NOT NULL,
  `id_akun` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengepul`
--

INSERT INTO `pengepul` (`id`, `id_akun`, `nama`, `no_hp`, `tanggal_lahir`, `alamat`) VALUES
(1, 1, 'Pak Galih', '082138976532', '1995-11-08', '');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_pengepul` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_pengepul`, `nama`, `jenis`, `harga`, `berat`, `catatan`, `tanggal`) VALUES
(1, 1, 'Ikan Nila', 'Ikan', 80000, 10, 'Ikan ditangkap di perairan batam, batu merah', '2024-11-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_stok`
--
ALTER TABLE `detail_stok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pencatatan` (`id_pencatatan`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indexes for table `nelayan`
--
ALTER TABLE `nelayan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nelayan_akun` (`id_akun`);

--
-- Indexes for table `pencatatan`
--
ALTER TABLE `pencatatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nelayan` (`id_nelayan`);

--
-- Indexes for table `pengepul`
--
ALTER TABLE `pengepul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pengepul_akun` (`id_akun`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_pengepul` (`id_pengepul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detail_stok`
--
ALTER TABLE `detail_stok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nelayan`
--
ALTER TABLE `nelayan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pencatatan`
--
ALTER TABLE `pencatatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengepul`
--
ALTER TABLE `pengepul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_stok`
--
ALTER TABLE `detail_stok`
  ADD CONSTRAINT `detail_stok_ibfk_1` FOREIGN KEY (`id_pencatatan`) REFERENCES `pencatatan` (`id`),
  ADD CONSTRAINT `detail_stok_ibfk_2` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`);

--
-- Constraints for table `nelayan`
--
ALTER TABLE `nelayan`
  ADD CONSTRAINT `fk_nelayan_akun` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id`);

--
-- Constraints for table `pencatatan`
--
ALTER TABLE `pencatatan`
  ADD CONSTRAINT `pencatatan_ibfk_1` FOREIGN KEY (`id_nelayan`) REFERENCES `nelayan` (`id`);

--
-- Constraints for table `pengepul`
--
ALTER TABLE `pengepul`
  ADD CONSTRAINT `fk_pengepul_akun` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pengepul`) REFERENCES `pengepul` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
