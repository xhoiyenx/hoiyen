-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2015 at 01:43 AM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bioshock Infinite', '2015-10-30 05:01:26', '2015-10-30 05:01:26'),
(2, 'Max Payne 3', '2015-10-30 05:21:49', '2015-10-30 05:21:49'),
(3, 'Grand Theft Auto IV', '2015-10-30 05:22:06', '2015-10-30 05:22:06'),
(4, 'Thief', '2015-10-30 05:23:46', '2015-10-30 05:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` smallint(5) unsigned NOT NULL,
  `parent_id` smallint(5) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 0, 'Steam', '2015-11-01 20:10:52', '2015-11-01 20:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_order`
--

CREATE TABLE IF NOT EXISTS `product_stock_order` (
  `id` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_order_detail`
--

CREATE TABLE IF NOT EXISTS `product_stock_order_detail` (
  `id` int(10) unsigned NOT NULL,
  `stock_order_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `id` mediumint(8) unsigned NOT NULL,
  `category_id` smallint(5) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` mediumint(8) unsigned NOT NULL,
  `role_id` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `usermail` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role_id`, `first_name`, `last_name`, `username`, `usermail`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hoiyen', 'Lo', 'admin', 'hoiyen.2000@gmail.com', 'a51d834b9f0ccc060a3dea29eae48d56', NULL, '2015-10-22 23:32:54', '2015-10-22 23:32:54'),
(7, 2, 'Member', 'One', 'member', 'member@gmail.com', 'a51d834b9f0ccc060a3dea29eae48d56', NULL, '2015-10-27 05:11:53', '2015-10-27 05:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE IF NOT EXISTS `user_meta` (
  `id` int(10) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', 'Administrator account with full access', '2015-10-22 00:25:15', '2015-10-22 00:25:15'),
(2, 'Member', 'member', 'Member account with only access to front page', '2015-10-22 00:32:53', '2015-10-22 00:32:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_role_permission`
--

CREATE TABLE IF NOT EXISTS `user_role_permission` (
  `id` mediumint(8) unsigned NOT NULL,
  `role_id` tinyint(3) unsigned NOT NULL,
  `permission` varchar(60) NOT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role_permission`
--

INSERT INTO `user_role_permission` (`id`, `role_id`, `permission`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'administrator_access', '1', '2015-10-25 17:35:29', '2015-10-25 21:12:41'),
(2, 1, 'user_access', '1', '2015-10-25 17:35:29', '2015-10-25 21:12:41'),
(3, 1, 'user_delete', '1', '2015-10-25 17:35:29', '2015-10-25 21:12:41'),
(4, 1, 'user_insert', '0', '2015-10-25 21:08:00', '2015-10-25 21:12:41'),
(5, 1, 'user_update', '0', '2015-10-25 21:08:00', '2015-10-25 21:12:41'),
(6, 1, 'user_assign', '0', '2015-10-25 21:08:00', '2015-10-25 21:12:41'),
(7, 1, 'role_access', '1', '2015-10-25 21:10:06', '2015-10-25 21:12:41'),
(8, 1, 'role_insert', '1', '2015-10-25 21:10:06', '2015-10-25 21:12:41'),
(9, 1, 'role_update', '1', '2015-10-25 21:10:06', '2015-10-25 21:12:41'),
(10, 1, 'role_delete', '1', '2015-10-25 21:10:06', '2015-10-25 21:12:41'),
(11, 1, 'role_assign', '1', '2015-10-25 21:10:06', '2015-10-25 21:12:41'),
(12, 2, 'administrator_access', '1', '2015-10-27 05:11:16', '2015-10-27 05:11:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stock_order`
--
ALTER TABLE `product_stock_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stock_order_detail`
--
ALTER TABLE `product_stock_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_to_category`
--
ALTER TABLE `product_to_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`,`usermail`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_permission`
--
ALTER TABLE `user_role_permission`
  ADD PRIMARY KEY (`id`), ADD KEY `permission` (`permission`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_stock_order`
--
ALTER TABLE `product_stock_order`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_stock_order_detail`
--
ALTER TABLE `product_stock_order_detail`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_to_category`
--
ALTER TABLE `product_to_category`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_role_permission`
--
ALTER TABLE `user_role_permission`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
