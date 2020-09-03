-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 03:35 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



--
-- Database: `oilfeed`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user_log_id` bigint(19) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_active` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_time` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waste_oil_entry`
--

CREATE TABLE `waste_oil_entry` (
  `waste_oil_id` bigint(19) NOT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `plant_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waste_oil_sale`
--

CREATE TABLE `waste_oil_sale` (
  `waste_sale_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `on_date` date NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_details` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `waste_oil_sale_product`
--

CREATE TABLE `waste_oil_sale_product` (
  `waste_loose_oil_id` bigint(19) NOT NULL,
  `waste_sale_id` bigint(19) NOT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `loose_oil_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `welfare_scheme`
--

CREATE TABLE `welfare_scheme` (
  `welfare_scheme_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount_percentage` int(5) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wet_carton_entry`
--

CREATE TABLE `wet_carton_entry` (
  `wet_carton_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `on_date` date NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`user_log_id`),
  ADD KEY `FKuser_log816755` (`user_id`);

--
-- Indexes for table `waste_oil_entry`
--
ALTER TABLE `waste_oil_entry`
  ADD PRIMARY KEY (`waste_oil_id`),
  ADD KEY `FKwaste_oil_165042` (`loose_oil_id`),
  ADD KEY `FKwaste_oil_137479` (`plant_id`);

--
-- Indexes for table `waste_oil_sale`
--
ALTER TABLE `waste_oil_sale`
  ADD PRIMARY KEY (`waste_sale_id`),
  ADD KEY `FKwaste_oil_51960` (`plant_id`);

--
-- Indexes for table `waste_oil_sale_product`
--
ALTER TABLE `waste_oil_sale_product`
  ADD PRIMARY KEY (`waste_loose_oil_id`),
  ADD KEY `FKwaste_oil_17292` (`waste_sale_id`),
  ADD KEY `FKwaste_oil_950672` (`loose_oil_id`);

--
-- Indexes for table `welfare_scheme`
--
ALTER TABLE `welfare_scheme`
  ADD PRIMARY KEY (`welfare_scheme_id`);

--
-- Indexes for table `wet_carton_entry`
--
ALTER TABLE `wet_carton_entry`
  ADD PRIMARY KEY (`wet_carton_id`),
  ADD KEY `FKwet_carton331559` (`plant_id`),
  ADD KEY `FKwet_carton625908` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `user_log_id` bigint(19) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7944;
--
-- AUTO_INCREMENT for table `waste_oil_entry`
--
ALTER TABLE `waste_oil_entry`
  MODIFY `waste_oil_id` bigint(19) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `waste_oil_sale`
--
ALTER TABLE `waste_oil_sale`
  MODIFY `waste_sale_id` bigint(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `waste_oil_sale_product`
--
ALTER TABLE `waste_oil_sale_product`
  MODIFY `waste_loose_oil_id` bigint(19) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `welfare_scheme`
--
ALTER TABLE `welfare_scheme`
  MODIFY `welfare_scheme_id` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wet_carton_entry`
--
ALTER TABLE `wet_carton_entry`
  MODIFY `wet_carton_id` bigint(19) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `FKuser_log816755` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `waste_oil_entry`
--
ALTER TABLE `waste_oil_entry`
  ADD CONSTRAINT `FKwaste_oil_137479` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`plant_id`),
  ADD CONSTRAINT `FKwaste_oil_165042` FOREIGN KEY (`loose_oil_id`) REFERENCES `loose_oil` (`loose_oil_id`);

--
-- Constraints for table `waste_oil_sale`
--
ALTER TABLE `waste_oil_sale`
  ADD CONSTRAINT `FKwaste_oil_51960` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`plant_id`);

--
-- Constraints for table `waste_oil_sale_product`
--
ALTER TABLE `waste_oil_sale_product`
  ADD CONSTRAINT `FKwaste_oil_17292` FOREIGN KEY (`waste_sale_id`) REFERENCES `waste_oil_sale` (`waste_sale_id`),
  ADD CONSTRAINT `FKwaste_oil_950672` FOREIGN KEY (`loose_oil_id`) REFERENCES `loose_oil` (`loose_oil_id`);

--
-- Constraints for table `wet_carton_entry`
--
ALTER TABLE `wet_carton_entry`
  ADD CONSTRAINT `FKwet_carton331559` FOREIGN KEY (`plant_id`) REFERENCES `plant` (`plant_id`),
  ADD CONSTRAINT `FKwet_carton625908` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
