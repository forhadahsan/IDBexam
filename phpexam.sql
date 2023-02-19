-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2023 at 06:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpexam`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ad_company` (IN `name` VARCHAR(20), IN `contact` VARCHAR(20))   INSERT INTO company(name,contact) VALUES(name,contact)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(6) NOT NULL,
  `name` varchar(22) NOT NULL,
  `contact` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `contact`) VALUES
(6, 'Monitor', '01912566733'),
(7, 'Mouse', '01934566780'),
(8, 'Keyborad', '01912566722'),
(9, 'Hard-Disk', '01999929390'),
(10, 'Pendrive', '01934566719');

--
-- Triggers `company`
--
DELIMITER $$
CREATE TRIGGER `ad_company` AFTER DELETE ON `company` FOR EACH ROW DELETE FROM product WHERE company_id=old.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(6) NOT NULL,
  `name` varchar(22) NOT NULL,
  `price` varchar(12) NOT NULL,
  `company_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `company_id`) VALUES
(7, 'Monitor LG-302', '12000', 6),
(8, 'Monitor Samsung-2011', '9000', 6),
(9, 'Mouse A4-302', '200', 7),
(10, 'Mouse Samsung-21', '900', 7),
(11, 'Lenavo-85', '3400', 8),
(12, 'Dell-05', '960', 8),
(13, 'Lenavo-VDR', '5400', 9),
(14, 'Dell-HDA', '3960', 9),
(15, 'StarTack-ER1', '900', 10),
(16, 'DELL-NA', '1000', 10),
(17, 'Walton-W1', '800', 10),
(18, 'UNNL-NA', '1700', 7);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product`
-- (See below for the actual view)
--
CREATE TABLE `view_product` (
`id` int(6)
,`product_name` varchar(22)
,`company_name` varchar(22)
);

-- --------------------------------------------------------

--
-- Structure for view `view_product`
--
DROP TABLE IF EXISTS `view_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `product_name`, `c`.`name` AS `company_name` FROM (`product` `p` join `company` `c`) WHERE `c`.`id` = `p`.`company_id` AND `p`.`price` > 12001200  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
