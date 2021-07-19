-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2021 at 05:45 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(30) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_pass` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminlog`
--

INSERT INTO `adminlog` (`id`, `admin_email`, `admin_pass`) VALUES
(2, 'admin@gmail.com', 'd337c17deb8203329c39b5ec515b334b');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ctg_id` int(11) NOT NULL,
  `ctg_name` text NOT NULL,
  `ctg_des` varchar(150) NOT NULL,
  `ctg_status` tinyint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ctg_id`, `ctg_name`, `ctg_des`, `ctg_status`) VALUES
(1, 'Men items', 'New Product come for sale', 0),
(2, 'Women items', 'Women New Product come for sale', 0),
(3, 'Laptop', 'here comes laptop brand new', 0),
(4, 'Mobile Phone', 'Brand new Product come for sale', 0),
(5, 'Gadget', 'New technology gadget for sale', 0),
(6, 'Fruit', '', 1),
(7, 'Fresh Vegetables', '', 1),
(8, 'Juice', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pdt_id` int(255) NOT NULL,
  `pdt_name` varchar(200) NOT NULL,
  `pdt_price` int(200) NOT NULL,
  `pdt_des` varchar(250) NOT NULL,
  `pdt_ctg` int(200) NOT NULL,
  `pdt_img` varchar(200) NOT NULL,
  `pdt_status` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pdt_id`, `pdt_name`, `pdt_price`, `pdt_des`, `pdt_ctg`, `pdt_img`, `pdt_status`) VALUES
(1, 'Telescope', 5000, 'Good Telescope with extra large view', 5, 'eYQ5Z29ngjmACA5HJv6Dui-320-80.jpg', 1),
(2, 'Panjabi', 250, 'New Panjabi Collection', 1, 'panjabi.png', 1),
(3, 'WMFork', 2000, 'lovely dress for a woman', 2, 'purepng.com-women-yw.png', 1),
(4, 'pc', 45000, 'digital laptop mac', 3, '149624-laptop.jpg', 1),
(5, 'shirt ', 500, 'office boys', 1, 'Spread-collar-casual-shirt.jpg', 1),
(6, 'Phone', 22000, 'Smartphone', 4, 'RaW5C1s.jpg', 1),
(7, 'Lure Telescope', 500000, 'Vision high built-in super views ', 1, '118781971_2644654205750649_3079254369453947459_o.jpg', 1),
(8, 'Fresh Fruit ', 85, ' Healing Powers of Lemons', 6, '14.jpg', 1),
(9, 'Fulkopi', 20, 'Fulkopi a good type of vegetable', 7, '09.jpg', 1),
(10, 'Pomegranate juice', 90, 'Drinking the juice can be excellent for you.', 8, '08.jpg', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_info_ctg`
-- (See below for the actual view)
--
CREATE TABLE `products_info_ctg` (
`pdt_id` int(255)
,`pdt_name` varchar(200)
,`pdt_price` int(200)
,`pdt_des` varchar(250)
,`pdt_img` varchar(200)
,`pdt_status` tinyint(5)
,`ctg_id` int(11)
,`ctg_name` text
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `user_firstname` text NOT NULL,
  `user_lastname` text NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mobile` int(11) NOT NULL,
  `user_roles` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_mobile`, `user_roles`) VALUES
(1, 'tanvir', 'Md.Tanvir', 'Rahman', 'tanvir88@gmail.com', '25f9e794323b453885f5181f1b624d0b', 1923456789, 5),
(2, 'Tonmoy', 'Tonmoy', 'Rahman', 'tonmoy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1634567892, 5);

-- --------------------------------------------------------

--
-- Structure for view `products_info_ctg`
--
DROP TABLE IF EXISTS `products_info_ctg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_info_ctg`  AS  select `products`.`pdt_id` AS `pdt_id`,`products`.`pdt_name` AS `pdt_name`,`products`.`pdt_price` AS `pdt_price`,`products`.`pdt_des` AS `pdt_des`,`products`.`pdt_img` AS `pdt_img`,`products`.`pdt_status` AS `pdt_status`,`category`.`ctg_id` AS `ctg_id`,`category`.`ctg_name` AS `ctg_name` from (`products` join `category`) where (`products`.`pdt_ctg` = `category`.`ctg_id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlog`
--
ALTER TABLE `adminlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ctg_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pdt_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlog`
--
ALTER TABLE `adminlog`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ctg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pdt_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
