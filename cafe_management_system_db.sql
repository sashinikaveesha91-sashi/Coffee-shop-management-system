-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2025 at 01:15 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `cafe_management_system_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cafe_management_system_db`;

--
-- Database: `cafe_management_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `check_in_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `work_date` date NOT NULL,
  `status` enum('Present','Excused','Sick','Absent') DEFAULT 'Present',
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `employee_id`, `check_in_time`, `work_date`, `status`, `notes`) VALUES
(1, 5, '2025-11-19 10:38:01', '2025-11-19', 'Present', '-'),
(2, 5, '2025-11-19 10:42:17', '2025-11-19', 'Excused', 's'),
(3, 1, '2025-11-19 10:42:28', '2025-11-19', 'Present', ''),
(4, 1, '2025-11-19 10:42:40', '2025-11-19', 'Absent', ''),
(5, 4, '2025-11-21 01:57:05', '2025-11-21', 'Sick', 'stomach pain'),
(6, 4, '2025-11-21 02:26:18', '2025-11-21', 'Sick', 'fever');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int NOT NULL,
  `ingredient_name` varchar(100) NOT NULL,
  `current_stock` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit` varchar(20) NOT NULL,
  `minimum_stock` decimal(10,2) DEFAULT '0.00',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`, `current_stock`, `unit`, `minimum_stock`, `updated_at`) VALUES
