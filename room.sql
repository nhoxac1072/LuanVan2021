-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3308
-- Thời gian đã tạo: Th6 21, 2021 lúc 01:34 PM
-- Phiên bản máy phục vụ: 5.7.28
-- Phiên bản PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `room`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` int(10) NOT NULL AUTO_INCREMENT,
  `day_set` datetime NOT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'Tin phòng'),
(2, 'Ẩm thực');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `image_id` int(10) NOT NULL AUTO_INCREMENT,
  `room_id` int(10) UNSIGNED NOT NULL,
  `room_image` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `room_id` (`room_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`image_id`, `room_id`, `room_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'room-295.jpg', NULL, '2021-06-11 03:18:49'),
(2, 2, 'room-386.jpg', NULL, '2021-06-11 03:18:39'),
(3, 3, 'hotel2076.jpg', NULL, NULL),
(4, 1, 'room17331.jpg', '2021-06-11 10:53:36', '2021-06-11 10:53:36'),
(5, 4, 'room223.jfif', '2021-06-12 01:38:19', '2021-06-16 01:34:35'),
(17, 8, 'images54.jfif', '2021-06-15 20:18:06', '2021-06-15 20:18:06'),
(18, 8, 'room153.jfif', '2021-06-15 20:18:06', '2021-06-15 20:18:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_03_16_124657_admin', 1),
(2, '2021_03_17_074248_customer', 1),
(3, '2021_03_20_034846_type', 1),
(4, '2021_03_20_034856_room', 1),
(5, '2021_03_26_035401_order', 1),
(6, '2021_03_26_035809_order_details', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `new`
--

DROP TABLE IF EXISTS `new`;
CREATE TABLE IF NOT EXISTS `new` (
  `new_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_name` text NOT NULL,
  `new_content` text NOT NULL,
  `new_image` varchar(20) NOT NULL,
  `date_post` date NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`new_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `new`
--

INSERT INTO `new` (`new_id`, `new_name`, `new_content`, `new_image`, `date_post`, `cat_id`) VALUES
(1, 'MO TA 1', 'NOI DUNG 1', 'blog-266.jpg', '2021-06-10', 2),
(2, 'MO TA 2', 'NOI DUNG 2', 'blog-293.jpg', '2021-06-21', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(10) UNSIGNED DEFAULT NULL,
  `day_order` datetime NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 NOT NULL,
  `total` double(8,2) NOT NULL,
  `status` int(2) NOT NULL,
  `deposit` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `room_price` float NOT NULL,
  `room_qty` int(2) NOT NULL,
  `adults` int(2) NOT NULL,
  `children` int(2) NOT NULL,
  `dayat` date NOT NULL,
  `dayout` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(10) NOT NULL,
  `order_status_name` varchar(100) NOT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(2) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(0, 'khách hàng'),
(1, 'nhân viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `room_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `room_price` float NOT NULL,
  `room_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quality` int(3) NOT NULL,
  `room_status` int(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `room`
--

INSERT INTO `room` (`room_id`, `type_id`, `room_name`, `room_price`, `room_description`, `quality`, `room_status`, `created_at`, `updated_at`) VALUES
(1, 8, '001', 4500000, 'rộng rãi thoáng mát có nv sinh rienge', 3, 1, NULL, '2021-06-11 03:18:49'),
(2, 2, '002', 500000, 'phòng cho cặp đôi có chỗ cho con cá', 5, 1, NULL, '2021-06-11 03:17:44'),
(3, 1, '003', 6540000, 'còn gì bằng', 2, 1, '2021-05-25 02:19:02', '2021-06-10 22:32:36'),
(4, 2, 'kalinda', 1000000, 'dấdsa', 3, 1, '2021-06-12 01:38:19', '2021-06-16 01:34:46'),
(8, 7, '006', 360000, 'gần chugn srs', 3, 1, '2021-06-15 20:18:06', '2021-06-15 20:18:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'đơn', 1, NULL, '2021-06-07 20:18:17'),
(2, 'đôi', 1, NULL, '2021-06-07 20:21:38'),
(7, 'gia đình', 1, '2021-05-24 21:52:33', '2021-06-07 20:21:40'),
(8, 'đa dụng', 1, '2021-05-24 21:52:44', '2021-06-07 20:18:18'),
(9, 'boss', 1, '2021-05-25 06:28:33', '2021-06-07 20:18:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(12) CHARACTER SET utf8 NOT NULL,
  `role` int(2) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`users_id`, `name`, `email`, `password`, `phone`, `role`, `address`, `created_at`, `updated_at`) VALUES
(1, 'nguyễn văn toàn', 'nguyenvantoan1072@gmail.com', '123456', '0121456789', 1, '123 cao lổ', NULL, NULL),
(2, 'oyu name', 'kangxin@gmail.com', '123456', '1234568520', 0, '162 tạ quang kháng', '2021-06-19 01:55:07', '2021-06-19 01:55:07'),
(3, 'NGUYỄN kang theo', 'toila@gmail.com', '123456', '0121456789', 1, '255 xíu địa chỉ, q2', '2021-06-20 02:48:43', '2021-06-20 02:48:43');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Các ràng buộc cho bảng `new`
--
ALTER TABLE `new`
  ADD CONSTRAINT `new_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Các ràng buộc cho bảng `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
