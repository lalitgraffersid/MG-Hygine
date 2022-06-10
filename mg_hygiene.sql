-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2021 at 12:10 AM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.27

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
(1, 'Test', 'test', '7221_1619172369.png', 1, '2021-04-23 10:03:17', '2021-04-23 10:06:17'),
(2, 'Test 2', 'test-2', '8140_1620292247.png', 1, '2021-05-06 09:10:47', '2021-05-06 09:10:47'),
(3, 'Nector', 'nector', '8974_1621263875.png', 1, '2021-05-18 03:34:36', '2021-05-18 03:34:36');

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
(8, 'jbHELKFQyBj8RSxhlg10vpN0jvhoywRLctssNHTZ', '2Y3EKBAH', 2, 'Small', 'Black', 100, 2, 200, '', 0, 'Free', 0, 20, 220, '2021-11-12 19:31:35', '2021-11-12 19:31:54');

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
(4, 3, 'Cleaning', 1, '2021-05-18 03:34:53', '2021-05-18 03:34:53');

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
(1, 1, 1, 'Product 1', 'product-1', 'slcnjasncjasncjasncjasncjasncjnasjcnsajcndsjncj saj ncjiasncjnasjicnm', 0, '', '', '', 100, NULL, 1, '2021-05-15 10:41:23', '2021-05-15 10:41:23'),
(2, 2, 3, 'Product 3', 'product-3', 'lksvmksdmcksdmcksdnkjc dsvckjsd njc dsjc njsd cj dsnjc', 1, 'Small,Medium,Large', 'Black,Black,Blue', '100,200,300', 0, NULL, 1, '2021-05-15 10:59:08', '2021-05-15 11:22:17'),
(3, 3, 4, 'Floor Cleaner', 'floor-cleaner', 'This is test description', 1, '1 kg,1 kg', 'blue,black', '1000,90', 0, NULL, 1, '2021-05-18 03:37:43', '2021-05-18 03:37:43');

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
(13, 3, '2124_1621264063.png', '2021-05-18 03:37:48', '2021-05-18 03:37:48');

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
(1, 'admin', NULL, 'admin', 'admin@gmail.com', NULL, '$2y$10$m.ZzMzbG21B6vHIUYqe5bOCKPOdDbnC3nYWBUA4pdye5w9FSFk4KW', NULL, '1', NULL, NULL, NULL, NULL, 'N', '2021-07-08 12:22:14', '2021-01-18 03:37:04', '2021-07-08 19:22:14');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_limits`
--
ALTER TABLE `cart_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