(6, 'White Rice', '48800.00', 'g', '5000.00', '2025-11-27 12:31:23'),
(7, 'Egg Noodles', '99.00', 'pcs', '10.00', '2025-11-27 12:31:23'),
(8, 'Flat Rice Noodles', '5000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(9, 'Spaghetti', '3000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(10, 'White Bread', '50.00', 'slice', '10.00', '2025-11-19 06:37:04'),
(11, 'Indomie Fried Noodles', '50.00', 'pack', '10.00', '2025-11-19 06:37:04'),
(12, 'Indomie Soup Noodles', '50.00', 'pack', '10.00', '2025-11-19 06:37:04'),
(13, 'Chicken Fillet', '4100.00', 'g', '1000.00', '2025-11-27 12:31:23'),
(14, 'Chicken Pieces', '50.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(15, 'Eggs', '100.00', 'pcs', '10.00', '2025-11-19 06:37:04'),
(16, 'Beef Meatballs', '98.00', 'pcs', '20.00', '2025-11-27 12:31:23'),
(17, 'Sausage', '100.00', 'pcs', '10.00', '2025-11-19 06:37:04'),
(18, 'Nuggets', '50.00', 'pcs', '10.00', '2025-11-19 06:37:04'),
(19, 'Minced Beef (Bolognese)', '1000.00', 'g', '200.00', '2025-11-19 06:37:04'),
(20, 'Fish Cake', '50.00', 'pcs', '10.00', '2025-11-19 06:37:04'),
(21, 'Chikuwa', '50.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(22, 'Fishroll', '50.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(23, 'Shrimp Tail', '50.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(24, 'Twister', '50.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(25, 'Dumpling', '50.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(26, 'Frozen Potatoes', '5000.00', 'g', '1000.00', '2025-11-19 06:37:04'),
(27, 'Banana', '20.00', 'pcs', '5.00', '2025-11-19 06:37:04'),
(28, 'Spicy Crackers', '2000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(29, 'Black Pepper Sauce', '1000.00', 'ml', '200.00', '2025-11-19 06:37:04'),
(30, 'BBQ Sauce', '1000.00', 'ml', '200.00', '2025-11-19 06:37:04'),
(31, 'Teriyaki Sauce', '880.00', 'ml', '200.00', '2025-11-27 12:31:23'),
(32, 'Grated Cheese', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(33, 'Chocolate Sprinkles/Spread', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(34, 'Cooking Oil', '5000.00', 'ml', '1000.00', '2025-11-19 06:37:04'),
(35, 'Nescafe Classic', '500.00', 'g', '50.00', '2025-11-19 06:37:04'),
(36, 'Lampung Coffee Powder', '500.00', 'g', '50.00', '2025-11-19 06:37:04'),
(37, 'Sidikalang Coffee Powder', '500.00', 'g', '50.00', '2025-11-19 06:37:04'),
(38, 'Aceh Gayo Coffee Powder', '500.00', 'g', '50.00', '2025-11-19 06:37:04'),
(39, 'Toraja Coffee Powder', '500.00', 'g', '50.00', '2025-11-19 06:37:04'),
(40, 'Liquid Palm Sugar', '2000.00', 'ml', '200.00', '2025-11-19 06:37:04'),
(41, 'UHT/Condensed Milk', '5000.00', 'ml', '500.00', '2025-11-19 06:37:04'),
(42, 'Cappuccino Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(43, 'Vanilla Latte Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(44, 'Pineapple', '10.00', 'pcs', '2.00', '2025-11-19 06:37:04'),
(45, 'Melon', '5.00', 'pcs', '1.00', '2025-11-19 06:37:04'),
(46, 'Mango', '5000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(47, 'Orange', '3000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(48, 'Strawberry', '2000.00', 'g', '200.00', '2025-11-19 06:37:04'),
(49, 'Avocado', '3000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(50, 'Strawberry Syrup', '1000.00', 'ml', '100.00', '2025-11-19 06:37:04'),
(51, 'Melon Syrup', '1000.00', 'ml', '100.00', '2025-11-19 06:37:04'),
(52, 'Lychee Syrup', '1000.00', 'ml', '100.00', '2025-11-19 06:37:04'),
(53, 'Yakult', '50.00', 'bottle', '5.00', '2025-11-19 06:37:04'),
(54, 'Sprite', '3000.00', 'ml', '500.00', '2025-11-19 06:37:04'),
(55, 'Tea Leaves/Tea Bags', '98.00', 'pcs', '10.00', '2025-11-21 02:29:33'),
(56, 'Lime/Lemon', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(57, 'Belgian Chocolate Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(58, 'Oreo Chocolate Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(59, 'Taro Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(60, 'Matcha Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(61, 'Red Velvet Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(62, 'Thai Tea Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(63, 'Bubblegum Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(64, 'Hazelnut Powder', '1000.00', 'g', '100.00', '2025-11-19 06:37:04'),
(65, 'Boba Pearl', '2000.00', 'g', '500.00', '2025-11-19 06:37:04'),
(66, 'Brown Sugar', '1000.00', 'ml', '200.00', '2025-11-19 06:37:04'),
(67, 'Bottled Water', '4.80', 'bottle', '1.00', '2025-11-19 17:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `purchase_detail_id` int NOT NULL,
  `purchase_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity_purchased` decimal(10,2) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_detail_id` int NOT NULL,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `order_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_detail_id`, `order_id`, `menu_id`, `quantity`, `order_price`, `subtotal`, `notes`) VALUES
(1, 11, 6, 1, '15000.00', '15000.00', '-'),
(2, 12, 7, 1, '15000.00', '15000.00', '-'),
(3, 13, 7, 1, '15000.00', '15000.00', '-'),
(4, 14, 7, 1, '15000.00', '15000.00', '-'),
(5, 15, 6, 1, '15000.00', '15000.00', '-'),
(6, 16, 6, 1, '15000.00', '15000.00', '-'),
(7, 17, 68, 1, '6000.00', '6000.00', '-'),
(8, 18, 6, 1, '15000.00', '15000.00', '-'),
(9, 18, 58, 1, '5000.00', '5000.00', '-'),
(10, 19, 58, 1, '5000.00', '5000.00', '-'),
(11, 19, 6, 1, '15000.00', '15000.00', '-'),
(12, 20, 6, 1, '15000.00', '15000.00', '-'),
(13, 21, 7, 1, '15000.00', '15000.00', '-'),
(14, 22, 6, 1, '15000.00', '15000.00', '-'),
(15, 22, 12, 1, '13000.00', '13000.00', '-');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` enum('Main Course','Snacks','Grilled','Drinks') NOT NULL,
  `status` enum('Available','Sold Out') NOT NULL DEFAULT 'Available',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `price`, `category`, `status`, `image_url`, `created_at`) VALUES
(6, 'Chicken Katsu + Rice', '15000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(7, 'Rice Bowl', '15000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(8, 'Spicy Fried Chicken + Rice', '18000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(9, 'Grilled Chicken + Rice', '20000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(10, 'Meatball Soup', '13000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(11, 'Chicken Noodles', '11000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(12, 'Chicken Noodles with Meatballs', '13000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(13, 'Fried Rice', '12000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(14, 'Egg Fried Rice', '15000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(15, 'Special Fried Rice', '18000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(16, 'Flat Rice Noodles Noodles', '12000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(17, 'Egg Flat Rice Noodles Noodles', '15000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(18, 'Special Flat Rice Noodles Noodles', '18000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(19, 'Spicy Crackers Bowl', '10000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(20, 'Egg Spicy Crackers', '13000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(21, 'Seafood Spicy Crackers', '18000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(22, 'Classic Stir-Fried Noodles', '12000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(23, 'Egg Stir-Fried Noodles', '15000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(24, 'Special Stir-Fried Noodles', '18000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(25, 'Instant Noodles', '10000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(26, 'Instant Noodles with Egg', '13000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(27, 'Extra White Rice', '5000.00', 'Main Course', 'Available', NULL, '2025-11-19 06:43:38'),
(28, 'French Fries', '18000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(29, 'Mix Snack', '20000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(30, 'Spaghetti Bolognese', '15000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(31, 'Korean Seafood', '15000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(32, 'Fried Fish Cake', '12000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(33, 'Fried Meatballs', '12000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(34, 'Fried Banana with Cheese & Chocolate', '15000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(35, 'Toast with Cheese & Chocolate', '15000.00', 'Snacks', 'Available', NULL, '2025-11-19 06:43:38'),
(36, 'Medium Grilled Sausage', '5000.00', 'Grilled', 'Available', NULL, '2025-11-19 06:43:38'),
(37, 'Large Grilled Sausage', '10000.00', 'Grilled', 'Available', NULL, '2025-11-19 06:43:38'),
(38, 'Mixed Grill (5 Skewers)', '12000.00', 'Grilled', 'Available', NULL, '2025-11-19 06:43:38'),
(39, 'Ice/Hot Americano', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(40, 'Palm Sugar Milk Coffee', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(41, 'Strawberry Milk Coffee', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(42, 'Melon Milk Coffee', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(43, 'Lampung Coffee', '11000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(44, 'Sidikalang Coffee', '13000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(45, 'Aceh Gayo Coffee', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(46, 'Toraja Coffee', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(47, 'Ice Cappucino', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(48, 'Ice Vanilla Latte', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(49, 'Pineapple Juice', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(50, 'Melon Juice', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(51, 'Mango Juice', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(52, 'Orange Juice', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(53, 'Strawberry Juice', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(54, 'Avocado Juice', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(55, 'Lychee Yakult', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(56, 'Melon Yakult', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(57, 'Strawberry Yakult', '15000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(58, 'Sweet Iced Tea', '5000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(59, 'Lemon Tea', '8000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(60, 'Iced Orange Drink', '8000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(61, 'Belgian Chocolate Ice Blend', '10000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(62, 'Ice Blend Choco Oreo', '10000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(63, 'Ice Blend Taro', '10000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(64, 'Ice Blend Matcha', '10000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(65, 'Ice Blend Thai Tea', '10000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(66, 'Boba Brown Sugar', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(67, 'Boba Red Velvet', '12000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38'),
(68, 'Mineral Water', '6000.00', 'Drinks', 'Available', NULL, '2025-11-19 06:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `visit_count` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `phone_number`, `visit_count`) VALUES
(3, 'Budi Santoso', '08123456789', 16),
(4, 'Raffi Ahmad', '081122334455', 20),
(5, 'Siti Aminah', '081987654321', 8),
(6, 'Dedy Corbuzier', '085712312312', 6),
(7, 'Joko Anwar', '081333444555', 1),
(8, 'Anya Geraldine', '087899988877', 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `purchase_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `status` enum('Ordered','Received','Cancelled') NOT NULL DEFAULT 'Ordered'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `table_number` int DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL,
  `payment_type` enum('Cash','Non-Cash') DEFAULT NULL,
  `order_status` enum('Pending','Processing','Completed','Cancelled') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `employee_id`, `customer_id`, `order_time`, `table_number`, `subtotal`, `discount`, `total_price`, `payment_type`, `order_status`) VALUES
(11, 4, NULL, '2025-11-19 16:44:44', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(12, 1, NULL, '2025-11-19 16:49:24', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(13, 1, NULL, '2025-11-19 16:53:51', NULL, '15000.00', '0.00', '15000.00', 'Non-Cash', 'Completed'),
(14, 1, NULL, '2025-11-19 16:55:05', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(15, 1, NULL, '2025-11-19 17:48:16', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(16, 1, NULL, '2025-11-19 17:57:23', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(17, 1, NULL, '2025-11-19 17:57:57', NULL, '6000.00', '0.00', '6000.00', 'Cash', 'Completed'),
(18, 4, NULL, '2025-11-20 13:55:53', NULL, '20000.00', '0.00', '20000.00', 'Cash', 'Completed'),
(19, 1, NULL, '2025-11-21 02:29:33', NULL, '20000.00', '0.00', '20000.00', 'Cash', 'Completed'),
(20, 1, NULL, '2025-11-21 02:30:43', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(21, 1, NULL, '2025-11-27 12:27:43', NULL, '15000.00', '0.00', '15000.00', 'Cash', 'Completed'),
(22, 1, 3, '2025-11-27 12:31:23', NULL, '28000.00', '4200.00', '23800.00', 'Non-Cash', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `menu_recipes`
--

CREATE TABLE `menu_recipes` (
  `recipe_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity_required` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_recipes`
--

INSERT INTO `menu_recipes` (`recipe_id`, `menu_id`, `ingredient_id`, `quantity_required`) VALUES
(1, 6, 13, '150.00'),
(2, 6, 6, '200.00'),
(3, 6, 31, '20.00'),
(4, 7, 13, '100.00'),
(5, 7, 6, '200.00'),
(6, 7, 31, '20.00'),
(7, 8, 14, '1.00'),
(8, 8, 6, '200.00'),
(9, 9, 14, '1.00'),
(10, 9, 6, '200.00'),
(11, 10, 16, '5.00'),
(12, 11, 7, '1.00'),
(13, 11, 13, '50.00'),
(14, 12, 7, '1.00'),
(15, 12, 13, '50.00'),
(16, 12, 16, '2.00'),
(17, 13, 6, '200.00'),
(18, 13, 34, '20.00'),
(19, 14, 6, '200.00'),
(20, 14, 15, '1.00'),
(21, 15, 6, '200.00'),
(22, 15, 15, '1.00'),
(23, 15, 16, '2.00'),
(24, 15, 17, '1.00'),
(25, 16, 8, '150.00'),
(26, 17, 8, '150.00'),
(27, 17, 15, '1.00'),
(28, 18, 8, '150.00'),
(29, 18, 15, '1.00'),
(30, 18, 16, '2.00'),
(31, 18, 17, '1.00'),
(32, 19, 28, '20.00'),
(33, 19, 16, '2.00'),
(34, 19, 17, '1.00'),
(35, 19, 7, '0.50'),
(36, 20, 15, '1.00'),
(37, 21, 15, '1.00'),
(38, 21, 21, '1.00'),
(39, 21, 22, '1.00'),
(40, 21, 23, '1.00'),
(41, 21, 24, '1.00'),
(42, 22, 7, '1.00'),
(43, 23, 7, '1.00'),
(44, 23, 15, '1.00'),
(45, 24, 7, '2.00'),
(46, 24, 15, '2.00'),
(47, 24, 16, '2.00'),
(48, 24, 17, '1.00'),
(49, 25, 11, '1.00'),
(50, 26, 11, '1.00'),
(51, 26, 15, '1.00'),
(52, 27, 6, '200.00'),
(53, 28, 26, '200.00'),
(54, 29, 26, '100.00'),
(55, 29, 17, '2.00'),
(56, 29, 18, '2.00'),
(57, 30, 9, '150.00'),
(58, 30, 19, '50.00'),
(59, 31, 21, '1.00'),
(60, 31, 22, '1.00'),
(61, 31, 23, '1.00'),
(62, 31, 24, '1.00'),
(63, 31, 17, '1.00'),
(64, 32, 20, '5.00'),
(65, 33, 16, '5.00'),
(66, 34, 27, '2.00'),
(67, 34, 33, '20.00'),
(68, 34, 32, '20.00'),
(69, 35, 10, '2.00'),
(70, 35, 33, '20.00'),
(71, 35, 32, '20.00'),
(72, 36, 17, '1.00'),
(73, 37, 17, '1.00'),
(74, 38, 17, '1.00'),
(75, 38, 16, '1.00'),
(76, 38, 21, '1.00'),
(77, 38, 22, '1.00'),
(78, 38, 23, '1.00'),
(79, 39, 35, '5.00'),
(80, 40, 35, '5.00'),
(81, 40, 40, '20.00'),
(82, 40, 41, '50.00'),
(83, 41, 35, '5.00'),
(84, 41, 50, '20.00'),
(85, 41, 41, '50.00'),
(86, 42, 35, '5.00'),
(87, 42, 51, '20.00'),
(88, 42, 41, '50.00'),
(89, 43, 36, '15.00'),
(90, 44, 37, '15.00'),
(91, 45, 38, '15.00'),
(92, 46, 39, '15.00'),
(93, 47, 42, '30.00'),
(94, 48, 43, '30.00'),
(95, 49, 44, '0.50'),
(96, 50, 45, '0.25'),
(97, 51, 46, '200.00'),
(98, 52, 47, '200.00'),
(99, 53, 48, '100.00'),
(100, 54, 49, '200.00'),
(101, 55, 52, '20.00'),
(102, 55, 53, '1.00'),
(103, 55, 54, '100.00'),
(104, 56, 51, '20.00'),
(105, 56, 53, '1.00'),
(106, 56, 54, '100.00'),
(107, 57, 50, '20.00'),
(108, 57, 53, '1.00'),
(109, 57, 54, '100.00'),
(110, 58, 55, '1.00'),
(111, 59, 55, '1.00'),
(112, 59, 56, '20.00'),
(113, 60, 47, '100.00'),
(114, 61, 57, '30.00'),
(115, 62, 58, '30.00'),
(116, 63, 59, '30.00'),
(117, 64, 60, '30.00'),
(118, 65, 62, '30.00'),
(119, 66, 66, '20.00'),
(120, 66, 65, '30.00'),
(121, 67, 61, '30.00'),
(122, 67, 65, '30.00'),
(123, 68, 67, '0.20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Owner','Manager','Cashier','Chef','Waiter') NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `token_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `role`, `phone_number`, `reset_token`, `token_expiry`, `created_at`) VALUES
(1, 'Admin Owner', 'owner', '123', 'Owner', '0811111111', NULL, NULL, '2025-11-13 11:21:38'),
(2, 'Cashier User', 'cashier_user', '$2a$10$e.x/L3b.b/V5g.E8/qRk.u.O/wN.pY.K/gU/5n.U/6p.S/9p.W', 'Cashier', '0822222222', NULL, NULL, '2025-11-13 11:21:38'),
(3, 'Chef User', 'chef_user', '$2a$10$f.z/C7d.g/W9h.G2/tSl.v.P/xO.rZ.L/iV/6o.X/7q.T/0q.Y', 'Chef', '0833333333', NULL, NULL, '2025-11-13 11:21:38'),
(4, 'Staff User', 'staff', '12345', 'Cashier', '0895406320307', NULL, NULL, '2025-11-13 15:08:05'),
(5, 'System Administrator', 'admin', '123', 'Owner', '0895406320307', NULL, NULL, '2025-11-13 15:12:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD UNIQUE KEY `ingredient_name` (`ingredient_name`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`purchase_detail_id`),
  ADD UNIQUE KEY `idx_purchase_details_unique` (`purchase_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD UNIQUE KEY `idx_order_details_unique` (`order_id`,`menu_id`,`notes`(50)),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD UNIQUE KEY `menu_name` (`menu_name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `menu_recipes`
--
ALTER TABLE `menu_recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD UNIQUE KEY `idx_menu_recipe_unique` (`menu_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `purchase_detail_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchase_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `menu_recipes`
--
ALTER TABLE `menu_recipes`
  MODIFY `recipe_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`purchase_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_details_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL;

--
-- Constraints for table `menu_recipes`
--
ALTER TABLE `menu_recipes`
  ADD CONSTRAINT `menu_recipes_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_recipes_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
