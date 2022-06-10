-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2022 at 09:55 PM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mg_hygiene`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `heading`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'About MG Hygiene', '<p style=\"font-family: Poppins, sans-serif; letter-spacing: 1px; color: rgb(119, 119, 119);\">We are suppliers of quality hygiene and catering products to the Cleaning, Catering and Hospitality industries and offer quality and reliable products you can count on. Our friendly and professional staff are here to answer any questions you may have about our company or our products.<br><br>Please browse our Web site for further information on our products and services. If you have any questions or would like to speak with a MG-Hygiene representative, please email us at sales@mghygiene.ie or</p><p style=\"font-family: Poppins, sans-serif; letter-spacing: 1px; color: rgb(119, 119, 119);\">call us on - 01 429 8710.</p>', '8171_1619417249.png', '2021-03-25 09:10:56', '2021-04-26 06:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `action_title` varchar(111) NOT NULL,
  `action_slug` varchar(111) NOT NULL,
  `class` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `action_title`, `action_slug`, `class`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Add', 'add', 'info', NULL, '2021-01-18 09:43:54', '2021-01-18 09:43:54'),
(2, 'Edit', 'edit', 'info', 'fas fa-pencil-alt', '2021-01-18 09:43:54', '2021-01-18 09:43:54'),
(3, 'Delete', 'delete', 'danger', 'fas fa-trash', '2021-01-18 09:44:32', '2021-01-18 09:44:32'),
(4, 'View', 'view', 'info', 'fas fa-eye', '2021-01-18 09:44:32', '2021-01-18 09:44:32'),
(5, 'Export', 'export', 'info', NULL, '2021-01-18 11:04:06', '2021-01-18 11:04:06'),
(6, 'Import', 'import', 'info', NULL, '2021-01-18 11:04:06', '2021-01-18 11:04:06'),
(8, 'Status', 'status', 'success', NULL, '2021-02-12 10:56:40', '2021-02-12 10:56:40'),
(9, 'Reset Password', 'password', 'primary', 'fas fa-key', '2021-02-23 04:47:04', '2021-02-23 04:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `action_id` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `brand_slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Nector', 'nector', '8974_1621263875.png', 1, '2021-05-18 03:34:36', '2021-05-18 03:34:36'),
(4, 'Greyland Chemical', 'greyland-chemical', '2629_1654757662.jpg', 1, '0000-00-00 00:00:00', '2022-06-09 19:24:23'),
(7, 'Taski', 'taski', '9867_1654757702.jpg', 1, '2021-11-15 17:58:50', '2022-06-09 19:25:02'),
(8, 'Vileda', 'vileda', '3492_1654757854.png', 1, '2021-11-15 18:01:32', '2022-06-09 19:27:34'),
(9, 'MP Hygiene Products', 'mp-hygiene-products', '2278_1654757884.png', 1, '2021-11-15 18:02:13', '2022-06-09 19:28:04'),
(10, 'Diversey', 'diversey', '3030_1654757918.jpg', 1, '2021-11-15 18:03:14', '2022-06-09 19:28:38'),
(11, 'Tork', 'tork', '8177_1654757955.png', 1, '2021-11-15 18:04:24', '2022-06-09 19:29:15'),
(12, 'Paper Products', 'paper-products', '2976_1654757995.jpg', 1, '2021-11-15 18:05:02', '2022-06-09 19:29:55'),
(13, 'Mopping System\'s', 'mopping-systems', '2943_1654758039.jpg', 1, '2021-11-15 18:05:20', '2022-06-09 19:30:39'),
(14, 'Sacks,Bin Liners & Bins', 'sacksbin-liners-bins', '3564_1654758061.jpg', 1, '2021-11-15 18:05:37', '2022-06-09 19:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `cart_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total` float NOT NULL,
  `coupon_code` varchar(100) DEFAULT NULL,
  `coupon_amount` float DEFAULT NULL,
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_price` float NOT NULL DEFAULT '0',
  `tax_amount` float NOT NULL,
  `total` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `session_id`, `cart_id`, `product_id`, `size`, `color`, `price`, `quantity`, `sub_total`, `coupon_code`, `coupon_amount`, `shipping_method`, `shipping_price`, `tax_amount`, `total`, `created_at`, `updated_at`) VALUES
(1, 'uHgKrqAYAfwlm5yGqSe8dC7NnlA45pdqQywExFvZ', 'HSQ3A6R0', 3, '1 kg', 'black', 90, 1, 90, NULL, NULL, NULL, 0, 9, 99, '2021-05-20 17:42:06', '2021-05-20 17:42:06'),
(2, 'uHgKrqAYAfwlm5yGqSe8dC7NnlA45pdqQywExFvZ', 'HSQ3A6R0', 2, 'Medium', 'Black', 200, 1, 200, NULL, NULL, NULL, 0, 20, 220, '2021-05-20 21:33:41', '2021-05-21 02:11:56'),
(3, '4WFmBtbfea2REtpzzPFospI2lX16u8SkGnk5dHNW', 'MUKS2PLT', 2, 'Small', 'Black', 100, 1, 100, NULL, NULL, NULL, 0, 10, 110, '2021-05-20 22:37:57', '2021-05-20 22:37:57'),
(4, 'uHgKrqAYAfwlm5yGqSe8dC7NnlA45pdqQywExFvZ', 'HSQ3A6R0', 1, '', '', 100, 1, 100, NULL, NULL, NULL, 0, 10, 110, '2021-05-21 01:18:40', '2021-05-21 01:18:54'),
(5, 'JMRde0tRf5NabkcmOCRlvVPlCnBVhKMHABdoBont', 'G116EJD7', 2, 'Small', 'Black', 100, 1, 100, '', 0, 'Free', 0, 10, 110, '2021-07-03 00:03:19', '2021-07-03 00:03:23'),
(6, 'da2NSM6O5xP2wpRtJLghmEodb1NDRIqsQI1SCzKs', '5WN6QE6B', 1, '', '', 100, 1, 100, '', 0, 'Free', 0, 10, 110, '2021-07-08 18:13:43', '2021-07-08 18:14:36'),
(7, 'EKENjKYZhESPYRXmosE3i3GVddC9A3depJHU0lx4', '8VE8IHV9', 2, 'Small', 'Black', 100, 1, 100, NULL, NULL, NULL, 0, 10, 110, '2021-11-12 19:31:24', '2021-11-12 19:31:24'),
(8, 'jbHELKFQyBj8RSxhlg10vpN0jvhoywRLctssNHTZ', '2Y3EKBAH', 2, 'Small', 'Black', 100, 2, 200, '', 0, 'Free', 0, 20, 220, '2021-11-12 19:31:35', '2021-11-12 19:31:54'),
(9, 'jAYnY1dGjcJ35la50cmBdLhrYaxfshn1ZaXo6uBd', '4COJ9WN9', 2, 'Small', 'Black', 100, 1, 100, '', 0, 'Free', 0, 10, 110, '2022-06-09 18:09:47', '2022-06-09 18:09:54'),
(10, 'L9xP6rExdkJu80EjgRKjr7ojky93G2bgS2UNgCod', 'CQUNCVBW', 156, '', '', 21.61, 1, 21.61, NULL, NULL, NULL, 0, 2.161, 23.771, '2022-06-10 01:49:09', '2022-06-10 01:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `cart_limits`
--

CREATE TABLE `cart_limits` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `minimum` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_limits`
--

INSERT INTO `cart_limits` (`id`, `category_id`, `minimum`, `created_at`, `updated_at`) VALUES
(1, 2, 30, '2021-04-02 05:56:50', '2021-04-02 05:56:50'),
(2, 3, 0, '2021-04-02 05:57:25', '2021-04-20 19:24:26'),
(3, 4, 0, '2021-04-02 05:57:25', '2021-04-02 05:57:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` int(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `brand_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Category 1', 1, '2021-05-05 11:01:35', '2021-05-05 11:02:09'),
(2, 1, 'Category 2', 1, '2021-05-06 09:11:06', '2021-05-06 09:11:06'),
(3, 2, 'Category 3', 1, '2021-05-06 09:11:16', '2021-05-06 09:11:16'),
(4, 3, 'Cleaning', 1, '2021-05-18 03:34:53', '2021-05-18 03:34:53'),
(5, 4, 'Toilet & Washroom', 1, '2021-11-15 18:08:27', '2021-11-15 18:08:27'),
(6, 4, 'Hard Surface Cleaners', 1, '2021-11-15 18:09:51', '2021-11-15 18:09:51'),
(7, 4, 'Floorcare', 1, '2021-11-15 18:10:16', '2021-11-15 18:10:16'),
(8, 4, 'Housekeeping (Chemical)', 1, '2021-11-15 18:10:36', '2021-11-15 18:10:36'),
(9, 4, 'Catering & Kitchen', 1, '2021-11-15 18:10:54', '2021-11-15 18:10:54'),
(10, 4, 'Handcare', 1, '2021-11-15 18:11:26', '2021-11-15 18:11:26'),
(11, 4, 'Specialised Chemical Products', 1, '2021-11-15 18:11:49', '2021-11-15 18:11:49'),
(12, 4, 'Maximum Range', 1, '2021-11-15 18:12:40', '2021-11-15 18:12:40'),
(13, 7, 'Taski Aero Vacuum Range', 1, '2021-11-15 18:12:53', '2021-11-15 18:12:53'),
(15, 7, 'TASKI Swingo Scrubber Driers Range', 1, '2021-11-15 18:13:23', '2021-11-15 18:13:23'),
(16, 8, 'Vileda Gloves', 1, '2021-11-15 18:13:40', '2021-11-15 18:15:43'),
(17, 9, 'Evadis Range', 1, '2021-11-15 18:14:00', '2021-11-15 18:16:16'),
(18, 9, 'Sanitizer Range', 1, '2021-11-15 18:14:24', '2021-11-15 18:16:33'),
(19, 9, 'Dispensers', 1, '2021-11-15 18:14:42', '2021-11-15 18:16:53'),
(20, 9, 'Tifon Range', 1, '2021-11-15 18:15:06', '2021-11-15 18:17:21'),
(21, 10, 'Kitchen Hygiene', 1, '2021-11-15 18:17:59', '2021-11-15 18:17:59'),
(22, 10, 'Building Care', 1, '2021-11-15 18:18:25', '2021-11-15 18:18:25'),
(23, 10, 'Personal Care', 1, '2021-11-15 18:18:49', '2021-11-15 18:18:49'),
(24, 10, 'Infection Prevention', 1, '2021-11-15 18:19:07', '2021-11-15 18:19:07'),
(25, 10, 'Infection Prevention', 1, '2021-11-15 18:21:32', '2021-11-15 18:21:32'),
(26, 10, 'Consumer Brands', 1, '2021-11-15 18:22:00', '2021-11-15 18:22:00'),
(27, 10, 'Room Care', 1, '2021-11-15 18:22:17', '2021-11-15 18:22:17'),
(28, 10, 'Floor Care', 1, '2021-11-15 18:22:32', '2021-11-15 18:22:32'),
(29, 11, 'Hand Towel Dispenser', 1, '2021-11-15 18:23:01', '2021-11-15 18:23:01'),
(30, 11, 'Toilet Paper Dispenser', 1, '2021-11-15 18:23:18', '2021-11-15 18:23:18'),
(31, 11, 'Bins', 1, '2021-11-15 18:23:40', '2021-11-15 18:23:40'),
(32, 11, 'Skincare', 1, '2021-11-15 18:23:55', '2021-11-15 18:23:55'),
(33, 11, 'Handsoap', 1, '2021-11-15 18:24:30', '2021-11-15 18:24:30'),
(34, 12, 'Toilet Tissue', 1, '2021-11-15 18:24:49', '2021-11-15 18:24:49'),
(36, 12, 'Napkins/Serviettes', 1, '2021-11-15 18:26:21', '2021-11-15 18:26:21'),
(37, 13, 'Mop Heads', 1, '2021-11-15 18:26:40', '2021-11-15 18:26:58'),
(38, 13, 'Mop Handles & Fittings', 1, '2021-11-15 18:27:15', '2021-11-15 18:27:15'),
(39, 13, 'Wet Floor Signs', 1, '2021-11-15 18:27:34', '2021-11-15 18:27:34'),
(40, 13, 'Floor Squeegees & Scrapers', 1, '2021-11-15 18:28:15', '2021-11-15 18:28:15'),
(41, 14, 'Black Refuse Sacks', 1, '2021-11-15 18:28:35', '2021-11-15 18:28:35'),
(42, 14, 'Clear refuse sacks', 1, '2021-11-15 18:28:59', '2021-11-15 18:28:59'),
(43, 14, 'Bin Liners', 1, '2021-11-15 18:29:14', '2021-11-15 18:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'Ritu Nagar', 'sritu2567@gmail.com', '09891504547', 'kjncjksncskjdnckjdsncjk', '2021-04-26 12:56:00', '2021-04-26 12:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `county`
--

CREATE TABLE `county` (
  `id` int(11) NOT NULL,
  `county` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `county`
--

INSERT INTO `county` (`id`, `county`, `created_at`, `updated_at`) VALUES
(1, 'Carlow', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(2, 'Cavan', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(3, 'Clare', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(4, 'Cork', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(5, 'Donegal', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(6, 'Dublin', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(7, 'Galway', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(8, 'Kerry', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(9, 'Kildare', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(10, 'Kilkenny', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(11, 'Laois', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(12, 'Leitrim', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(13, 'Limerick', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(14, 'Longford', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(15, 'Louth', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(16, 'Mayo', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(17, 'Meath', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(18, 'Monaghan', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(19, 'Offaly', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(20, 'Roscommon', '2021-04-05 05:10:35', '2021-04-05 05:10:35'),
(21, 'Sligo', '2021-04-05 05:11:38', '2021-04-05 05:11:38'),
(22, 'Tipperary', '2021-04-05 05:11:38', '2021-04-05 05:11:38'),
(23, 'Waterford', '2021-04-05 05:11:38', '2021-04-05 05:11:38'),
(24, 'Westmeath', '2021-04-05 05:11:38', '2021-04-05 05:11:38'),
(25, 'Wexford', '2021-04-05 05:11:38', '2021-04-05 05:11:38'),
(26, 'Wicklow', '2021-04-05 05:11:38', '2021-04-05 05:11:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Ireland',
  `county` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `town_city` varchar(100) DEFAULT NULL,
  `eircode` varchar(50) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `company_name`, `country`, `county`, `street_address`, `town_city`, `eircode`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Ritu', 'Nagar', NULL, 'Ireland', 'Carlow', 'vjvjv', 'Ghaziabad', '', '09891504547', 'sritu2567@gmail.com', '2021-04-26 11:30:48', '2021-04-26 11:30:48'),
(2, 'Vikas', 'Nagar', NULL, 'Ireland', 'Carlow', 'vjvjv', 'Ghaziabad', '', '8755883873', 'vikas.nagar@commediait.com', '2021-05-15 12:39:27', '2021-05-15 12:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `discount_coupons`
--

CREATE TABLE `discount_coupons` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `coupon_code` varchar(11) NOT NULL,
  `discount` int(11) NOT NULL COMMENT '%',
  `users_limit` int(11) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `status` int(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `cart_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total` float NOT NULL,
  `coupon_code` varchar(100) DEFAULT NULL,
  `coupon_amount` float DEFAULT NULL,
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_price` float NOT NULL DEFAULT '0',
  `tax_amount` float NOT NULL,
  `total` float NOT NULL,
  `g_total` float NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL,
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `shipping_address_id`, `order_id`, `session_id`, `cart_id`, `product_id`, `size`, `color`, `price`, `quantity`, `sub_total`, `coupon_code`, `coupon_amount`, `shipping_method`, `shipping_price`, `tax_amount`, `total`, `g_total`, `txn_id`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 2, 0, '609FC10010047738207102', '7wZmgYGKVToTsEAoSOqfeOvczvVzkSbqxOoDzIH0', 'R3F6BQVK', 2, 'Medium', 'Black', 200, 4, 800, '', 0, 'Free', 0, 80, 880, 990, 'txn_1IrMmFA2zRONk2AvPSGE8p0h', 'succeeded', NULL, '2021-05-15 12:39:33', '2021-05-15 12:39:33'),
(2, 2, 0, '609FC10010047738207102', '7wZmgYGKVToTsEAoSOqfeOvczvVzkSbqxOoDzIH0', 'R3F6BQVK', 1, NULL, NULL, 100, 1, 100, '', 0, 'Free', 0, 10, 110, 990, 'txn_1IrMmFA2zRONk2AvPSGE8p0h', 'succeeded', NULL, '2021-05-15 12:39:33', '2021-05-15 12:39:33'),
(3, 2, 0, '609FC24FC6275357697169', '7wZmgYGKVToTsEAoSOqfeOvczvVzkSbqxOoDzIH0', '1Z895OBB', 1, '', '', 100, 2, 200, '', 0, 'Free', 0, 20, 220, 1100, 'txn_1IrMrdA2zRONk2Avr05cSGs9', 'succeeded', NULL, '2021-05-15 12:45:05', '2021-05-15 12:45:05'),
(4, 2, 0, '609FC24FC6275357697169', '7wZmgYGKVToTsEAoSOqfeOvczvVzkSbqxOoDzIH0', '1Z895OBB', 2, 'Medium', 'Black', 200, 4, 800, '', 0, 'Free', 0, 80, 880, 1100, 'txn_1IrMrdA2zRONk2Avr05cSGs9', 'succeeded', NULL, '2021-05-15 12:45:05', '2021-05-15 12:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `our_environments`
--

CREATE TABLE `our_environments` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_environments`
--

INSERT INTO `our_environments` (`id`, `heading`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Our Environment', '<h5 style=\"margin: 0cm; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 18pt; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></h5><h4 style=\"margin: 0cm; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 18pt; vertical-align: baseline; font-family: &quot;Times New Roman&quot;, serif; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">1 Purchase paper products that are sourced from sustainable sources and that do not damage the environment in their production</p><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">2. Offer green cleaning solutions to our customers manufactured from naturally occurring products like citrus acids</p><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">3. Work in partnership with our customers through education to eliminate chemicals from their cleaning programs via the use PH neutral solutions and microfibre technology.</p><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">Promote the use of recycled plastics containers.</p><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">Promote the use of recycled and biodegradable waste sacks.</p><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">Re-use, return or recycle any incoming packaging materials.</p><p style=\"font-family: Poppins, sans-serif; font-size: 14px; letter-spacing: 1px; color: rgb(119, 119, 119);\">We are constantly setting challenging targets for improving our environmental performance and we welcome feedback from our customers.</p></h4>', '2021-04-01 12:27:59', '2021-04-27 20:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `our_environment_images`
--

CREATE TABLE `our_environment_images` (
  `id` int(11) NOT NULL,
  `our_environment_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `our_environment_images`
--

INSERT INTO `our_environment_images` (`id`, `our_environment_id`, `image`, `created_at`, `updated_at`) VALUES
(5, 1, '3274_1619169520.jpg', '2021-04-23 09:18:41', '2021-04-23 09:18:41'),
(6, 1, '2628_1619169521.jpg', '2021-04-23 09:18:42', '2021-04-23 09:18:42'),
(7, 1, '9605_1619169522.jpg', '2021-04-23 09:18:43', '2021-04-23 09:18:43'),
(8, 1, '3991_1619169523.jpg', '2021-04-23 09:18:43', '2021-04-23 09:18:43'),
(9, 1, '2784_1619169523.jpg', '2021-04-23 09:18:44', '2021-04-23 09:18:44'),
(10, 1, '1715_1619169524.jpg', '2021-04-23 09:18:44', '2021-04-23 09:18:44'),
(11, 1, '5726_1619169524.jpg', '2021-04-23 09:18:45', '2021-04-23 09:18:45'),
(12, 1, '8134_1619169525.jpg', '2021-04-23 09:18:45', '2021-04-23 09:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy`
--

CREATE TABLE `privacy_policy` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privacy_policy`
--

INSERT INTO `privacy_policy` (`id`, `heading`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">Who we are</h2><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\"><span style=\"color: rgb(146, 146, 146); font-size: 14px; font-weight: 400;\">Our website address is: </span><a href=\"https://wpsuperiors.com/delany.\" target=\"_blank\">wpsuperiors.com</a></p><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">What personal data we collect and why we collect it</h2><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Comments</h3><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor’s IP address and browser user agent string to help spam detection.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Media</h3><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\"><span style=\"color: rgb(146, 146, 146); font-size: 14px; font-weight: 400;\">If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</span></p><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Contact forms</h3><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Cookies</h3><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select \"Remember Me\", your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Embedded content from other websites</h3><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Analytics</h3><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">Who we share your data with</h2><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">How long we retain your data</h2><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-family: Georgia, serif; color: rgb(146, 146, 146);\">For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">What rights you have over your data</h2><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\"><span style=\"color: rgb(146, 146, 146); font-size: 14px; font-weight: 400;\">If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</span></p><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">Where we send your data</h2><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\"><span style=\"color: rgb(146, 146, 146); font-size: 14px; font-weight: 400;\">Visitor comments may be checked through an automated spam detection service.</span></p><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">Your contact information</h2><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\">Additional information</h2><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">How we protect your data</h3><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">What data breach procedures we have in place</h3><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">What third parties we receive data from</h3><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">What automated decision making and/or profiling we do with user data</h3><h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Industry regulatory disclosure requirements</h3>', '2021-03-25 09:10:56', '2021-04-02 09:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_slug` varchar(255) NOT NULL,
  `description` longtext,
  `variants` int(4) NOT NULL DEFAULT '0',
  `sizes` varchar(255) DEFAULT NULL,
  `colors` varchar(255) DEFAULT NULL,
  `prices` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `title`, `title_slug`, `description`, `variants`, `sizes`, `colors`, `prices`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Product 1', 'product-1', 'slcnjasncjasncjasncjasncjasncjnasjcnsajcndsjncj saj ncjiasncjnasjicnm', 0, '', '', '', 100, NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 3, 'Product 3', 'product-3', 'lksvmksdmcksdmcksdnkjc dsvckjsd njc dsjc njsd cj dsnjc', 1, 'Small,Medium,Large', 'Black,Black,Blue', '100,200,300', 0, NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 4, 'Floor Cleaner', 'floor-cleaner', 'This is test description', 1, '1 kg,1 kg', 'blue,black', '1000,90', 0, NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 0, 0, 'title', 'title_slug', 'description', 0, 'sizes', 'colors', 'prices', 0, 'image', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 4, 5, 'Triple S Toilet Cleaner 1Lt', 'triple-s-toilet-cleaner-1lt', 'Effectively cleans and descales toilets and other ceramic surfaces. Safe for use on stainless steel and chrome fittings.\r\n\r\nToilet Bowls: Remove cap and aim under the rim at the water outlets then around the bowl above the water level. Leave for 5 minutes and brush stubborn stains. To remove stains below\r\nthe water level, force water round the S bend with the toilet brush and apply as above. Rinse brush thoroughly after use. Urinals: Apply evenly across the surface of the urinal, scrubbing\r\nstains with a brush. Leave to flush automatically and rinse brush. Sinks: Wear protective gloves. Insert the plug and apply carefully to taps and spread evenly around the inside of the\r\nsink.  Allow to react for a few minutes and agitate with a cloth or sponge. Remove the plug and rinse thoroughly.', 0, '', '', '', 3.44, NULL, 1, '0000-00-00 00:00:00', '2022-06-10 00:12:57'),
(104, 4, 5, 'Triple Clean 750ml', '', 'A foaming ready to use cleaner for use on a variety of washroom surfaces.\n\nTriple Clean Ready to Use may be used to clean a variety of washroom surfaces including washbasins, sinks, tiles, cabinets, counter services and tables. It complies with BSEN1276, it is certified against MRSA and will kill 99.999% of germs.\n\n \n\nTriple S Information Sheet\n\n/_fileupload/Triple-Clean-RTU-1.pdf\n\nTriple S MSDS Sheet\n\n/_fileupload/Triple-Clean-RTU1.pdf', 0, '', '', '', 3.66, 'https://drive.google.com/file/d/1DLR56PWsRrHpHsnC9nmYcNnpCrme7FBk/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 4, 5, 'Spray & Wipe with Bleach 750ml', '', 'A ready-to use-bactericidal cleaner for use on most washroom surfaces.\n\nUse neat and apply to the surface by cloth or spray. Allow a few minutes contact time and rinse away with a damp cloth leaving a clean disinfected surface. Ideal for many washroom surfaces including washbasins, sinks, tiles, cabinets, counter surfaces and tables. Where washroom walls are looking jaded, it is perfect for making grout lines look like new. It will kill most commonly found bacteria. Always clean vertical surfaces from the bottom up to avoid unsightly streaking.\n\n \n\n', 0, '', '', '', 3.6, 'https://drive.google.com/file/d/1h-bcjG85qhFM7Ow4X6YNzUtmadw6vi53/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 4, 5, 'Citrus Toilet & Washroom Cleaner 1lt', 'citrus-toilet-washroom-cleaner-1lt', 'A concentrated liquid designed to clean, disinfect and deodorise most washroom surfaces, including stainless steel. Effective against most common forms of bacteria.\r\n\r\nCitrus Toilet/Washroom Cleaner is ideal for use on many washroom surfaces including toilets, urinals, washbasins, sinks, tiles, counter surfaces and floors.\r\n\r\nFor General Washroom Cleaning: Dilute 1 part to 60 parts water. For Stainless Steel Cleaning: Dilute 1 part to 40 parts water. Use neat for disinfecting drains. Apply to surface by cloth, allow a few minutes contact time, agitate and then wipe away with a damp cloth leaving a clean disinfected surface.\r\n\r\nProduct Information Sheet:\r\n\r\n/_fileupload/Citrus-Toilet-Washroom-Cleaner-1.pdf\r\n\r\nProduct MSSD Sheet:\r\n\r\n/_fileupload/Citrus-Toilet-Washroom%20MSSD.pdf', 0, '', '', '', 3.15, NULL, 1, '0000-00-00 00:00:00', '2022-06-10 00:14:38'),
(107, 4, 5, 'Triple S Toilet Cleaner 5L', 'triple-s-toilet-cleaner-5l', 'Effectively cleans and descales toilets and other ceramic surfaces. Safe for use on stainless steel and chrome fittings.\r\n\r\nToilet Bowls: Remove cap and aim under the rim at the water outlets then around the bowl above the water level. Leave for 5 minutes and brush stubborn stains. To remove stains below\r\nthe water level, force water round the S bend with the toilet brush and apply as above. Rinse brush thoroughly after use. Urinals: Apply evenly across the surface of the urinal, scrubbing\r\nstains with a brush. Leave to flush automatically and rinse brush. Sinks: Wear protective gloves. Insert the plug and apply carefully to taps and spread evenly around the inside of the\r\nsink.  Allow to react for a few minutes and agitate with a cloth or sponge. Remove the plug and rinse thoroughly.\r\n\r\nProduct Information:\r\n\r\n/_fileupload/Triple%20S%20Info%20Sheet.pdf\r\n\r\nProduct MSSD Sheet:\r\n\r\n/_fileupload/Triple%20S.pdf', 0, '', '', '', 15.5, NULL, 1, '0000-00-00 00:00:00', '2022-06-10 17:17:05'),
(108, 4, 5, 'Greyland Limescale Remover 1L', '', 'A powerful germicidal descaler of most washroom surfaces. Including stainless steel and chrome fittings.\n\nToilet Bowls: Remove cap and aim under the rim at the water outlets then around the bowl above the water level. Leave for 5 minutes and brush stubborn stains. To remove stains below the water level, force water round the S bend with the toilet brush and apply as above. Rinse brush thoroughly after use. Urinals: Apply evenly across the surface of the urinal, leave to react for 5 minutes before scrubbing stains with a brush. Allow to flush automatically and rinse brush. Sinks: Wear protective gloves. Insert the plug and apply carefully to taps and spread around the inside of the sink. Allow to react for a few minutes and agitate with a cloth or sponge. Remove the plug and rinse thoroughly.\n\n \n\nProduct Information Sheet:\n\n/_fileupload/Limescale-Remover-1%20Info%20sheet.pdf\n\nProduct MSDS Sheet:\n\n/_fileupload/Limescale-Remover%20MSSD%20Sheet_.pdf\n', 0, '', '', '', 3.79, 'https://drive.google.com/file/d/1rFZazqTo4krHuDu1nTXfmJxOGv2n3sHG/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 4, 5, 'Greyland Thick Bleach 5L', '', 'Ideal for use where general purpose cleaning and sterilising is required.\n\nAgitate before use. Thickened formula will cling to vertical surfaces. Use neat to disinfect toilets, urinals, drains, waste pipes etc. For general use dilute with up to 100 parts water, apply by mop or cloth. Allow a few minutes to react, wipe and rinse with clean water.\n\n \n\n', 0, '', '', '', 5.15, 'https://drive.google.com/file/d/1ox_ZsddWmQK9mgu6gCaf51TM0mu6ce-K/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 4, 5, 'Toilet Freshener', '', 'Ideal for use as a daily deodoriser for toilets and urinals.\n\n', 0, '', '', '', 8.01, 'https://drive.google.com/file/d/1vpVFaWeV5CtAhUUmredwpZhJiMpvbCe3/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 4, 5, 'Uritex 5L', '', 'Removes scale and stains from toilet bowls and urinals etc. Clears the most stubborn blockage in drains and sewage by dissolving greasy matter and removing limescale. Also a mild disinfectant and contains corrosion inhibitors to reduce attack on metal fittings.\n\nFor cleaning drains use with 1 to 4 parts of hot water. For removing stains from walls, concrete etc. Use with 1 to 4 parts of hot water and apply with a brush or spray. For removing scale from toilet bowls, urinals, gullies etc, block outlet and use 1 part in 2 to 4 parts water. Allow to soak for a few minutes, if required scrub with a brush and rinse with adequate supplies of water.\n\n', 0, '', '', '', 12.92, 'https://drive.google.com/file/d/1br84JPaI-e-0seH7ymuTgE61pnKkK0qE/view?usp=sharing ', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 4, 6, 'Greyland Universal Cleaner 5L', '', 'A general purpose cleaner of grime and grease from most hard surfaces, including floors and walls.\n\nDilute 1 part with 5 parts of water for heavy duty cleaning. Dilute 1 part with 60 parts of water for general purpose cleaning of hard surfaces. Apply to the surface with mop or cloth, leave to react for a few seconds and then wipe off the dirt with the mop or cloth, rubbing stubborn marks. Rinse the mop or cloth frequently in clean water. When dry, surfaces may be polished with a  dry cloth.', 0, '', '', '', 12.35, '\nhttps://drive.google.com/file/d/1Z6ALxPhWYFMjYNcR0hOB4mHxxZMZUwAi/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 4, 6, 'Greyland Universal Cleaner 750ml', '', 'A ready to use general purpose cleaner of grime and grease from most hard surfaces, including floors and walls.\n\nSpray onto surface, leave to react for a few seconds and then wipe off the dirt with a clean damp cloth, rubbing stubborn marks. Rinse the wiping cloth frequently in clean water. When dry, surfaces may be polished with a dry cloth.', 0, '', '', '', 2.38, '\nhttps://drive.google.com/file/d/1P-58mYE6FEV7_5SDbqIjTtpgn5nd9sHP/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 4, 6, 'Greyland Neutral Cleaner 5L', '', 'An effective neutral cleaner for most types a floor and hard surfaces.\n\nDilute 1 part with 50 parts of water (100ml to 5 litres). Apply to surface with mop or cloth, leave to react for a few seconds. Rub stubborn marks and then rinse with clean water and allow to air dry.  Change the rinsing water frequently to avoid redisposition. When dry, surfaces may be polished with a dry cloth.', 0, '', '', '', 11.62, '\nhttps://drive.google.com/file/d/16hrlxWz_BWhDgvyjB8BLMonHofIlntuJ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 4, 6, 'Greyland Heavy Duty Degreasers 5L', '', 'A powerful cleaner of grime and grease from most hard surfaces, including floors and walls.\n\nDilute approx. 1 part with 10 parts of water (500ml to 5 litres) for heavy duty cleaning of floors etc. Apply by mop or machine, scrub and then rinse thoroughly with clean water. Dilute approx. 1 part with 150 parts of water (35ml to 5 litres) for general purpose cleaning of hard surfaces. Spray or wipe diluted cleaner onto surface, leave to react for a few seconds, and then wipe the dirt off with a clean damp cloth which should be frequently rinse in clean water. When dry, surfaces may be polished with a dry cloth.', 0, '', '', '', 12.84, 'https://drive.google.com/file/d/1KJs0EGRrVFhhTY2LeJGTs8Ee6K8YPA1e/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 4, 6, 'Greyland Lemon Cleanser 5L', '', 'An easy to use hard surface cleaner imparting a zesty lemon fragrance. Ideal for cleaning floors, walls, kitchen equipment etc.\n\nFor heavy impacted oil and grease: dilute 1 part with 10 parts of cold water (500ml to 5 litres). For all stone floors: dilute 1 part with 20 parts of water (250ml to 5 litres). For general cleaning of floors, walls, equipment etc: dilute 1 part with 50 parts of water (100ml to 5 litres). Apply to the surface with spray, mop or cloth, leave to react for a few seconds and then wipe off the dirt with the mop/cloth, rubbing stubborn marks.  Rinse the mop/cloth frequently in clean water.', 0, '', '', '', 10.27, 'https://drive.google.com/file/d/1-TaBQTXn2YWs_Sah_hnSbMyi5W2_Y5cU/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 4, 6, 'Greyland Hard Surface Perfumed Sanitiser 5L', '', 'A pleasantly perfumed concentrated cleaner suitable for use on many surfaces, effective on most commonly found bacteria.\n\nDilute 1 part with 30 parts of water. Apply to surface with mop, leave to react for a few minutes then remove the excess and allow to air dry. Perfumed Sanitiser may also be applied by cloth or spray.', 0, '', '', '', 11.62, '\nhttps://drive.google.com/file/d/1TYJpyHRAT9V1ux0gUnP4IJH68Gu_Zoa8/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 4, 7, 'Greyland Floor Maintainer 5L', '', 'A perfumed neutral product to clean and protect emulsion polished floors, including sealed wood and cork. Also for use as a maintenance product for floors previously\ncoated with a metallised floor polish.\n\nFor damp mopping dilute 1:20 with water. Mop floor with this solution, rinse the dirt into a bucket of clean water and allow to dry. Then machine buff to restore the shine. For spray buffing dilute 1:8 with water. Spray a small amount onto the floor and pass the machine over this area, three or four passes should clean, dry and shine the floor. Do not over apply and do not attempt to spray buff very dirty floors, these should be mopped or scrubbed with a mild solvent-based detergent prior to application of floor maintainer.', 0, '', '', '', 12.35, 'https://drive.google.com/file/d/1ayqHiE-fARSm6kPx2pozzcyceT_iMnqr/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 4, 7, 'Greyland Floor Stripper 5L', '', 'Effectively strips emulsion polishes from most floor surfaces, including sealed wood or cork.\n\nDilute approximately 1 to 10 with water to achieve effective results. It may be spread with a mop or machine equipped with a tank. Leave in contact with the polish for between 5 – 15 minutes before machine scrubbing with a black stripping pad, never allow the stripper to dry as this will make polish harder to remove, divide the floor into areas where the whole process may be completed before the solution dries. Always rinse well and allow the floor to dry thoroughly before re-applying polish. A small amount of a mild acid such as vinegar may be added to the final rinse to neutralise the floor.', 0, '', '', '', 16.07, 'https://drive.google.com/file/d/1DSI4dtCbwFuAQbBFJ-bsBhnR_y6tfyIm/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 4, 7, 'Greyland High Solid Floor Polish 5L', '', 'A high 20% solids, dry-bright metallised emulsion polish for use in medium to high wear conditions, good resistance to scuffing and black heel marking makes it an all round performer which allies durability with economy. High gloss and good detergent resistance gives long life with easy maintenance.\n\nEnsure floor has been properly swept and cleaned before application, making sure that any oil, grease and old polish has been removed. Rinse well with water and allow to dry thoroughly. Mop or apply a thin film of product onto floor. Allow 30 minutes to dry. Apply a second thin coat and allow to dry.', 0, '', '', '', 21.17, 'https://drive.google.com/file/d/17RCWYkxavxugyZ74lCGWVJIbHczVNLhU/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 4, 7, 'Greyland Extra Solid Floor Poilsh', '', 'An extra high 24% solids, dry-bright metallised emulsion polish that is particularly suitable for use on high wear areas where it will produce a long lasting durable shine with an excellent response to spray buffing. At this solids level all the properties of the polymer will be obtained in the least number of coats and its prolonged life will extend the period between expensive stripping and re-polishing operations.\n\nEnsure floor has been properly swept and cleaned before application, making sure that any oil, grease and old polish has been removed. Rinse well with water and allow to dry thoroughly. Mop or apply a thin film of product onto floor. Allow 30 minutes to dry. Apply a second thin coat and allow to dry.', 0, '', '', '', 23.12, 'https://drive.google.com/file/d/1QSuLJPjkjXwEQMnPHXmV1UT484HPeudr/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 4, 7, 'Greyland Pine Floor Gel 5L', '', 'Designed for use on all types of floors particularly wood and linoleum where the naturals oils help feed the floor and give the product a degree of buffability, this can be built up over a period of time to a natural slip resistant shine. The natural pine oils in Pine Floor Gel impart a fresh, pine fragrance.\n\nDilute 1:80 with water for floor mopping, Once dry, the floor should be machine buffed. Dilute 1:20 for spray buffing. Pine Gel can also be used on most hard surfaces i.e. walls, ceilings, toilets and other clean areas. Dilute 1:50 with water for general cleaning.', 0, '', '', '', 10.57, 'https://drive.google.com/file/d/1_a7e-mP09EXH1UEn17EB4oHugxT2JFlb/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 4, 7, 'Greyland Rinse Free Stripper 5L', '', 'Strips emulsion floor polishes without the aid of a scrubbing machine, and can be used in areas where machines are not accessible such as stairs.\n\nDilute 1:10 with water, spread onto the floor with a mop and leave for up to twenty minutes, again keep damp do not allow to dry out. The resultant slurry can be picked up with a mop, and then the floor should be thoroughly rinsed and allowed to dry.', 0, '', '', '', 9.28, 'https://drive.google.com/file/d/1ksH0NMv0keLfoBJQXOdDyBziuEIqHzsc/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 4, 7, 'Greyland Extraction Carpet Cleaner 5L', '', 'An effective cleaner of carpets and upholstery, this low foaming product is suitable for use with either hot or cold water machines.\n\nTest a small area for colour fastness prior to use. Vacuum carpet or fabric before commencing cleaning operation. Dilute approximately 1 to 50 with water and add to carpet cleaning machine. Clean carpet or fabric as per machine manufacturer’s guidelines. Brush carpet or fabric when finished and leave to dry for at least six or seven hours. Vacuum carpet or fabric again when dry.', 0, '', '', '', 11.17, '\nhttps://drive.google.com/file/d/1JsfZr_kbBCsVIP9yXtkP4s7S7wCbZrz2/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 4, 7, 'Greyland Wet Look Floor Polish 5L', '', 'A high solids, dry-bright metallised emulsion polish designed to provide a high gloss, durable finish to most hard floor surfaces, including sealed cork and sealed wooden floors. Made for use with ultra high speed buffing machines.\n\nEnsure floor has been properly swept and cleaned before application, making sure that any oil, grease and old polish has been removed. Rinse well with water and allow to dry thoroughly. Mop or apply a thin film of product onto floor. Allow 30 minutes to dry. Apply a second thin coat and allow to dry.', 0, '', '', '', 12.82, 'https://drive.google.com/file/d/1rZuSx0HvWmKjmLnTQS2mwGVc63kJnyij/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 4, 7, 'Greyland Carpet Pre- Spotter 750ml', '', 'A pleasantly fragranced ready to use carpet and upholstery spot cleaner. May be used as a stain remover or as a pre-spotter in conjunction with Greyland Dry Foam Carpet Shampoo or Extraction Carpet Cleaner. This is a ready to use product, no dilution is required.\n\nTest a small area for colour fastness prior to use. Spray onto stain and leave for a few minutes to react then gently rub with a soft cloth or brush, work towards the centre of the stain, finally rub with a damp cloth to pick up residue and allow it to dry thoroughly. Vacuum to complete the process.', 0, '', '', '', 19.37, 'Greyland Carpet & upholstery Pre- Spotter 750ml ', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 4, 8, 'Greyland Telephone Sanitizer RTU 750ml', '', 'A hard surface cleaner designed for the cleaning and disinfection of telephone handsets.\n\nTo ensure a clean, fresh hygienic result, spray onto a lint free cloth, wipe the telephone surface clean and allow to dry. Do not rinse. This method may be used to sanitise other hard surfaces.', 0, '', '', '', 2.73, 'https://drive.google.com/file/d/1jgMWg4I_NnPQA6_3KuGxsXKnKf2k5OzD/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 4, 8, 'Greyland Odour Neutraliser RTU 750ml', '', 'A ready to use, fast acting neutraliser with a zesty lemon fragrance. Suitable for use against urine, tobacco smoke, food smells, pet odours and vomit.\n\nCan be used on most surfaces and is suitable for use against urine, tobacco smoke, food smells, pet odours, vomit etc. Kills most common forms of bacteria. Remove gross contamination before treatment, thoroughly wet the area with product and allow to dry onto fabric, wiping other surfaces  dry. Blot fresh urine spills with paper or towel, thoroughly wet the area with product, remove excess liquid and allow to dry. Treat old spills first with hot water extraction machine, then wet the area with neutraliser, allow a short period to react and  extract the residue. Always test a small area first to ensure no damage may occur.', 0, '', '', '', 4.2, 'https://drive.google.com/file/d/1ynTnSoLHdB2Mwjkb7T9zL6eV8UCP5w6H/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 4, 8, 'Greyland Glass Cleaner 750ml', '', 'Effectively cleans and shines glass surfaces such as windows, mirrors, stainless steel etc.\n\nSpray onto a clean soft cloth, glass wipers or polishing paper and wipe onto the surface. Do not apply to hot surfaces. Also suitable for plastics, chrome, ceramics, laminates and stainless steel where a streak free finish is required.', 0, '', '', '', 2.82, 'https://drive.google.com/file/d/1PB0QPTC8A6TQZ0hAqTVBz7sVmuDvfjQR/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 4, 8, 'Greyland Cream Cleaner', '', 'A non-scratch mild cream, safe to use on any hard washable surface.', 0, '', '', '', 2.08, 'https://drive.google.com/file/d/1M4Xhz4r88m-OPCGfZv0m4TBaVKlPdDXG/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 4, 9, 'Greyland Auto Rinse Aid', '', 'An effective additive to assist the final drying process in cabinet dishwashing and glasswashing to prevent spots and hazing. Will produce a sparkling finish.\n\nDispense via the machine’s automatic dosing system, then adjust the concentration until effective results and being achieved with the minimum amount of product. Auto Rinse Aid will ensure a perfect finish on crockery, cutlery, utensils and glassware. A temperature of at least 60ºC should be achieved for the rinse aid to work effectively.\n\nAuto Rinse Aid is the perfect product to combine with Machine Dishwash or Machine Glasswash.', 0, '', '', '', 11.17, 'https://drive.google.com/file/d/1jNMvrncSHRnfKKYNk4pK4mkEbdFXngZq/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 4, 9, 'Greyland Oven Cleaner RTU 750ml', '', 'A ready to use spray that effectively cleans grease and charred food from ovens and grills.\n\nEnsure that the oven is switched off. Apply neat product onto all surfaces of a warm oven. Scrub heavy, burnt on deposits with a brush/scouring pad if required. Leave product on to react for 15 minutes, scrub, then rinse off thoroughly.', 0, '', '', '', 2.65, 'https://drive.google.com/file/d/1zrZBk6hLoDRtFZl7ewrLt9yQU2_PQqEt/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 4, 9, 'Greyland Machine Dishwash Detergent', '', 'Machine Dishwash is an effective detergent for use in cabinet dishwashing machines. Easily removes stubborn dirt and soling in both hard and soft water areas.\n\nDispense via the machine’s automatic dosing system then adjust the concentration until effective results are being achieved, using the minimum amount of product. Suitable for washing crockery, cutlery and stainless steel utensils and may be used to good effect in tray washing machines.', 0, '', '', '', 11.18, 'https://drive.google.com/file/d/1sciwxgV5ee9ezFtu_gCo38SyGGszGU8Z/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 4, 9, 'Greyland Machine Glasswash 5L', '', 'Concentrated Machine Glasswash is a powerful detergent for use in cabinet glasswashing machines to remove the most stubborn stains and soil.\n\nDispense the product via the machine’s automatic dosing system then adjust the concentration until effective results are being achieved with the minimum amount of product.\n\nBest result will be achieved when used in conjunction with Greyland Rinse Aid or Auto Rinse Aid. Concentrated Machine Glasswash will ensure a perfect finish on glasses, tumblers and glassware in both hard and soft water area.', 0, '', '', '', 10.56, 'https://drive.google.com/file/d/14mRffYQmEvYHYLMQrRA-MMm3k1XejNDu/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 4, 9, 'Greyland Descaling Liquid 5L', '', 'A powerful, acid based detergent designed to remove limescale and water staining from automatic catering equipment, such as maching dish and glasswashers.\n\nFor use against heavy scale: dilute 1 part product with up to 5 parts water, soak or brush machine parts to be descaled with solution. Agitate if necessary and thoroughly rinse 2 or 3 times with clean water. Depending on the level of scale, dilute up to 1 part product to 20 parts water. Use a dilution rate of up to 1 part product to 80 parts water to remove water staining. Always test the solution on a small are to check compatibility.', 0, '', '', '', 12.66, 'https://drive.google.com/file/d/1IYlNp_KltpQu09WWs4aCNjGnI-cq4X1W/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 4, 9, 'Greyland Kitchen Degreaser RTU 750mls', '', 'A powerful multi-purpose RTU cleaner degreaser. This food safe, odourless degreaser can be used on all hard surfaces especially in kitchens and food preparation areas.\n\nSpray neat product onto the surface, leave to react for a few seconds then wipe off the dirt with a clean, damp cloth, rinse the cloth frequently in clean water.', 0, '', '', '', 2.99, 'https://drive.google.com/file/d/17lbZOmc3Ql8gB8gVXwXbpQDqoXyVXwuF/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 4, 9, 'Greyland Spray & Wipe Sanitizer 750ml', '', 'A foaming ready to use cleaner suitable for use on most surfaces. It will kill most commonly found bacteria including MRSA and is ideal for use in kitchens, food preparation areas and hospitals. Complies with BSEN1276.\n\nSpray neat product onto the surface, leave in contact for up to 30 seconds, then wipe with a clean, damp cloth. Rinse the cloth frequently in clean water.', 0, '', '', '', 2.94, 'https://drive.google.com/file/d/15iUdkjhTWYiONDv6xkl-7Qi4a9kEg4Bf/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 4, 9, 'Greyland concentrated Neutral Detergeant 5L', '', 'An odourless concentrated neutral detergent, ideal for the economic cleaning of dishes and most hard surfaces.\n\nFor dishwashing: dilute in a bowl 1 part with upto 1000 parts of warm water depending on the amount of grease and soil to be removed. Place items in the bowl, allow to soak, then wipe with a cloth, sponge or brush. Drip dry and polish with a soft cloth.', 0, '', '', '', 8.22, 'https://drive.google.com/file/d/1d7HW8nb1Df4rpvvTh6XSW0Cv7UJ9iF8Q/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 4, 9, 'Greyland SteriTann 5L', '', 'A chlorinated sanitiser & tannin remover with a gentle action, removes stubborn stains effectively and economically. Safe to use on all crockery.\n\nFor use as a steriliser, dilute 1 part product with 50 parts water to sanitise hard surfaces in the kitchen/bathroom etc. Allow a contact time of 15 minutes, rinsing is not necessary. For use as a tannin remover, dilute 1 part product with up to 10 parts water to remove tannin stains. Soak items in solution for up to 30 minutes and rinse thoroughly with clean water.', 0, '', '', '', 12.61, 'https://drive.google.com/file/d/1kTolUYVA2WjnOySOC2YlvZwL2EFSQMf_/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 4, 9, 'Greyland Foodsafe Bacterial Cleaner 5L', '', 'An odourless food safe cleaner that removes build-ups of grease and grime from hard surfaces. It contains a bactericide and is effective against most common forms of bacteria, making it ideal for use in kitchens and food preparation areas.\n\nFor heavy duty cleaning: dilute 1 part product with approximately 10 parts of water and apply by trigger spray, cloth or mop. Allow five minutes contact time and rinse away with a damp cloth. For general purpose cleaning: dilute 1 part product with up to 50 parts of water. Spray or wipe solution onto the surface, allow few seconds to react and wipe clean with a damp cloth. Food Safe Bactericidal Cleaner may be used to clean a variety of kitchen surfaces including worktops, cupboard fronts, external equipment surfaces and floors.', 0, '', '', '', 13.01, 'https://drive.google.com/file/d/1lMJ8hmkiH5b9pPwTnleRuYLT3ONyBOOa/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 4, 9, 'Greyland Neutral Detergent 5L (Wash Up)', '', 'An odourless neutral detergent, ideal for the economic cleaning of dishes and most hard surfaces.\n\nFor dishwashing: dilute in a bowl 1 part product with up to 500 parts warm water, depending on the amount of grease and soil to be removed. Place items in the bowl, allow to soak, then wipe with a cloth, sponge or brush. Drip dry and polish with a soft cloth or tea towel. For cleaning hard surfaces: dilute 1 part product with up to 150 parts of warm water, wipe surface clean with a cloth and allow to air dry.', 0, '', '', '', 4.32, 'https://drive.google.com/file/d/1Tb8y5emxkww4v_PUdauggvn6imYptsTh/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 4, 9, 'Greyland Foodsafe Sanitizer 5L', '', 'An odourless food safe cleaner suitable for use on most hard surfaces. It is effective against most common forms of bacteria including MRSA, making it ideal for use in kitchens, food preparation areas, hospitals and nursing homes. Complies with BSEN1276.\n\nFor general purpose cleaning, dilute 1 part product with 30 parts of water. Spray or wipe solution onto the surface, allow few seconds to react and wipe clean with a damp cloth, no need to rinse. Food Safe Sanitiser may be used to clean and disinfect a variety of hard surfaces including tables, worktops, sinks, draining boards, cupboard fronts, external equipment surfaces, walls and floors. Always clean vertical surfaces from the bottom up to avoid unsightly streaking.', 0, '', '', '', 15.34, 'https://drive.google.com/file/d/1OOSBjoxM2iVBm_qsMaEnVcQmSB98MAx7/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 4, 10, 'Greyland Pink Soap', '', 'An economical pearlised hand soap suitable for all environments. Ideal for use in most bulk fill dispensers.\n\nFirstly wet hands, then apply soap directly to skin and work into a rich lather. Wash for at least 20 seconds, use a clean nailbrush to clean under fingernails if necessary, rinse and dry thoroughly.', 0, '', '', '', 8.64, 'https://drive.google.com/file/d/1fHu5PeK3zSXEqtiE3j15fKULF9v346XJ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 4, 10, 'Greyland Luxury Foaming Soap 5L', '', 'A luxury instant foaming soap. Only a small amount is required to provide effective skin cleansing. No water required to create a lather. Highly economical.\n\nApply small amount of soap direct to hands, rub into a lather no water required. Then rinse in water and dry.', 0, '', '', '', 9.41, 'https://drive.google.com/file/d/1VOIX14aJjXcytKKXYlLIBivc1-UiaZ80/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 4, 11, 'Greyland Deodourising Fluid 5L', '', 'Will neutralise unpleasant odours and is ideal for use in areas such as rubbish bins, waste disposal chutes, waste tips and sewage farms.\n\nDilute approximately 1 part in 40 parts of water and disperse by low pressure spray or watering can onto relevant area to neutralise foul odours.', 0, '', '', '', 20.88, 'https://drive.google.com/file/d/1ShEQNUHXqBU8FMozbFFk3fyfnr-sv_Qy/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 4, 11, 'Greyland DELTA DP200 1L (Chewing Gum Remover)', '', 'A natural based cleaner for safely and easily removing chewing gum and sticky labels. Safe to use on fabrics, carpets, painted surfaces, wood and plastic laminates, inside or outside.\n\nDo not dilute. Apply by spray to affected areas. On carpets, apply sparingly and agitate gum using a plastic scraper or nylon scouring pad. On fabric seating, spray and agitate with a nylon scouring pad until all traces of gum are removed. On general flooring surfaces; spray gum, remove bulk with a sharp scraper, spray any remaining residues and agitate with a nylon scouring pad. Wash floors down after cleaning with a detergent solution. To remove sticky labels; spray product and agitate with a nylon scouring pad, wipe clean using a cloth moistened with product.', 0, '', '', '', 12.41, 'https://drive.google.com/file/d/1T6iXn1s6sLYmfsq_2ZRLfVo2_BUgG6Eo/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 4, 11, 'Greyland Delta Activator 1L Graffitti Remover', '', 'A multi-purpose graffiti remover that is suitable for removing graffiti from non-porous, decorative, laminated plastic or painted surfaces without damaging the underlying finish.\n\nWipe or spray product onto the graffiti and allow to act. Depending on surface, scrub area with a dry cloth, natural bristle scrubbing brush or nylon pad and rinse with water or wipe down with a damp cloth. Repeat if necessary.', 0, '', '', '', 12.41, 'https://drive.google.com/file/d/18GBb9gE0EH8raHGTr9BZHPZVS9s1UMqb/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 4, 11, 'Greyland Stainless Steel', '', 'A low odour cleaner polish designed for use on stainless steel and bright metals. Low odour and non-tainting cleaner that creates a high gloss finish.\n\nRemove gross contamination if necessary. Spray lightly onto lint free cloth then wipe immediately.', 0, '', '', '', 8.64, 'https://drive.google.com/file/d/1lxtPKTTJpdhpSCNo3pAcEHTiZ1MIRbHs/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 4, 11, 'Greyland Concrete & Masonary 5L', '', 'An effective acidic cleaner of concrete, brick and masonry surfaces.\n\nWear acid resistant gloves, goggles and suitable face and skin protection. Before use, always test an inconspicuous area for suitability. Do not use on acid sensitive surfaces.  Dilute 1 part with 4 parts water and brush this solution onto the surface, leave in contact for at least 5 minutes, do not allow to dry out. Agitate surface to remove stubborn marks, rinse thoroughly by spraying with clean water and give a final rinse with a mild alkaline solution. Rinse applicators in water and dispose of after use. Not to be used on stainless steel or vitreous enamel.', 0, '', '', '', 15.89, 'https://drive.google.com/file/d/1xBZ4GAp0tYdWKiKyWFxgusx3NuEC-9oA/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 4, 11, 'Greyland Graffiti Remover 750ml', '', 'A blend of low toxic solvents that will remove a wide range of paints, crayons, pencil and inks from felt tip and ball point pens. Suitable for use on all solvent resistant surfaces.\n\nWear protective clothing, goggles and gloves. Test a small unobtrusive area by rubbing with a white cloth dampened with product as any damage will be irreversible. Use neat and spray or wipe directly onto surface to be treated and leave for a few minutes to penetrate, agitate with a cloth or, for persistent marks, an abrasive hand pad. Porous surfaces are best treated with a brush to penetrate pores. Do not use in enclosed or confined spaces.', 0, '', '', '', 8.76, 'https://drive.google.com/file/d/1xHFItynsq8dmK0LUjEpsTx4c-IImBEmM/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 4, 12, 'Lemon- Maximum Citrus Floor Gel', '', 'Lemon- Maximum Citrus Floor Gel', 0, '', '', '', 9.24, 'https://drive.google.com/file/d/1e6d-tEn6VZjGJ50YOzsW0_aHHpM6k6qt/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 7, 13, 'Taski Aero 15', '', 'The “All-in-One” feature combination with highest efficiency and ultra-low noise\n\nThe TASKI AERO high-efficiency vacuum cleaner uses state-of-the-art technology and has a super-efficient motor. And, with the patented whisper technology, the vacuum cleaner works ultra-silently. The new range consists of four streamlined and agile models which satisfy the rigorous requirements of frequent professional cleaning at any time, and in any environment.', 0, '', '', '', 185.6, 'https://drive.google.com/file/d/1tqozDaj7amcTGbTUXL_CScDD4YpWP4Vy/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 7, 13, 'Taski Aero 8', '', 'The TASKI AERO 8 high-efficiency vacuum cleaner uses state-of-the art technology and has a super-efficient motor. With the patented TASKI whisper technology, the vacuum cleaner works ultra-silently. \nCompact and robust TASKI design. Sustainable high-efficiency concept. Ultra-silent TASKI whisper technology.\nDesigned and tested according to operational best practice.', 0, '', '', '', 165.22, 'https://drive.google.com/file/d/1TyssbxsMHsmVH4lZKczR9c8M57PC76MZ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 7, 15, 'TASKI swingo 455E', '', 'Small electric 17\" (430mm) scrubber drier\n\nTruly versatile for use in all types of small or congested hard floor areas such as retail stores, kitchens, schools, and hospitals\nIntuitive controls and yellow maintenance points, operator training and maintenance time is reduced to a minimum\nVery robust and durable and engineered to withstand the toughest cleaning tasks\nGreat working width and increased tank volume\nThe use of high-tech material and long life components, enhance the machine’s uptime, while reducing service and repair costs to a minimum', 0, '', '', '', 3, 'https://drive.google.com/file/d/1mXvTEapAcNhz2eWBv1vMuWoHxn8J42ac/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 8, 16, 'Vileda Multi-Purpose Gloves', '', 'Vileda Multi-Purpose Gloves', 0, '', '', '', 1.02, 'https://drive.google.com/file/d/1Azz8_ubhUGvPrnwB5w8S4R-0Qn_rK76V/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 9, 17, 'Z FOLDED HAND TOWELS', '', 'Designation	Colour 	No of Ply	No of Sheets\nZ Folded Hand Towels 	White	2	150', 0, '', '', '', 21.61, 'https://drive.google.com/file/d/1XITlu0lKoDof8bhhPp3oJwGYg1bkJ9am/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 9, 17, 'Mini Jumbo Toilet Paper', '', 'Designation 	Colour	No of Ply	Rolls per case\nMini Jumbo Toilet Paper 	White	2	12', 0, '', '', '', 11.17, 'https://drive.google.com/file/d/10eVhDosRR9g9hKTBYTORDW7kjB5u2RXN/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 9, 17, 'Coreless compact toilet paper roll', '', 'Designation	Colour	No of Ply	No of Sheets	Rolls per Case\nCoreless compact toilet paper roll	White	2	800	24', 0, '', '', '', 31.18, 'https://drive.google.com/file/d/1GDt6EoNlvjoE-1yd8Dsr6cLrkKaOKBIN/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 9, 17, 'Standard Toilet Paper', '', 'Designation	Colour	No of Ply	No of Sheets	Rolls per case \nStandard Toilet Paper 	White	2	150	4*10', 0, '', '', '', 13.55, 'https://drive.google.com/file/d/10qjKm8PFSuvm7U95pVVzBi_vase44EoK/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 9, 18, 'Santizer Hydralcoholic Gel', '', 'Product Code	Pack	Packing\nMPH22	Jerrycan	4 x 5L', 0, '', '', '', 35.29, 'https://drive.google.com/file/d/1xBJ5lz9K2Y1RlAXviVWdMHlPIgph3J0w/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 9, 18, 'Sanitizer- Hydroalacoholic Gel 100ml', '', 'Product Code\n\nPack	Packing\nMPH21	Clapper Bottle	100 mL', 0, '', '', '', 3.18, 'https://drive.google.com/file/d/1e5Py5TgZUDaTbEzDQgajXgPOp1TIuc1I/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 9, 18, 'Sanitizer - Hydroalcoholic Gel', '', 'Product Code	Pack	Packing\nMPH20	Cap Bottle + Pumps	6 x 500mL', 0, '', '', '', 48.14, 'https://drive.google.com/file/d/1iMH8uvU7AiqsRBDQFbg3EZBIReNlJFrb/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 9, 18, 'Disinfection Wipes', '', 'Product Code	Pack	Packing\nMPH14	Tifon Antiseptic and Disinfectant Wipes x 100	1', 0, '', '', '', 6.21, 'https://drive.google.com/file/d/1w68oJf99PUk1Cy8iKAAe_JCf11otqfLA/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 9, 19, 'Evadis Coreless Compact Horizontal Twin Roll Dispenser White', '', 'Product Code	Type	System	Colour	Stub Roll\nMPHD02	Double	Manual	White	No', 0, '', '', '', 17.86, 'https://drive.google.com/file/d/17DuAuiNLrB0vmlya43rp03g1aTal-GUB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 9, 19, 'Evadis Auto Cut Hand Towel Roll Dispenser White (Manual/Sensored)', '', 'Product Code	Type	System	Colour\nMPHD03	Midi	Manual	White\nMPHD03(Sensor)	Midi	Sensor	White', 0, '', '', '', 53.03, 'https://drive.google.com/file/d/1YjKR_kbnq3k1-RW2L_oTzxBL8A4YmRhN/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 9, 19, 'Folded Hand Towel Dispenser White', '', 'Product Code	Type	System	Colour\nMPHD08	Midi	Manual	White', 0, '', '', '', 18.23, 'https://drive.google.com/file/d/1z9zaEPZO3RnlB04eEByNl-yVTSe8D_dm/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 9, 19, 'Evadis Easy Cut Centre Pull Toilet Tissue Dispenser White', '', 'Product Code	Type	System	Colour	Stub Roll\nMPHD01	Mini	Manual	White	No', 0, '', '', '', 12.23, 'https://drive.google.com/file/d/1t92dkT0wy2FlPQh7rh9Apbf8Nef8uS0-/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 9, 19, 'Tifon Manual (LIQUID) 900mL Soap Dispenser White', '', 'Product Code	System	Colour	Capacity\nMPHD04	Manual	White	1L', 0, '', '', '', 17.06, 'https://drive.google.com/file/d/1gaRYVn3K_a84fezpo2OpIDt7uMwMMeOu/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 9, 19, 'Tifon Foam Soap 1L Dispenser White', '', 'Product Code	System	Colour	Capacity\nMPHD05	Manual	White	1L', 0, '', '', '', 22.02, 'https://drive.google.com/file/d/1mOuQMQNCqw54GWq945rf99pFIn-9DZBj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 9, 19, 'Nini Jumbo Dispenser Single', '', 'Product Code	Type	System	Colour	Stub Roll\nMPHD06	Mini	Manual	White	No', 0, '', '', '', 15.29, 'https://drive.google.com/file/d/1Qt5GpFEfCRkj7JHOYKMZSJV9fFOpzrsZ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 9, 19, 'White Refillable Liquid Soap Dispenser', '', 'White Refillable Liquid Soap Dispenser', 0, '', '', '', 27.53, 'https://drive.google.com/file/d/1Z57uSjBpjTKsD8iFHI-oA_LHIvDkEcMa/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 9, 19, 'Centre Pull Dispenser', '', 'Product Code	Type	System	Colour\nMPHD11	Midi	Manual	White', 0, '', '', '', 18.35, 'https://drive.google.com/file/d/10TAXXU25NBkc4d_zVp6zSt3MWswf_U-b/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 9, 20, 'Tifon Foam Anti Bac Soap', '', 'Product Code 	Pack	Packing\nMPH05	Cartridge	6 x 1L', 0, '', '', '', 48.33, 'https://drive.google.com/file/d/13nnMSbgICoJ-y573eFAqD4y5SXexToHg/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 9, 20, 'Tifon Liquid Anti Bac Soap', '', 'Product Code	Pack	Packing\nMPH11	Cartridge	6X 900 mL', 0, '', '', '', 49.82, 'https://drive.google.com/file/d/1BPDaBObBMkXWssolwjQzffCpN8aOxPQ-/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 9, 20, 'Tifon Foam Soap Pink', '', 'Product Code 	Colour	Fragrance	Pack	Packing\nMPH12	Pink	Cranberry, Pomegranate	Cartridge	6x 1L', 0, '', '', '', 52, 'https://drive.google.com/file/d/14HwSt0jDsE3GXLrCO3_qzvfuBA19jtS6/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 9, 20, 'Tifon Liquid Hand Sanitizer', '', 'Product Code	Pack	Packing\nMPH13	Tifon Liquid Hand Sanitzer	6 x 800mL', 0, '', '', '', 45.88, 'https://drive.google.com/file/d/1ZGnQfJnZFfHSFVJnk0esT_UAT4B90WZz/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 10, 21, 'Suma Star (Plus) D1', '', 'Concentrated manual dishwashing liquid\n\nConcentrated formulation gives excellent economy is use\nCuts through grease and dried-on food without drying skin\nStreak-free, easy rinsing for a superior finish\nStable lather means long-lasting efficiency of cleaning solution\n\n2 x 5L', 0, '', '', '', 25.29, 'https://drive.google.com/file/d/1S4njsVmvF8WIervqGCW0UjBbGMwOl8wh/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 10, 21, 'Suma Star (Plus) D1 concentrated', '', 'Concentrated manual dishwashing liquid\n\nConcentrated formulation gives excellent economy is use\nCuts through grease and dried-on food without drying skin\nStreak-free, easy rinsing for a superior finish\nStable lather means long-lasting efficiency of cleaning solution\n\n4 x 1.5L\n', 0, '', '', '', 79.19, 'https://drive.google.com/file/d/1d7J9d6JSL1QCPKzADgdxMvFZJYeDh7tR/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 10, 21, 'Suma Multi D2 Bottle Kit', '', 'Concentrated all purpose detergent for cleaning hard surfaces, including floors, walls, doors, ceilings and general equipment.\n\nModerately alkaline, non-solvent multi-purpose cleaner.', 0, '', '', '', 25.69, 'https://drive.google.com/file/d/1U2ZbcEGTmije7Cej9Rl0_i03pzA-yhMg/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 10, 21, 'Suma Multipurpose D2.3 SmartDose', '', 'Super concentrated kitchen detergent for cleaning all washable surfaces, part of the SmartDose System\n\nSimple offering for small kitchens\nNo need for equipment installation\nFour products in one; Floor cleaner, glass cleaner, general purpose cleaner and hand dishwashing', 0, '', '', '', 27.01, 'https://drive.google.com/file/d/1krFXtK6Lk5no-1SdqI1ug7LRYLXbnst5/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 10, 21, 'Suma Sol D4.8 10kg', '', 'Powder detergent disinfectant for use on all hard surfaces\n\nSuma Sol D4.8 is a powder suitable for use on all hard surfaces, equipment and utensils requiring disinfection.  Suma Sol D4.8 contains Chlorine which has a broad spectrum of activity against micro-organisms. \n\nSuma Sol D4.8 also contains a scale control agent, which makes it effective in all water conditions.  This disinfecting powder is effective against a wide spectrum of micro-organisms, helping to improve hygiene security. \n\nSuitable for disinfection of all kitchen equipment, Suma Sol is easily soluble in water and effective in all water conditions.', 0, '', '', '', 35.94, 'https://drive.google.com/file/d/18iHfTKPKkKKea6oWGW8Suj3OrGyKwSQa/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 10, 21, 'Suma Inox D7 S/S Cleaner 750 ml', '', 'Ready to use stainless steel polish\n\nAn oil-based, ready-to-use cleaner and polish for use on stainless steel non-food contact surfaces and other metal surfaces, such as brass, aluminum and copper. Ideal for use on refrigerator doors, handles, trolleys and dishwashing machines. Leaves the surface clean and shiny. Colorless with a hydrocarbon scent.\n\nHelps protect surfaces by forming a protective film\nKeeps surfaces looking good, with a smooth lustre\nResists finger marks and water spotting to maintain a polished appearance for longer', 0, '', '', '', 5.93, 'https://drive.google.com/file/d/10Fh6jBCfVKpv2xyUAGcwEM_Nq2EUR1HQ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 10, 21, 'Suma Inox D7.1 S/S Cleaner 750ml', '', 'Ready to use stainless steel polish.\n\nStainless steel is notoriously hard to keep free from finger marks, but the Suma Inox D7.1 Stainless Steel Polish 750ml is here to help! The specially designed formula brings a sparkling shine to any stainless steel surfaces, giving them a brand new shine free of any dullness or finger marks. The 750ml bottle features an easy-to-use trigger spray for easy application. Not safe for food preparation surfaces.\n\nProduct features\n\nCapacity 750ml\n\nMaterial Plastic\n\nFinish - external Transparent\n\nTransparent bottle clearly shows contents\n\nSuitable for use on furniture and appliances\n\nNo CFC\'s\n\n¿Colour coded alphanumeric label\n\nReady to use - no dilution needed\n\nBox Quantity: 1 x 750ml', 0, '', '', '', 5.93, 'https://drive.google.com/file/d/1vmePWuJmRyWXnaM345ZA95fuYwaBsgi1/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 10, 21, 'Suma Special L4 2x5L', '', 'Dishwashing detergent for medium water hardness conditions\n\nSuma Special L4 is a concentrated liquid mechanical ware washing detergent specially formulated to provide excellent soil removal in medium hard water conditions.', 0, '', '', '', 37.65, 'https://drive.google.com/file/d/1q7a7RutA9GTsPAGCz_R4RvyUjOubEyD9/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 10, 21, 'Suma Alu L10 2x5L', '', 'Dishwashing detergent, for use in medium and hard water conditions\n\nConcentrated liquid detergent specially formulated to provide excellent soil removal in medium to hard water conditions.\nFormulation makes it suitable for use on aluminium.', 0, '', '', '', 30.79, 'https://drive.google.com/file/d/15217VgERbzj-fWLq5XMz-9mWItZQ51yx/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 10, 21, 'Suma Nova L6 2x5L', '', 'Dishwashing detergent for all water types.\n\n \n\nSuma Bac D10 Conc\n• Concentrated liquid sanitiser which cleans and disinfects all food contact surfaces in one step\n• Economical cost in use by the controlled dosing dispenser. One 1.5L pouch doses 150 trigger spray bottles\n• Effective against a side spectrum of micro-organisms, helping improve hygiene security\n• Well known food industry product.', 0, '', '', '', 35.82, 'https://drive.google.com/file/d/1cdnDkIU2t1HAR3Pdm_EqJoK04D81r2a1/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `products` (`id`, `brand_id`, `category_id`, `title`, `title_slug`, `description`, `variants`, `sizes`, `colors`, `prices`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(187, 10, 21, 'Suma Revoflow Clean P5 3x4.5kg', '', 'Detergent suitable for use in medium to hard water conditions, part of the Revoflow system\n\nHighly alkaline, chlorinated powder detergent for use with the Suma Revoflow system \n\n- Highly chlorinated powder detergent for effective stain removal\n\n- Innovative cap prevents spillage or accidental mixing\n\n- Outstanding results every time', 0, '', '', '', 241.39, 'https://drive.google.com/file/d/1CGpnENMFsNMsqOhmV7ks2f1fbGBRmkc1/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 10, 21, 'Suma Revoflow Safe P9 3x4.5Kg', '', 'Aluminum safe, non-corrosive detergent for use in all water conditions, part of the Revoflow system\n\nAluminium safe powder detergent for use as part of the Suma Revoflow system \n\n- Chlorinated powder detergent\n\n- Safe for use on aluminium\n\n- Kind to delicate decorated crockery.', 0, '', '', '', 257.84, 'https://drive.google.com/file/d/1I5oJWfbmZVY56ZiXoRPfHiz6luJjvg34/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 10, 21, 'Suma Break Up D3.5 2x5L', '', 'Concentrated liquid degreaser\n\n \n\nThis fast acting heavy duty degreaser from Suma is designed to remove fat, oil and carbons from the inside of ovens, grills, and other metallic cooking equipment including aluminium. The industrial degreasing formula cutz through the heaviest grease and fatty deposits which can otherwise prove difficult to get rid of.\n\nThis ready to use solution is non-caustic, non-hazardous and is particularly effective for cleaning the inside of dishwashers and similar industrial kitchen equipment which can collect deposits of fat and grease in time.', 0, '', '', '', 28.06, 'https://drive.google.com/file/d/1XWBSF7ANByaBF1AzgZAlgNQ6iVHlA1Lf/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 10, 21, 'Suma Break Up D3.5 J-Flex', '', 'Concentrated liquid degreaser, part of the J-Flex System\n\nSuma D3.5 J-Flex is an alkaline liquid detergent suitable for manual cleaning of all heavily soiled surfaces in the kitchen, like floors, equipment, cooker hoods and cooker tops.\n\nIt is an optimal blend of non-ionic and anionic surfactants, for good wetting of surfaces, and alkali and sequestrant for effective removal of all kinds of grease and dried-on food.\n\nThe formulation is balanced in such a way that the product is safe for use on aluminium surfaces.', 0, '', '', '', 15.92, 'https://drive.google.com/file/d/1-67B3OlUvCg2afpHWg2irTbe2t1rC-n8/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 10, 21, 'Suma Bac D10', '', 'Concentrated liquid detergent sanitiser\n\nSuma Bac D10 is a highly concentrated detergent surface sanitizer for one-step cleaning and disinfection. Effective against a wide range of micro-organisms in all water conditions.', 0, '', '', '', 32.34, 'https://drive.google.com/file/d/1D6B52KQBK8k3hbklileMX8-Fscm5tJXD/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 10, 21, 'Suma Combi +LA6 5L', '', '2 in 1 detergent and rinse aid\n\nSuma Combi+ LA6 is a combined concentrated liquid mechanical ware washing detergent and rinse aid in one.', 0, '', '', '', 21.52, 'https://drive.google.com/file/d/16VXC4hzuPvkNy8IdseeT9m7cBScjYVtu/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 10, 21, 'Clax Revoflow PRO P1 3x4.5 Kg', '', 'High active soft water detergent, part of the Revoflow system.', 0, '', '', '', 111.15, 'https://drive.google.com/file/d/1Bnk2UN-Ez-I-AdLtmETtm6H74epROoqR/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 10, 21, 'Suma Revoflow Clear A11 3x4L', '', 'Acidic rinse aid, part of the Revoflow system\n\nEnsures quick drying\nGives streak and spot-free results\nBeing highly concentrated, gives excellent economy in use\nConvenient pack is easy to handle with less plastic waste\nNo contact with chemicals due to innovative packaging design\nCompatible with soft metals\nConcentrated low foam machine rinse additive with scale control properties', 0, '', '', '', 210.1, 'https://drive.google.com/file/d/1_RzuJHOJqua_G--ATc8BAi_-QuKQlrXs/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 10, 21, 'Suma Shine K2 10KG Tub Destainer', '', 'Powder destainer/pre-soaker.\n\nThe Suma Shine K2 Destainer is a presoak and destaining cleaning chemical for use on plastic which effectively removes stains when used before washing. Suma Shine will need to be diluted in water before use - one scoop into sink or reservoir of warm water. This effective and quality cleaner is ideal for use on crockery and cutlery.', 0, '', '', '', 63.28, 'https://drive.google.com/file/d/1GOqDxgYY_etWwz1cvebeWEbABXALbzfR/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 10, 21, 'Bryta 5 in 1 Dish Wash Tabs 120pc', '', 'Dishwasher tablets for all water conditions\n\nProfessional machine dishwasher tablets with rinse aid and salt, manual dose in dissolvable wrapping.', 0, '', '', '', 27.25, 'https://drive.google.com/file/d/1tEpHTLJd_RMia59ZxIuNeFglP-ryHKGg/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 10, 21, 'Suma Unison Maxi G3 3x4.5 kg', '', 'Suma Unison Maxi G3 is a high performance machine ware washing detergent specially formulated to provide excellent soil removal in medium hard to hard water conditions.\n\n A heavy duty, alkaline powder detergent which is suitable for use in all types of automatically dosed commercial ware washing machines.', 0, '', '', '', 136.95, 'https://drive.google.com/file/d/1sNiindaNbSyDmnTMa8U3H6ch-LRsTaTQ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 10, 21, 'Suma Star plus D1 4x1.5L', '', 'Highly concentrated manual dishwashing liquid.  For use with Divermite dispensing system.\n\nDivermite Suma Star Plus is a highly concentrated pouch of washing up liquid that cuts through grease and food particles with ease. A perfect solution for restaurants, cafeterias, commercial catering units, workplace canteens etc., Suma Star washing up liquid is design for dishwashing by hand. Compatible with a Divermite Plus Dispenser (33-055), the dosage is controlled to save on waste and optimise usage. A high performance hand dishwashing solution for busy kitchen and catering environments. ', 0, '', '', '', 79.19, 'https://drive.google.com/file/d/1e38Zg1eITLwLEYAooSffbt5k_9wg3vXE/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 10, 21, 'Suma Bac D10 2 x 1.4L Smart Dose', '', 'Concentrated liquid detergent sanitiser\n\nDiversey 1.4Lit Smartdose D10 Suma Bac Kitchen Sanitiser. SmartDose is a maintenance free, portable dosing system. Allows for 2 different shot sizes, making it suitable for bucket, machine and sink filling. General purpose, hand dish wash, floors, glass.\n\nSmartDose is an innovative dosing platform for super concentrate daily cleaners and disinfectants setting a new industry benchmark of accuracy, simplicity and safety for the users without the need for a connected water supply. \n\nThe Smart pump technology is very practical and uses icon based instructions. This makes it possible to vary shot sizes for any of the different cleaning methods including spray cleaning, bucket cleaning or scrubber driers, but requires minimal user training or measuring. And being a closed system, it provides the maximum level of safety and cost control.\n\nSmartDose also dramatically reduces the environmental footprint of all it\'s users. All daily formulations are EU-Flower certified and as platform for super concentrates, it by definition offers packaging, chemical, storage as well as transport benefits versus standard platforms.', 0, '', '', '', 17.81, 'https://drive.google.com/file/d/1gsXFLa2VUhfN7PT6EJoYMugr0tpmKDNn/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 10, 21, 'Endbac Sanitizing Tablets 6x230', '', 'Chlorine tablets for food surfaces and salad washing.\n\nChlorine based sanitising tablets for food contact surfaces and salad washing. Fast dissolving.', 0, '', '', '', 94.76, 'https://drive.google.com/file/d/1MhAnnlH7lEaz5bPH97zG4Tzh-Hmy22TP/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 10, 22, 'TASKI Sani 4 in 1 Conc', '', 'Concentrated  acidic washroom cleaner and disinfectant.\n\nConcentrated neutral pH daily washroom cleaner for all surfaces \n \n\nVersatile can be used for surfaces and floors, ideal in hard water areas to control limescale\nSafe to use on all surfaces including chrome and stainless steel.\nPleasant ONT fragrance', 0, '', '', '', 26.28, 'https://drive.google.com/file/d/1bkDlQ2vzTZdYLR8JAxRF9KDrnDFEb0fL/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 10, 22, 'TASKI Sani 4 in 1 QuattroSelect', '', 'Concentrated  acidic washroom cleaner and disinfectant\n\nTASKI Sani 4 in 1 is a concentrated cleaner, descaler, disinfectant and deodoriser for all acid resistant hard surfaces in washroom areas. Its special formulation combines excellent cleaning performance and lime scale removal, even in hard water conditions. TASKI Sani 4 in 1 is bactericidal and fungicidal to give a hygienic clean and reduce cross contamination.\n\nThis acidic based formulation cleans, descales, disinfects and deodorises in one step. It is effective against a wide spectrum of micro-organisms including E coli and Salmonella providing excellent hygiene and reducing the risk of cross contamination. The unique patented ONT air neutralising technology alters malodour molecules therefore enhances the image of your washroom. This excellent cleaner works in a large spectrum of water hardness and by combining so many features in a washroom cleaner it actually reduces the number of products required in the washroom area.\n\nPlease speak to us about the installing the Dilution Control Station for dispensing of QS chemicals.  A free site survey is available to assess requirements and deliver recommendations for the best cost in use solution.\n \n\nQuattro Select is a cabinet system from Diversey that allows up to four concentrated cleaning products to be prepared at different dilutions and speeds at the same time. The V-shaped profile of the Quattro Select cartridge ensures it is completely emptied. They also use just 50g of EU-approved mixed plastics, and they contain the equivalent to 250 standard trigger bottles. Concentrated products are more cost effective and environmentally friendly as less water in the product means less water content to transport from manufacturing site to the point of use. Diversey promotes the use of concentrates and has a number of dispensing platforms that allow you to use concentrates to mix your own dilutions on site.\n\nChoosing Quattro Select will improve efficiency with high-speed accurate filling of bottles, buckets and scrubber driers with it’s two flow rates. It provides excellent results in a simple and easy way with precise dilution. Each Quattro Select can deliver up to 2500 litres of ready-to-use product with just two pouches – saving on transport, storage and packaging waste, making it the environmentally friendly product of choice, while improving your operational costs.', 0, '', '', '', 88.78, 'https://drive.google.com/file/d/1vQPJCcC71eL-l680DLo6EyT8A7JjzCo6/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 10, 22, 'Taski Sani Mould Out 750ml', '', 'Bleach-based cleaner for removing stains inluding mould and mildew. Whitens and brightens discoloured grout.\n\nTaski Sani Mould Out is a powerful grout cleaner with a formulation that removes mould, mildew and fungus from ceramic and tiled areas in washrooms, bathrooms and leisure facilities. Mould Out has a highly alkaline formulation which also removes body fat and soap scum whilst helping to prevent bad odours.  Supplied in a handy ready to use 750ml trigger spray bottle, Sani Mould Out can be used for daily or periodic cleaning.  This mould cleaners high-foaming performance ensures it can be sprayed onto vertical ceramic and tiled surfaces to ensure adequate contact time. ', 0, '', '', '', 41.38, 'https://drive.google.com/file/d/1emxCDCCGW0JymQ1frtj7d1f7QnDWn2mL/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 10, 22, 'Taski Sprint 200 EXACT 1L', '', 'Multi-purpose hard surface cleaner - super concentrate.\n\nThe EXACT System offers a simple choice of just three products: choose one red, one blue, one green.  These three products will then deal quickly and efficiently with all daily cleaning tasks.  With its smart packaging, waste and storage is reduced.  Exact also ensures accurate dosing and the colour coding system makes this cleaning system easy to use.\n\nSprint 200 is an alcohol based daily hard surface cleaner super concentrate.  .\n\nThis product is part of the unique EXACT dosing and packaging concept for accurate dosage and cost control available from Diversey.  Please speak to us regarding dosing system installation or help and advice.\n', 0, '', '', '', 10.2, 'https://drive.google.com/file/d/1W1Ro2dDhL01Io3so5_WfZcPLIexWofnG/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 10, 22, 'TASKI Sprint 200 Pur-Eco SD 1.4L E1a', '', 'Multi-purpose hard surface cleaner - super concentrate.\n\nSprint 200 Pur-Eco is a multi-purpose cleaner, which is alcohol-based for daily cleaning of hard water resistant surfaces.  Part of the SmartDose system which is an innovative portable dosing platform.   Thanks to its smart packaging, the SmartDose concept allows to easily, safely and accurately dose concentrated cleaning products.  Sprint 200 Pur-Eco SD is formulated with surfactants derived from natural vegetable sources to minimise the impact on the environment and ensure a safer use.  Sprint 200 Pur-Eco SD ful_ ls the criteria of the EU “Flower” and Scandinavian “NordicSwan” eco-label schemes. \n\nPur-Eco is a solution of choice when combining performance, safety for the user and environmental responsibility.  All formulations are used at low dosages, limiting the use and disposal of chemicals into the environment and packed in recyclable material.  Diversey\'s expertise environmental commitment and certi­fication against ISO 9001, ISO 14001 and the AISE Charter of Sustainable Cleaning provide further guarantee of quality and efficacy.', 0, '', '', '', 26.25, 'https://drive.google.com/file/d/19p-ewtJdyAZyvrVMDARFcEGbFu5_aXCB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 10, 22, 'TASKI Sprint 200 Pur-Eco QuattroSelect', '', 'Multi-purpose hard surface cleaner - super concentrate.\n\nTaski Sprint is a highly concentrated alcohol-based daily cleaner for water resistant hard surfaces.  This surface cleaner is very economical thanks to excellent cleaning performance at low dosages.  Taski Sprint dries quickly without streaking and leaves a pleasant fresh fragrance. Suitable for use with single disc machines and wet mopping systems.  Sold in cases of 2x1.\n\nThis acidic based formulation cleans, descales, disinfects and deodorises in one step. It is effective against a wide spectrum of micro-organisms including E coli and Salmonella providing excellent hygiene and reducing the risk of cross contamination. The unique patented ONT air neutralising technology alters malodour molecules therefore enhances the image of your washroom. This excellent cleaner works in a large spectrum of water hardness and by combining so many features in a washroom cleaner it actually reduces the number of products required in the washroom area.\n\nPlease speak to us about the installing the Dilution Control Station for dispensing of QS chemicals. A free site survey is available to assess requirements and deliver recommendations for the best cost in use solution.', 0, '', '', '', 58.94, 'https://drive.google.com/file/d/19p-ewtJdyAZyvrVMDARFcEGbFu5_aXCB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 10, 22, 'Sprint Hard Surface Cleaner 5L', '', 'Multi-purpose hard surface cleaner.\n\nA fast and effective cleaner with a clean, fresh fragrance. This cleaner is suitable for all surfaces and leaves no residue which saves time and effort. Ideal for use on walls, paintwork, doors, ceramic tiles, laminates and other hard washable surfaces. ', 0, '', '', '', 10.58, 'https://drive.google.com/file/d/10GmZAlrVk-gyZtUDSC-1zPhxevtjIHUU/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 10, 22, 'Taski Sprint Glass J Flex 1.5L', '', 'Concentrated, non-streaking, quick-drying, non-ammoniated glass cleaner.\n\nSprint Glass J-Flex concentrated glass cleaner will leave surfaces such as glass, stainless steel and mirrors stain and streak free.', 0, '', '', '', 22.38, 'https://drive.google.com/file/d/1PATbAFf0AF8n6eb15AWaSNMI1EE0kY-w/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 10, 22, 'Taski Sprint Glass QS 2x2.5L', '', 'Concentrated, non-streaking, quick-drying, non-ammoniated glass cleaner.', 0, '', '', '', 77.81, 'https://drive.google.com/file/d/1kCvtt7gT1bAWynKaqEqYvKrLefWknoXG/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 10, 22, 'Taski Sprint Spitfire 750ml', '', 'Heavy-duty, spray-and-wipe power cleaner.\n\nTaski Spitfire Spray is a heavy duty alkaline cleaner for most water resistant hard surfaces.  Taski Spitfire has excellent emulsifying properties and contains alkaline and solvent ingredients.  Spitfire Spray, with its fresh fragrance, ready to use, no rinse and streak-free formular, is easy to apply and dries quickly without leaving any residue.  Diversey\'s Taski Spitfire is excellent at removing graffiti as well as other persistant stains.  Taski Spitfire is a great trouble shooter, but Taski Spitfire can also be used for periodic deep cleaning on most water resistant hard surfaces.   This Diversey graffitti and solvent cleaner, Taski Sprint Spitfire, is sold in 750ml trigger spray bottles individually.', 0, '', '', '', 5.63, 'https://drive.google.com/file/d/1dUfkPKoc-ZD7h3VwmsqbW7j90xFnK8My/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 10, 22, 'Sani 4 in 1 Smartdose 1.4L', '', 'Concentrated  acidic washroom cleaner and disinfectant.\n\nSuper Concentrated Glass and Hard Surface Cleaner\n\nSmartDose is an innovative dosing platform for super concentrate daily cleaners and disinfectants setting a new industry benchmark of accuracy, simplicity and safety for the users without the need for a connected water supply.\n\nThe Smart pump technology is very practical and uses icon based instructions. This makes it possible to vary shot sizes for any of the different cleaning methods including spray cleaning, bucket cleaning or scrubber driers, but requires minimal user training or measuring. And being a closed system, it provides the maximum level of safety and cost control.\n\nSmartDose also dramatically reduces the environmental footprint of all it’s users. All daily formulations are EU-Flower certified and as platform for super concentrates, it by definition offers packaging, chemical, storage as well as transport benefits versus standard platforms.', 0, '', '', '', 34.16, 'https://drive.google.com/file/d/1L_Qftu1iwPD_saciog5Z_EMPWAWcb4qB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 10, 22, 'Taski Sani Des 2x5L', '', 'Daily use washroom cleaner and disinfectant.\n\nTASKI Sani Des is a cleaner and disinfectant for all washroom surfaces.  It is a versatile cleaner and disinfectant designed to effectively fight against a wide range of micro-organisms.  The fresh fragrance of this washroom cleaner leaves your bathrooms smelling clean, whilst the cleaner removes common washroom soils. Taski Sani Des Washroom Cleaner & Disinfectant is sold in 5ltr ready to use containers, in cases of 2.', 0, '', '', '', 33.07, 'https://drive.google.com/file/d/1GZIEDP04ER2BHTqC5SmOjNlfgUf_pI72/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 10, 22, 'Taski Sani Des EXACT 1L', '', 'Concentrated daily use washroom cleaner and disinfectant.\n\nThe EXACT System offers a simple choice of just three products: choose one red, one blue, one green.  These three products will then deal quickly and efficiently with all daily cleaning tasks.  With its smart packaging, waste and storage is reduced.  Exact also ensures accurate dosing and the colour coding system makes this cleaning system easy to use.\n\nTASKI Sani Des is a cleaner and disinfectant for all washroom surfaces.  It is a versatile cleaner and disinfectant designed to effectively fight against a wide range of micro-organisms.  The fresh fragrance of this washroom cleaner leaves your bathrooms smelling clean, whilst the cleaner removes common washroom soils.  Sold in cases of 6x1.\n\nThis product is part of the unique EXACT dosing and packaging concept for accurate dosage and cost control available from Diversey.  Please speak to us regarding dosing system installation or help and advice.', 0, '', '', '', 14.3, 'https://drive.google.com/file/d/1__b7a446tVzD5iKEyg964UCo58VYhGUC/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 10, 22, 'Sani Des J Flex Cleaner Disinfectant 1.5L', '', 'Concentrated daily use washroom cleaner and disinfectant.\n\nTASKI Sani Des is a cleaner and disinfectant for all washroom surfaces.  It is a versatile cleaner and disinfectant designed to effectively fight against a wide range of micro-organisms.  The fresh fragrance of this washroom cleaner leaves your bathrooms smelling clean, whilst the cleaner removes common washroom soils.  \n\nThis product is part of the unique revolutionary Divery J-Flex system which provides customer solutions to the issues surrounding dilution control available.  Please speak to us regarding dosing system installation or help and advice', 0, '', '', '', 22.03, 'https://drive.google.com/file/d/1vDsEA4eWKhzy6pxY072nLJWsLWc0Swqj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 10, 22, 'Taski Sprint 200 JFlex 1.5Lt', '', 'Multi-purpose hard surface cleaner - super concentrate\n\nTaski Sprint is a highly concentrated alcohol-based daily cleaner for water resistant hard surfaces. This surface cleaner is very economical thanks to excellent cleaning performance at low dosages. Taski Sprint dries quickly without streaking and leaves a pleasant fresh fragrance. Suitable for use with single disc machines and wet mopping systems. Sold in cases of 1.\n\nThis product is part of the unique revolutionary Diversey J-Flex system which provides customer solutions to the issues surrounding dilution control available. Please speak to us regarding dosing system installation or help and advice.', 0, '', '', '', 46.73, 'https://drive.google.com/file/d/1tnwh8U9_amRADzEATaCeYcofBKqFmHN3/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 10, 22, 'Taski Sprint Anti Bac 2x5L', '', 'Multi-purpose hard surface cleaner and disinfectant.\n\n \n\nTaski Sprint Disinfectant is for the cleaning and disinfecting of water-resistant surfaces, including floors and walls.  This versatile cleaner with disinfectant properties is effective against a range of soils and bacteria.  With its fresh fragrance, Taski Sprint Antibac ensures effective cleaning of all water-resistant hard surfaces and reduces the risk of accidental bacteria cross-contamination.  This Taski disinfectant from Diversey is sold in cases of 2.  Suitable for both trigger and bucket application, Taski Sprint anti bac is available in large 5ltr containers.\n\nTaski is a brand manufactured by Diversey designed to give professional cleaning results.', 0, '', '', '', 29.98, 'Taski Sprint Anti Bac 2x5L', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 10, 22, 'TASKI Sani 4 in 1 J Flex 1.5L', '', 'Concentrated  acidic washroom cleaner and disinfectant.\n\nSani 4 in 1 is a concentrated cleaner, descaler, disinfectant and deodoriser for all acid resistant hard surfaces in washroom areas. Its special formulation combines excellent cleaning performance and lime scale removal, even in hard water conditions.Sani 4 in 1 is bactericidal and fungicidal to give a hygienic clean and reduce cross contamination.\n\nThis acidic based formulation cleans, descales, disinfects and deodorises in one step. It is effective against a wide spectrum of micro-organisms including E coli and Salmonella providing excellent hygiene and reducing the risk of cross contamination. The unique patented ONT air neutralising technology alters malodour molecules therefore enhances the image of your washroom. This excellent cleaner works in a large spectrum of water hardness and by combining so many features in a washroom cleaner it actually reduces the number of products required in the washroom area', 0, '', '', '', 37.98, 'https://drive.google.com/file/d/1Ni6ZQIWjO5M6wNiO-s4akyBky_hwQ69p/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 10, 22, 'Good Sense BreakDown 5L', '', 'Biological based odour neutraliser.\n\nGood Sense Break Down enzyme based odour neutraliser is excellent at eliminating odours in urinals, toilets, bins and drains.  The dual action of cleaning detergents and bacteria culture inside of Good Sense Break Down breaks down organic material.  This odour neutraliser can be used for a wide variety of applications including the removal of stubborn odours from carpets.  Good Sense Break Down contains Odour Neutralising Technology.\n\nThe Good Sense range from Diversey offers a complete solution to all odour control problems.  These odour control products get to work immediately and keep working to ensure your premises are kept fresh and inviting.', 0, '', '', '', 36.69, 'https://drive.google.com/file/d/1hKI2IUiPcsDpBJSWhcDOAwffhOqRbMWY/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 10, 22, 'Softcare Fresh H1 800ml', '', 'Lightly perfumed general purpose hand wash.\n\nLeverLine Fresh is a highly effective general handwashing product, suitable for application in a wide range of areas, such as restaurants, offices and schools.', 0, '', '', '', 43.58, 'https://drive.google.com/file/d/1-bQTp6txxJoAVP4GGVStCZ7MIEihoGzB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 10, 22, 'Softcare H61 Sport 2in1 2 x 5L', '', 'Mild premium quality hair and body shampoo.', 0, '', '', '', 37.61, 'https://drive.google.com/file/d/1EJ8XYMvlcr8D6IsIj9rqyfVDAgrBs2tc/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 10, 22, 'Softcare H5 Hand Sanitizer 10x500ml', '', 'Alcohol rub for skin disinfectant.\n\nAlcohol rub for instant hand disinfection\nEfficient against bacteria and viruses\nEN1500 approved for surgical hand disinfection\nThickening system ensures the gel does not instantly liquefy and run off the hands making it easier to apply correctly\n500ml pump top bottle', 0, '', '', '', 77.76, 'https://drive.google.com/file/d/1qFpGg9Ja-aNQAUROiV71FhBAI6qW3dhf/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 10, 22, 'Softcare Dermosoft H9 800ml x6', '', 'A reconditioning cream for softening and moisturising hands.\n\nA reconditioning cream for softening and moisturising hands \n \n\nHelps to prevent dry and cracked skin\nEasily absorbed into skin\nNon-greasy, non-perfumed\nPack size   6 x 800ml', 0, '', '', '', 54.75, 'https://drive.google.com/file/d/1BVqt8VSAA6NrtgJhDxI4GvpEcBHOyMlo/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 10, 22, 'Softcare H21 Extra Mild Hand Cleaner 6x800ml', '', 'Mild  natural soap based hand washing cream for frequent use.\n\nMild, natural soap/hand washing cream for frequent use. Contains moisturisers to re-hydrate the skin.', 0, '', '', '', 41.9, 'https://drive.google.com/file/d/1z1oJ25kZqxdChX_iLBObl1z1AUB__VHZ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 10, 22, 'SoftCare Lux 2in1 H68 6x800ml', '', 'Mild premium quality hair and body shampoo.\n\nLeverLine Lux 2in1 is a mild hair and body shampoo. The product can also be used as bath foam gel and can be applied in hotel bathrooms, and shower rooms of sports clubs.', 0, '', '', '', 74.43, 'https://drive.google.com/file/d/1thIdeloTzDkcIWU4gk-v2LbK4Xpfdnvm/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 10, 22, 'Softcare Silk H200 Soap 2x5L', '', 'Mild hand wash with perfume.\n\nSoft Care Silk is a mild general handwashing product. The product is especially suitable for use in areas where frequent handwashing is required. gives mild and effective skin cleansing with the skin care ingredients and humectants helping to keep the skin in good condition.', 0, '', '', '', 31.08, 'https://drive.google.com/file/d/1bXxPrew02mPXuiLkpvHAEAc77SDoICLw/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 10, 22, 'Softcare Med H5 6x800ml', '', 'Alcohol rub for skin disinfection based on isopropanol.\n\nLever Med is a 70% alcohol gel for hygenic hand disinfection. The product is suitable for application in the healthcare and food processing area.\n\n6x800ml', 0, '', '', '', 58.41, 'https://drive.google.com/file/d/1wDizzMEy2l1aUegY7_X6SkE-YefG8H2V/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 10, 22, 'SoftCare Lux 2in1 H68 28x300ml', '', 'Mild premium quality hair and body shampoo.\n\nSoft Care Lux 2 in 1 H68 is a mild hair and body shampoo.\n\nSmart surfactant system ensures removal of greasy soil whilst being mild to the skin and hair.\n\nCapacity: 300ml\nPack Size: 28', 0, '', '', '', 98.82, 'https://drive.google.com/file/d/1Hu5lkzo0tJOb-Cm1kauvkZsB0UJZuQmG/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 10, 24, 'J Flex Oxivir 1.5L', '', 'A concentrated powerful broad spectrum cleaner disinfectant. Automatically diluted through the J-Flex system to give 57 ready to use trigger sprays.\n\nOxivir Plus is an ideal solution for any facility or operation that comes under the threat of infections. It can be used to prevent infections such as MRSA, Norovirus and influenza in a clinical and community setting. This makes it a great choice for hospitals, long\nterm care facilities, hospitality establishments, schools, government run organisations and commercial offices.', 0, '', '', '', 25.36, 'https://drive.google.com/file/d/11hNDlDL0W16eElZ_-HBA10t8ClUE5KNm/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 10, 24, 'Oxivir Spray 750ml', '', 'This Disinfectant Spray is ideal for using on a wide range of surfaces.\n\n In this ready to use trigger bottle, this is designed to enhance the performance of the product, ensuring to give you outstanding results every time. \nEffective against Norovirus in 2 minutes. \nOxivir Plus is an ideal solution for any facility or operation that comes under the threat of infections. It can be used to prevent infections such as MRSA, Norovirus and influenza in a clinical and community setting. This makes it a great choice for hospitals, long\nterm care facilities, hospitality establishments, schools, government run organisations and commercial offices.', 0, '', '', '', 5.18, 'https://drive.google.com/file/d/1UJ2T2xnF1VzyubCbq6K9s3LMhNTMN4xv/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 10, 44, 'Clax Mild 20L', '', 'Enzymatic liquid detergent for washing all types  of fabric.\n\nClax Mild is a complete enzymatic liquid mainwash detergent specially formulated for use in commercial, hospital and on premise laundries. The product has been designed for automatic and manual dosing and can be applied in all water hardness conditions. Clax Mild is suitable for washing all cotton and polycotton fabrics.\n\nClax Mild is a low alkaline, mild product, based on an effective blend of surfactants, water hardness sequestrants, anti-greying agents, enzymes and optical brightening agents.  The phosphate based building system ensures low water hardness ion concentration and consequently prevents precipitation of detergent components.  Phosphates also function as anti-greying agent by keeping soil particles in suspension (prevents redeposition). In addition other ingredients with antiredeposition properties have been included in the product.  Clax Mild has been formulated with a blend of anionic and nonionic surfactants ensuring good particulate and fatty/oily soil removal. The presence of proteolytic enzyme leads to protein degradation, thus facilitating removal of proteinaceous soil such as blood and food stains.  This product is mainly used as a single shot mainwash detergent. However, it may also be applied in conjunction with an alkali booster (for heavily soiled fabric).\n\nClax Mild is used for cleaning fabric from hospitals and other healthcare establishments, hotels and restaurants. In addition this product is suitable for washing delicate articles.\n\nClax is designed to deliver bright, clean and fresh-smelling laundry that is stain-free and soft with no greying or deterioration over time. Advanced formulation helps to reduce rewashes, linen replacement and machine occupancy for better overall results and productivity.', 0, '', '', '', 98.23, 'https://drive.google.com/file/d/1q9qyXXG3vYv-zrjI6iVUJUD1WGM7LOT8/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 10, 44, 'Clax Bright 20L', '', 'Clax Bright is a well stabilised, effective, low to medium temperature bleach system based on phthalimidoperoxyhexanoic acid.\n\nBleaching System, which is used for low to medium temperature washing. Use on all types of textiles (except for wool and nylon), including colored, solid color fabrics. The system has proved to give excellent wash performance on white linen. When used with lower washing temperatures, the product helps reduce energy and water usage, which in turn implies a substantial cost savings.\n\nClax Bright is a laundry destainer specially formulated for use in commercial laundries.  The product should be applied in the mainwash at 40 - 50 °C and can be used for all types of fabric (except woollen and nylon articles).  Clax Bright is a well stabilized, effective, low to medium temperature bleach system based on phthalimidoperoxyhexanoic acid.  It is an easily pumpable liquid, ensuring optimal delivery in the wash solution.  Clax Bright can be applied on all types of fabric (except wool and nylon), including colour fast articles. For cost-effective (energy saving) bleach performance, the temperature and pH of the washsolution should be 40°C and 9.2. 9.5 (pH at point of dosing) respectively. When used according to the instructions the product causes minimal fabric damage and colour fading.  Clax Bright provides good hygiene, provided temperature, pH and contact time are as indicated on the instructions.  Clax Bright is part of a LowTemp system, based on a pre-wash/mainwash detergent, enzymes and bleach.  This system has been shown to give excellent cleaning results on white workwear, restaurant/kitchen linen and hospital linen.  In addition lower wash temperatures result in reduced energy and water consumption and consequently significant cost-savings can be obtained.', 0, '', '', '', 224.08, 'https://drive.google.com/file/d/1Z_abu2g4z9zLw9comkm8Xa30Gt31gHt6/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 10, 26, 'Domestos Prof. Orginal 5L', '', 'Thick bleach\n\nDomestos Professional Original prevents limescale and kills all known germs.  Domestos Professional Original’s thick formula clings better for lasting protection. Due to the advanced Domestos Professional Original formula it prevents limescale. Domestos Professional Original can be used in lavatories, drains, sinks and large surfaces such as floors and work surfaces.  Do not use neat on floors or work surfaces.  Domestos Professional Original is suitable for use in septic tanks. Domestos Professional Original provides a complete protection from germs including salmonella, E-coli and listeria.  This bleach has a thick formula that clings better for lasting protection whilst killing all known germs.  Sold in cases of 4x1.\n\nThe Domestos range offers people peace of mind when tackling germs, and responsible advice for establishing sensible home hygiene regimes.  From its original incarnation as liquid bleach, the brand has been extended and developed to offer a variety of products and fresh fragrances.  The Domestos products stocked by Pattersons are from the professional range.', 0, '', '', '', 12.9, 'https://drive.google.com/file/d/16R7h07EsZ_3RF8E5z7sfxd-CIwADgeQf/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 10, 26, 'Domestos 750ml x 9', '', 'Thick Bleach\n\nDomestos Professional Original prevents limescale and kills all known germs.  Domestos Professional Original’s thick formula clings better for lasting protection. Due to the advanced Domestos Professional Original formula it prevents limescale. Domestos Professional Original can be used in lavatories, drains, sinks and large surfaces such as floors and work surfaces.  Do not use neat on floors or work surfaces.  Domestos Professional Original is suitable for use in septic tanks. Domestos Professional Original provides a complete protection from germs including salmonella, E-coli and listeria.  This bleach has a thick formula that clings better for lasting protection whilst killing all known germs.  Sold in cases of 9x1.', 0, '', '', '', 1.48, 'https://drive.google.com/file/d/1SY_zE0lFlvi28O9Yka-j2XgVowChaZfO/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 10, 26, 'CIF Prof Oven & Grill CL 750m', '', 'Oven and grill cleaner\n\n \n\nConfidently tackle your cleaning with the Ciff Professional range.  This Cif is not the same as you use at home, but a professional version designed for use in catering establishments.  You may use this oven & grill cleaner at home too if you would like a professional strength cleaner to remove tough greases and burnt on food fast.  This oven & grill cleaner is suitable for ovens, grills, salamanders and griddles.  This cleaner has a non-corrosive formulation from a brand known and trusted.  Sold in cases of 6x1. \n\nCif Professional is a range of powerful professional cleaning products for perfect end results. This brand from Diversey is a range that consists of products which targets truly professional business needs coupled with a well known and trusted brand. By giving you excellent cleaning results, you can focus on your core business.', 0, '', '', '', 30.13, 'https://drive.google.com/file/d/1hCdLg3ChXxk54uGdakQc8rw9xmeWwbbK/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 10, 26, 'Cif Multipurpose/Glass Cleaner 750ml', '', 'Glass, window and non porous surface cleaner\n\nCif Window Cleaner quickly removes grime and grease to leave behind a streakfree shine in seconds.  Cif is ready to use on windows and interior surfaces including mirrors, tables and other hard surfaces. Sold in cases of 6x1, this Cif Window Cleaner is a professional cleaner designed for use in business environments but if you would like the power of a professional cleaner this glass cleaner can also be used at home.\n\nCif Professional is a range of powerful professional cleaning products for perfect end results. The Cif range consists of products which targets truly professional business needs coupled with a well known and trusted brand. By giving you excellent cleaning results, you can focus on your core business.', 0, '', '', '', 5.27, 'https://drive.google.com/file/d/1YZrbgy4V-FbIUXtR5xpr1PTk2t-WNId1/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 10, 26, 'Cif Professional Wood Polish 750ml', '', 'High wax wood and non pourous polish.\n\nCif Wood Polish cleans, polishes and protects all wood and laminates.  This professional furnituire polish is a unique blend of waxes which remove dust, fingermarks, smudges and stains in less time with less effort, leaving a deep and lasting shine.  This polish can be used on a variety of surfaces with confidence.  Sold in cases of 6x1.\n\nCif Professional is a range of powerful professional cleaning products for perfect end results.  This brand from Diversey is a range that consists of products which targets truly professional business needs coupled with a well known and trusted brand.  By giving you excellent cleaning results, you can focus on your core business.', 0, '', '', '', 4.86, 'https://drive.google.com/file/d/14A3HkPHpfrCad_We29dL3Cr9W3TrEmjL/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 10, 26, 'Sun Dishwash Tablet case (100pk)', '', 'Mechanical ware wash detergent.', 0, '', '', '', 24.63, 'https://drive.google.com/file/d/1CGJwVKhG2RFoyB0y8vS86uGnArjT_t7Y/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 10, 26, 'Cif Cream Cleaner 500ml\n', '', 'Hard surface cream cleaner.\n\nCif Professional Cream Cleaner tackles the toughest of cleaning jobs in the bathroom and the kitchen.  Cif’s cream cleaner\'s powerful and versatile formula cuts through even tough grease and limescale leaving a deep down clean and a brilliant shine.  Gentle on surfaces, Cif Cream Cleaner can be used on enamel and vitroceramic.  In an easy to handle 500ml bottle Cif Professional Cream Cleaner is sold in cases of 8. \n\nThe Cif brand has always been up for the tough cleaning jobs around the house - in fact, family and community are at the core of our home care philosophy. Cif believes the easier we make your home tasks, the more time you can have with the people who matter to you most. That\'s why Cif has been the UK & Ireland\'s first choice in cleaners for decades.  This professional cream cleaner takes the ethos of the Cif brand but with greater power for professional cream cleaning.', 0, '', '', '', 2.85, 'https://drive.google.com/file/d/1Tpu1AMtA5S6f5WUu4WkS8PvCRYhTFv_g/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 10, 26, 'Bryta Cleaner & Degreaser 5L', '', 'Cleaner and degreaser for large surfaces.\n\nEffective heavy duty hard surface cleaner and degreaser for kitchens. (Formerly Brillo Cleaner Degreaser)', 0, '', '', '', 5.32, 'https://drive.google.com/file/d/1SfE_E-eeO7cLRxeWb9_bPclym5Ebo4D3/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 10, 26, 'Bryta Oven & Grill Gel 5L', '', 'Heavy duty oven and grill cleaner.\n\nBryta Oven & Grill cleaner. Highly effective formulation. Suitable for cleaning ovens and grills in kitchen and food preparation environments. (Formerly Brill Oven Gel Cleaner)', 0, '', '', '', 0, 'https://drive.google.com/file/d/1_tdU0iwROsFPOfqmbxxTGw0BebL64VQL/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 10, 26, 'Shield 3 Way Toilet Cleaner 1L', '', 'Daily toilet cleaner and descaler.\n\nShield 3 Way Toilet Cleaner is a powerful acidic formulation which easily overcomes even the toughest toilet cleaning tasks. (Formerly Lifeguard 3 Way Toilet Cleaner)', 0, '', '', '', 5.02, 'https://drive.google.com/file/d/1L4q2n4JD2zL0BS62XBku-aQxCyP3nusA/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 10, 27, 'Roomcare R2 Plus 2x1.5L', '', 'Concentrated multi-surface cleaner & disinfectant.\n\n \n\nSimple to use, this Room Care Hard Surface Cleaner pouch is designed for use with the Divermite dosing system, which provides an accurate does of cleaner to reduce overall consumption and eradicate waste. The thick formula is suitable for use on a wide variety of hard surfaces. This pack contains two 1.5 litre refills.', 0, '', '', '', 122.35, 'https://drive.google.com/file/d/10SJEV7jDRVHIfUcwxDdzP8Zdr0bg8XcX/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 10, 27, 'Roomcare R3 Glass 2x1.5L', '', 'Glass and multi-surface cleaner for glass and other water-resistant hard surfaces. The spray cleaner rapidly removes oily soils and finger marks from glass, mirrors, tiles and other glazed surfaces.\nDries quickly, leaving surfaces streak-free.\n\nPleasant fresh fragrance.\n\nFor use with Divermite systems.', 0, '', '', '', 119.19, 'https://drive.google.com/file/d/1vhzLu9AoyLPLOG0OmJB3Fi-QWUSzXvGX/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 10, 27, 'Roomcare R5 Air Freshener', '', 'Concentrated air freshener.\n\nFor effective air cleansing use Diversey Room Care R5-Plus air freshener. With a fresh, floral fragrance this product will take care of all unpleasant odours and aromas. Simple to use, the pouch fits easily into the Divermite dosing system, which provides accurate dispenses to reduce overall consumption and eradicate waste. Safe for frequent use, the pouch will make up 15 - 30 litres of ready to use solution.', 0, '', '', '', 108.33, 'https://drive.google.com/file/d/1p2zKud_FTFpgh4PvH7n6rhKaqQkq1ZC-/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 10, 27, 'Roomcare R1 Plus Toilet Cleaner 2x1.5L', '', 'Concentrated daily toilet bowl cleaner.', 0, '', '', '', 87.35, 'https://drive.google.com/file/d/1igy4SMGT4wj3W4Yglmxq0kBJoVVZKXYu/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 10, 28, 'TASKI Jontec Tensol S/Dose 1.4L', '', 'Neutral pH floor maintainer in SmartDose system for accurate dilution.', 0, '', '', '', 42.7, 'https://drive.google.com/file/d/1UiJdFGStMzpLb5gavKeu_m6RvNbCEolq/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 10, 28, 'Taski Jontec 5L', '', 'Taski Jontec 300 5L', 0, '', '', '', 12.15, 'https://drive.google.com/file/d/1PtsO_shI7dj5Bxfu0E1kfEw77Ww8C3Du/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 10, 28, 'Taski Jontec 300 J Flex 1.5L', '', 'Neutral pH low foam floor cleaner.', 0, '', '', '', 26, 'https://drive.google.com/file/d/1he5tEUKPJCjfIkvW2qB6n8jScVshBXjc/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 10, 28, 'TASKI Jontec 300 Pur-Eco SmartDose', '', 'Neutral pH low foam floor cleaner.\n', 0, '', '', '', 21.96, 'https://drive.google.com/file/d/13c09997HNBd9_o1yryCyTgw1_nUsHaZe/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 10, 28, 'TASKI Jontec Forward', '', 'Heavy duty floor cleaner.', 0, '', '', '', 40.8, 'https://drive.google.com/file/d/1e8rEka_RVBEr3F5YHuKU556SpyZF-lpd/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 10, 28, 'TASKI Jontec Forward SmartDose', '', 'TASKI Jontec Forward SD 1.4L', 0, '', '', '', 38.82, 'https://drive.google.com/file/d/1ooER00bFTMIHwZVqcl5rcxWCxjdXGrHv/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 10, 28, 'TASKI Jontec Forward QuattroSelect', '', 'Heavy duty floor cleaner for use with QuattroSelect unit only.', 0, '', '', '', 62.05, 'https://drive.google.com/file/d/1o0Yi7v8hvQu5O1vfmb62zAnLUjfDRNuj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 10, 28, 'TASKI Jontec Forward J-Flex', '', 'Heavy duty floor cleaner for use with J-Flex system only.', 0, '', '', '', 36.45, 'https://drive.google.com/file/d/1WbupVXToAsGWECBWgTmZBNoZwyVU0Lq7/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 10, 28, 'Diversy Actival 2x5L', '', 'Low foam heavy duty kitchen floor cleaner.', 0, '', '', '', 44.73, 'https://drive.google.com/file/d/1VyK9zhk4iY3OabyxWsZWouFUCerqcf4s/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 10, 28, 'Taski Tapi Spotex 2 750ml', '', 'General purpose carpet spotter.', 0, '', '', '', 6.07, 'https://drive.google.com/file/d/1xJ5XV2lCsQ1BaBCU6-ISGHThWWkvVEIV/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 10, 28, 'TASKI Jontec Tensol Conc', '', 'Neutral pH floor maintainer', 0, '', '', '', 7.9, 'https://drive.google.com/file/d/132PftMpPX9AGxu82IHL2AU92-8jVqDNp/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 10, 28, 'Taski Jontec 300 EXACT 1L', '', 'Neutral pH low foam floor cleaner.\n\n', 0, '', '', '', 12.05, 'https://drive.google.com/file/d/1FQThMYK8S3zMIuG1arZrxibUu9T9QWgk/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 10, 28, 'Carefree Stripper 5lt', '', 'Fragranced neutral floor maintainer ', 0, '', '', '', 19.65, 'https://drive.google.com/file/d/10zfkH_XREcQzg0wriBCT5VAmGMgnDf9z/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 10, 28, 'Carefree Floor Maintainer\n', '', 'Fragranced neutral floor maintainer.', 0, '', '', '', 17.74, 'https://drive.google.com/file/d/15HBNdEHeu6cmIUn2jgjUyjcOHI19R4K0/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 10, 28, 'Carefree Eternum 5L', '', 'High gloss low maintenance floor polish.', 0, '', '', '', 36.73, 'https://drive.google.com/file/d/1E0stJyIWxZ23dU3__NMnWk8zg9oirKnh/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 10, 28, 'Carefree Emulsion 5L x 2', '', 'Medium gloss floor polish.\n\n', 0, '', '', '', 73.5, 'https://drive.google.com/file/d/1QzWkcPJy4ewRrJ9B0c2cD3Dv6zcbzNbj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 10, 28, 'Carefree Satin 5L x 2', '', 'Low gloss floor polish.', 0, '', '', '', 74.56, 'https://drive.google.com/file/d/1qx3hT-mwaGhfDLOcJmgq46IKp0D7lwmB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 10, 28, 'Carefree Stride 3000 5L', '', 'Low foam neutral floor cleaner and maintainer.', 0, '', '', '', 21.7, 'https://drive.google.com/file/d/1ApXRqY_Ijd3kt_FA1pxjHSExEfWdZTum/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `products` (`id`, `brand_id`, `category_id`, `title`, `title_slug`, `description`, `variants`, `sizes`, `colors`, `prices`, `price`, `image`, `status`, `created_at`, `updated_at`) VALUES
(264, 10, 28, 'Bourne Natural Seal 5L', '', 'Heavy duty polyurethane wood floor sealer', 0, '', '', '', 139.3, 'https://drive.google.com/file/d/1hJ4lzJEltZL_QN-bmSXQu0NMjQ_4OESB/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 10, 28, 'D1 Bourne Traffic Liquid Wax 5L', '', 'Liquid wax for wood and cork floors.', 0, '', '', '', 26.67, 'https://drive.google.com/file/d/1j3B4JrZ-_Fo_o_oHBuL1B0_FSZPa935w/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 10, 28, 'TASKI Tapi Spotex 6x.05L', '', 'Aerosol carpet spotter to remove solvent based stains.', 0, '', '', '', 47.8, 'https://drive.google.com/file/d/1UH5GQOGZdOUYxyTsc00zZeOG8t_4Rqli/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 10, 28, 'Taski Tapi Extract 2x5L', '', 'Extraction cleaner for carpets and upholstery with a fresh apple fragrance.', 0, '', '', '', 53.74, 'https://drive.google.com/file/d/1n4S1ywzH7tIXWubw-KrPVAOATSSB1Mfk/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 10, 28, 'TASKI Tapi Gum 0.5L', '', 'Aerosol based chewing gum remover.\n\n', 0, '', '', '', 13.18, 'https://drive.google.com/file/d/1vIDjw7-j24hmOyUr0fVI5jAjKOpOqnWf/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 10, 28, 'Enhance Foam Shampoo 2x5L', '', 'Carpet shampoo for cleaning and refreshing carpets.\n\n', 0, '', '', '', 40.46, 'https://drive.google.com/file/d/1dXjMSWYm6CkFqPSvVo3x6WRyq7E_KJnN/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 10, 28, 'Taski Tapi Shampoo 2 x 5L', '', 'Carpet shampoo for cleaning and refreshing carpets.', 0, '', '', '', 52.88, 'https://drive.google.com/file/d/1cWi6hV102goIz8NeTdZg-wPkpnoSpDRx/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 10, 28, 'Enhance Extraction Clnr 2x5L', '', 'Extraction cleaner for carpets and upholstery with a fresh apple fragrance.', 0, '', '', '', 48.65, 'https://drive.google.com/file/d/1C5YrRiC0xVMvMDNN6ww31KekrTdajTJr/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 11, 29, 'Tork Matic® Hand Towel Roll Dispenser – with Intuition™ Sensor', '', 'Stainless Steel H1 dispenser.\n\nThe Tork Matic® Hand Towel Roll Dispenser with Intuition™ Sensor in Image Design gives your guests the ultimate hand drying experience. Creating a sophisticated impression in the washroom is as important as the image your customers see when they first enter your building. The touch free, one-at-a-time dispensing reduces consumption and improves hygiene. Go beyond beautiful design and provide elegance with the Tork Image Line.\n\nAn adjustable towel length allows you to select the towel size that\'s right for your business\nTouch free, one-at-a-time dispensing reduces consumption and improves hygiene\nEasy maintenance with the LED refill indicator that shows when a refill is needed\nReliable performance and intuitive maintenance gives you peace of mind', 0, '', '', '', 173.88, 'https://drive.google.com/file/d/1XMlTQaN9CbZa3xJKh-kZx0wVEvwIvPQJ/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 11, 29, 'Tork Xpress™ Multifold Hand Towel Dispenser', '', 'Stainless Steel H2 Dispenser.\n\nA modern design with smooth surfaces and clean lines that fits seamlessly in your washroom. Create a great impression that boosts the high-quality image of your facility. Stylish stainless steel with anti-finger print coating looks great and stays clean.\n\nOne-at-a-time dispensing for reduced consumption and increased hygiene\nExtra slim design – attractive and space-saving\nTop-up able feature ensures hand towels never run out', 0, '', '', '', 31.74, 'https://drive.google.com/file/d/1rJaku6cvW4Wo35HVQJ_HsRKRqMBW5c_O/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 11, 29, 'Tork Matic® Hand Towel Roll Dispenser – with Intuition™ Sensor White', '', 'Colour: White\n\nThe Tork Matic® Hand Towel Roll Dispenser with Intuition™ Sensor in Elevation Design gives your guests the ultimate no-touch hand-drying experience. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nHygienic because guests touch only the towel they use\nThe adjustable towel length allows you to reduce towel consumption. Select the towel size that\'s right for your business\nReliable performance and intuitive maintenance gives you peace of mind', 0, '', '', '', 168.4, 'https://drive.google.com/file/d/1l4fif-R5rmaEyDTNa6khX_LlPD4QQxXq/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 11, 29, 'Tork Matic® Hand Towel Roll Dispenser – with Intuition™ Sensor Black', '', 'Colour: Black\n\n \n\nThe Tork Matic® Hand Towel Roll Dispenser with Intuition™ Sensor in Elevation Design gives your guests the ultimate no-touch hand-drying experience. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nHygienic because guests touch only the towel they use\nThe adjustable towel length allows you to reduce towel consumption. Select the towel size that\'s right for your business\nReliable performance and intuitive maintenance gives you peace of mind', 0, '', '', '', 168.4, 'https://drive.google.com/file/d/1lRmflF57g4oZzKT619wF8WAA4jnT5flV/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 11, 29, 'Tork Xpress® Multi-fold Hand Towel Dispenser', '', 'The Tork Xpress® Multi-fold Hand Towel Dispenser in Elevation Design is suitable for environments that demand both comfort and hygiene. This slim, attractive dispenser reduces consumption and waste with one-at-a-time dispensing. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nGood hygiene as guests only touch the towel used\nBundles can be topped up easily to avoid paper run-outs\nHassle free maintenance due to overfill protection for easy refilling', 0, '', '', '', 39.55, 'https://drive.google.com/file/d/1rJaku6cvW4Wo35HVQJ_HsRKRqMBW5c_O/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 11, 29, 'Tork Xpress® Multi-fold Mini Hand Towel Dispenser', '', 'The Tork Xpress® Multi-fold Hand Towel Dispenser in Elevation Design is suitable for environments that demand both comfort and hygiene. This slim, attractive dispenser fits in low to medium traffic washrooms where space is limited and reduces consumption with one-at-a-time dispensing. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nOne-at-a-time dispensing reduces cost-in-use and waste\nEnsures good hygiene as guests only touch the towel that they use\nBundles can be topped up easily to avoid paper run-outs\nHassle-free maintenance due to overfill protection for easy refilling', 0, '', '', '', 29.65, 'https://drive.google.com/file/d/1sWmVR2_JgNwhdl-CFUNIkUMcobM6Wxeq/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 11, 29, 'Tork Xpress Countertop Multi-fold Hand Towel Dispenser', '', 'The Tork Xpress Countertop Multi-fold Hand Towel Dispenser in Elevation Design serves as a great alternative to providing a stack of loose towels on the washroom counter top. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nThe compact size is ideal when space is limited or mounting not possible\nUpmarket look and better hygiene instead of stacked paper towels\nOne-at-a-time dispensing reduces cost-in-use and waste', 0, '', '', '', 30.16, 'https://drive.google.com/file/d/1x_kvO6dQ4GNvyPFvOxM1yKBr9aq1e6ih/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 11, 29, 'Tork Singlefold/C-fold Hand Towel Dispenser', '', 'The Tork Singlefold/C-fold Hand Towel Dispenser in Elevation Design is suitable for demanding environments. It reduces consumption and therefore waste with its reliable one-at-a-time dispensing. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nBundles can be topped up easily to avoid paper run-outs\nThe hood opens on the side for hassle-free maintenance\nA robust design with reliable dispensing gives you peace of mind', 0, '', '', '', 34.87, 'https://drive.google.com/file/d/193lhqEjhO9xer0_sSpVZ0SqVt_1uLPZn/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 11, 30, 'Tork Twin Coreless Mid-size Toilet Roll Dispenser', '', 'The Tork Twin Coreless Mid-size Toilet Roll Dispenser is ideal for medium to high traffic washrooms with a high focus on guest satisfaction. It ensures high efficiency and that toilet paper is always available for guests by holding up to nine times more paper than two conventional toilet rolls.\n\nCoreless rolls means that there is less waste to remove\nA smart, stub-roll holder allows full roll consumption to minimise waste\nThe compact horizontal dispenser saves space.', 0, '', '', '', 30.16, 'https://drive.google.com/file/d/17t3oDcVu2guEbvTX0ytCm1w1aWHyy1oL/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 11, 30, 'Tork Jumbo Toilet Roll Dispenser', '', 'The Tork Jumbo Toilet Roll Dispenser in Elevation Design is suitable for high-traffic locations. Its extra-high capacity saves maintenance time and ensures that paper is always available. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nA smart, stub-roll holder allows for full roll consumption\nThe optimal roll brake avoids free spinning rolls and therefore reduces consumption\nA clear window indicates when it\'s time to refill.', 0, '', '', '', 56.25, 'https://drive.google.com/file/d/1EGIe3ExFE41f9K4OCw1wj01MfRfs5b2f/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 11, 30, 'Tork Folded Toilet Paper Dispenser', '', 'The Tork Folded Toilet Paper Dispenser in Elevation Design is ideal for low- to medium-traffic locations. It offers improved hygiene with its sheet-by-sheet dispensing, which lets your guests only touch the sheet they use. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nBundles are easy to load for flexible refilling and minimal waste\nThe slim design saves space.', 0, '', '', '', 20.55, 'https://drive.google.com/file/d/1RseP2spJfwsVDH23Df6AmoHaN12D4AE_/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 11, 30, 'Tork Conventional Toilet Roll Dispenser', '', 'The Tork Conventional Toilet Roll Dispenser in Elevation Design is suitable for low-traffic washrooms and reduces maintenance by holding two conventional toilet rolls. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nA closed dispenser that keeps rolls protected for better hygiene.', 0, '', '', '', 36.62, 'https://drive.google.com/file/d/1ywTMQt-gNpZGxreB-o_-gf1GA1WNonyq/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 11, 30, 'Tork SmartOne® Toilet Roll Dispenser', '', 'The Tork SmartOne Toilet Roll Dispenser in Elevation Design is an efficient and very robust dispensing system suitable for demanding washrooms with high traffic. The sheet-by-sheet dispensing helps to reduce consumption by up to 40% when compared to traditional jumbo roll dispensers, which means more visits per roll.\n\nThe single-sheet dispensing helps to reduce consumption by up to 40%\nIt is hygienic as guests only touch the paper that they use\nIt has an extremely robust design with a metal key and lock that protects the roll and stops theft\nAn extra high capacity saves maintenance time and ensures that paper is always available.', 0, '', '', '', 73.41, 'https://drive.google.com/file/d/1IdJbiyx7EOKBBEB8R6FgVBaXR-km50fm/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 11, 30, 'Tork SmartOne® Twin Mini Toilet Roll Dispenser\n', '', 'The Tork SmartOne Twin Mini Toilet Roll Dispenser in Elevation Design is an efficient and very robust dispensing system suitable for demanding washrooms with high traffic. By holding two rolls and sheet-by-sheet dispensing, consumption is reduced by up to 40% when compared to a traditional jumbo roll dispenser which means more visits per roll. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nThe single-sheet dispensing helps to reduce consumption by up to 40%\nIt is hygienic because guests only touch the paper that they use\nIt has an extremely robust design with a metal key and lock that protects the roll and stops theft\nAn extra high capacity saves maintenance time and ensures that paper is always available\nThe twin roll dispenser allows rolls to be used to the end minimising the stub roll waste.', 0, '', '', '', 62.79, 'https://drive.google.com/file/d/1pUDCHYeLeE1yaiEnG9SV7v4VU7-m8K-Q/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 11, 30, 'Tork Mini Jumbo Toilet Roll Dispenser', '', 'A modern design with smooth surfaces and clean lines that fits seamlessly in your washroom. Create a great impression that boosts the high-quality image of your facility. Stylish stainless steel with anti finger print coating looks great and stays clean.\n\nModern and seamless design – make the right impression\nEasy to clean stainless steel with anti-fingerprint protection/coating  - keeps the high class look for a better experience\nHigh capacity – ensures your guests that toilet paper will never run out\nSmart stub roll holder – reduces waste. Stub rolls can be used to the end\nOptimal roll brake – Smooth dispensing and no paper on the floor.', 0, '', '', '', 32.13, 'https://drive.google.com/file/d/185uDSjBLF8_D6J3LiSrarEUrJKspkvSj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 11, 30, 'Tork Twin Mini Jumbo Toilet Roll Dispenser', '', 'The Tork Twin Mini Jumbo Toilet Roll Dispenser in Elevation Design is the ideal choice for high-traffic washrooms where the guest experience is as important as high efficiency and low running costs. It ensures that tissue is always available by holding two full high-capacity rolls. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nBoth rolls can be used to the end to minimise waste\nThe optimal roll brake avoids free spinning rolls and therefore reduces consumption\nA clear window indicates when it\'s time to refill.', 0, '', '', '', 40.72, 'https://drive.google.com/file/d/1_xdUqA0JIVv1eL_UXqTG0lW8QBe6FCnz/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 11, 30, 'Tork Twin Mid-size Toilet Roll Dispenser', '', 'The Tork Twin Mid-size Toilet Roll Dispenser in Elevation Design is ideal for medium- to high-traffic washrooms with high focus on guest satisfaction. It ensures high efficiency and that toilet paper is always available for guests by holding up to six times more paper than two conventional toilet rolls. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nAutomatic roll shift that makes it easy for guests to access the new roll\nEmpty cores remain inside the dispenser to avoid waste on the floor\nCompact dispenser saves space.', 0, '', '', '', 30.16, 'https://drive.google.com/file/d/17t3oDcVu2guEbvTX0ytCm1w1aWHyy1oL/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 11, 30, 'Tork Twin Mid-size Toilet Roll Dispenser Black', '', 'The Tork Twin Mid-size Toilet Roll Dispenser in Elevation Design is ideal for medium- to high-traffic washrooms with high focus on guest satisfaction. It ensures high efficiency and that toilet paper is always available for guests by holding up to six times more paper than two conventional toilet rolls. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nAutomatic roll shift that makes it easy for guests to access the new roll\nEmpty cores remain inside the dispenser to avoid waste on the floor\nCompact dispenser saves space.', 0, '', '', '', 30.16, 'https://drive.google.com/file/d/1UprHOtPJdvbf8GtAT_-SsUsFD7a0ejSF/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 11, 30, 'Tork SmartOne® Mini Toilet Roll Dispenser', '', 'The Tork SmartOne Mini Toilet Roll Dispenser in Elevation Design is an efficient and very robust dispensing system suitable for demanding washrooms with low to medium traffic. The sheet-by-sheet dispensing helps to reduce consumption by up to 40% when compared to traditional jumbo roll dispensers, which means more visits per roll. Tork Elevation dispensers have a functional, modern design that makes a lasting impression on your guests.\n\nThe single-sheet dispensing helps to reduce consumption by up to 40%\nIt is hygienic as guests only touch the paper that they use\nIt has an extremely robust design with a metal key and lock that protects the roll and stops theft\nThe high capacity saves maintenance time and ensures that paper is always available.', 0, '', '', '', 67.01, 'https://drive.google.com/file/d/1pUDCHYeLeE1yaiEnG9SV7v4VU7-m8K-Q/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 11, 31, 'Tork Bin 50 Litre', '', 'A modern design with smooth surfaces and clean lines that fits seamlessly in your washroom. Create a great impression that boosts the high-quality image of your facility. Stylish stainless steel with anti finger print coating looks great and stays clean.\n\nHigh capacity (50L) reduces maintenance time\nSlim and attractive bin that can be wall mounted to blend into the washroom interior and maintain a great impression\nConcealed bin liner maintains a fresh impression to the user\nEasy maintenance with bin lid that can be opened from either side (lid sold separately)', 0, '', '', '', 50.76, 'https://drive.google.com/file/d/1_Uqr3i3Cjp3CeYnNv0jIdFO_xuRl_XrE/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 11, 32, 'Tork Foam Soap Dispenser with Intuition™ sensor', '', 'A modern design with smooth surfaces and clean lines that fits seamlessly in your washroom. Create a great impression that boosts the high-quality image of your facility. Stylish stainless steel with anti finger print coating looks great and stays clean.\n\nModern and seamless design – make the right impression\nEasy to clean stainless steel with anti-fingerprint protection/coating  - keeps the high class look for a better experience\nSensor-activated, gives a high-tech impression\nTouch free  and proven easy-to-use design  by third party certificate promotes good hand hygiene for all washroom visitors\nProven Easy to use for the cleaning staff saving time for refilling\nLED refill indicator indicates need for maintenance', 0, '', '', '', 95.82, 'https://drive.google.com/file/d/1Z3kHPKt64C95oNpOeTq3q9J7LV3P-pmT/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 11, 32, 'Tork Liquid and Spray Soap Dispenser', '', 'The Tork skin care dispensers for soap and sanitisers are suitable for all kinds of washrooms - even in tough and demanding environments. The dispenser is available with an armlever for use in areas where extra hygiene is of critical importance. The system offers quick and easy refilling proven by Easy to Use certification by the Swedish Rheumatism Association\n\nTork skincare dispensers with proven functional design, promoting a good hand hygiene for all washroom visitors\nEasy to use for all visitors: proven by 3rd party certification\nEasy to use for the cleaning staff : certified functional design of the system\nVersatile dispenser can be used for large range of S1 liquid and S11 spray refills', 0, '', '', '', 35.27, 'https://drive.google.com/file/d/1_Vk9KBIjyyoitIk5dO-ScZ7AhDkbvO73/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 11, 32, 'Tork Mini Liquid Soap Dispenser', '', 'The Tork Mini Liquid Soap Dispenser in Elevation Design fits into any size washroom and can be used with a wide range of Tork skincare products in sealed bottles. It is easy to use and provides excellent hygiene. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nEasy-to-Use approval for comfortable usage especially for children and the elderly\nCertified effortless cleaning and intuitive refilling saves time', 0, '', '', '', 24.41, 'https://drive.google.com/file/d/1-9piadXcly4kqAdOO8ZPaioZlRIdtmAj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 11, 32, 'Tork Foam Soap Dispenser', '', 'The Tork Foam Soap Dispenser in Elevation Design fits into all washrooms and can be used with a wide range of Tork skincare products in sealed bottles. It is Easy-to-Use approved and provides good hand hygiene for all users. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nEasy-to-Use approval for comfortable usage especially for children and the elderly\nCertified effortless cleaning and intuitive refilling saves time', 0, '', '', '', 41.7, 'https://drive.google.com/file/d/1B9PQrhUl5EiKIHPDeNLBQWm_3t01ZJPg/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 11, 32, 'Tork Foam Soap Dispenser – with Intuition™ sensor', '', 'The Tork Foam Soap Dispenser with Intuition ™Sensor in Elevation Design allows you to make a good impression on your guests and can be used with a wide range of Tork skincare products in sealed bottles. Its touch-free dispensing ensures good hand hygiene for all users. Elevation dispensers have a functional and modern design that makes a lasting impression on your guests.\n\nEasy maintenance with the LED level indicator that shows when a refill is needed\nCertified effortless cleaning and intuitive refilling saves time', 0, '', '', '', 95.82, 'https://drive.google.com/file/d/1Z3kHPKt64C95oNpOeTq3q9J7LV3P-pmT/view?usp=sharing\\', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 11, 33, 'Tork Spray Soap × 1 800ml', '', 'Colour: Pink\n\nEAN: 5010195550681\n\nQuality level: Universal\n\nServe more with less. Tork Spray Soap delivers 2,650 doses of a luxuriously fragranced hand soap that\'s mild to the skin. This soap is ideal for high-traffic washrooms where efficiency is key.\n\nHigh capacity: Up to 2,650 dosages per refill lasts longer.\nLuxurious fragrance\nFits into Tork Spray Soap Dispenser S35', 0, '', '', '', 61.53, 'https://drive.google.com/file/d/14tSP6kWQJPoO02H2HTuHzON90kB92a4X/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 11, 33, 'Tork Non perfumed Hand & Body Lotion × 1', '', 'Colour: White\n\nEAN: 7322540394054\n\nQuality level: Premium\n\nTork Hand & Body Lotion is ideal for normal, dry and sensitive skin. It helps to protect the skin from excessive dryness, leaving it feeling nourished and touchably soft, day after day. It\'s a non-perfumed lotion with caring ingredients, ensuring a natural level of skin moisture. Suitable for Tork Mini Liquid Soap Dispensers, which are easy to use and provide good hand hygiene to all users.\n\nMoisturising – Premium quality ingredients include rapeseed oil and vitamin E to help nourish skin\nCertified with the Nordic Swan – official ecolabel of the Nordic countries\nQuick-and-easy refilling proven with easy-to-use certification by the Swedish Rheumatism Association\n\"The sealed bottle with single-use pump secures good hygiene and reduces the risk of cross-contamination\"\nThe bottle collapses as the contents are used, reducing waste', 0, '', '', '', 83.35, 'https://drive.google.com/file/d/156Z14YWFoDwX3rU8f4eVvcJwTlXgfaNc/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 11, 33, 'Tork Mild Mini Liquid Soap × 1', '', 'Article: 420502\n\nColour: Light Yellow\n\nEAN: 7322540394313\n\nQuality level: Premium\n\nGive your visitors an all-purpose soap with a fresh scent that’s perfect for all skin types. Tork Mild Mini Liquid Soap has moisturising and replenishing ingredients proven mild to the skin for gentle hand washing. Suitable for Tork Liquid Soap Dispensers, which are easy to use and provide good hand hygiene to all users.\n\nA rich, moisturising lather with fresh scent to nourish the skin\nCertified with the EU Ecolabel, which stands for high environmental performance\nQuick-and-easy refilling proven with easy-to-use certification by the Swedish Rheumatism Association\nThe sealed bottle with single-use pump secures good hygiene and reduces the risk of cross-contamination\nThe bottle collapses as the contents are used, reducing waste.', 0, '', '', '', 32.21, 'https://drive.google.com/file/d/1aIQmS60KtkHobWBSZUZ8Sf6mFQ5HcJ5i/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 11, 33, 'Tork Extra Hygiene Liquid Soap × 1', '', 'Article: 420810\n\nColour: Transparent\n\nEAN: 7322540394399\n\nQuality level: Premium\n\nProvide an extra hygienic hand wash with Tork Extra Hygiene Liquid Soap. Its perfume- and colour-free formula is kind to the skin yet highly effective against bacteria. Ideal for environments where hands have to be washed frequently and cross-contamination risks are high. Suitable for Tork Liquid & Spray Soap Dispensers, which are easy to use and provide good hand hygiene to all users.\n\nThe formula is more effective against bacteria than ordinary hand soap\nCertified with the Nordic Swan – official ecolabel of the Nordic countries\nQuick-and-easy refilling proven with easy-to-use certification by the Swedish Rheumatism Association\nThe sealed bottle with single-use pump secures good hygiene and reduces the risk of cross-contamination\nThe bottle collapses as the contents are used, reducing waste.', 0, '', '', '', 29.69, 'https://drive.google.com/file/d/1W4vEcyZf0COUwr9i33ZmrNDW9uVlKk7M/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 12, 34, 'Matic Toilet Roll', '', '36 rolls per case.', 0, '', '', '', 40.32, 'https://drive.google.com/file/d/1YUGyCv9dcGC1BNKjiuR_FxtrEwbactnv/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 12, 34, 'CENTREFEED TOILET ROLL 2 PLY - 200M x 13cm', '', '6 x 200m', 0, '', '', '', 17.65, 'https://drive.google.com/file/d/1C3Cwvt26ZcG7VBM-HJ3jwtap9yy2U1Xj/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 12, 34, 'CORELESS TOILET ROLL 2 PLY WHITE - 90m X 9.5cm', '', '36 rolls per case.', 0, '', '', '', 39.15, 'https://drive.google.com/file/d/11HNe_sxwYr8uPVlyhDpC7--OUwIBEjnA/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 12, 36, 'COCKTAIL NAPKIN 2 PLY WHITE - 24cm x 24cm', '', '4000 per case', 0, '', '', '', 34.85, 'https://drive.google.com/file/d/14EravynHNORvAdfHk0sB1tySpJQg2-87/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 12, 36, 'TUSCANY SERVIETTE 2 PLY WHITE ¼ FOLD - 38cm x 38cm', '', '2000 per case', 0, '', '', '', 34.87, 'https://drive.google.com/file/d/1GQqoCkPM6R5yE-BXdYT2u_oiIH7IJChw/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 13, 37, 'Microfibre Long Pile Mop', '', 'Long pile holds more water & dirt\nWith pockets\n \n\nNo need for pre-sweeping\nGreat for larger mopping areas, canteens/kitchens etc\n80/20 polyester/polyamide', 0, '', '', '', 11.73, 'https://drive.google.com/file/d/1MK9SfXKku1JjblW-gemSd9O5NcmbyYS5/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 13, 37, 'Microfibre Scrub Mop', '', 'With colour coded tabs, ears and pockets.\n \n\nCan be used with both \'clip-frame\' and \'break-frame\'\nMore abrasive for tougher cleaning, ideal for cleaning tougher safety flooring.\nFully washable', 0, '', '', '', 7.1, 'https://drive.google.com/file/d/1WdHj1NTKEw1yBZRMMSt6wIWql3P3cVrm/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 13, 37, 'Standard Microfibre Mophead', '', 'Microfibre mop head\nFully washable\nColour coded', 0, '', '', '', 8.7, 'https://drive.google.com/file/d/1TYyt9K6h9G9H9ujrKcgpHuefncY-vrNf/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 13, 37, 'Exel Fitting Socket Mop', '', 'The patented Exel® fitting. Exel® sockets are hard wearing. \n\nThe \'Push-Pull\' type fitting prevents socket loosening from handle during wringing. Universal colour coded plastic Exel® socket collar fitting screws or pushes onto handle. Available in both PY and Twine yarn.', 0, '', '', '', 1.4, 'https://drive.google.com/file/d/15OdVrR3sfHFATq-RWu0QCDGs5D-IYN0J/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 13, 37, 'Exel Revolution Socket Mops', '', 'A Hygiemix socket mop but with an Exel Socket. \n\n \n\nA launder-able mop up to 60°C. Produced from a unique 50/50 blend of bleached cotton and synthetic yarn for absorbency and strength. Improved performance circular profile looped white yarn with colour-coded band mop socket. \n \n\nWashable mop\nStayflat looped end mop\n50/50 mix of polyester & cotton yarn mop\nColour coded mop\nAlso available in antibacterial biofresh yarn', 0, '', '', '', 4.59, 'https://drive.google.com/file/d/1WEz4Kz0L8dPDqBUfw0cxCXsEwvc9sRYR/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 13, 38, 'Colour Coded Aluminium handles', '', 'With screw thread to fit mop range, colour coded brooms and hygiene brooms.', 0, '', '', '', 10.29, 'https://drive.google.com/file/d/1ONJSIfDh_N64Nc4krC1oHieUFwly2dsi/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 13, 38, 'Aluminium Telescopic Handles', '', 'Extends up to 184cm.\n\nfor use with flat mopping systems.\n\nAvailable in all 4 colours.', 0, '', '', '', 17.11, 'https://drive.google.com/file/d/19pwWQZL9prGk1qXjNJqIGPjwsq0fKfAh/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 13, 38, 'V Sweeper Kit', '', 'A dry dust control system. \n\n \n\nDesigned for sweeping large smooth floor areas such as airports, hotel lobbies, shopping centres etc.\n\nAll heads are machimne washable.\n\nRequires assembly. Complete in 1 case.', 0, '', '', '', 88.79, 'https://drive.google.com/file/d/1WNiJ37uLwZmZB59_lKJK7ZTmtJsrrIO7/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 13, 38, 'Exel Mop Handles', '', 'Lightweight aluminium handle with colour coded grip & easy push fit fitting for Exel® sockets.\n \n\nFits all Exel® sockets', 0, '', '', '', 10.3, 'https://drive.google.com/file/d/1FNRkoSDCAC-nVC-tMpYuVO1JWyN31DgM/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 13, 38, 'Wall tidy', '', 'Keep your broom cupboards tidy with this high quality push and grip system which accomodates 3 handles from 9 to 35mm diameter. Available in 5 colours including white. ', 0, '', '', '', 18.23, 'https://drive.google.com/file/d/1D8k2wD682gwcEASMplzDX5ZY9QmoF7lE/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 13, 39, 'Hanging \'Closed For Cleaning\' Door Safety Sign', '', 'Easy to use, suits door widths from 70cm to 95cm\nSign simply ‘rolls-up’ and packs away for easy storage.\nRubber cap ends providing grip and protection against door frame.\n\nThe essential spring loaded ‘Closed for Cleaning’ warning sign. Forms a perfect barrier to prevent unwanted entry whilst cleaning is in progress. Suitable for doorways in public areas, such as airports, stations, retail outlets, hotels, offices, education facilities and factories. Manufactured from strong, resilient but flexible materials for long-life and effortless use. ', 0, '', '', '', 1.49, 'https://drive.google.com/file/d/133Iredn22LxI8n4vB9-Zox1Elgr0n3KA/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 13, 39, 'Multi-Lingual Safety Cones', '', 'Highly visible vivid yellow 4 sided cones to warn of slippery wet floors. Tough and durable weatherproof polypropylene for use both indoors and outdoors as required. Imprinted with industry standard wet floor sign with ‘CAUTION’ in 5 languages: English, German, French, Spanish and Dutch.\n \n\n \n\nStandard Cone: • Height: 67.5cm • Width: 28cm • D: 28cm\nLarge Cone: • Height: 91cm • Width: 32cm • D: 32cm', 0, '', '', '', 47.05, 'https://drive.google.com/file/d/1JE7uUEz7eG3LR8QNpebvRljVWWInP1sE/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 13, 45, '24 Ltr Bison Bucket & Wringer', '', 'A good quality contract bucket and wringer, at a super saver price.\n \n\n24 litre\nColour coded', 0, '', '', '', 85.74, 'https://drive.google.com/file/d/1F1zpQkMwSebgtMA8SApp52S9Dfk_Cd2x/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 13, 45, 'Ambassador Heavy Duty Steel Mop Wringer', '', 'Gear operated, zinc coated with/without colour sided panels. Nylon pressure bars. \n \n\nUse with mops 350-560gm (12-20oz)', 0, '', '', '', 83.25, 'https://drive.google.com/file/d/15Mbuu-KAKd0JcalJNDwuEHkCemKFKZNd/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 13, 40, 'Zinc Plated Steel Frame Floor Squeegee', '', 'Specially selected foam rubber squeegee provides maximum flexibility on uneven floors.\n \n\nRecommended handle for metal squeegee - YYL*07', 0, '', '', '', 9.26, 'https://drive.google.com/file/d/1gPALt9enUCh5UA4_qLePE82XUd5b3H1p/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 14, 41, '26” x 44” Libra', '', '65 micron Extra Heavy Duty black refuse sacks on rolls, 25 sacks per roll, 8 rolls per case\n\nSuitable for commercial kitchen and industrial waste, can hold up to 21kg’s', 0, '', '', '', 22.27, 'https://drive.google.com/file/d/101f6-6Q6fB-RTo2kPiJyRPrgO5_T23Ey/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 14, 41, '26” x 44” Pisces', '', '37.5 micron Standard black refuse sacks on rolls, 25 sacks per roll, 8 rolls per case\n\nSuitable for domestic and light commercial waste, can hold up to 10kg’s', 0, '', '', '', 21.88, 'https://drive.google.com/file/d/1ZpE-7Coljq1MlJepWEJi8HH5eKblONB4/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 14, 41, '26” x 44” Gemini', '', '55 micron Heavy Duty black refuse sacks on rolls, 25 sacks per roll, 8 rolls per case\n\nSuitable for commercial kitchen and industrial waste, can hold up to 17kg’s', 0, '', '', '', 35.62, 'https://drive.google.com/file/d/16SUa535c52LQHKUBD91ZFUzBr-nTZvBn/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 14, 41, '18\" x 29\" x 39\" HAWK', '', '40 Micron Standard Black Refuse sacks suitable for a \"slim jim\" bin, loose 200 per case.\n\nSuitable for domestic and light commercial waste, can hold up to 12kg’s', 0, '', '', '', 21.18, 'https://drive.google.com/file/d/142zTabWTM8nYYU29MM3_zaShmcpJ6rGF/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 14, 42, '26” x 44” Taurus', '', '40 micron Standard clear refuse sacks on rolls, 25 sacks per roll, 8 rolls per case\n\nSuitable for domestic and light commercial waste, can hold up to 12kg’s', 0, '', '', '', 31.47, 'https://drive.google.com/file/d/1mnFwTwHv7XMxgDtIMC-L3fEGttljSWfq/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 14, 42, '18\" x 29\" x 39\" Rio Grande', '', '40 Micron Standard Clear Refuse sacks suitable for a \"slim jim\" bin, loose 200 per case.\n\nSuitable for domestic and light commercial waste, can hold up to 12kg’s', 0, '', '', '', 36.7, 'https://drive.google.com/file/d/10oFhlq7VSRcMv9xPRtGCsBO7xQnP2xSx/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 14, 43, '13” x 25” x 30” Bin 30 hd 100% biodegradable \"Swing Bin Liners\"\n', '', '15 micron white 100% degradable High Density swing bin liners on rolls, 25 liners per roll, 20 rolls per case\n\nSuitable for light waste, can hold up to 4.5kg’s', 0, '', '', '', 16.33, 'https://drive.google.com/file/d/1ruKpMsIf1yVg71lF5ROQB7JxlLBCcL71/view?usp=sharing\n', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 14, 45, '13” x 25” x 20” Bin 20 hd 100% biodegradable \"Pedal Bin Liners\"', '', '15 micron white 100% degradable High Density pedal bin liners on rolls, 25 liners per roll, 20 rolls per case\n\nSuitable for light waste, can hold up to 4.5kg’s', 0, '', '', '', 14.5, 'https://drive.google.com/file/d/1iB2x7JupuGBL7zuT9eUXCF30q5vGY6En/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 14, 45, '11\" x 17\" x 18\" Cosmos \"Office Bin Liner\"', '', '6 micron white High Density office bin liners on rolls, loose packed 1000 per case (10 x 100)\n\nSuitable for light office waste, can hold up to 2-3 kg’s.', 0, '', '', '', 17.95, 'https://drive.google.com/file/d/1pB63iuPxvMetXwjORrUb5tPQODqiU7Vv/view?usp=sharing', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '9309_1621075283.jpg', '2021-05-15 10:41:24', '2021-05-15 10:41:24'),
(2, 1, '7763_1621075284.jpg', '2021-05-15 10:41:25', '2021-05-15 10:41:25'),
(7, 2, '3296_1621077113.jpg', '2021-05-15 11:11:54', '2021-05-15 11:11:54'),
(9, 2, '7767_1621077114.jpg', '2021-05-15 11:11:54', '2021-05-15 11:11:54'),
(11, 2, '9892_1621077115.jpg', '2021-05-15 11:11:55', '2021-05-15 11:11:55'),
(12, 3, '5720_1621264063.png', '2021-05-18 03:37:43', '2021-05-18 03:37:43'),
(13, 3, '2124_1621264063.png', '2021-05-18 03:37:48', '2021-05-18 03:37:48'),
(14, 103, '8049_1654774977.jpeg', '2022-06-10 00:13:01', '2022-06-10 00:13:01'),
(15, 106, '6965_1654775078.jpeg', '2022-06-10 00:14:38', '2022-06-10 00:14:38'),
(16, 106, '5848_1654775121.jpeg', '2022-06-10 00:15:21', '2022-06-10 00:15:21'),
(17, 107, '2761_1654836425.jpeg', '2022-06-10 17:17:05', '2022-06-10 17:17:05');

-- --------------------------------------------------------

--
-- Table structure for table `refund_policy`
--

CREATE TABLE `refund_policy` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `refund_policy`
--

INSERT INTO `refund_policy` (`id`, `heading`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Refund Policy', '<h3 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 18px; font-weight: 600; color: rgb(51, 51, 51);\">Returns &amp; Refunds</h3><h2 style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Georgia, serif; font-size: 20px; font-weight: 600; color: rgb(51, 51, 51);\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-size: 14px; font-weight: 400; color: rgb(146, 146, 146);\">Please check the contents of your Delany performance feeds package on arrival. Should any items be damaged during shipment, it is important that you notify upon opening the package. Also, please keep all packaging materials from the shipment.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-size: 14px; font-weight: 400; color: rgb(146, 146, 146);\">Your statutory rights are not affected by any of these conditions.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; font-size: 14px; font-weight: 400; color: rgb(146, 146, 146);\"><br></p></h2>', '2021-03-25 09:10:56', '2021-04-02 09:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `action_id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `name_slug` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `section_id`, `action_id`, `name`, `name_slug`, `url`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, '1,2,3', 'Actions', 'actions', 'actions.index', 1, '2021-02-12 04:48:53', '2021-02-23 00:35:50'),
(2, 1, '1,2,3', 'Sections', 'sections', 'sections.index', 2, '2021-02-12 04:49:49', '2021-02-23 00:35:56'),
(3, 1, '1,2,3', 'Roles', 'roles', 'roles.index', 3, '2021-02-12 04:50:11', '2021-02-23 00:35:58'),
(4, 3, '1,2,3,8', 'Sub Admin', 'sub_admin', 'sub_admin.index', 1, '2021-02-11 23:21:45', '2021-02-23 01:38:09'),
(7, 3, '1,2,3,4,8,9', 'Users', 'users', 'users.index', 2, '2021-02-22 23:55:06', '2021-03-04 23:04:25'),
(11, 9, '1,2,3,8', 'Brands', 'brands', 'brands.index', 1, '2021-03-04 00:11:31', '2021-04-23 09:28:22'),
(23, 13, '4,3', 'Contacts', 'contacts', 'contacts.index', 1, '2021-03-16 05:49:55', '2021-03-16 05:49:55'),
(25, 9, '1,2,3,8', 'Products', 'products', 'products.index', 3, '2021-03-20 07:28:45', '2021-03-20 07:28:45'),
(26, 12, '2', 'Our Environment', 'our_environment', 'our_environment.index', 0, '2021-04-01 12:07:33', '2021-04-23 08:15:33'),
(27, 12, '2', 'About Us', 'about_us', 'about_us.index', 0, '2021-04-01 12:30:16', '2021-04-01 12:30:16'),
(28, 12, '2', 'Terms And Conditions', 'terms_and_conditions', 'terms_and_conditions.index', 0, '2021-04-01 12:37:29', '2021-04-01 12:37:29'),
(29, 12, '2', 'Privacy Policy', 'privacy_policy', 'privacy_policy.index', 0, '2021-04-01 12:40:17', '2021-04-01 12:40:17'),
(30, 12, '2', 'Refund Policy', 'refund_policy', 'refund_policy.index', 0, '2021-04-01 12:42:26', '2021-04-01 12:42:26'),
(31, 12, '2', 'Shipping/Delivery Policy', 'shippingdelivery_policy', 'shippingdelivery_policy.index', 0, '2021-04-01 12:51:20', '2021-04-01 12:51:20'),
(32, 14, '2', 'Shipping', 'shipping', 'shipping.index', 0, '2021-04-02 05:00:29', '2021-04-02 05:22:12'),
(33, 14, '2,8', 'Tax', 'tax', 'tax.index', 0, '2021-04-02 05:27:31', '2021-04-03 06:17:55'),
(36, 17, '4', 'Orders', 'orders', 'orders.index', 0, '2021-04-05 09:24:19', '2021-04-05 09:24:19'),
(37, 9, '1,2,3,8', 'Categories', 'categories', 'categories.index', 2, '2021-05-05 10:31:19', '2021-05-05 10:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `section_title` varchar(200) NOT NULL,
  `section_slug` varchar(200) NOT NULL,
  `section_order` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section_title`, `section_slug`, `section_order`, `created_at`, `updated_at`) VALUES
(1, 'Modules', 'modules', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Product Management', 'product-management', 3, '2021-03-04 05:40:48', '2021-03-20 12:59:01'),
(12, 'Pages Management', 'pages-management', 2, '2021-03-09 16:10:25', '2021-03-20 11:56:58'),
(13, 'Website Enquiry', 'website-enquiry', 10, '2021-03-16 11:01:20', '2021-03-16 11:01:20'),
(14, 'Shipping and Tax', 'shipping-and-tax', 4, '2021-04-02 10:28:23', '2021-04-02 10:28:23'),
(17, 'Order Management', 'order-management', 7, '2021-04-05 14:53:17', '2021-04-05 14:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, '353 1 429 8710', 'sales@mghygiene.ie', '45 JFK , Industrial Estate, Bluebell, Dublin 12', '2021-03-20 09:21:03', '2021-04-29 00:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `shippingdelivery_policy`
--

CREATE TABLE `shippingdelivery_policy` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippingdelivery_policy`
--

INSERT INTO `shippingdelivery_policy` (`id`, `heading`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Shipping/Delivery Policy', '<h3 style=\"box-sizing: inherit; margin: 2rem 0px 1rem; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.4; vertical-align: baseline; font-family: Futura, sans-serif; font-size: 21px; letter-spacing: -0.02em; text-transform: uppercase;\"><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline;\"><span style=\"font-size: 10pt; border: 1pt none windowtext; padding: 0cm;\"><span style=\"font-family: Tahoma;\">*Please note there may be delays to orders due to the current situation regarding Covid-19.*</span></span></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline;\"><span style=\"font-size: 10pt; border: 1pt none windowtext; padding: 0cm;\"><span style=\"font-family: Tahoma;\"><br></span><u></u><u></u></span></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline;\"><span style=\"font-size: 10pt; border: 1pt none windowtext; padding: 0cm;\">We deliver&nbsp;within the Republic of Ireland within 4 – 5 working days. (Please bear in mind that working days exclude the weekend &amp; bank holidays).<u></u><u></u></span></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; vertical-align: baseline;\"><span style=\"font-size: 10pt; border: 1pt none windowtext; padding: 0cm;\">Standard deliveries are made between the hours of 8am and 6pm, Monday to Friday. A signature will be required upon delivery.</span><span style=\"font-size: 10pt; font-family: Arial, sans-serif;\"><u></u><u></u></span></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><br></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\">Supplement Delivery: €4.95 per order within Ireland<u></u><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><u></u><span style=\"color: inherit;\">Dog Food Delivery: €8.00 per every bag within Ireland – Orders over 10 bags contact Alan for a discount quote.</span></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><u></u><span style=\"color: inherit;\">Horse Feed Delivery:</span></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\">Please note, there is a minimum order of 30 bags of horse feed.<u></u><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\">Pallets can be made up of a mixed selection of bags of horse feed /dog food<u></u><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\">Delivery €30.00 per horse feed order up to 49 bags within Ireland. Orders of 50 bags (pallet) free delivery within Ireland<u></u><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><u></u>&nbsp;<u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\">*A mixed order of horse feed and dog food totalling &nbsp;50 bags (pallet) free delivery within Ireland.<u></u><u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\"><u></u>&nbsp;<u></u></p><p class=\"MsoNormal\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-family: Arial, Helvetica, sans-serif; font-size: small; letter-spacing: normal; text-transform: none;\">**Any Delivery outside of Ireland please contact Alan, 00353 086 820 2874 directly for a quote.</p></h3>', '2021-03-25 09:10:56', '2021-04-16 23:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `shipping_method` varchar(100) NOT NULL COMMENT 'Package, Pallet',
  `cart_amount` double NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `shipping_method`, `cart_amount`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Fixed', 0, 10, '2021-04-23 10:52:54', '2021-04-23 10:57:30'),
(2, 'Free', 100, 0, '2021-04-23 10:52:54', '2021-04-23 10:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

CREATE TABLE `shipping_address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `first_name1` varchar(100) DEFAULT NULL,
  `last_name1` varchar(100) DEFAULT NULL,
  `company_name1` varchar(255) DEFAULT NULL,
  `country1` varchar(100) NOT NULL DEFAULT 'Ireland',
  `county1` varchar(100) DEFAULT NULL,
  `street_address1` varchar(255) DEFAULT NULL,
  `town_city1` varchar(100) DEFAULT NULL,
  `eircode1` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping_address`
--

INSERT INTO `shipping_address` (`id`, `customer_id`, `first_name1`, `last_name1`, `company_name1`, `country1`, `county1`, `street_address1`, `town_city1`, `eircode1`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ritu', 'Nagar', NULL, 'Ireland', 'Carlow', 'vjvjv', 'Ghaziabad', '', '2021-04-27 22:42:55', '2021-04-27 22:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(11) NOT NULL,
  `tax` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `tax`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2021-04-02 05:38:31', '2021-04-23 11:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `terms_conditions`
--

CREATE TABLE `terms_conditions` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `terms_conditions`
--

INSERT INTO `terms_conditions` (`id`, `heading`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Terms And Conditions', '<h4 class=\"checkout-trem\" style=\"font-weight: 700; font-size: 36px; color: rgb(128, 156, 0); padding-bottom: 22px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">General statement</h4><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">We respect your right to privacy. Visitors are advised that each time they visit a Website, two general levels of information about their visit can be retained. The first level comprises statistical and other analytical information collected on an aggregate and non-individual specific basis of all browsers who visit the site. The second is information which is personal or particular to a specific visitor who knowingly chooses to provide that information.</p><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">The statistical and analytical information provides general and not individually specific information about the number of people who visit this Website; the number of people who return to this site; the pages that they visit; where they were before they came to this site and the page in the site at which they exited. This information helps us monitor traffic on our Website so that we can manage the site’s capacity and efficiency. It also helps us to understand which parts of this site are most popular and generally to assess user behaviour and characteristics in order to measure interest in and use of the various areas of the site.</p><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">Through this Website you may have an opportunity to send us information, such as through the \"registration\" pages or any other area where you may send e-mails, provide feedback, etc. By choosing to participate in these, you will be providing us with some level of personal information relating to you. This information will only be used by this site for:</p><ul style=\"padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 16px;\"><li style=\"list-style: none;\">1. the purposes for which it was provided by you;</li><li style=\"list-style: none;\">2. verification purposes and statistical analysis; and</li><li style=\"list-style: none;\">3. marketing and administration purposes.</li></ul><h4 class=\"checkout-trem\" style=\"font-weight: 700; font-size: 36px; color: rgb(128, 156, 0); padding-bottom: 22px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">General statement</h4><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">Personal information: information that is associated with your name or personal identity. The this site Website does not collect any personal data about you on this Website, apart from information which you volunteer (for example, by emailing us, or registering with us). Any information which you provide in this way is not made available to any third parties, and is used by this site only in line with the purpose for which you provided it.</p><h4 class=\"checkout-trem\" style=\"font-weight: 700; font-size: 36px; color: rgb(128, 156, 0); padding-bottom: 22px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">General statement</h4><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">Non-personal information: data collected for statistical purposes which is not associated with a specific identity. This site collects and analyses technical information in order to evaluate our Website. The type of technical information we log is confined to the following:</p><ul style=\"padding: 0px; color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 16px;\"><li style=\"list-style: none;\">The IP address*1 of the visitor’s Web server</li><li style=\"list-style: none;\">The IP address*1 of the visitor’s Web server</li><li style=\"list-style: none;\">The pages visited on the this site Website, i.e. URL’s*2 visited</li><li style=\"list-style: none;\">The previous Website address from which the visitor reached us, including any search terms used</li><li style=\"list-style: none;\">Clickstream data which shows the traffic of visitors around this Website (for example, pages accessed)</li></ul><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">*1 An IP address is an identifier for a computer or device on a Transmission Control Protocol/Internet Protocol (TCP/IP) network, such as the World Wide Web. Networks use the TCP/IP protocol to route information based on the IP address of the destination. In other words, an IP address is a number that is automatically assigned to your computer whenever you are surfing the Web, allowing Web servers to locate and identify your computer. Computers require IP addresses in order for users to communicate on the Internet, browse and shop.</p><p style=\"font-family: Poppins; color: rgb(119, 119, 119); font-size: 16px;\">*2 A URL (Uniform Resource Locator) is the global address of documents and other resources on the World Wide Web.</p>', '2021-03-25 09:10:56', '2021-04-26 05:45:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'admin,sub_admin,user',
  `account_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Office,Service,Account',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(111) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` varchar(111) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` varchar(111) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `account_type`, `name`, `email`, `mobile`, `password`, `remember_token`, `status`, `lat`, `lng`, `device_id`, `fcm_token`, `is_deleted`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, 'admin', 'admin@gmail.com', NULL, '$2a$10$uSg7M8jeVM2Y5yvGyMOSlOoakmMqeHmeRNcP4zrbq4sWfK3OgJNIK', NULL, '1', NULL, NULL, NULL, NULL, 'N', '2022-06-10 10:22:40', '2021-01-18 03:37:04', '2022-06-10 17:22:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_limits`
--
ALTER TABLE `cart_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_coupons`
--
ALTER TABLE `discount_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_environments`
--
ALTER TABLE `our_environments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_environment_images`
--
ALTER TABLE `our_environment_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_policy`
--
ALTER TABLE `refund_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippingdelivery_policy`
--
ALTER TABLE `shippingdelivery_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_limits`
--
ALTER TABLE `cart_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `county`
--
ALTER TABLE `county`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discount_coupons`
--
ALTER TABLE `discount_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `our_environments`
--
ALTER TABLE `our_environments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `our_environment_images`
--
ALTER TABLE `our_environment_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `privacy_policy`
--
ALTER TABLE `privacy_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `refund_policy`
--
ALTER TABLE `refund_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippingdelivery_policy`
--
ALTER TABLE `shippingdelivery_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_address`
--
ALTER TABLE `shipping_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms_conditions`
--
ALTER TABLE `terms_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
