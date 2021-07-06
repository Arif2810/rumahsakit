-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2021 at 09:44 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_dokter`
--

CREATE TABLE `tb_dokter` (
  `id_dokter` varchar(50) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `spesialis` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_dokter`
--

INSERT INTO `tb_dokter` (`id_dokter`, `nama_dokter`, `spesialis`, `alamat`, `no_telp`) VALUES
('8de1a500-3663-457b-9a27-1644e0c17fa2', 'Dokter A', 'Penyakit Dalam', 'Pati', '088200110016'),
('e6bfe5eb-02b5-4ec1-b7f7-ce2e41547700', 'Dr. Yudi saputra', 'Penyakit Kulit', 'Kudus', '081275121552');

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

CREATE TABLE `tb_obat` (
  `id_obat` varchar(50) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `ket_obat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_obat`
--

INSERT INTO `tb_obat` (`id_obat`, `nama_obat`, `ket_obat`) VALUES
('403abc2b-2ef9-4a4e-96d2-b4d83a6a4d2b', 'Obat A', 'obat pusing'),
('43288b0b-661f-44ab-a86d-e149a1c529a9', 'Obat D', '-'),
('4d328bb7-8e21-4812-9686-cbfee056f0f3', 'obat C', 'sakit gigi'),
('bdba4c10-4993-4d4a-b76a-d8cad34326e9', 'Obat E', '-'),
('e2ea0e7e-04cf-4b41-8a87-04add912f993', 'obat B', 'obat demam');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pasien`
--

CREATE TABLE `tb_pasien` (
  `id_pasien` varchar(50) NOT NULL,
  `nomor_identitas` varchar(100) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pasien`
--

INSERT INTO `tb_pasien` (`id_pasien`, `nomor_identitas`, `nama_pasien`, `jenis_kelamin`, `alamat`, `no_telp`) VALUES
('118725fd-44e9-493a-bade-8d0d80040d86', '202012345', 'M. Nur', 'L', 'Pati', '0888123123'),
('31fc8a27-c69a-460b-8bd7-2e4221a3293f', '202012348', 'Tuyem', 'P', 'Kediri', '0888123126'),
('329845e8-fe19-4785-bf9b-32f1d890e5fd', '20200101', 'Pasien A', 'L', 'Kudus', '088200110017'),
('8aa4bdb9-5d2d-46cb-b641-1d367bbf6f1d', '202012347', 'Angga', 'L', 'Kudus', '0888123125'),
('c78a88d6-1483-467a-b692-aaa2955645e5', '202012346', 'Andhan', 'L', 'Kudus', '0888123124'),
('e6a304c2-1f05-417e-bf0d-f2672de52229', '021321434', 'Andi', 'L', 'Jl. Satu Kudus', '088200110011');

-- --------------------------------------------------------

--
-- Table structure for table `tb_poliklinik`
--

CREATE TABLE `tb_poliklinik` (
  `id_poli` varchar(50) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_poliklinik`
--

INSERT INTO `tb_poliklinik` (`id_poli`, `nama_poli`, `lokasi`) VALUES
('0e4998e7-4876-4d01-8cfd-839fe838b5f4', 'Poli 1', 'K, lt 4'),
('1632b926-4fb4-4d91-b449-f3c648b1f688', 'Poli 3', 'K, lt 6'),
('21019878-5704-4e3e-87ad-32e44763faa9', 'Poli 5', 'K, lt 6'),
('9b5ce7e9-a400-40e4-90cd-8134dc8009ca', 'Poli 2', 'K, lt 5');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekammedis`
--

CREATE TABLE `tb_rekammedis` (
  `id_rm` varchar(50) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `id_poli` varchar(50) NOT NULL,
  `id_pasien` varchar(50) NOT NULL,
  `keluhan` text NOT NULL,
  `id_dokter` varchar(50) NOT NULL,
  `diagnosa` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rekammedis`
--

INSERT INTO `tb_rekammedis` (`id_rm`, `tgl_periksa`, `id_poli`, `id_pasien`, `keluhan`, `id_dokter`, `diagnosa`) VALUES
('4217a6bf-4875-426e-84a2-5afd4b965705', '2020-06-03', '9b5ce7e9-a400-40e4-90cd-8134dc8009ca', '118725fd-44e9-493a-bade-8d0d80040d86', '<p>pusing</p>\r\n', '8de1a500-3663-457b-9a27-1644e0c17fa2', 'migrain'),
('60a8da1c-e31c-4dd1-9d5c-6bc2bb685543', '2020-06-03', '0e4998e7-4876-4d01-8cfd-839fe838b5f4', '31fc8a27-c69a-460b-8bd7-2e4221a3293f', '<p>sakit perut</p>\r\n', '8de1a500-3663-457b-9a27-1644e0c17fa2', 'diare'),
('64224cd1-3d5e-45cd-a0af-05ef466a2cde', '2020-06-04', '9b5ce7e9-a400-40e4-90cd-8134dc8009ca', '329845e8-fe19-4785-bf9b-32f1d890e5fd', '<p>lemas</p>\r\n', 'e6bfe5eb-02b5-4ec1-b7f7-ce2e41547700', 'animea');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rm_obat`
--

CREATE TABLE `tb_rm_obat` (
  `id` int(10) NOT NULL,
  `id_rm` varchar(50) NOT NULL,
  `id_obat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rm_obat`
--

INSERT INTO `tb_rm_obat` (`id`, `id_rm`, `id_obat`) VALUES
(11, '64224cd1-3d5e-45cd-a0af-05ef466a2cde', '403abc2b-2ef9-4a4e-96d2-b4d83a6a4d2b'),
(12, '64224cd1-3d5e-45cd-a0af-05ef466a2cde', '4d328bb7-8e21-4812-9686-cbfee056f0f3'),
(13, '4217a6bf-4875-426e-84a2-5afd4b965705', '403abc2b-2ef9-4a4e-96d2-b4d83a6a4d2b'),
(14, '4217a6bf-4875-426e-84a2-5afd4b965705', '43288b0b-661f-44ab-a86d-e149a1c529a9'),
(15, '60a8da1c-e31c-4dd1-9d5c-6bc2bb685543', '403abc2b-2ef9-4a4e-96d2-b4d83a6a4d2b'),
(16, '60a8da1c-e31c-4dd1-9d5c-6bc2bb685543', '4d328bb7-8e21-4812-9686-cbfee056f0f3'),
(17, '60a8da1c-e31c-4dd1-9d5c-6bc2bb685543', 'e2ea0e7e-04cf-4b41-8a87-04add912f993');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
('', 'Yola', 'yola1996', 'a9573217994b9a6b35bce220e5a670a86a2b8b4f', '1'),
('98731216336846848', 'Arif Rusman', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_dokter`
--
ALTER TABLE `tb_dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `tb_pasien`
--
ALTER TABLE `tb_pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `tb_poliklinik`
--
ALTER TABLE `tb_poliklinik`
  ADD PRIMARY KEY (`id_poli`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `tb_rekammedis`
--
ALTER TABLE `tb_rekammedis`
  ADD PRIMARY KEY (`id_rm`),
  ADD KEY `tb_rekammedis_ibfk_1` (`id_pasien`),
  ADD KEY `tb_rekammedis_ibfk_2` (`id_dokter`),
  ADD KEY `tb_rekammedis_ibfk_3` (`id_poli`);

--
-- Indexes for table `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rm` (`id_rm`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_rekammedis`
--
ALTER TABLE `tb_rekammedis`
  ADD CONSTRAINT `tb_rekammedis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tb_pasien` (`id_pasien`),
  ADD CONSTRAINT `tb_rekammedis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tb_dokter` (`id_dokter`),
  ADD CONSTRAINT `tb_rekammedis_ibfk_3` FOREIGN KEY (`id_poli`) REFERENCES `tb_poliklinik` (`id_poli`);

--
-- Constraints for table `tb_rm_obat`
--
ALTER TABLE `tb_rm_obat`
  ADD CONSTRAINT `tb_rm_obat_ibfk_1` FOREIGN KEY (`id_rm`) REFERENCES `tb_rekammedis` (`id_rm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_rm_obat_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `tb_obat` (`id_obat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
