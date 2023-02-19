-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2023 at 01:04 PM
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
-- Database: `idb54`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_manufacturer` (IN `name` VARCHAR(20), IN `contact` VARCHAR(20))   insert INTO manufacturer(name,contact)values(name,contact)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `contact`) VALUES
(1, 'Apple', '01889183888'),
(2, 'Xiaomi', '01776153320'),
(3, 'Sony', '01889183888');

--
-- Triggers `manufacturer`
--
DELIMITER $$
CREATE TRIGGER `ad_manufacturer` AFTER DELETE ON `manufacturer` FOR EACH ROW DELETE FROM product WHERE manufacture_id=old.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` varchar(6) NOT NULL,
  `manufacture_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `manufacture_id`) VALUES
(1, 'iPhone X', '50000', 1),
(2, 'Xperia Z', '3000', 3),
(3, 'Redmi 5', '4000', 2),
(4, 'iPhone 13 pro Max', '140000', 1),
(5, 'Redmi 3', '3000', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_product_list1`
-- (See below for the actual view)
--
CREATE TABLE `v_product_list1` (
`id` int(6)
,`product_name` varchar(30)
,`mfg_name` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `v_product_list1`
--
DROP TABLE IF EXISTS `v_product_list1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_product_list1`  AS SELECT `p`.`id` AS `id`, `p`.`name` AS `product_name`, `m`.`name` AS `mfg_name` FROM (`product` `p` join `manufacturer` `m`) WHERE `m`.`id` = `p`.`manufacture_id` AND `p`.`price` > 50005000  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
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
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
