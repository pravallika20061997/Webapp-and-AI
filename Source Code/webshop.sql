-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2022 at 04:28 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uemail` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uemail`, `password`) VALUES
('admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `srno` int(11) NOT NULL,
  `uemail` varchar(20) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`srno`, `uemail`, `item_id`, `qty`) VALUES
(9, 'dhannesh@gmail.com', 10, 1),
(12, 'happy@gmail.com', 3, 1),
(13, 'happy@gmail.com', 5, 1),
(14, 'happy@gmail.com', 7, 1),
(15, 'happy@gmail.com', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'Stationary'),
(2, 'Grocery'),
(3, 'Home Decoration'),
(4, 'Health Care'),
(5, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(25) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `price`, `quantity`, `cat_id`) VALUES
(1, 'Pencil', 5, 10, 1),
(2, 'Sharpner', 5, 100, 1),
(3, 'Rice', 35, 250, 2),
(4, 'Flour', 45, 950, 2),
(5, 'Led Bulb', 112, 220, 3),
(6, 'Lights', 450, 200, 3),
(7, 'Face cream', 221, 56, 4),
(8, 'Face Wash', 166, 25, 4),
(9, 'Socks', 29, 100, 5),
(10, 'Sleepers', 243, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `srno` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`srno`, `invoice_no`, `item_id`, `qty`, `price`, `total`) VALUES
(1, 2, 1, 4, 5, 20),
(2, 2, 2, 1, 5, 5),
(3, 2, 5, 2, 112, 224),
(4, 2, 8, 3, 166, 498),
(5, 3, 1, 4, 5, 20),
(6, 3, 2, 1, 5, 5),
(7, 3, 5, 2, 112, 224),
(8, 3, 8, 3, 166, 498),
(9, 4, 3, 1, 35, 35),
(10, 4, 8, 2, 166, 332),
(11, 5, 4, 1, 45, 45),
(12, 5, 5, 1, 112, 112);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `invoice_no` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` float DEFAULT NULL,
  `pay_method` varchar(20) DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`invoice_no`, `user_id`, `amount`, `pay_method`, `order_date`, `delivery_status`, `delivery_date`) VALUES
(1, 2, 747, 'COD', '2022-08-11 17:44:06', 'Delivered', '2022-08-11 18:31:28'),
(2, 2, 747, 'COD', '2022-08-11 17:58:32', 'Delivered', '2022-08-11 18:29:40'),
(3, 2, 747, 'COD', '2022-08-11 18:01:43', 'Delivered', '2022-08-11 18:29:35'),
(4, 2, 367, 'COD', '2022-08-11 18:30:41', 'UnDelivered', NULL),
(5, 6, 157, 'COD', '2022-08-11 18:54:48', 'UnDelivered', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `upwd` varchar(50) DEFAULT NULL,
  `umobile` varchar(12) DEFAULT NULL,
  `uemail` varchar(20) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `creditcard_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `uname`, `upwd`, `umobile`, `uemail`, `address`, `zipcode`, `creditcard_no`) VALUES
(2, 'Dhanesh Kumar', '12345', '8439516563', 'dhannesh@gmail.com', '', '', '123412341234'),
(3, 'Dhanesh Kumar', '123', '7017777155', 'dhannesh@gmail.com', '', '', '111122223333'),
(4, 'Dhanesh Kumar', '1234', '12341234', 'dhannesh@gmail.com', 'Ghaziabad', '247667', '112233441122'),
(5, 'Dhanesh Kumar', '123', '12341234', 'dhannesh@gmail.com', 'dhanesh.psit', '247667', '123123443322'),
(6, 'Happy', '111', '1212121212', 'happy@gmail.com', 'India', '100082', '11222233444');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`uemail`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`srno`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_cat` (`cat_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`srno`),
  ADD KEY `fk_item` (`item_id`),
  ADD KEY `fk_invoice` (`invoice_no`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`invoice_no`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `invoice_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_cat` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_invoice` FOREIGN KEY (`invoice_no`) REFERENCES `sales` (`invoice_no`),
  ADD CONSTRAINT `fk_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
