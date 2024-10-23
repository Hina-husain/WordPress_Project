-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2023 at 04:18 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `is_active` int(30) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `com_id` int(11) NOT NULL,
  `company_name` varchar(55) NOT NULL,
  `is_active` int(30) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_contact` varchar(40) NOT NULL,
  `c_address` varchar(60) NOT NULL,
  `c_previous_bal` varchar(40) NOT NULL,
  `c_city` varchar(30) NOT NULL,
  `is_active` int(30) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `min_sale_price` int(11) DEFAULT NULL,
  `max_sale_price` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `com_id_FK` int(11) DEFAULT NULL,
  `cat_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_accounts`
--

CREATE TABLE `purchase_accounts` (
  `pur_account_id` int(11) NOT NULL,
  `pur_account_date` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `vendor_id_FK` int(11) DEFAULT NULL,
  `customer_id_FK` int(11) DEFAULT NULL,
  `invoice_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice`
--

CREATE TABLE `purchase_invoice` (
  `invoice_id` int(11) NOT NULL,
  `cash` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `transport` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `invoice_date` datetime DEFAULT current_timestamp(),
  `vendor_id_FK` int(11) DEFAULT NULL,
  `customer_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `pur_item_id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `pur_item_date` datetime DEFAULT current_timestamp(),
  `pur_invoice_id_FK` int(11) DEFAULT NULL,
  `product_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchasing`
--

CREATE TABLE `purchasing` (
  `id` int(11) NOT NULL,
  `product_name` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `transport` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `p_date` datetime DEFAULT current_timestamp(),
  `vendor_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale_accounts`
--

CREATE TABLE `sale_accounts` (
  `sale_account_id` int(11) NOT NULL,
  `sale_account_date` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `vendor_id_FK` int(11) DEFAULT NULL,
  `customer_id_FK` int(11) DEFAULT NULL,
  `invoice_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice`
--

CREATE TABLE `sale_invoice` (
  `sale_id` int(11) NOT NULL,
  `cash` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `transport` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `sale_date` datetime DEFAULT current_timestamp(),
  `vendor_id_FK` int(11) DEFAULT NULL,
  `customer_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sale_item`
--

CREATE TABLE `sale_item` (
  `sale_item_id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `pur_item_date` datetime DEFAULT NULL,
  `pur_invoice_id_FK` int(11) DEFAULT NULL,
  `product_id_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `v_id` int(11) NOT NULL,
  `v_name` varchar(50) NOT NULL,
  `v_contact` varchar(40) NOT NULL,
  `v_address` varchar(60) NOT NULL,
  `previous_balance` varchar(50) NOT NULL,
  `v_city` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `com_id_FK` (`com_id_FK`),
  ADD KEY `cat_id_FK` (`cat_id_FK`);

--
-- Indexes for table `purchase_accounts`
--
ALTER TABLE `purchase_accounts`
  ADD PRIMARY KEY (`pur_account_id`),
  ADD KEY `vendor_id_FK` (`vendor_id_FK`),
  ADD KEY `customer_id_FK` (`customer_id_FK`),
  ADD KEY `invoice_id_FK` (`invoice_id_FK`);

--
-- Indexes for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `vendor_id_FK` (`vendor_id_FK`),
  ADD KEY `customer_id_FK` (`customer_id_FK`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`pur_item_id`),
  ADD KEY `pur_invoice_id_FK` (`pur_invoice_id_FK`),
  ADD KEY `product_id_FK` (`product_id_FK`);

--
-- Indexes for table `purchasing`
--
ALTER TABLE `purchasing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id_FK` (`vendor_id_FK`);

--
-- Indexes for table `sale_accounts`
--
ALTER TABLE `sale_accounts`
  ADD PRIMARY KEY (`sale_account_id`),
  ADD KEY `vendor_id_FK` (`vendor_id_FK`),
  ADD KEY `customer_id_FK` (`customer_id_FK`),
  ADD KEY `invoice_id_FK` (`invoice_id_FK`);

--
-- Indexes for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `vendor_id_FK` (`vendor_id_FK`),
  ADD KEY `customer_id_FK` (`customer_id_FK`);

--
-- Indexes for table `sale_item`
--
ALTER TABLE `sale_item`
  ADD PRIMARY KEY (`sale_item_id`),
  ADD KEY `pur_invoice_id_FK` (`pur_invoice_id_FK`),
  ADD KEY `product_id_FK` (`product_id_FK`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_accounts`
