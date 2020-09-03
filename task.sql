-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 05:14 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `approval_list`
--

CREATE TABLE `approval_list` (
  `approval_id` bigint(19) NOT NULL,
  `rep_preference_id` bigint(19) NOT NULL,
  `approval_number` bigint(19) NOT NULL,
  `primary_key` bigint(19) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `issue_at` int(5) NOT NULL,
  `name` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `approval_list_history`
--

CREATE TABLE `approval_list_history` (
  `approval_his_id` bigint(19) NOT NULL,
  `approval_id` bigint(19) NOT NULL,
  `issued_by` int(5) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_by` bigint(10) NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_guarantee`
--

CREATE TABLE `bank_guarantee` (
  `bg_id` bigint(10) NOT NULL,
  `distributor_id` bigint(19) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `account_no` varchar(40) DEFAULT NULL,
  `bg_amount` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `block_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`block_id`, `name`, `description`, `status`, `created_by`, `created_time`, `modified_by`, `modified_time`) VALUES
(1, 'Head Office', NULL, 1, 1, '2017-02-04 07:15:00', NULL, NULL),
(2, 'OPS', NULL, 1, 1, '2017-02-04 07:15:00', NULL, NULL),
(3, 'Stock Point', NULL, 1, 1, '2017-02-04 07:15:10', NULL, NULL),
(4, 'C&F', NULL, 1, 1, '2017-02-04 07:15:00', NULL, NULL),
(5, 'Distributor', NULL, 1, 1, '2017-02-04 07:15:00', 0, NULL),
(6, 'Executive', NULL, 1, 1, '2017-02-28 12:57:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `block_designation`
--

CREATE TABLE `block_designation` (
  `block_designation_id` int(5) NOT NULL,
  `block_id` int(5) NOT NULL,
  `designation_id` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `block_designation`
--

INSERT INTO `block_designation` (`block_designation_id`, `block_id`, `designation_id`, `status`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 2, 3, 1),
(5, 2, 4, 1),
(6, 2, 5, 1),
(7, 2, 6, 1),
(8, 2, 7, 1),
(9, 3, 3, 1),
(10, 4, 3, 1),
(11, 1, 8, 1),
(12, 1, 9, 1),
(13, 1, 10, 1),
(14, 5, 11, 1),
(15, 6, 11, 1),
(16, 1, 12, 1),
(17, 1, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `block_designation_page`
--

CREATE TABLE `block_designation_page` (
  `block_designation_id` int(5) NOT NULL,
  `page_id` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `block_designation_page_history`
--

CREATE TABLE `block_designation_page_history` (
  `bdph_id` bigint(19) NOT NULL,
  `page_id` bigint(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `block_designation_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `broker`
--

CREATE TABLE `broker` (
  `broker_id` bigint(10) NOT NULL,
  `broker_code` varchar(20) DEFAULT NULL,
  `agency_name` varchar(100) NOT NULL,
  `concerned_person` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location_id` bigint(10) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `pincode` int(9) DEFAULT NULL,
  `vat_no` varchar(20) DEFAULT NULL,
  `aadhar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `tan_no` varchar(20) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `broker_bank_guarantee`
--

CREATE TABLE `broker_bank_guarantee` (
  `broker_bg_id` bigint(19) NOT NULL,
  `broker_id` bigint(10) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `account_no` varchar(40) DEFAULT NULL,
  `bg_amount` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `capacity`
--

CREATE TABLE `capacity` (
  `capacity_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_id` int(5) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `rank` int(9) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `capacity_micron`
--

CREATE TABLE `capacity_micron` (
  `capacity_id` int(5) NOT NULL,
  `micron_id` int(5) NOT NULL,
  `value` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `capacity_micron_history`
--

CREATE TABLE `capacity_micron_history` (
  `cmh_id` bigint(19) NOT NULL,
  `capacity_id` int(5) NOT NULL,
  `micron_id` int(5) NOT NULL,
  `value` int(8) NOT NULL DEFAULT '0',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counter_sale`
--

CREATE TABLE `counter_sale` (
  `counter_sale_id` bigint(19) NOT NULL,
  `counter_id` bigint(10) NOT NULL,
  `cs_category_id` int(5) NOT NULL,
  `cs_pay_mode_id` int(5) NOT NULL,
  `on_date` date NOT NULL,
  `bill_number` int(10) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `dd_number` varchar(50) DEFAULT NULL,
  `received_denomination` int(10) DEFAULT NULL,
  `total_bill` int(10) NOT NULL,
  `pay_customer` int(10) DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `bank_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  `no_of_cartons` int(10) NOT NULL,
  `amount` int(25) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_debit_purpose`
--

CREATE TABLE `credit_debit_purpose` (
  `purpose_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '1',
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cron_history`
--

CREATE TABLE `cron_history` (
  `cron_id` bigint(19) NOT NULL,
  `cron_type` varchar(50) NOT NULL,
  `cron_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cs_category`
--

CREATE TABLE `cs_category` (
  `cs_category_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cs_pay_mode`
--

CREATE TABLE `cs_pay_mode` (
  `cs_pay_mode_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cs_product`
--

CREATE TABLE `cs_product` (
  `cs_product_id` bigint(19) NOT NULL,
  `counter_sale_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_and_f`
--

CREATE TABLE `c_and_f` (
  `c_and_f_id` bigint(10) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `concerned_person` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `pincode` int(9) DEFAULT NULL,
  `vat_no` varchar(20) DEFAULT NULL,
  `aadhar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `tan_no` varchar(20) DEFAULT NULL,
  `sd_amount` bigint(20) DEFAULT NULL,
  `outstanding_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `agreement_start_date` date DEFAULT NULL,
  `agreement_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_and_f_agreement_history`
--

CREATE TABLE `c_and_f_agreement_history` (
  `cfah_id` bigint(19) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_and_f_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_and_f_bank_gurantee`
--

CREATE TABLE `c_and_f_bank_gurantee` (
  `bg_id` bigint(10) NOT NULL,
  `c_and_f_id` bigint(10) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `account_no` varchar(40) DEFAULT NULL,
  `bg_amount` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_and_f_credit_debit_note`
--

CREATE TABLE `c_and_f_credit_debit_note` (
  `note_id` bigint(19) NOT NULL,
  `purpose_id` int(5) DEFAULT NULL,
  `plant_id` bigint(10) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `on_date` date DEFAULT NULL,
  `note_type` tinyint(2) NOT NULL DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(10) DEFAULT NULL,
  `verified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `c_and_f_payment`
--

CREATE TABLE `c_and_f_payment` (
  `payment_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `pay_mode_id` int(5) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `dd_number` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(10) DEFAULT NULL,
  `verified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daily_corrections`
--

CREATE TABLE `daily_corrections` (
  `correction_id` bigint(19) NOT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_receipt_product`
--

CREATE TABLE `data_receipt_product` (
  `auto_inc_id` bigint(19) NOT NULL,
  `receipt_invoice_product_id` bigint(19) NOT NULL,
  `invoice_do_product_id` bigint(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_invoice_details`
--

CREATE TABLE `deleted_invoice_details` (
  `delete_invoice_id` bigint(19) NOT NULL,
  `invoice_number` int(10) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `do_id` bigint(19) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `invoice_do_id` bigint(19) NOT NULL,
  `invoice_do_product_id` bigint(19) NOT NULL,
  `do_ob_product_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `items_per_carton` int(5) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `plant_id` bigint(19) NOT NULL,
  `created_by` int(9) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designation_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designation_id`, `name`, `description`, `status`, `created_by`, `created_time`, `modified_by`, `modified_time`) VALUES
(1, 'VC&MD', '(NULL)', 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(2, 'Executive', NULL, 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(3, 'Manager', NULL, 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(4, 'Production', NULL, 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(5, 'Quality Controller', NULL, 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(6, 'Weigh Bridge', NULL, 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(7, 'Security', NULL, 1, 0, '2017-02-06 11:55:00', 0, NULL),
(8, 'Admin', NULL, 3, 0, '2017-02-06 11:55:00', NULL, NULL),
(9, 'Super User', NULL, 3, 0, '2017-02-06 11:55:00', NULL, NULL),
(10, 'Deputy Manager', NULL, 1, 0, '2017-02-06 11:55:00', NULL, '2017-02-06 11:55:00'),
(11, 'General', NULL, 1, 0, '2017-02-06 11:55:00', NULL, NULL),
(12, 'Dy.Manager(Mktg)', '', 1, 6, '2017-04-20 14:35:00', NULL, NULL),
(13, 'Concurrent Auditor', '', 1, 6, '2017-04-20 14:35:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designation_reporting`
--

CREATE TABLE `designation_reporting` (
  `reportee_id` int(5) NOT NULL,
  `reporting_id` int(5) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation_reporting`
--

INSERT INTO `designation_reporting` (`reportee_id`, `reporting_id`, `status`) VALUES
(2, 13, 1),
(3, 1, 1),
(13, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `distributor_id` bigint(19) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `type_id` int(5) NOT NULL,
  `agent_id` bigint(19) DEFAULT NULL,
  `distributor_code` varchar(20) DEFAULT NULL,
  `agency_name` varchar(100) NOT NULL,
  `concerned_person` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `distributor_place` varchar(200) DEFAULT NULL,
  `location_id` bigint(10) DEFAULT NULL,
  `pincode` int(9) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `landline` varchar(15) DEFAULT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `vat_no` varchar(20) DEFAULT NULL,
  `aadhar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `tan_no` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `marriage_date` date DEFAULT NULL,
  `executive_id` int(9) DEFAULT NULL,
  `sd_amount` bigint(20) DEFAULT NULL,
  `outstanding_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `agreement_start_date` date DEFAULT NULL,
  `agreement_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_agreement_history`
--

CREATE TABLE `distributor_agreement_history` (
  `dah_id` bigint(19) NOT NULL,
  `distributor_id` bigint(19) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_credit_debit_note`
--

CREATE TABLE `distributor_credit_debit_note` (
  `note_id` bigint(19) NOT NULL,
  `purpose_id` int(5) DEFAULT NULL,
  `distributor_id` bigint(19) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `on_date` date DEFAULT NULL,
  `note_type` tinyint(2) NOT NULL DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(10) DEFAULT NULL,
  `verified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_order`
--

CREATE TABLE `distributor_order` (
  `distributor_id` bigint(19) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_payment`
--

CREATE TABLE `distributor_payment` (
  `payment_id` bigint(19) NOT NULL,
  `pay_mode_id` int(5) NOT NULL,
  `distributor_id` bigint(19) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `dd_number` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(10) DEFAULT NULL,
  `verified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_price_type`
--

CREATE TABLE `distributor_price_type` (
  `price_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_trans`
--

CREATE TABLE `distributor_trans` (
  `dist_trans_id` bigint(11) NOT NULL,
  `distributor_id` bigint(11) NOT NULL,
  `trans_type_id` int(11) NOT NULL,
  `trans_amount` decimal(12,2) NOT NULL,
  `outstanding_amount` decimal(12,2) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `trans_date` date NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_trans_type`
--

CREATE TABLE `distributor_trans_type` (
  `dist_trans_type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributor_type`
--

CREATE TABLE `distributor_type` (
  `type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dist_ob_penalty`
--

CREATE TABLE `dist_ob_penalty` (
  `ob_penality_id` bigint(10) NOT NULL,
  `distributor_id` bigint(19) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` int(9) NOT NULL,
  `weight` decimal(12,3) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `penalty_day` int(5) NOT NULL,
  `penalty_date` date NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `penalty_price` decimal(12,2) NOT NULL,
  `ob_penalty_id` int(5) DEFAULT NULL,
  `total_product_price` decimal(12,2) DEFAULT NULL,
  `distributor_code` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dist_sd_amount_history`
--

CREATE TABLE `dist_sd_amount_history` (
  `sd_amount_h_id` bigint(11) NOT NULL,
  `distributor_id` bigint(19) NOT NULL,
  `sd_amount` decimal(12,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `do`
--

CREATE TABLE `do` (
  `do_id` bigint(19) NOT NULL,
  `do_number` int(10) NOT NULL,
  `do_date` date NOT NULL,
  `lifting_point` bigint(10) DEFAULT NULL,
  `do_distributor_id` bigint(19) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `penality` decimal(12,2) NOT NULL,
  `do_against_id` smallint(4) NOT NULL DEFAULT '1',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `do_against`
--

CREATE TABLE `do_against` (
  `do_against_id` smallint(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `do_order`
--

CREATE TABLE `do_order` (
  `do_ob_id` bigint(19) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `do_id` bigint(19) NOT NULL,
  `penalty_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `do_order_product`
--

CREATE TABLE `do_order_product` (
  `do_ob_product_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `product_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `pending_qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `items_per_carton` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `do_ob_id` bigint(19) NOT NULL,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `executive`
--

CREATE TABLE `executive` (
  `executive_id` bigint(19) NOT NULL,
  `name` varchar(100) NOT NULL,
  `executive_code` varchar(20) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `user_id` bigint(10) NOT NULL,
  `location_id` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `executive_limit`
--

CREATE TABLE `executive_limit` (
  `executive_limit_id` bigint(10) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `executive_id` bigint(19) NOT NULL,
  `ob_limit` decimal(14,6) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ffa_rebate`
--

CREATE TABLE `ffa_rebate` (
  `ffa_rebate_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lower_limit` decimal(8,3) NOT NULL,
  `upper_limit` decimal(8,3) NOT NULL,
  `multiplier` decimal(5,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fgs_free_gift`
--

CREATE TABLE `fgs_free_gift` (
  `gift_product_id` bigint(19) NOT NULL,
  `free_gift_id` bigint(10) NOT NULL,
  `fgs_product_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fgs_free_product`
--

CREATE TABLE `fgs_free_product` (
  `free_product_id` bigint(19) NOT NULL,
  `fgs_product_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `item_type_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fg_scheme_product`
--

CREATE TABLE `fg_scheme_product` (
  `fgs_product_id` bigint(19) NOT NULL,
  `item_type_id` int(5) NOT NULL,
  `gift_type_id` int(5) NOT NULL,
  `fg_scheme_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `free_gift`
--

CREATE TABLE `free_gift` (
  `free_gift_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `free_gift_scheme`
--

CREATE TABLE `free_gift_scheme` (
  `fg_scheme_id` bigint(19) NOT NULL,
  `type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `free_sample`
--

CREATE TABLE `free_sample` (
  `free_sample_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `do_number` int(10) NOT NULL,
  `on_date` date NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gatepass`
--

CREATE TABLE `gatepass` (
  `gatepass_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `gatepass_number` int(10) NOT NULL,
  `on_date` date NOT NULL,
  `way_bill_number` varchar(250) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gatepass_history`
--

CREATE TABLE `gatepass_history` (
  `gatepass_history_id` bigint(19) NOT NULL,
  `gatepass_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `gatepass_number` int(10) NOT NULL,
  `on_date` date NOT NULL,
  `way_bill_number` varchar(255) DEFAULT NULL,
  `invoice_details` mediumtext NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gatepass_invoice`
--

CREATE TABLE `gatepass_invoice` (
  `gatepass_invoice_id` bigint(19) NOT NULL,
  `gatepass_id` bigint(19) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `waybill_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gift_type`
--

CREATE TABLE `gift_type` (
  `gift_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `godown_stock_transfer`
--

CREATE TABLE `godown_stock_transfer` (
  `gst_id` bigint(19) NOT NULL,
  `counter_id` bigint(10) NOT NULL,
  `st_type_id` int(5) NOT NULL,
  `on_date` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gst_product`
--

CREATE TABLE `gst_product` (
  `gst_product_id` bigint(19) NOT NULL,
  `gst_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `product_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` bigint(19) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `received_date` date NOT NULL,
  `lr_number` varchar(50) NOT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_product`
--

CREATE TABLE `insurance_product` (
  `insurance_product_id` bigint(19) NOT NULL,
  `insurance_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `invoice_do_product_id` bigint(19) NOT NULL,
  `leaked_pouches` int(11) NOT NULL,
  `recovered_oil` decimal(12,3) NOT NULL,
  `net_loss` decimal(12,3) NOT NULL,
  `net_loss_amount` decimal(12,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` bigint(19) NOT NULL,
  `invoice_type_id` int(5) NOT NULL DEFAULT '1',
  `plant_id` bigint(10) DEFAULT NULL,
  `invoice_number` int(10) NOT NULL,
  `invoice_date` date NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `vat_percent` int(5) DEFAULT NULL,
  `discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `vehicle_number` varchar(20) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_do`
--

CREATE TABLE `invoice_do` (
  `invoice_do_id` bigint(19) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `do_id` bigint(19) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_do_product`
--

CREATE TABLE `invoice_do_product` (
  `invoice_do_product_id` bigint(19) NOT NULL,
  `invoice_do_id` bigint(19) NOT NULL,
  `do_ob_product_id` bigint(19) DEFAULT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_free_gift`
--

CREATE TABLE `invoice_free_gift` (
  `invoice_fg_id` bigint(19) NOT NULL,
  `free_gift_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `invoice_scheme_id` bigint(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_free_product`
--

CREATE TABLE `invoice_free_product` (
  `invoice_free_product_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `item_type_id` int(5) NOT NULL,
  `invoice_scheme_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_pm`
--

CREATE TABLE `invoice_pm` (
  `invoice_pm_id` bigint(19) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_scheme`
--

CREATE TABLE `invoice_scheme` (
  `invoice_scheme_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `fg_scheme_id` bigint(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_type`
--

CREATE TABLE `invoice_type` (
  `invoice_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE `item_type` (
  `item_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_entry`
--

CREATE TABLE `leakage_entry` (
  `leakage_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `leakage_number` int(10) NOT NULL,
  `on_date` date NOT NULL,
  `type` smallint(2) NOT NULL DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_pm`
--

CREATE TABLE `leakage_pm` (
  `lpm_id` bigint(19) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `ops_leakage_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_pm_micron`
--

CREATE TABLE `leakage_pm_micron` (
  `leakage_pm_id` bigint(19) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `ops_leakage_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `micron_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_product`
--

CREATE TABLE `leakage_product` (
  `leakage_product_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `leaked_pouches` int(9) NOT NULL DEFAULT '0',
  `items_per_carton` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `leakage_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_recovered_oil`
--

CREATE TABLE `leakage_recovered_oil` (
  `oil_recovery_id` bigint(19) NOT NULL,
  `recovery_id` bigint(19) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `oil_weight` decimal(12,3) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_recovered_products`
--

CREATE TABLE `leakage_recovered_products` (
  `recovery_product_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `recovery_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL,
  `recovered_pouches` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leakage_recovery`
--

CREATE TABLE `leakage_recovery` (
  `recovery_id` bigint(19) NOT NULL,
  `leakage_id` bigint(19) NOT NULL,
  `on_date` date DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lit_product`
--

CREATE TABLE `lit_product` (
  `lit_product_id` bigint(19) NOT NULL,
  `lit_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `lost_pouches` int(9) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` bigint(10) DEFAULT NULL,
  `level_id` bigint(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` bigint(10) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loose_oil`
--

CREATE TABLE `loose_oil` (
  `loose_oil_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `short_name` varchar(100) NOT NULL,
  `rank` int(9) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `ob_status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `loose_oil_code` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loose_oil_test`
--

CREATE TABLE `loose_oil_test` (
  `test_id` bigint(10) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `test_unit_id` bigint(10) DEFAULT NULL,
  `test_group_id` bigint(10) NOT NULL,
  `range_type_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order` int(5) NOT NULL,
  `lower_limit` varchar(20) DEFAULT NULL,
  `lower_check` tinyint(1) NOT NULL DEFAULT '1',
  `upper_check` tinyint(1) NOT NULL DEFAULT '1',
  `upper_limit` varchar(20) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loss_in_transit`
--

CREATE TABLE `loss_in_transit` (
  `lit_id` bigint(19) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `transporter_name` varchar(250) NOT NULL,
  `lr_number` varchar(100) NOT NULL,
  `lr_date` date NOT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `micron`
--

CREATE TABLE `micron` (
  `micron_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mrr_fg`
--

CREATE TABLE `mrr_fg` (
  `mrr_fg_id` bigint(19) NOT NULL,
  `tanker_fg_id` bigint(19) NOT NULL,
  `mrr_number` int(10) NOT NULL,
  `received_qty` int(10) DEFAULT NULL,
  `ledger_number` varchar(50) DEFAULT NULL,
  `folio_number` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `mrr_date` date DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mrr_oil`
--

CREATE TABLE `mrr_oil` (
  `mrr_oil_id` bigint(19) NOT NULL,
  `tanker_oil_id` bigint(19) NOT NULL,
  `mrr_number` int(10) NOT NULL,
  `ledger_number` varchar(50) DEFAULT NULL,
  `folio_number` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `mrr_date` date DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `oil_tank_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mrr_oil_history`
--

CREATE TABLE `mrr_oil_history` (
  `mrr_oil_history_id` bigint(12) NOT NULL,
  `mrr_oil_id` bigint(12) NOT NULL,
  `tanker_oil_id` bigint(12) NOT NULL,
  `mrr_number` bigint(12) NOT NULL,
  `ledger_number` varchar(100) DEFAULT NULL,
  `folio_number` varchar(100) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `mrr_date` date NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `oil_tank_id` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mrr_pm`
--

CREATE TABLE `mrr_pm` (
  `mrr_pm_id` bigint(19) NOT NULL,
  `tanker_pm_id` bigint(19) NOT NULL,
  `mrr_number` int(10) NOT NULL,
  `received_qty` int(10) DEFAULT NULL,
  `ledger_number` varchar(50) DEFAULT NULL,
  `folio_number` varchar(50) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `mrr_date` date DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mrr_pm_film`
--

CREATE TABLE `mrr_pm_film` (
  `mrr_pm_film_id` bigint(19) NOT NULL,
  `mrr_pm_id` bigint(19) NOT NULL,
  `micron_id` int(5) NOT NULL,
  `no_of_rolls` int(10) NOT NULL,
  `core_carton_weight` decimal(12,3) NOT NULL,
  `received_quantity` decimal(12,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mrr_pm_history`
--

CREATE TABLE `mrr_pm_history` (
  `mrr_pm_history_id` bigint(12) NOT NULL,
  `mrr_pm_id` bigint(12) NOT NULL,
  `tanker_pm_id` bigint(12) NOT NULL,
  `mrr_number` bigint(12) NOT NULL,
  `received_qty` decimal(12,3) NOT NULL,
  `ledger_number` varchar(100) DEFAULT NULL,
  `folio_number` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `mrr_date` date NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtp_oil`
--

CREATE TABLE `mtp_oil` (
  `mtp_oil_id` bigint(19) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `mtp_number` int(9) NOT NULL,
  `tender_date` date NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `remarks3` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mtp_pm`
--

CREATE TABLE `mtp_pm` (
  `mtp_pm_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `mtp_number` int(9) NOT NULL,
  `mtp_date` date NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `remarks3` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ob_penalty`
--

CREATE TABLE `ob_penalty` (
  `ob_penalty_id` int(5) NOT NULL,
  `penalty_days` int(5) NOT NULL,
  `penalty` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ob_status_history`
--

CREATE TABLE `ob_status_history` (
  `ob_status_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ob_type`
--

CREATE TABLE `ob_type` (
  `ob_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `distributor_type_id` int(5) DEFAULT NULL,
  `price_type_id` int(5) NOT NULL,
  `has_discount` tinyint(1) DEFAULT '0',
  `discount_percentage` int(5) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oil_ob_status_history`
--

CREATE TABLE `oil_ob_status_history` (
  `oil_ob_status_id` bigint(19) NOT NULL,
  `loose_oil_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oil_stock_balance`
--

CREATE TABLE `oil_stock_balance` (
  `oil_stock_balance_id` bigint(19) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `on_date` date NOT NULL,
  `opening_balance` decimal(12,3) NOT NULL,
  `receipts` decimal(14,6) NOT NULL DEFAULT '0.000000',
  `production` decimal(14,6) NOT NULL DEFAULT '0.000000',
  `recovered` decimal(14,6) NOT NULL DEFAULT '0.000000',
  `closing_balance` decimal(12,3) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oil_tank`
--

CREATE TABLE `oil_tank` (
  `oil_tank_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `capacity` varchar(100) DEFAULT NULL,
  `opening_stock` decimal(12,2) DEFAULT NULL,
  `plant_id` bigint(10) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oil_tank_history`
--

CREATE TABLE `oil_tank_history` (
  `oth_id` bigint(19) NOT NULL,
  `oil_tank_id` bigint(10) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `modified_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ops_leakage`
--

CREATE TABLE `ops_leakage` (
  `ops_leakage_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `on_date` date NOT NULL,
  `leakage_number` int(10) NOT NULL,
  `leakage_quantity` int(10) NOT NULL,
  `leaked_pouches` int(10) NOT NULL DEFAULT '0',
  `oil_recovered` decimal(12,3) NOT NULL,
  `recovered_quantity` int(10) NOT NULL DEFAULT '0',
  `recover_type` int(5) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ops_processing_loss`
--

CREATE TABLE `ops_processing_loss` (
  `processing_loss_id` int(9) NOT NULL,
  `plant_id` bigint(10) DEFAULT NULL,
  `loose_oil_id` int(5) DEFAULT NULL,
  `quantity` decimal(12,3) DEFAULT NULL,
  `on_date` date DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `created_by` bigint(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(11) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` bigint(19) NOT NULL,
  `lifting_point` bigint(10) NOT NULL,
  `ob_type_id` int(5) NOT NULL,
  `welfare_scheme_id` bigint(10) DEFAULT NULL,
  `order_number` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `type` smallint(2) NOT NULL DEFAULT '1',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_product_id` bigint(19) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `pending_qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `unit_price` decimal(12,2) NOT NULL,
  `add_price` decimal(12,2) DEFAULT NULL,
  `items_per_carton` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packing_material`
--

CREATE TABLE `packing_material` (
  `pm_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pm_code` varchar(100) DEFAULT NULL,
  `pm_category_id` int(5) NOT NULL,
  `pm_group_id` int(9) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packing_material_capacity`
--

CREATE TABLE `packing_material_capacity` (
  `pm_id` bigint(10) NOT NULL,
  `capacity_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packing_material_category`
--

CREATE TABLE `packing_material_category` (
  `pm_category_id` int(5) NOT NULL,
  `packing_type_id` int(5) NOT NULL,
  `pm_unit` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packing_material_test`
--

CREATE TABLE `packing_material_test` (
  `pm_test_id` bigint(10) NOT NULL,
  `range_type_id` bigint(10) NOT NULL,
  `pm_category_id` int(5) NOT NULL,
  `test_unit_id` bigint(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `order` int(5) NOT NULL,
  `lower_limit` varchar(20) DEFAULT NULL,
  `lower_check` tinyint(1) NOT NULL DEFAULT '1',
  `upper_check` tinyint(1) NOT NULL DEFAULT '1',
  `upper_limit` varchar(20) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `specification_type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `packing_type`
--

CREATE TABLE `packing_type` (
  `packing_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `pay_mode_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plant`
--

CREATE TABLE `plant` (
  `plant_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `plant_code` int(9) DEFAULT NULL,
  `tally_code` int(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location_id` bigint(10) NOT NULL,
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant`
--

INSERT INTO `plant` (`plant_id`, `name`, `short_name`, `plant_code`, `tally_code`, `description`, `address`, `location_id`, `remarks1`, `remarks2`, `status`, `created_by`, `created_time`, `modified_by`, `modified_time`) VALUES
(1, 'Distributor', 'DISTB', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, '2017-02-10 07:30:00', NULL, NULL),
(2, 'Head Office', 'HO', NULL, NULL, NULL, '', 1, NULL, NULL, 1, 0, '2017-02-10 07:30:00', NULL, NULL),
(3, 'Executive', 'EXEC', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, '2017-02-28 12:58:00', NULL, NULL),
(4, 'Kakinada OPS', 'KKD', 2000, 2, '', '', 20, NULL, NULL, 1, 2, '2017-03-06 09:10:06', NULL, NULL),
(6, 'Vijayawada Stock Point', 'VJA', 5000, 9, '', 'AP cooperative oil seed growers federation limited, Oil stock Point Vijayawada [5000] D.No.59A-21-3/1, Vivekananda Colony, High School Road, , VIJAYAWADA , Krishna ', 21, NULL, NULL, 1, 2, '2017-03-06 09:29:30', 6, '2017-04-25 16:27:38'),
(7, 'Tirupathi Stock Point', 'TPT', 7000, 5, '', 'AP coperative oil seed growers federation limitied, Oil stock Point Tirupati [ 7000 ]\r\nD.NO.7-121/E, SRINAGAR COLONY, NEAR WATER TANK VAIKUNTA , TIRUPATI , Chittor', 23, NULL, NULL, 1, 2, '2017-03-15 12:21:25', 6, '2017-04-25 16:27:49'),
(8, 'Vizag Stock Point', 'VIZ', 6000, 4, '', 'APOILFED VIJAYA OIL STOCK POINT VIZAG   [ 6000 ],  D.NO.39-25-10/6,SEETHANNA GARDENS, MADHAVADHARA, OPP KR , VISHAKAPATNAM , Vizag\r\nPh No: 08912504653', 24, NULL, NULL, 1, 2, '2017-03-15 12:21:57', 6, '2017-04-25 16:28:08'),
(9, 'Anantapur Stock Point', 'ATP', 8000, 8, '', 'AP cooperative oil seed growers federation limited, Anantapur Stock Point  [ 8000 ] , VOC, TAPOVANAM , ANANTHAPUR , Anantapur', 25, NULL, NULL, 1, 2, '2017-03-15 12:22:38', 6, '2017-04-25 16:26:33'),
(10, 'Sarvepalli', 'SPY', 1000, 1, 'Oil Packing Station', 'Sy.No.1394/1, Sarvepalli (V), Venkatachalam (M) - 524321, S.P.S.R.Nellore (District),AP.', 629, NULL, NULL, 1, 6, '2017-03-28 12:45:50', 6, '2017-06-06 19:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `plant_block`
--

CREATE TABLE `plant_block` (
  `plant_id` bigint(10) NOT NULL,
  `block_id` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_block`
--

INSERT INTO `plant_block` (`plant_id`, `block_id`, `status`) VALUES
(1, 5, 1),
(2, 1, 1),
(3, 6, 1),
(4, 2, 1),
(6, 3, 1),
(7, 3, 1),
(8, 3, 1),
(9, 3, 1),
(10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plant_counter`
--

CREATE TABLE `plant_counter` (
  `counter_id` bigint(10) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_counter`
--

INSERT INTO `plant_counter` (`counter_id`, `plant_id`, `name`, `status`, `modified_by`, `modified_time`) VALUES
(2, 6, 'VIjawada Stock Point', 1, NULL, NULL),
(3, 7, 'Tirupathi Stock Point', 1, NULL, NULL),
(4, 8, 'Vizag Stock Point', 1, NULL, NULL),
(5, 9, 'Anantapur Stock Point', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plant_counter_product`
--

CREATE TABLE `plant_counter_product` (
  `product_id` bigint(10) NOT NULL,
  `counter_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `loose_pouches` int(10) NOT NULL,
  `updated_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plant_film_stock`
--

CREATE TABLE `plant_film_stock` (
  `plant_film_stock_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `micron_id` int(5) NOT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_film_stock`
--

INSERT INTO `plant_film_stock` (`plant_film_stock_id`, `plant_id`, `pm_id`, `micron_id`, `quantity`, `status`, `modified_by`, `modified_time`) VALUES
(17, 4, 66, 2, '1577.246', 1, NULL, NULL),
(18, 4, 67, 2, '976.794', 1, NULL, NULL),
(19, 4, 33, 2, '509.507', 1, NULL, NULL),
(20, 4, 58, 2, '-2.185', 1, NULL, NULL),
(21, 4, 59, 2, '583.051', 1, 1562, '2017-05-30 20:04:19'),
(22, 4, 45, 2, '1918.108', 1, 6, '2017-06-02 21:25:39'),
(23, 4, 60, 2, '1023.342', 1, NULL, NULL),
(24, 4, 52, 2, '582.773', 1, NULL, NULL),
(25, 4, 63, 2, '1136.319', 1, 6, '2017-06-02 21:25:39'),
(26, 4, 40, 2, '2467.151', 1, NULL, NULL),
(27, 4, 62, 2, '683.035', 1, NULL, NULL),
(28, 4, 1, 2, '-88.173', 1, 1562, '2017-05-30 20:01:57'),
(29, 4, 55, 2, '669.325', 1, NULL, NULL),
(30, 4, 57, 2, '886.569', 1, NULL, NULL),
(31, 4, 56, 2, '367.165', 1, NULL, NULL),
(32, 4, 33, 3, '-328.752', 1, 6, '2017-06-02 21:25:39'),
(35, 4, 40, 3, '0.000', 1, NULL, NULL),
(36, 4, 97, 2, '235.960', 1, 6, '2017-06-02 21:25:39'),
(37, 4, 1, 3, '1863.923', 1, 6, '2017-06-02 21:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `plant_free_gift`
--

CREATE TABLE `plant_free_gift` (
  `plant_id` bigint(10) NOT NULL,
  `free_gift_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `updated_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plant_location`
--

CREATE TABLE `plant_location` (
  `plant_id` bigint(10) NOT NULL,
  `location_id` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plant_order`
--

CREATE TABLE `plant_order` (
  `plant_id` bigint(10) NOT NULL,
  `order_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_order`
--

INSERT INTO `plant_order` (`plant_id`, `order_id`, `status`) VALUES
(6, 319, 1),
(6, 326, 1),
(6, 339, 1),
(6, 340, 1),
(6, 341, 1),
(6, 357, 1),
(6, 408, 1),
(6, 423, 1),
(6, 424, 1),
(6, 435, 1),
(6, 443, 1),
(6, 451, 1),
(6, 458, 1),
(6, 476, 1),
(6, 485, 1),
(6, 501, 1),
(6, 507, 1),
(6, 513, 1),
(6, 517, 1),
(6, 535, 1),
(6, 536, 1),
(6, 537, 1),
(6, 550, 1),
(6, 601, 1),
(6, 605, 1),
(6, 613, 1),
(6, 616, 1),
(6, 643, 1),
(6, 644, 1),
(6, 666, 1),
(6, 673, 1),
(6, 678, 1),
(6, 692, 1),
(6, 712, 1),
(6, 733, 1),
(6, 771, 1),
(6, 777, 1),
(6, 786, 1),
(6, 788, 1),
(6, 803, 1),
(6, 816, 1),
(6, 824, 1),
(6, 870, 1),
(6, 871, 1),
(6, 881, 1),
(6, 897, 1),
(6, 909, 1),
(6, 918, 1),
(6, 944, 1),
(6, 949, 1),
(6, 1007, 1),
(6, 1064, 1),
(6, 1116, 1),
(6, 1117, 1),
(6, 1118, 1),
(6, 1144, 1),
(6, 1152, 1),
(6, 1153, 1),
(6, 1154, 1),
(6, 1170, 1),
(6, 1173, 1),
(6, 1187, 1),
(6, 1208, 1),
(6, 1233, 1),
(6, 1237, 1),
(6, 1239, 1),
(6, 1254, 1),
(6, 1255, 1),
(6, 1271, 1),
(6, 1272, 1),
(6, 1276, 1),
(6, 1293, 1),
(6, 1300, 1),
(6, 1314, 1),
(6, 1319, 1),
(6, 1328, 1),
(6, 1371, 1),
(6, 1379, 1),
(6, 1398, 1),
(6, 1412, 1),
(6, 1447, 1),
(6, 1461, 1),
(6, 1479, 1),
(6, 1505, 1),
(6, 1507, 1),
(7, 282, 1),
(7, 283, 1),
(7, 338, 1),
(7, 402, 1),
(7, 417, 1),
(7, 418, 1),
(7, 441, 1),
(7, 444, 1),
(7, 466, 1),
(7, 509, 1),
(7, 523, 1),
(7, 526, 1),
(7, 540, 1),
(7, 588, 1),
(7, 634, 1),
(7, 636, 1),
(7, 654, 1),
(7, 659, 1),
(7, 694, 1),
(7, 720, 1),
(7, 778, 1),
(7, 791, 1),
(7, 885, 1),
(7, 916, 1),
(7, 961, 1),
(7, 1053, 1),
(7, 1119, 1),
(7, 1179, 1),
(7, 1226, 1),
(7, 1269, 1),
(7, 1289, 1),
(7, 1308, 1),
(7, 1336, 1),
(7, 1343, 1),
(7, 1359, 1),
(7, 1414, 1),
(7, 1415, 1),
(7, 1442, 1),
(7, 1448, 1),
(7, 1474, 1),
(7, 1491, 1),
(7, 1496, 1),
(7, 1527, 1),
(8, 287, 1),
(8, 288, 1),
(8, 381, 1),
(8, 382, 1),
(8, 467, 1),
(8, 584, 1),
(8, 688, 1),
(8, 817, 1),
(8, 945, 1),
(8, 1165, 1),
(8, 1366, 1),
(8, 1400, 1),
(8, 1401, 1),
(8, 1499, 1),
(8, 1511, 1),
(8, 1512, 1),
(9, 542, 1),
(9, 543, 1),
(9, 652, 1),
(9, 761, 1),
(9, 1260, 1),
(9, 1327, 1),
(9, 1475, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plant_pm`
--

CREATE TABLE `plant_pm` (
  `plant_id` bigint(10) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `updated_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_pm`
--

INSERT INTO `plant_pm` (`plant_id`, `pm_id`, `quantity`, `updated_time`) VALUES
(4, 1, '1863.288', '2017-06-07 16:47:09'),
(4, 2, '10813.000', '2017-06-08 18:53:52'),
(4, 3, '22075.200', '2017-06-08 18:53:52'),
(4, 4, '17045.000', '2017-06-08 18:53:52'),
(4, 5, '1620.000', '2017-06-07 15:56:04'),
(4, 6, '9660.000', '2017-04-13 10:46:20'),
(4, 13, '13985.000', '2017-06-02 21:25:39'),
(4, 15, '2173.000', '2017-06-08 15:21:18'),
(4, 16, '42349.000', '2017-06-02 21:25:39'),
(4, 17, '24762.000', '2017-06-02 21:25:39'),
(4, 18, '31984.000', '2017-06-02 21:25:39'),
(4, 20, '106857.000', '2017-04-01 17:31:38'),
(4, 21, '63216.000', '2017-04-01 17:31:38'),
(4, 22, '4115.000', '2017-04-01 17:31:38'),
(4, 23, '4532.000', '2017-06-06 15:39:13'),
(4, 25, '39518.000', '2017-04-01 17:31:38'),
(4, 26, '7316.000', '2017-04-01 17:31:38'),
(4, 28, '29801.000', '2017-04-01 17:31:38'),
(4, 29, '2400.000', '2017-04-01 17:31:38'),
(4, 32, '10088.000', '2017-04-01 17:31:38'),
(4, 33, '3482.755', '2017-06-02 21:25:39'),
(4, 34, '32696.000', '2017-06-07 20:15:50'),
(4, 36, '2114.000', '2017-05-11 13:47:48'),
(4, 37, '23501.000', '2017-05-09 15:48:22'),
(4, 38, '8310.000', '2017-04-14 12:21:06'),
(4, 40, '2529.151', '2017-05-20 18:26:40'),
(4, 41, '19624.000', '2017-06-07 20:16:45'),
(4, 44, '7108.000', '2017-04-01 17:31:38'),
(4, 45, '5687.628', '2017-06-02 21:25:39'),
(4, 46, '9815.000', '2017-06-07 20:17:53'),
(4, 49, '8236.000', '2017-04-10 13:42:53'),
(4, 51, '10830.000', '2017-04-10 13:42:53'),
(4, 52, '582.773', '2017-04-01 17:44:08'),
(4, 55, '669.325', '2017-04-01 17:44:08'),
(4, 56, '367.165', '2017-04-28 16:58:48'),
(4, 57, '818.893', '2017-04-01 17:44:08'),
(4, 58, '-0.185', '2017-04-01 17:44:08'),
(4, 59, '583.051', '2017-05-30 20:04:19'),
(4, 60, '1023.342', '2017-04-01 17:44:08'),
(4, 61, '0.000', NULL),
(4, 62, '683.035', '2017-04-01 17:44:08'),
(4, 63, '1103.637', '2017-06-02 21:25:39'),
(4, 64, '0.000', NULL),
(4, 65, '0.000', NULL),
(4, 66, '1577.246', '2017-04-01 17:44:08'),
(4, 67, '976.794', '2017-04-01 17:44:08'),
(4, 68, '5697.000', '2017-04-01 17:31:38'),
(4, 69, '19721.000', '2017-06-05 10:26:57'),
(4, 70, '2328.000', '2017-06-02 21:25:39'),
(4, 71, '8160.000', '2017-04-26 12:43:41'),
(4, 72, '3080.000', '2017-04-10 13:42:53'),
(4, 73, '9471.000', '2017-04-01 17:31:38'),
(4, 74, '0.000', NULL),
(4, 75, '608.000', '2017-04-01 17:31:38'),
(4, 76, '0.000', NULL),
(4, 77, '0.000', NULL),
(4, 78, '316.000', '2017-04-01 17:31:38'),
(4, 79, '8665.000', '2017-06-08 17:18:18'),
(4, 81, '1844.000', '2017-06-05 10:26:57'),
(4, 82, '11930.000', '2017-04-01 17:31:38'),
(4, 83, '-5.000', NULL),
(4, 84, '9631.000', '2017-06-02 21:25:39'),
(4, 85, '48031.000', '2017-06-06 19:51:54'),
(4, 88, '40.356', '2017-05-12 17:04:28'),
(4, 89, '128.610', '2017-05-26 18:55:25'),
(4, 90, '4494.000', NULL),
(4, 91, '0.000', NULL),
(4, 92, '0.000', NULL),
(4, 93, '0.000', NULL),
(4, 94, '0.000', NULL),
(4, 96, '0.000', '2017-05-11 00:00:00'),
(4, 97, '235.960', '2017-06-02 21:25:39'),
(6, 2, '-35.000', '2017-06-08 16:57:44'),
(6, 3, '-220.800', '2017-06-08 16:57:44'),
(6, 4, '-153.200', '2017-06-08 16:57:44'),
(6, 34, '-67.000', '2017-06-08 16:32:28'),
(6, 41, '-27.000', '2017-06-08 16:32:28'),
(6, 46, '-39.000', '2017-06-02 16:47:09'),
(6, 69, '2.000', '2017-06-06 10:31:10'),
(6, 79, '2.000', '2017-06-06 10:31:10'),
(6, 81, '17.000', '2017-06-06 10:31:10'),
(6, 85, '-1.000', '2017-05-24 13:14:21'),
(6, 89, '-0.063', '2017-04-18 14:54:03'),
(7, 2, '-568.000', '2017-06-08 18:02:41'),
(7, 3, '-1060.800', '2017-06-08 18:02:41'),
(7, 4, '-707.200', '2017-06-08 18:02:41'),
(7, 34, '-121.000', '2017-06-08 17:59:28'),
(7, 46, '-192.000', '2017-06-08 17:59:58'),
(7, 85, '-3.000', '2017-05-08 13:47:27'),
(8, 2, '-337.000', '2017-06-08 16:12:39'),
(8, 3, '-796.800', '2017-06-08 16:16:03'),
(8, 4, '-531.200', '2017-06-08 16:16:03'),
(8, 34, '-57.000', '2017-06-08 16:16:03'),
(8, 41, '-40.000', '2017-04-22 15:11:55'),
(8, 46, '-205.000', '2017-06-08 16:14:33'),
(9, 2, '-3.000', '2017-05-29 10:27:00'),
(9, 3, '-14.400', '2017-06-07 17:15:11'),
(9, 4, '-8.600', '2017-06-07 17:15:11'),
(9, 85, '1.000', '2017-06-07 17:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `plant_product`
--

CREATE TABLE `plant_product` (
  `plant_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `loose_pouches` int(10) DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_product`
--

INSERT INTO `plant_product` (`plant_id`, `product_id`, `quantity`, `loose_pouches`, `updated_time`) VALUES
(4, 4, '475.00', 0, '2017-04-01 13:05:15'),
(4, 6, '0.00', 0, '2017-05-24 18:46:31'),
(4, 7, '0.00', 0, '2017-05-22 16:58:27'),
(4, 9, '3.00', 0, '2017-06-08 18:52:19'),
(4, 10, '1.00', 0, '2017-05-15 19:55:11'),
(4, 11, '110.00', 0, '2017-06-08 18:52:19'),
(4, 12, '0.00', 0, '2017-05-25 19:45:03'),
(4, 13, '0.00', 0, '2017-06-07 18:28:03'),
(4, 14, '88.00', 0, '2017-06-06 19:39:18'),
(4, 15, '87.00', 0, '2017-04-01 13:05:15'),
(4, 16, '0.00', 0, '2017-04-01 13:05:15'),
(4, 18, '0.00', 0, '2017-04-01 13:05:15'),
(4, 19, '0.00', 0, '2017-04-01 13:05:15'),
(4, 20, '0.00', 0, '2017-04-01 13:05:15'),
(4, 21, '1072.00', 0, '2017-06-08 18:52:19'),
(4, 23, '83.00', 0, '2017-06-07 19:50:21'),
(4, 24, '32.00', 0, '2017-06-05 19:39:43'),
(4, 25, '33.00', 0, '2017-06-07 19:50:21'),
(4, 28, '183.00', 0, '2017-06-08 18:52:19'),
(4, 29, '498.00', 0, '2017-06-05 19:39:43'),
(4, 31, '188.00', 0, '2017-06-08 18:52:19'),
(4, 32, '1250.00', 0, '2017-06-08 18:52:19'),
(4, 33, '217.00', 0, '2017-06-05 19:39:43'),
(4, 35, '214.00', 0, '2017-06-01 19:52:46'),
(4, 36, '0.00', 0, '2017-04-01 13:05:15'),
(4, 37, '9.00', 0, '2017-04-11 20:49:03'),
(4, 41, '917.00', 0, '2017-06-08 18:52:19'),
(4, 42, '0.00', 0, '2017-06-01 19:52:46'),
(4, 43, '199.00', 0, '2017-06-08 18:52:19'),
(4, 45, '6.00', 0, '2017-06-05 19:39:43'),
(4, 47, '0.00', 0, '2017-06-06 17:33:08'),
(4, 48, '123.00', 0, '2017-06-08 18:52:19'),
(4, 49, '226.00', 0, '2017-05-30 20:04:19'),
(4, 52, '0.00', 0, '2017-04-01 13:05:15'),
(4, 54, '44.00', 0, '2017-05-30 19:32:57'),
(4, 55, '2800.00', 0, '2017-06-08 18:52:19'),
(4, 56, '1572.00', 0, '2017-06-01 19:52:46'),
(6, 4, '1.00', NULL, '2017-04-11 10:58:19'),
(6, 6, '5.00', NULL, '2017-05-25 10:21:22'),
(6, 7, '2.44', NULL, '2017-04-11 10:58:19'),
(6, 9, '3.00', NULL, '2017-05-31 14:30:23'),
(6, 10, '6.00', NULL, '2017-05-25 10:21:22'),
(6, 11, '50.00', NULL, '2017-06-06 12:36:22'),
(6, 12, '0.00', NULL, '2017-05-03 11:20:18'),
(6, 13, '2.00', NULL, '2017-04-01 08:48:32'),
(6, 14, '40.00', NULL, '2017-06-06 12:36:22'),
(6, 21, '228.86', NULL, '2017-06-08 16:32:28'),
(6, 23, '169.00', NULL, '2017-06-07 10:41:25'),
(6, 24, '103.00', NULL, '2017-06-08 16:56:21'),
(6, 25, '74.00', NULL, '2017-05-17 10:56:37'),
(6, 28, '99.00', NULL, '2017-06-06 12:36:22'),
(6, 29, '36.31', NULL, '2017-05-03 11:20:18'),
(6, 31, '55.00', NULL, '2017-06-05 10:54:47'),
(6, 32, '254.44', NULL, '2017-06-08 10:16:55'),
(6, 33, '43.50', NULL, '2017-05-27 12:01:07'),
(6, 35, '164.49', NULL, '2017-06-08 16:32:28'),
(6, 36, '0.00', NULL, '2017-04-01 08:48:32'),
(6, 37, '25.00', NULL, '2017-05-10 10:39:56'),
(6, 40, '1.00', 0, '2017-04-17 11:15:40'),
(6, 41, '517.94', NULL, '2017-06-08 16:57:44'),
(6, 42, '0.00', NULL, '2017-04-19 11:35:50'),
(6, 43, '125.00', NULL, '2017-06-06 10:31:10'),
(6, 45, '126.00', NULL, '2017-06-08 16:32:28'),
(6, 47, '0.00', NULL, '2017-04-01 08:48:32'),
(6, 48, '87.75', NULL, '2017-06-08 16:32:28'),
(6, 49, '50.53', NULL, '2017-05-17 10:56:37'),
(6, 54, '46.31', NULL, '2017-06-08 16:32:28'),
(7, 4, '0.00', NULL, '2017-05-20 09:08:56'),
(7, 7, '3.00', NULL, '2017-05-20 09:08:56'),
(7, 10, '0.00', NULL, '2017-04-01 09:48:26'),
(7, 11, '157.00', NULL, '2017-06-08 17:55:02'),
(7, 12, '137.88', NULL, '2017-06-08 17:55:02'),
(7, 13, '9.00', NULL, '2017-04-01 09:48:26'),
(7, 14, '87.00', NULL, '2017-06-04 13:22:15'),
(7, 15, '19.00', NULL, '2017-05-12 14:03:45'),
(7, 21, '430.18', NULL, '2017-06-08 17:59:28'),
(7, 23, '29.00', NULL, '2017-05-31 16:14:52'),
(7, 24, '0.00', NULL, '2017-04-01 09:48:26'),
(7, 25, '12.00', NULL, '2017-06-08 17:55:02'),
(7, 28, '1.00', 0, '2017-05-09 10:44:45'),
(7, 29, '97.00', NULL, '2017-06-06 14:14:41'),
(7, 31, '15.00', NULL, '2017-06-04 13:22:15'),
(7, 32, '280.29', NULL, '2017-06-08 17:59:58'),
(7, 33, '38.00', NULL, '2017-06-04 13:22:15'),
(7, 35, '63.50', NULL, '2017-06-06 14:14:41'),
(7, 37, '62.00', NULL, '2017-04-01 09:48:26'),
(7, 41, '1215.66', NULL, '2017-06-08 18:02:41'),
(7, 42, '0.00', NULL, '2017-04-13 11:09:05'),
(7, 43, '191.00', NULL, '2017-06-08 17:55:02'),
(7, 45, '356.00', NULL, '2017-06-08 17:55:02'),
(7, 47, '25.00', NULL, '2017-06-08 17:55:02'),
(7, 48, '446.00', NULL, '2017-06-08 17:55:02'),
(7, 54, '30.00', NULL, '2017-05-31 16:14:52'),
(8, 7, '0.00', NULL, '2017-05-05 11:49:44'),
(8, 11, '20.00', NULL, '2017-06-01 12:10:44'),
(8, 14, '16.00', NULL, '2017-06-08 10:47:20'),
(8, 21, '143.00', NULL, '2017-06-08 16:16:03'),
(8, 23, '55.00', NULL, '2017-06-08 10:47:20'),
(8, 28, '48.00', NULL, '2017-06-01 12:10:44'),
(8, 29, '154.00', NULL, '2017-06-08 10:47:20'),
(8, 31, '184.00', NULL, '2017-06-08 10:47:20'),
(8, 32, '367.68', NULL, '2017-06-08 16:14:33'),
(8, 33, '7.00', NULL, '2017-04-12 11:51:56'),
(8, 35, '42.49', NULL, '2017-06-08 10:47:54'),
(8, 37, '53.00', NULL, '2017-04-01 09:28:21'),
(8, 41, '283.74', NULL, '2017-06-08 10:47:20'),
(8, 42, '259.92', NULL, '2017-06-08 16:12:39'),
(8, 43, '83.00', NULL, '2017-06-08 10:47:54'),
(8, 45, '107.00', NULL, '2017-06-01 15:07:30'),
(8, 48, '62.00', NULL, '2017-06-08 10:47:20'),
(9, 11, '266.00', NULL, '2017-04-27 15:43:06'),
(9, 12, '79.00', NULL, '2017-05-29 10:24:50'),
(9, 14, '62.00', NULL, '2017-04-01 09:57:03'),
(9, 15, '0.00', NULL, '2017-04-01 09:57:03'),
(9, 21, '117.00', NULL, '2017-05-29 10:24:50'),
(9, 23, '1.00', NULL, '2017-04-01 09:57:03'),
(9, 28, '70.00', NULL, '2017-04-01 09:57:03'),
(9, 29, '756.00', NULL, '2017-06-07 17:15:11'),
(9, 32, '81.94', NULL, '2017-04-01 09:57:03'),
(9, 35, '55.00', NULL, '2017-05-29 10:24:50'),
(9, 41, '159.00', NULL, '2017-05-29 10:27:00'),
(9, 43, '153.00', NULL, '2017-05-29 10:24:50'),
(9, 45, '20.00', NULL, '2017-04-01 09:57:03'),
(9, 48, '112.00', NULL, '2017-05-29 10:24:50');

-- --------------------------------------------------------

--
-- Table structure for table `plant_production`
--

CREATE TABLE `plant_production` (
  `plant_production_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `production_date` date NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_production`
--

INSERT INTO `plant_production` (`plant_production_id`, `plant_id`, `production_date`, `created_by`, `created_time`) VALUES
(19, 4, '2017-04-01', 4, '2017-04-01 18:38:45'),
(20, 4, '2017-04-03', 919, '2017-04-03 19:05:01'),
(21, 4, '2017-04-04', 919, '2017-04-04 19:13:51'),
(22, 4, '2017-04-06', 4, '2017-04-06 18:50:03'),
(23, 4, '2017-04-07', 4, '2017-04-07 15:26:36'),
(24, 4, '2017-04-07', 4, '2017-04-07 18:57:10'),
(25, 4, '2017-04-07', 4, '2017-04-07 19:58:28'),
(26, 4, '2017-04-07', 4, '2017-04-07 20:41:05'),
(27, 4, '2017-04-07', 4, '2017-04-07 21:12:56'),
(28, 4, '2017-04-07', 4, '2017-04-07 21:21:46'),
(29, 4, '2017-04-07', 4, '2017-04-07 21:23:13'),
(30, 4, '2017-04-07', 4, '2017-04-07 22:10:32'),
(31, 4, '2017-04-08', 4, '2017-04-08 14:01:34'),
(32, 4, '2017-04-08', 4, '2017-04-08 14:28:21'),
(33, 4, '2017-04-08', 4, '2017-04-08 16:20:13'),
(34, 4, '2017-04-08', 4, '2017-04-08 16:32:08'),
(35, 4, '2017-04-08', 4, '2017-04-08 16:52:09'),
(36, 4, '2017-04-08', 4, '2017-04-08 16:53:18'),
(37, 4, '2017-04-08', 4, '2017-04-08 18:33:08'),
(38, 4, '2017-04-08', 4, '2017-04-08 18:34:41'),
(39, 4, '2017-04-08', 4, '2017-04-08 18:41:14'),
(40, 4, '2017-04-08', 4, '2017-04-08 18:54:19'),
(41, 4, '2017-04-08', 4, '2017-04-08 20:49:05'),
(42, 4, '2017-04-10', 4, '2017-04-10 16:18:21'),
(43, 4, '2017-04-10', 4, '2017-04-10 16:37:22'),
(44, 4, '2017-04-10', 4, '2017-04-10 16:37:43'),
(45, 4, '2017-04-10', 4, '2017-04-10 17:08:37'),
(46, 4, '2017-04-10', 4, '2017-04-10 18:29:28'),
(47, 4, '2017-04-10', 4, '2017-04-10 18:57:48'),
(48, 4, '2017-04-10', 4, '2017-04-10 19:17:38'),
(49, 4, '2017-04-10', 4, '2017-04-10 19:56:22'),
(50, 4, '2017-04-10', 919, '2017-04-10 20:55:53'),
(51, 4, '2017-04-11', 4, '2017-04-11 18:12:32'),
(52, 4, '2017-04-11', 4, '2017-04-11 18:20:11'),
(53, 4, '2017-04-11', 4, '2017-04-11 18:28:56'),
(54, 4, '2017-04-11', 4, '2017-04-11 18:43:10'),
(55, 4, '2017-04-11', 4, '2017-04-11 18:48:29'),
(56, 4, '2017-04-11', 4, '2017-04-11 19:42:59'),
(57, 4, '2017-04-11', 919, '2017-04-11 20:49:03'),
(58, 4, '2017-04-11', 919, '2017-04-11 20:56:09'),
(59, 4, '2017-04-12', 4, '2017-04-12 16:27:09'),
(60, 4, '2017-04-12', 4, '2017-04-12 18:08:13'),
(61, 4, '2017-04-12', 4, '2017-04-12 18:31:37'),
(62, 4, '2017-04-12', 4, '2017-04-12 18:35:31'),
(63, 4, '2017-04-12', 4, '2017-04-12 18:44:58'),
(64, 4, '2017-04-12', 4, '2017-04-12 18:50:21'),
(65, 4, '2017-04-12', 4, '2017-04-12 19:04:16'),
(66, 4, '2017-04-12', 919, '2017-04-12 20:51:31'),
(67, 4, '2017-04-13', 4, '2017-04-13 15:59:54'),
(68, 4, '2017-04-13', 4, '2017-04-13 16:29:27'),
(69, 4, '2017-04-13', 4, '2017-04-13 16:49:50'),
(70, 4, '2017-04-13', 4, '2017-04-13 18:12:59'),
(71, 4, '2017-04-13', 4, '2017-04-13 19:07:31'),
(72, 4, '2017-04-13', 919, '2017-04-13 20:31:40'),
(73, 4, '2017-04-14', 4, '2017-04-14 17:07:45'),
(74, 4, '2017-04-14', 919, '2017-04-14 20:15:50'),
(75, 4, '2017-04-15', 4, '2017-04-15 16:43:31'),
(76, 4, '2017-04-15', 4, '2017-04-15 16:46:31'),
(77, 4, '2017-04-15', 4, '2017-04-15 17:34:12'),
(78, 4, '2017-04-15', 4, '2017-04-15 17:42:14'),
(79, 4, '2017-04-15', 4, '2017-04-15 18:00:44'),
(80, 4, '2017-04-15', 4, '2017-04-15 18:45:32'),
(81, 4, '2017-04-15', 4, '2017-04-15 20:33:09'),
(82, 4, '2017-04-17', 4, '2017-04-17 17:29:55'),
(83, 4, '2017-04-17', 4, '2017-04-17 17:35:04'),
(84, 4, '2017-04-17', 4, '2017-04-17 18:29:03'),
(85, 4, '2017-04-17', 4, '2017-04-17 18:36:32'),
(86, 4, '2017-04-17', 4, '2017-04-17 18:38:30'),
(87, 4, '2017-04-17', 919, '2017-04-17 20:49:20'),
(88, 4, '2017-04-18', 4, '2017-04-18 17:44:45'),
(89, 4, '2017-04-18', 4, '2017-04-18 20:34:59'),
(90, 4, '2017-04-18', 4, '2017-04-18 21:24:17'),
(91, 4, '2017-04-18', 4, '2017-04-18 22:15:05'),
(92, 4, '2017-04-19', 4, '2017-04-19 14:51:25'),
(93, 4, '2017-04-19', 4, '2017-04-19 16:47:25'),
(94, 4, '2017-04-19', 4, '2017-04-19 16:58:48'),
(95, 4, '2017-04-19', 4, '2017-04-19 17:02:12'),
(96, 4, '2017-04-19', 4, '2017-04-19 17:03:54'),
(97, 4, '2017-04-19', 4, '2017-04-19 17:07:38'),
(98, 4, '2017-04-19', 4, '2017-04-19 18:23:35'),
(99, 4, '2017-04-19', 4, '2017-04-19 19:43:54'),
(100, 4, '2017-04-19', 4, '2017-04-19 19:46:39'),
(101, 4, '2017-04-19', 4, '2017-04-19 19:47:52'),
(102, 4, '2017-04-19', 4, '2017-04-19 19:48:53'),
(103, 4, '2017-04-19', 4, '2017-04-19 19:49:30'),
(104, 4, '2017-04-19', 4, '2017-04-19 19:51:49'),
(105, 4, '2017-04-20', 4, '2017-04-20 15:40:33'),
(106, 4, '2017-04-20', 4, '2017-04-20 16:12:41'),
(107, 4, '2017-04-20', 919, '2017-04-20 20:35:53'),
(108, 4, '2017-04-21', 4, '2017-04-21 15:43:49'),
(109, 4, '2017-04-21', 4, '2017-04-21 20:53:15'),
(110, 4, '2017-04-22', 4, '2017-04-22 18:32:24'),
(111, 4, '2017-04-22', 4, '2017-04-22 21:09:50'),
(112, 4, '2017-04-24', 4, '2017-04-24 17:16:34'),
(113, 4, '2017-04-24', 4, '2017-04-24 17:51:44'),
(114, 4, '2017-04-24', 4, '2017-04-24 19:45:05'),
(115, 4, '2017-04-25', 4, '2017-04-25 16:08:25'),
(116, 4, '2017-04-25', 4, '2017-04-25 16:46:13'),
(117, 4, '2017-04-25', 4, '2017-04-25 18:59:55'),
(118, 4, '2017-04-25', 4, '2017-04-25 19:03:47'),
(119, 4, '2017-04-25', 4, '2017-04-25 19:07:07'),
(120, 4, '2017-04-25', 919, '2017-04-25 20:21:19'),
(121, 4, '2017-04-26', 4, '2017-04-26 18:09:56'),
(122, 4, '2017-04-26', 4, '2017-04-26 19:14:26'),
(123, 4, '2017-04-26', 4, '2017-04-26 19:17:16'),
(124, 4, '2017-04-27', 4, '2017-04-27 15:38:40'),
(125, 4, '2017-04-27', 4, '2017-04-27 16:11:47'),
(126, 4, '2017-04-27', 4, '2017-04-27 16:20:00'),
(127, 4, '2017-04-27', 4, '2017-04-27 16:48:02'),
(128, 4, '2017-04-27', 4, '2017-04-27 19:51:09'),
(129, 4, '2017-04-27', 4, '2017-04-27 19:58:33'),
(130, 4, '2017-04-28', 919, '2017-04-28 15:28:44'),
(131, 4, '2017-04-28', 4, '2017-04-28 15:49:35'),
(132, 4, '2017-04-28', 4, '2017-04-28 15:51:12'),
(133, 4, '2017-04-28', 4, '2017-04-28 15:59:47'),
(134, 4, '2017-04-28', 4, '2017-04-28 16:11:18'),
(135, 4, '2017-04-28', 4, '2017-04-28 17:35:55'),
(136, 4, '2017-04-28', 4, '2017-04-28 18:18:39'),
(137, 4, '2017-04-28', 4, '2017-04-28 18:19:28'),
(138, 4, '2017-04-28', 4, '2017-04-28 18:51:34'),
(139, 4, '2017-04-28', 919, '2017-04-28 20:22:59'),
(140, 4, '2017-04-29', 4, '2017-04-29 16:51:28'),
(141, 4, '2017-04-29', 4, '2017-04-29 17:02:42'),
(142, 4, '2017-04-29', 4, '2017-04-29 17:09:28'),
(143, 4, '2017-04-29', 4, '2017-04-29 18:19:41'),
(144, 4, '2017-04-29', 4, '2017-04-29 19:17:27'),
(145, 4, '2017-05-02', 4, '2017-05-02 15:32:46'),
(146, 4, '2017-05-02', 4, '2017-05-02 16:27:31'),
(147, 4, '2017-05-02', 4, '2017-05-02 16:30:45'),
(148, 4, '2017-05-02', 4, '2017-05-02 16:33:30'),
(149, 4, '2017-05-02', 4, '2017-05-02 17:07:00'),
(150, 4, '2017-05-02', 4, '2017-05-02 17:57:05'),
(151, 4, '2017-05-02', 4, '2017-05-02 18:16:38'),
(152, 4, '2017-05-02', 4, '2017-05-02 18:42:16'),
(153, 4, '2017-05-02', 4, '2017-05-02 19:10:14'),
(154, 4, '2017-05-02', 919, '2017-05-02 20:44:15'),
(155, 4, '2017-05-03', 4, '2017-05-03 14:37:41'),
(156, 4, '2017-05-03', 4, '2017-05-03 16:59:14'),
(157, 4, '2017-05-03', 4, '2017-05-03 17:04:52'),
(158, 4, '2017-05-03', 4, '2017-05-03 17:06:59'),
(159, 4, '2017-05-03', 4, '2017-05-03 17:11:33'),
(160, 4, '2017-05-03', 4, '2017-05-03 17:54:03'),
(161, 4, '2017-05-03', 4, '2017-05-03 18:18:18'),
(162, 4, '2017-05-03', 919, '2017-05-03 20:13:28'),
(163, 4, '2017-05-04', 4, '2017-05-04 17:47:47'),
(164, 4, '2017-05-04', 919, '2017-05-04 20:38:22'),
(165, 4, '2017-05-05', 4, '2017-05-05 13:58:26'),
(166, 4, '2017-05-05', 4, '2017-05-05 15:05:16'),
(167, 4, '2017-05-05', 4, '2017-05-05 16:45:18'),
(168, 4, '2017-05-05', 4, '2017-05-05 17:34:32'),
(169, 4, '2017-05-05', 919, '2017-05-05 20:25:00'),
(170, 4, '2017-05-06', 919, '2017-05-06 15:57:42'),
(171, 4, '2017-05-06', 4, '2017-05-06 17:51:53'),
(172, 4, '2017-05-06', 919, '2017-05-06 18:25:58'),
(173, 4, '2017-05-06', 4, '2017-05-06 18:47:54'),
(174, 4, '2017-05-06', 4, '2017-05-06 18:52:36'),
(175, 4, '2017-05-06', 919, '2017-05-06 20:35:35'),
(176, 4, '2017-05-06', 4, '2017-05-06 20:37:51'),
(177, 4, '2017-05-08', 919, '2017-05-08 15:13:42'),
(178, 4, '2017-05-08', 4, '2017-05-08 16:36:49'),
(179, 4, '2017-05-08', 919, '2017-05-08 17:02:53'),
(180, 4, '2017-05-08', 4, '2017-05-08 17:45:34'),
(181, 4, '2017-05-08', 4, '2017-05-08 17:50:02'),
(182, 4, '2017-05-08', 919, '2017-05-08 18:35:35'),
(183, 4, '2017-05-08', 919, '2017-05-08 20:24:50'),
(184, 4, '2017-05-08', 919, '2017-05-08 20:28:16'),
(185, 4, '2017-05-08', 4, '2017-05-08 20:30:06'),
(186, 4, '2017-05-09', 919, '2017-05-09 17:19:48'),
(187, 4, '2017-05-09', 4, '2017-05-09 17:33:55'),
(188, 4, '2017-05-09', 919, '2017-05-09 18:46:21'),
(189, 4, '2017-05-09', 919, '2017-05-09 20:24:43'),
(190, 4, '2017-05-09', 4, '2017-05-09 20:28:19'),
(191, 4, '2017-05-10', 919, '2017-05-10 18:21:05'),
(192, 4, '2017-05-10', 919, '2017-05-10 18:21:30'),
(193, 4, '2017-05-10', 919, '2017-05-10 20:00:27'),
(194, 4, '2017-05-11', 919, '2017-05-11 16:47:46'),
(195, 4, '2017-05-11', 919, '2017-05-11 20:18:48'),
(196, 4, '2017-05-12', 4, '2017-05-12 19:58:12'),
(197, 4, '2017-05-12', 4, '2017-05-12 20:09:49'),
(198, 4, '2017-05-13', 919, '2017-05-13 16:02:39'),
(199, 4, '2017-05-13', 919, '2017-05-13 16:33:17'),
(200, 4, '2017-05-13', 4, '2017-05-13 17:33:50'),
(201, 4, '2017-05-13', 4, '2017-05-13 19:23:01'),
(202, 4, '2017-05-13', 4, '2017-05-13 20:04:04'),
(203, 4, '2017-05-15', 4, '2017-05-15 15:40:03'),
(204, 4, '2017-05-15', 919, '2017-05-15 17:21:57'),
(205, 4, '2017-05-15', 919, '2017-05-15 19:55:11'),
(206, 4, '2017-05-16', 919, '2017-05-16 15:29:14'),
(207, 4, '2017-05-16', 4, '2017-05-16 17:28:06'),
(208, 4, '2017-05-16', 4, '2017-05-16 17:33:40'),
(209, 4, '2017-05-16', 4, '2017-05-16 19:31:16'),
(210, 4, '2017-05-16', 4, '2017-05-16 19:53:33'),
(211, 4, '2017-05-16', 919, '2017-05-16 21:20:26'),
(212, 4, '2017-05-17', 4, '2017-05-17 16:14:12'),
(213, 4, '2017-05-17', 4, '2017-05-17 16:15:19'),
(214, 4, '2017-05-17', 4, '2017-05-17 17:09:52'),
(215, 4, '2017-05-17', 4, '2017-05-17 18:56:31'),
(216, 4, '2017-05-17', 919, '2017-05-17 21:04:30'),
(217, 4, '2017-05-18', 4, '2017-05-18 15:24:01'),
(218, 4, '2017-05-18', 919, '2017-05-18 16:30:50'),
(219, 4, '2017-05-18', 4, '2017-05-18 17:59:14'),
(220, 4, '2017-05-18', 919, '2017-05-18 20:43:13'),
(221, 4, '2017-05-19', 4, '2017-05-19 19:16:43'),
(222, 4, '2017-05-20', 4, '2017-05-20 17:20:08'),
(223, 4, '2017-05-20', 919, '2017-05-20 20:00:06'),
(224, 4, '2017-05-22', 4, '2017-05-22 16:46:34'),
(225, 4, '2017-05-22', 4, '2017-05-22 16:58:27'),
(226, 4, '2017-05-22', 4, '2017-05-22 16:59:28'),
(227, 4, '2017-05-22', 4, '2017-05-22 17:17:19'),
(228, 4, '2017-05-22', 4, '2017-05-22 19:37:48'),
(229, 4, '2017-05-22', 4, '2017-05-22 20:34:13'),
(230, 4, '2017-05-22', 4, '2017-05-22 20:44:22'),
(231, 4, '2017-05-22', 921, '2017-05-22 22:59:11'),
(232, 4, '2017-05-23', 919, '2017-05-23 16:53:53'),
(233, 4, '2017-05-23', 919, '2017-05-23 17:36:37'),
(234, 4, '2017-05-23', 919, '2017-05-23 18:44:39'),
(235, 4, '2017-05-23', 4, '2017-05-23 19:34:28'),
(236, 4, '2017-05-23', 4, '2017-05-23 19:35:24'),
(237, 4, '2017-05-23', 4, '2017-05-23 20:30:33'),
(238, 4, '2017-05-24', 4, '2017-05-24 16:55:49'),
(239, 4, '2017-05-24', 4, '2017-05-24 18:46:31'),
(240, 4, '2017-05-24', 4, '2017-05-24 20:07:06'),
(241, 4, '2017-05-25', 919, '2017-05-25 15:16:27'),
(242, 4, '2017-05-25', 919, '2017-05-25 15:43:37'),
(243, 4, '2017-05-25', 919, '2017-05-25 19:45:03'),
(244, 4, '2017-05-25', 4, '2017-05-25 19:46:11'),
(245, 4, '2017-05-26', 919, '2017-05-26 16:03:16'),
(246, 4, '2017-05-26', 919, '2017-05-26 16:25:02'),
(247, 4, '2017-05-26', 919, '2017-05-26 17:47:01'),
(248, 4, '2017-05-26', 919, '2017-05-26 19:47:30'),
(249, 4, '2017-05-27', 919, '2017-05-27 19:06:15'),
(250, 4, '2017-05-29', 919, '2017-05-29 16:21:58'),
(251, 4, '2017-05-29', 919, '2017-05-29 19:06:45'),
(252, 4, '2017-05-30', 919, '2017-05-30 15:34:58'),
(253, 4, '2017-05-30', 919, '2017-05-30 15:37:14'),
(254, 4, '2017-05-30', 4, '2017-05-30 17:08:28'),
(255, 4, '2017-05-30', 4, '2017-05-30 17:22:59'),
(256, 4, '2017-05-30', 4, '2017-05-30 17:54:03'),
(257, 4, '2017-05-30', 919, '2017-05-30 19:32:57'),
(258, 4, '2017-05-31', 4, '2017-05-31 17:16:50'),
(259, 4, '2017-05-31', 4, '2017-05-31 17:18:58'),
(260, 4, '2017-05-31', 4, '2017-05-31 17:58:13'),
(261, 4, '2017-05-31', 4, '2017-05-31 18:07:40'),
(262, 4, '2017-05-31', 919, '2017-05-31 20:27:52'),
(263, 4, '2017-06-01', 4, '2017-06-01 16:38:49'),
(264, 4, '2017-06-01', 919, '2017-06-01 17:07:44'),
(265, 4, '2017-06-01', 4, '2017-06-01 19:52:46'),
(266, 4, '2017-06-02', 919, '2017-06-02 19:30:09'),
(267, 4, '2017-06-02', 919, '2017-06-02 19:30:22'),
(268, 4, '2017-06-03', 4, '2017-06-03 13:53:31'),
(269, 4, '2017-06-03', 919, '2017-06-03 19:36:40'),
(270, 4, '2017-06-05', 4, '2017-06-05 16:01:24'),
(271, 4, '2017-06-05', 4, '2017-06-05 17:54:53'),
(272, 4, '2017-06-05', 919, '2017-06-05 19:39:43'),
(273, 4, '2017-06-06', 4, '2017-06-06 13:26:38'),
(274, 4, '2017-06-06', 4, '2017-06-06 15:42:28'),
(275, 4, '2017-06-06', 4, '2017-06-06 15:52:46'),
(276, 4, '2017-06-06', 4, '2017-06-06 17:33:07'),
(277, 4, '2017-06-06', 919, '2017-06-06 19:39:18'),
(278, 4, '2017-06-07', 4, '2017-06-07 18:14:30'),
(279, 4, '2017-06-07', 4, '2017-06-07 18:28:03'),
(280, 4, '2017-06-07', 4, '2017-06-07 18:49:48'),
(281, 4, '2017-06-07', 4, '2017-06-07 18:54:47'),
(282, 4, '2017-06-07', 919, '2017-06-07 19:50:21'),
(283, 4, '2017-06-08', 4, '2017-06-08 15:47:44'),
(284, 4, '2017-06-08', 4, '2017-06-08 18:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `plant_recovery_oil`
--

CREATE TABLE `plant_recovery_oil` (
  `plant_id` bigint(10) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `oil_weight` decimal(12,3) NOT NULL,
  `updated_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plant_recovery_oil`
--

INSERT INTO `plant_recovery_oil` (`plant_id`, `loose_oil_id`, `oil_weight`, `updated_time`) VALUES
(4, 1, '70.000', '2017-04-26 14:04:49'),
(4, 2, '45.000', '2017-04-26 14:07:57'),
(4, 3, '10.000', '2017-04-26 14:13:01'),
(4, 4, '25.000', '2017-04-26 14:10:11'),
(6, 1, '13.480', '2017-06-08 16:56:21'),
(6, 2, '10.480', '2017-06-08 16:57:44'),
(6, 3, '3.640', '2017-06-07 15:45:11'),
(6, 4, '7.840', '2017-06-02 16:47:09'),
(6, 5, '6.090', '2017-04-01 08:48:32'),
(6, 7, '13.200', '2017-04-01 08:48:32'),
(7, 1, '4.530', '2017-06-08 17:59:28'),
(7, 2, '2.710', '2017-06-08 18:02:41'),
(7, 4, '11.600', '2017-06-08 17:59:58'),
(7, 6, '0.000', '2017-05-08 13:47:27'),
(8, 1, '4.000', '2017-06-08 16:16:03'),
(8, 2, '1.000', '2017-06-08 16:12:39'),
(8, 3, '0.000', '2017-04-22 15:11:55'),
(8, 4, '12.000', '2017-06-08 16:14:33'),
(9, 1, '3.620', '2017-04-01 09:57:03'),
(9, 2, '10.610', '2017-05-29 10:27:00'),
(9, 4, '4.670', '2017-06-07 17:15:11'),
(9, 5, '2.000', '2017-04-01 09:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `pm_group`
--

CREATE TABLE `pm_group` (
  `pm_group_id` int(9) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pm_stock_balance`
--

CREATE TABLE `pm_stock_balance` (
  `pm_stock_balance_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `opening_balance` decimal(12,3) NOT NULL,
  `receipts` decimal(12,3) NOT NULL DEFAULT '0.000',
  `on_date` date NOT NULL,
  `production` decimal(12,3) NOT NULL DEFAULT '0.000',
  `plant_id` bigint(10) NOT NULL,
  `stock_transfer` decimal(12,3) NOT NULL DEFAULT '0.000',
  `closing_balance` decimal(12,3) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pm_test_option`
--

CREATE TABLE `pm_test_option` (
  `option_id` bigint(10) NOT NULL,
  `pm_test_id` bigint(10) NOT NULL,
  `key` int(10) NOT NULL,
  `value` varchar(100) NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pm_unit`
--

CREATE TABLE `pm_unit` (
  `pm_unit` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_fg_history`
--

CREATE TABLE `po_fg_history` (
  `po_fg_history_id` bigint(19) NOT NULL,
  `po_fg_id` bigint(19) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `supplier_id` bigint(19) NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_fg_tanker`
--

CREATE TABLE `po_fg_tanker` (
  `po_fg_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_free_gift`
--

CREATE TABLE `po_free_gift` (
  `po_fg_id` bigint(19) NOT NULL,
  `free_gift_id` bigint(10) NOT NULL,
  `supplier_id` bigint(10) NOT NULL,
  `po_number` int(9) NOT NULL,
  `po_date` date NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_oil`
--

CREATE TABLE `po_oil` (
  `po_oil_id` bigint(19) NOT NULL,
  `po_number` int(9) NOT NULL,
  `closed_time` timestamp NULL DEFAULT NULL,
  `po_date` date NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `loose_oil_id` int(5) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `po_type_id` int(5) NOT NULL,
  `supplier_id` bigint(10) NOT NULL,
  `broker_id` bigint(10) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `mtp_oil_id` bigint(19) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `closed_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_oil_history`
--

CREATE TABLE `po_oil_history` (
  `po_oil_history_id` bigint(19) NOT NULL,
  `po_oil_id` bigint(19) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `supplier_id` bigint(19) NOT NULL,
  `broker_id` bigint(19) NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_oil_lab_test`
--

CREATE TABLE `po_oil_lab_test` (
  `lab_test_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `test_number` int(9) NOT NULL,
  `test_date` date NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_oil_lab_test_results`
--

CREATE TABLE `po_oil_lab_test_results` (
  `test_result_id` bigint(19) NOT NULL,
  `lab_test_id` bigint(19) NOT NULL,
  `test_id` bigint(10) NOT NULL,
  `value` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_oil_tanker`
--

CREATE TABLE `po_oil_tanker` (
  `po_oil_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_pm`
--

CREATE TABLE `po_pm` (
  `po_pm_id` bigint(19) NOT NULL,
  `po_number` int(9) NOT NULL,
  `po_date` date NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `po_type_id` int(5) NOT NULL,
  `mtp_pm_id` bigint(19) DEFAULT NULL,
  `supplier_id` bigint(10) NOT NULL,
  `broker_id` bigint(10) DEFAULT NULL,
  `plant_id` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_pm_history`
--

CREATE TABLE `po_pm_history` (
  `po_pm_history_id` bigint(19) NOT NULL,
  `po_pm_id` bigint(19) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `supplier_id` bigint(19) NOT NULL,
  `broker_id` bigint(19) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_pm_lab_test`
--

CREATE TABLE `po_pm_lab_test` (
  `lab_test_id` bigint(19) NOT NULL,
  `test_number` int(9) NOT NULL,
  `test_date` date NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tanker_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_pm_lab_test_results`
--

CREATE TABLE `po_pm_lab_test_results` (
  `test_result_id` bigint(19) NOT NULL,
  `value` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `lab_test_id` bigint(19) NOT NULL,
  `pm_test_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_pm_tanker`
--

CREATE TABLE `po_pm_tanker` (
  `po_pm_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `tanker_pm_id` bigint(19) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `po_type`
--

CREATE TABLE `po_type` (
  `po_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `preference_id` bigint(10) NOT NULL,
  `section` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `lable` varchar(250) NOT NULL,
  `type` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preference_history`
--

CREATE TABLE `preference_history` (
  `preference_history_id` bigint(19) NOT NULL,
  `value` text NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `preference_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` bigint(10) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `product_packing_type_id` int(5) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `items_per_carton` int(5) DEFAULT NULL,
  `oil_weight` decimal(12,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `production_pm`
--

CREATE TABLE `production_pm` (
  `ppm_id` bigint(19) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `production_product_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `production_pm_micron`
--

CREATE TABLE `production_pm_micron` (
  `production_pm_id` bigint(19) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `production_product_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `micron_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `production_product`
--

CREATE TABLE `production_product` (
  `production_product_id` bigint(19) NOT NULL,
  `plant_production_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `items_per_carton` int(5) NOT NULL,
  `loose_pouches` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_capacity`
--

CREATE TABLE `product_capacity` (
  `product_id` bigint(10) NOT NULL,
  `capacity_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_packing_material`
--

CREATE TABLE `product_packing_material` (
  `product_id` bigint(10) NOT NULL,
  `capacity_id` int(5) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `quantity` decimal(12,3) NOT NULL,
  `units` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_packing_type`
--

CREATE TABLE `product_packing_type` (
  `product_packing_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_name` varchar(45) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_pm_weight`
--

CREATE TABLE `product_pm_weight` (
  `product_pm_weight_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `weight` decimal(12,3) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

CREATE TABLE `product_price` (
  `product_price_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `plant_id` bigint(10) DEFAULT NULL,
  `price_type_id` int(5) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `range_type`
--

CREATE TABLE `range_type` (
  `range_type_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_do`
--

CREATE TABLE `rb_do` (
  `do_hist_id` bigint(19) NOT NULL,
  `do_id` bigint(19) DEFAULT NULL,
  `do_number` int(10) DEFAULT NULL,
  `do_date` date DEFAULT NULL,
  `lifting_point` bigint(10) DEFAULT NULL,
  `do_against_id` smallint(4) DEFAULT NULL,
  `do_created_by` bigint(10) DEFAULT NULL,
  `do_created_time` timestamp NULL DEFAULT NULL,
  `order_id` bigint(19) DEFAULT NULL,
  `product_id` bigint(10) DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL,
  `product_price` decimal(12,2) DEFAULT NULL,
  `pending_quantity` decimal(12,2) DEFAULT NULL,
  `items_per_carton` int(5) DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rb_production`
--

CREATE TABLE `rb_production` (
  `rb_production_id` bigint(11) NOT NULL,
  `approval_id` bigint(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `production_product_id` bigint(19) NOT NULL,
  `product_id` bigint(19) NOT NULL,
  `production_date` date NOT NULL,
  `micron_id` int(5) DEFAULT NULL,
  `consumption` text NOT NULL,
  `created_by` bigint(11) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_free_gift`
--

CREATE TABLE `receipt_free_gift` (
  `rf_gift_id` bigint(19) NOT NULL,
  `receipt_invoice_id` bigint(19) NOT NULL,
  `free_gift_id` bigint(10) NOT NULL,
  `fg_scheme_id` bigint(19) NOT NULL,
  `invoice_quantity` decimal(12,2) NOT NULL,
  `received_quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_free_product`
--

CREATE TABLE `receipt_free_product` (
  `rf_product_id` bigint(19) NOT NULL,
  `receipt_invoice_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `fg_scheme_id` bigint(19) NOT NULL,
  `invoice_quantity` decimal(12,2) NOT NULL,
  `received_quantity` decimal(12,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_invoice`
--

CREATE TABLE `receipt_invoice` (
  `receipt_invoice_id` bigint(19) NOT NULL,
  `stock_receipt_id` bigint(19) NOT NULL,
  `invoice_id` bigint(19) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_invoice_product`
--

CREATE TABLE `receipt_invoice_product` (
  `receipt_invoice_product_id` bigint(19) NOT NULL,
  `receipt_invoice_id` bigint(19) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `invoice_do_product_id` bigint(19) DEFAULT NULL,
  `invoice_quantity` decimal(12,2) NOT NULL,
  `received_quantity` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recovered_oil_production`
--

CREATE TABLE `recovered_oil_production` (
  `ro_production_id` bigint(19) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `on_date` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `loose_oil_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recovered_oil_scrap`
--

CREATE TABLE `recovered_oil_scrap` (
  `oil_scrap_id` bigint(19) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `on_date` date NOT NULL,
  `oil_weight` decimal(12,3) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `plant_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reporting_preference`
--

CREATE TABLE `reporting_preference` (
  `rep_preference_id` bigint(19) NOT NULL,
  `section` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `issue_raised_by` int(5) NOT NULL,
  `issue_closed_by` int(5) NOT NULL,
  `label` varchar(100) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `table_primary_column` varchar(255) DEFAULT NULL,
  `table_column` varchar(50) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rop_product`
--

CREATE TABLE `rop_product` (
  `rop_product_id` bigint(19) NOT NULL,
  `ro_production_id` bigint(19) NOT NULL,
  `item_qty` int(5) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `product_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scheme_type`
--

CREATE TABLE `scheme_type` (
  `type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_receipt`
--

CREATE TABLE `stock_receipt` (
  `stock_receipt_id` bigint(19) NOT NULL,
  `vehicle_number` varchar(20) DEFAULT NULL,
  `plant_id` bigint(10) NOT NULL,
  `srn_number` int(10) NOT NULL,
  `on_date` date NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_type`
--

CREATE TABLE `stock_transfer_type` (
  `st_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_updation`
--

CREATE TABLE `stock_updation` (
  `stock_updation_id` bigint(29) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(19) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` bigint(10) NOT NULL,
  `type_id` int(5) NOT NULL,
  `supplier_code` varchar(20) DEFAULT NULL,
  `agency_name` varchar(100) NOT NULL,
  `concerned_person` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location_id` bigint(10) DEFAULT NULL,
  `pincode` int(9) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `alternate_mobile` varchar(20) DEFAULT NULL,
  `aadhar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `tan_no` varchar(20) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bank_guarantee`
--

CREATE TABLE `supplier_bank_guarantee` (
  `supplier_bg_id` bigint(19) NOT NULL,
  `supplier_id` bigint(10) NOT NULL,
  `bank_id` int(5) NOT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `account_no` varchar(40) DEFAULT NULL,
  `bg_amount` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_type`
--

CREATE TABLE `supplier_type` (
  `type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_fg`
--

CREATE TABLE `tanker_fg` (
  `tanker_fg_id` bigint(19) NOT NULL,
  `invoice_qty` decimal(12,2) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `free_gift_id` bigint(10) NOT NULL,
  `gross` decimal(12,2) DEFAULT NULL,
  `tier` decimal(12,2) DEFAULT NULL,
  `invoice_gross` decimal(12,2) DEFAULT NULL,
  `invoice_tier` decimal(12,2) DEFAULT NULL,
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `gross_time` timestamp NULL DEFAULT NULL,
  `tare_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_oil`
--

CREATE TABLE `tanker_oil` (
  `tanker_oil_id` bigint(19) NOT NULL,
  `invoice_qty` decimal(12,3) NOT NULL,
  `loose_oil_id` int(5) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `gross` decimal(12,2) DEFAULT NULL,
  `tier` decimal(12,2) DEFAULT NULL,
  `invoice_gross` decimal(12,2) DEFAULT NULL,
  `invoice_tier` decimal(12,2) DEFAULT NULL,
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `gross_time` timestamp NULL DEFAULT NULL,
  `tare_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_pm`
--

CREATE TABLE `tanker_pm` (
  `tanker_pm_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `pm_id` bigint(10) NOT NULL,
  `invoice_quantity` decimal(12,2) NOT NULL,
  `gross` decimal(12,2) DEFAULT NULL,
  `tier` decimal(12,2) DEFAULT NULL,
  `invoice_gross` decimal(12,2) DEFAULT NULL,
  `invoice_tier` decimal(12,2) DEFAULT NULL,
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL,
  `gross_time` timestamp NULL DEFAULT NULL,
  `tare_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_pp_delivery`
--

CREATE TABLE `tanker_pp_delivery` (
  `tanker_pp_delivery_id` bigint(19) NOT NULL,
  `tanker_id` bigint(19) NOT NULL,
  `gross` decimal(12,2) DEFAULT NULL,
  `tier` decimal(12,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `remarks2` int(10) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `gross_time` timestamp NULL DEFAULT NULL,
  `tare_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_register`
--

CREATE TABLE `tanker_register` (
  `tanker_id` bigint(19) NOT NULL,
  `tanker_type_id` int(5) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `tanker_in_number` int(9) NOT NULL,
  `vehicle_number` varchar(20) NOT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `dc_number` varchar(50) DEFAULT NULL,
  `party_name` varchar(255) DEFAULT NULL,
  `broker_name` varchar(255) DEFAULT NULL,
  `in_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `out_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `remarks1` varchar(255) DEFAULT NULL,
  `remarks2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tanker_type`
--

CREATE TABLE `tanker_type` (
  `tanker_type_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tender_oil`
--

CREATE TABLE `tender_oil` (
  `tender_oil_id` bigint(19) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT '0.000',
  `quoted_price` decimal(12,2) NOT NULL,
  `negotiated_price` decimal(12,2) DEFAULT NULL,
  `support_document` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `mtp_oil_id` bigint(19) NOT NULL,
  `supplier_id` bigint(10) NOT NULL,
  `broker_id` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tender_pm`
--

CREATE TABLE `tender_pm` (
  `tender_pm_id` bigint(19) NOT NULL,
  `mtp_pm_id` bigint(19) NOT NULL,
  `broker_id` bigint(10) DEFAULT NULL,
  `supplier_id` bigint(10) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT '0.000',
  `quoted_price` decimal(12,2) NOT NULL,
  `negotiated_price` decimal(12,2) DEFAULT NULL,
  `support_document` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `territory_level`
--

CREATE TABLE `territory_level` (
  `level_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_group`
--

CREATE TABLE `test_group` (
  `test_group_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order` int(5) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_option`
--

CREATE TABLE `test_option` (
  `option_id` bigint(10) NOT NULL,
  `test_id` bigint(10) NOT NULL,
  `key` int(10) NOT NULL,
  `value` varchar(100) NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_unit`
--

CREATE TABLE `test_unit` (
  `test_unit_id` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `plant_id` bigint(10) NOT NULL,
  `block_id` int(5) NOT NULL,
  `designation_id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` bigint(10) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` bigint(10) DEFAULT NULL,
  `modified_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `plant_id`, `block_id`, `designation_id`, `name`, `mobile`, `email`, `address`, `status`, `created_by`, `created_time`, `modified_by`, `modified_time`) VALUES
(1, 'superuser', '900150983cd24fb0d6963f7d28e17f72', 2, 1, 9, 'Super User', NULL, NULL, NULL, 1, 0, '2017-02-17 11:10:00', 0, NULL),
(2, 'admin', '900150983cd24fb0d6963f7d28e17f72', 2, 1, 8, 'Admin', NULL, NULL, NULL, 1, 0, '2017-02-17 11:10:00', NULL, NULL),
(4, 'kkdops', '900150983cd24fb0d6963f7d28e17f72', 4, 2, 3, 'krishna mohan', NULL, '', '', 1, 2, '2017-03-06 09:27:39', 2, '2017-03-16 15:38:27'),
(6, 'headoffice', '900150983cd24fb0d6963f7d28e17f72', 2, 1, 2, 'Venkatesh', NULL, '', '', 1, 2, '2017-03-06 09:28:45', NULL, NULL),
(7, 'stockpoint', '900150983cd24fb0d6963f7d28e17f72', 6, 3, 3, 'Ramesh', NULL, '', '', 1, 2, '2017-03-06 09:30:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user_log_id` bigint(19) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_active` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_time` timestamp NULL DEFAULT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`user_log_id`, `user_id`, `login_time`, `last_active`, `logout_time`, `ip_address`, `user_agent`) VALUES
(7949, 2, '2020-09-03 15:14:28', '2020-09-03 15:14:28', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36');

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
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
  MODIFY `user_log_id` bigint(19) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7950;
--
-- AUTO_INCREMENT for table `waste_oil_entry`
--
ALTER TABLE `waste_oil_entry`
  MODIFY `waste_oil_id` bigint(19) NOT NULL AUTO_INCREMENT;
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
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
