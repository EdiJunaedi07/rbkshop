-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2023 at 05:22 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rbkshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `jual`
--

CREATE TABLE `jual` (
  `id_jual` int(11) NOT NULL,
  `no_faktur` varchar(15) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `dibayar` int(11) DEFAULT NULL,
  `kembalian` int(11) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jual`
--

INSERT INTO `jual` (`id_jual`, `no_faktur`, `tgl_jual`, `jam`, `grand_total`, `dibayar`, `kembalian`, `id_user`) VALUES
(17, '202306130001', '2023-06-10', '23:41:00', 11000, 11000, 99000, 1),
(19, '202306130002', '2023-06-11', '23:43:17', 18500000, 1850000, 0, 1),
(20, '202306130003', '2023-06-12', '23:44:50', 18500000, 18500000, 0, 1),
(21, '202306130004', '2023-06-13', '23:52:28', 21000, 21000, 0, 1),
(22, '202306130005', '2023-06-13', '23:54:13', 11000, 11000, 0, 1),
(30, '202306170001', '2023-06-17', '18:35:47', 275000, 275000, 0, 2),
(31, '202306210001', '2023-06-21', '11:24:35', 4200000, 4200000, 0, 4),
(32, '202306210002', '2023-06-21', '11:26:15', 460000, 500000, 40000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(2) NOT NULL,
  `nama_kategori` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(8, 'Pera'),
(10, 'Pulen'),
(11, 'super pulen');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `kode_produk` varchar(25) DEFAULT NULL,
  `nama_produk` varchar(150) DEFAULT NULL,
  `id_kategori` int(2) DEFAULT NULL,
  `id_satuan` int(2) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `kode_produk`, `nama_produk`, `id_kategori`, `id_satuan`, `harga_beli`, `harga_jual`, `stok`) VALUES
(14, '11111', 'Ramos Bandung', 10, 6, 190000, 210000, 99),
(15, '22222', 'Cianjur', 10, 6, 200000, 215000, 120),
(16, '44444', 'Beras Cianjur', 10, 6, 200000, 250000, 119);

-- --------------------------------------------------------

--
-- Table structure for table `rinci_jual`
--

CREATE TABLE `rinci_jual` (
  `id_rinci` int(11) NOT NULL,
  `no_faktur` varchar(15) DEFAULT NULL,
  `kode_produk` varchar(25) DEFAULT NULL,
  `modal` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `untung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rinci_jual`
--

INSERT INTO `rinci_jual` (`id_rinci`, `no_faktur`, `kode_produk`, `modal`, `harga`, `qty`, `total_harga`, `untung`) VALUES
(25, '202306130001', '11111', 9000, 11000, 1, 11000, 2000),
(26, '202306130002', '33333', 170000, 185000, 5, 925000, 75000),
(27, '202306130002', '33333', 170000, 185000, 100, 18500000, 1500000),
(28, '202306130003', '33333', 170000, 185000, 100, 18500000, 1500000),
(29, '202306130004', '22222', 8000, 10000, 1, 10000, 2000),
(30, '202306130004', '11111', 9000, 11000, 1, 11000, 2000),
(31, '202306130005', '11111', 9000, 11000, 1, 11000, 2000),
(32, '202306130006', '33333', 170000, 185000, 1, 185000, 15000),
(33, '202306130006', '11111', 9000, 11000, 1, 11000, 2000),
(34, '202306140001', '22222', 8000, 10000, 1, 10000, 2000),
(35, '202306140002', '22222', 8000, 10000, 1, 10000, 2000),
(36, '202306140003', '22222', 8000, 10000, 1, 10000, 2000),
(37, '202306140004', '22222', 8000, 10000, 1, 10000, 2000),
(38, '202306140001', '11111', 9000, 11000, 1, 11000, 2000),
(39, '202306140001', '33333', 170000, 185000, 99, 18315000, 1485000),
(40, '202306170001', '00010', 250000, 275000, 1, 275000, 25000),
(41, '202306210001', '11111', 190000, 210000, 20, 4200000, 400000),
(42, '202306210002', '11111', 190000, 210000, 1, 210000, 20000),
(43, '202306210002', '44444', 200000, 250000, 1, 250000, 50000);

--
-- Triggers `rinci_jual`
--
DELIMITER $$
CREATE TRIGGER `t_rinci_jual` AFTER INSERT ON `rinci_jual` FOR EACH ROW BEGIN
	UPDATE produk SET stok = stok - NEW.qty
    WHERE kode_produk = NEW.kode_produk;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(2) NOT NULL,
  `nama_satuan` varchar(25) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`) VALUES
(2, 'Liter'),
(6, 'Karung'),
(8, 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(1) NOT NULL,
  `nama_toko` varchar(25) DEFAULT NULL,
  `slogan` varchar(50) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_telpon` varchar(18) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `nama_toko`, `slogan`, `alamat`, `no_telpon`, `deskripsi`) VALUES
(1, 'Rumah Beras Kenanga', 'Tempatnya Beras Berkualitas', 'Jl. Siliwangi, Kp. Jaura, RT/RW 001/021, Ds. Muara Ciujung Timur, Kec. Rangkasbitung, Lebak-Banten.', '089516408708', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(2) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `email`, `password`, `level`) VALUES
(1, 'Admin', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1),
(4, 'Kasir ', 'kasir@gmail.com ', '8691e4fc53b99da544ce86e22acba62d13352eff', 2),
(6, 'penguji', 'penguji@email.com', '00b29a3bb553d6025ae79ccea11bb7f241b939da', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jual`
--
ALTER TABLE `jual`
  ADD PRIMARY KEY (`id_jual`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `rinci_jual`
--
ALTER TABLE `rinci_jual`
  ADD PRIMARY KEY (`id_rinci`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jual`
--
ALTER TABLE `jual`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rinci_jual`
--
ALTER TABLE `rinci_jual`
  MODIFY `id_rinci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