--
ALTER TABLE `purchase_accounts`
  MODIFY `pur_account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `pur_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchasing`
--
ALTER TABLE `purchasing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_accounts`
--
ALTER TABLE `sale_accounts`
  MODIFY `sale_account_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_item`
--
ALTER TABLE `sale_item`
  MODIFY `sale_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`com_id_FK`) REFERENCES `company` (`com_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`cat_id_FK`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `purchase_accounts`
--
ALTER TABLE `purchase_accounts`
  ADD CONSTRAINT `purchase_accounts_ibfk_1` FOREIGN KEY (`vendor_id_FK`) REFERENCES `vendor` (`v_id`),
  ADD CONSTRAINT `purchase_accounts_ibfk_2` FOREIGN KEY (`customer_id_FK`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `purchase_accounts_ibfk_3` FOREIGN KEY (`invoice_id_FK`) REFERENCES `purchase_invoice` (`invoice_id`);

--
-- Constraints for table `purchase_invoice`
--
ALTER TABLE `purchase_invoice`
  ADD CONSTRAINT `purchase_invoice_ibfk_1` FOREIGN KEY (`vendor_id_FK`) REFERENCES `vendor` (`v_id`),
  ADD CONSTRAINT `purchase_invoice_ibfk_2` FOREIGN KEY (`customer_id_FK`) REFERENCES `customer` (`c_id`);

--
-- Constraints for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `purchase_item_ibfk_1` FOREIGN KEY (`pur_invoice_id_FK`) REFERENCES `purchase_invoice` (`invoice_id`),
  ADD CONSTRAINT `purchase_item_ibfk_2` FOREIGN KEY (`product_id_FK`) REFERENCES `product` (`p_id`);

--
-- Constraints for table `purchasing`
--
ALTER TABLE `purchasing`
  ADD CONSTRAINT `purchasing_ibfk_1` FOREIGN KEY (`vendor_id_FK`) REFERENCES `vendor` (`v_id`);

--
-- Constraints for table `sale_accounts`
--
ALTER TABLE `sale_accounts`
  ADD CONSTRAINT `sale_accounts_ibfk_1` FOREIGN KEY (`vendor_id_FK`) REFERENCES `vendor` (`v_id`),
  ADD CONSTRAINT `sale_accounts_ibfk_2` FOREIGN KEY (`customer_id_FK`) REFERENCES `customer` (`c_id`),
  ADD CONSTRAINT `sale_accounts_ibfk_3` FOREIGN KEY (`invoice_id_FK`) REFERENCES `purchase_invoice` (`invoice_id`);

--
-- Constraints for table `sale_invoice`
--
ALTER TABLE `sale_invoice`
  ADD CONSTRAINT `sale_invoice_ibfk_1` FOREIGN KEY (`vendor_id_FK`) REFERENCES `vendor` (`v_id`),
  ADD CONSTRAINT `sale_invoice_ibfk_2` FOREIGN KEY (`customer_id_FK`) REFERENCES `customer` (`c_id`);

--
-- Constraints for table `sale_item`
--
ALTER TABLE `sale_item`
  ADD CONSTRAINT `sale_item_ibfk_1` FOREIGN KEY (`pur_invoice_id_FK`) REFERENCES `purchase_invoice` (`invoice_id`),
  ADD CONSTRAINT `sale_item_ibfk_2` FOREIGN KEY (`product_id_FK`) REFERENCES `product` (`p_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
