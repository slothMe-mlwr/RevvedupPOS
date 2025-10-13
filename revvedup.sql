-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2025 at 04:57 PM
-- Server version: 9.3.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `revvedup`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL,
  `reference_number` int NOT NULL,
  `service` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `employee_id` int NOT NULL,
  `appointment_customer_id` int NOT NULL,
  `fullname` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `street` text COLLATE utf8mb4_general_ci NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` time NOT NULL,
  `emergency` tinyint(1) DEFAULT '0',
  `status` enum('pending','request canceled','approved','canceled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `seen` int NOT NULL DEFAULT '0' COMMENT '0=unseen,1=seen',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `reference_number`, `service`, `employee_id`, `appointment_customer_id`, `fullname`, `contact`, `city`, `street`, `appointmentDate`, `appointmentTime`, `emergency`, `status`, `seen`, `created_at`) VALUES
(17, 561535, 'Brake Service', 8, 1, 'john doe', '09454454744', '', '', '2025-09-30', '14:45:00', 1, 'approved', 1, '2025-09-30 06:46:02'),
(18, 635986, 'Engine Repair', 9, 1, 'john doe', '09454454744', '', '', '2025-10-08', '09:12:00', 1, 'approved', 1, '2025-10-08 02:12:39'),
(19, 755112, 'Engine Repair', 9, 1, 'joshua san padilla', '09454454741', 'Angono', 'sta.rosa 2 marilao', '2025-10-08', '10:40:00', 0, 'canceled', 1, '2025-10-08 02:40:09'),
(20, 247723, 'Engine Repair', 10, 1, 'Joshua Anderson Padilla', '09454454741', 'Antipolo', 'acacia123', '2025-10-09', '08:00:00', 0, 'approved', 1, '2025-10-08 06:17:48'),
(21, 310483, 'Engine Repair', 11, 4, 'honey jane moral', '091234', 'Antipolo', 'asd234sad', '2025-10-09', '15:22:00', 0, 'approved', 1, '2025-10-10 02:22:41'),
(22, 195276, 'Oil Change', 8, 5, 'gtvvtfvfvff', '09058085396', 'Antipolo', 'san roque', '2025-10-13', '14:47:00', 1, 'canceled', 1, '2025-10-12 05:48:03'),
(23, 596179, 'Engine Repair', 11, 5, 'gtgtgtgtg', '0045145785487457457', 'Antipolo', 'gbgttgtgt', '2025-10-13', '12:49:00', 0, 'approved', 1, '2025-10-12 05:49:57'),
(24, 191718, 'Engine Repair', 11, 4, 'honey jane moral', '091234', 'Antipolo', 'asd234sad', '2025-10-15', '10:17:00', 1, 'pending', 0, '2025-10-13 14:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `business_details`
--

CREATE TABLE `business_details` (
  `business_id` int NOT NULL,
  `business_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `business_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `business_contact_num` varchar(60) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_details`
--

INSERT INTO `business_details` (`business_id`, `business_name`, `business_address`, `business_contact_num`) VALUES
(2, 'reveveveup', 'sta.maria bulacan', '09454454744'),
(6, '[businessName]', '[businessAd]', '[090342343]');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_fullname` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_status` int NOT NULL DEFAULT '1' COMMENT '0=notactive,1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_fullname`, `customer_email`, `customer_password`, `customer_status`) VALUES
(1, 'joshua', 'joshua@gmail.com', '$2y$10$q4ZHWGUQ4NHj8ySLgBzTXOmP2SGMDlfYrDxv8j89sDTaX5A/YPqV2', 1),
(2, 'andy anderson', 'andersonandy046@gmail.com', '$2y$10$EbOfPhVjI/d9oOoAbIhpJ.qwJmiw8LP9SyZilCQq2FQaBvYMDRyUC', 1),
(3, 'honey jane', 'honey@gmail.com', '$2y$10$61znkLaYwPKvI6yhyg6ToeCZLXejP6kE4FhJkNPzXlPO1hi1wxTlu', 1),
(4, 'Glaiza Navarrete', 'glaiza@gmail.com', '$2y$10$iwiZ2TbVDDvEaoozuQDkWuou7KgKB9kIPYS1RqrgIiv6Cw3XcqQxS', 1),
(5, 'Glaiza Navarrete', 'navarreteglaiza998@gmail.com', '$2y$10$ONpsUP4Jv0aBEwRLP8sdm.45sXjyaHiMonbzna4s43KB4ZINuRBuW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

CREATE TABLE `deduction` (
  `deduction_id` int NOT NULL,
  `deduction_date` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `deduction_user_id` int NOT NULL,
  `deduction_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deduction`
--

INSERT INTO `deduction` (`deduction_id`, `deduction_date`, `deduction_user_id`, `deduction_amount`) VALUES
(7, 'September 2025 Week 5 ', 1, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `item_cart`
--

CREATE TABLE `item_cart` (
  `item_id` int NOT NULL,
  `item_user_id` int NOT NULL,
  `item_prod_id` int NOT NULL,
  `item_qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prod_capital` decimal(10,2) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_qty` int NOT NULL,
  `prod_img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prod_status` int NOT NULL DEFAULT '1' COMMENT '0=deleted,1=archived',
  `prod_category` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `prod_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_capital`, `prod_price`, `prod_qty`, `prod_img`, `prod_status`, `prod_category`, `prod_description`) VALUES
(1678, 'air filter click vario 150', 125.00, 350.00, 10, '1.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1679, 'APCC Air Filter Mio Sporty', 80.00, 250.00, 3, '2.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1680, 'APCC Air Filter XRM', 80.00, 250.00, 3, '3.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1681, 'APCC Air Filter Mio-Soul', 90.00, 250.00, 3, '4.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1682, 'APCC Air Filter Shogun/Smash', 90.00, 250.00, 3, '5.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1683, 'APCC Air Filter Beat FI', 90.00, 250.00, 3, '6.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1684, 'APCC Air Filter Honda/PCX150/ADV150', 120.00, 300.00, 3, '7.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1685, 'APCC Air Filter Nmax', 130.00, 300.00, 3, '8.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1686, 'click 160 air filter', 125.00, 350.00, 10, '9.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1687, 'COD Air Filter for Aerox 155', 100.00, 275.00, 10, '10.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1688, 'DNF Yamaha Mio Gear Gravis 125 Air Filter', 120.00, 300.00, 5, '11.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1689, 'fortune air filter aerox', 145.00, 350.00, 5, '12.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1690, 'gpc air filter click 125i/150i', 181.00, 350.00, 3, '13.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1691, 'gpc air filter click 160i', 181.00, 400.00, 4, '14.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1692, 'gpc air filter mio 125 mx', 120.00, 270.00, 4, '15.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1693, 'gpc air filter pcx150', 300.00, 400.00, 3, '16.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1694, 'gpc air filter raider150', 95.00, 300.00, 3, '17.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1695, 'marin air filter sniper washable', 205.00, 500.00, 5, '18.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1696, 'mrtr air filter sniper135', 85.00, 300.00, 1, '19.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1697, 'otaka air filter click 125', 130.00, 350.00, 6, '20.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1698, 'pcx 150 air filter', 125.00, 350.00, 4, '21.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1699, 'raider 150 air filter', 90.00, 250.00, 4, '22.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1700, 'stock air filter aerox v1', 185.00, 450.00, 2, '23.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1701, 'stock air filter beat fi ', 135.00, 350.00, 4, '24.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1702, 'stock air filter burgman', 136.00, 400.00, 3, '25.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1703, 'stock air filter click 125', 135.00, 350.00, 2, '26.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1704, 'stock air filter click 150', 135.00, 350.00, 2, '27.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1705, 'stock air filter m3', 75.00, 275.00, 8, '28.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1706, 'stock air filter mio 125', 135.00, 350.00, 3, '29.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1707, 'stock air filter nmax v1', 185.00, 450.00, 2, '30.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1708, 'stock air filter nmax v2', 185.00, 450.00, 4, '31.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1709, 'stock air filter sniper 150', 91.00, 300.00, 3, '32.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1710, 'sv air filter mio 125/m3', 100.00, 250.00, 5, '33.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1711, 'Universal Air Filter for Aerox 155', 99.00, 300.00, 10, '34.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1712, 'Yamaha Genuine Air Filter Nmax V2/Aerox V2', 170.00, 300.00, 10, '35.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(1713, 'bearing 6201', 50.00, 120.00, 10, '36.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1714, 'bearing 6301', 50.00, 120.00, 10, '37.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1715, 'bearing 6300', 50.00, 120.00, 10, '38.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1716, 'bearing 6203', 50.00, 120.00, 10, '39.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1717, 'bearing 6202', 50.00, 120.00, 10, '40.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1718, 'bearing 6004', 50.00, 120.00, 10, '41.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1719, 'NTN Bearings 6300 2RS Rubber Seal 10*35*11', 30.00, 150.00, 20, '42.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1720, 'NTN Bearings 6202 2RS Rubber Seal 15*35*11', 30.00, 150.00, 20, '43.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(1721, 'beast tire 70x80x14 4pr flash p6240 tl', 684.00, 1000.00, 4, '44.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1722, 'beast tire 70x80x17 4pr flash p6240 tl', 798.00, 1150.00, 4, '45.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1723, 'beast tire 80x80x17 4pr flash p6240 tl', 897.00, 1280.00, 4, '46.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1724, 'beast tire 80x80x14 4pr flash p6240 tl', 897.00, 1400.00, 3, '47.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1725, 'beast tire 90x80x17 4pr flash p6240 tl', 1178.00, 1650.00, 4, '48.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1726, 'beast tire 100x80x17 4pr flash p640 tl ', 1315.00, 1800.00, 2, '49.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1727, 'Beast Tire 90x80x14', 975.00, 1600.00, 1, '50.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1728, 'beast tire 110x70x13', 1280.00, 1700.00, 1, '51.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1729, 'beast tire 110x80x14', 1520.00, 1900.00, 1, '52.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1730, 'beast tire 130x70x13', 1680.00, 2100.00, 1, '53.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1731, 'Quick Tire 80x80x14', 875.00, 1400.00, 1, '54.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1732, 'Quick Tire 90x80x14', 1045.00, 1550.00, 3, '55.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1733, 'Quick Tire 90x80x14 (alt model)', 1440.00, 2000.00, 1, '56.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1734, 'Quick Tire 130x70x13', 1705.00, 2250.00, 2, '57.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1735, 'Quick Tire 140x70x14', 2045.00, 2545.00, 1, '58.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1736, 'zeneos 90xx80x14 49p zn88 tl', 1210.00, 1680.00, 2, '59.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1737, 'ball race click', 135.00, 450.00, 10, '60.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1738, 'ball race nmax', 135.00, 450.00, 10, '61.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1739, 'ball race xrm', 135.00, 450.00, 10, '62.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1740, 'ball race yamaha', 135.00, 450.00, 10, '63.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1741, 'Raider Ball Race Carb/FI', 180.00, 450.00, 6, '64.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1742, 'saiyan ball race aerox', 61.00, 450.00, 5, '65.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1743, 'saiyan ball race beat', 61.00, 450.00, 5, '66.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1744, 'saiyan ball race click', 101.00, 450.00, 5, '67.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1745, 'saiyan ball race mio', 61.00, 450.00, 5, '68.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1746, 'saiyan ball race nmax', 61.00, 450.00, 5, '69.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1747, 'saiyan ball race wave 100', 61.00, 450.00, 3, '70.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(1748, 'od battery ytx4l', 550.00, 880.00, 5, '71.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(1749, 'od battery ytz8v', 1050.00, 1650.00, 2, '72.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(1750, 'od battery 12nl', 650.00, 980.00, 3, '73.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(1751, 'od battery 12nl5l-bs', 700.00, 1100.00, 3, '74.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(1752, 'osaki brake cable beat fi v2', 148.00, 250.00, 3, '75.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1753, 'osaki brake cable euro daan hari', 77.00, 150.00, 1, '76.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1754, 'osaki brake cable tmx125 alpha front', 75.00, 200.00, 2, '77.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1755, 'otaka brake cable mio', 52.00, 150.00, 3, '78.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1756, 'otaka brake cable wave 125', 45.00, 150.00, 3, '79.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1757, 'sw brake cable beat', 55.00, 150.00, 2, '80.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1758, 'sw brake cable smash 115', 39.00, 150.00, 4, '81.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1759, 'sw brake cable r150', 35.00, 150.00, 2, '82.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(1760, 'gpc brake pad shogun/xrm trinity rear', 45.00, 120.00, 5, '83.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1761, 'grs brake pad shogun front', 25.00, 120.00, 5, '84.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1762, 'grs brake pad raider fi', 225.00, 120.00, 10, '85.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1763, 'mehol pcx brake pad R', 50.00, 220.00, 3, '86.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1764, 'mehol pcx brake pad F', 50.00, 220.00, 3, '87.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1765, 'osak pcx brake pad 160 F', 55.00, 200.00, 3, '88.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1766, 'osak pcx brake pad 160 R', 55.00, 200.00, 3, '89.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1767, 'rcb brake pad mio/y15zr/click', 250.00, 350.00, 5, '90.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1768, 'rz brake pad w125', 25.00, 120.00, 5, '91.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1769, 'rz brake pad beat', 25.00, 120.00, 5, '92.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1770, 'rz brake pad 2110/w100', 25.00, 120.00, 5, '93.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1771, 'saiyan brake pad beat new', 37.00, 120.00, 10, '94.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1772, 'saiyan brake pad click 125', 37.00, 120.00, 10, '95.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1773, 'saiyan brake pad m3', 37.00, 120.00, 10, '96.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1774, 'saiyan brake pad mio', 37.00, 120.00, 10, '97.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1775, 'saiyan brake pad pcx160/adv150 rear', 37.00, 120.00, 10, '98.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1776, 'saiyan brake pad wave 110', 37.00, 120.00, 5, '99.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1777, 'saiyan brake pad wave 125', 37.00, 120.00, 5, '100.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1778, 'smok brake pad w100', 65.00, 150.00, 5, '101.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1779, 'smok brake pad raider150 front', 65.00, 150.00, 5, '102.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1780, 'smok brake pad raider150 fi rear', 65.00, 150.00, 5, '103.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1781, 'vgt brake pad xrm trinity', 40.00, 120.00, 5, '104.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1782, 'vgt brake pad r150 rear', 40.00, 120.00, 5, '105.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1783, 'vgt brake pad sniper150 rear', 40.00, 120.00, 5, '106.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1784, 'XKD Brake Pad Beat/BeatFI/Burgman', 50.00, 150.00, 5, '107.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1785, 'zeno brake pad m3/aerox/nmax front', 65.00, 150.00, 10, '108.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1786, 'zeno brake pad beat front', 65.00, 150.00, 5, '109.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1787, 'zeno brake pad sniper155 front', 65.00, 150.00, 5, '110.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1788, 'zeno brake pad sniper 155 rear', 65.00, 150.00, 5, '111.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1789, 'zeno brake pad adv/pcx rear', 65.00, 150.00, 5, '112.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1790, 'zeno brake pad mio', 65.00, 150.00, 10, '113.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1791, 'zeno brake pad xrm trinity', 65.00, 150.00, 10, '114.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1792, 'zeno brake pad w125', 65.00, 150.00, 5, '115.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(1793, 'otaka brake rod xrm110', 28.00, 100.00, 5, '116.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE'),
(1794, 'otaka brake rod tmx150', 28.00, 100.00, 5, '117.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE'),
(1795, 'otaka brake rod barako', 27.00, 100.00, 5, '118.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE'),
(1796, 'Brake Shoe XRM/WAVE/DREAM', 60.00, 150.00, 10, '119.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1797, 'MTR Suzuki Nex/Burgman/Crossover/Skydrive/Skydrive FI Brake Shoe', 120.00, 270.00, 10, '120.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1798, 'Nissin Brake Shoe Aerox', 180.00, 300.00, 10, '121.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1799, 'Nissin Brake Shoe Beat', 170.00, 300.00, 10, '122.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1800, 'Nissin Brake Shoe Click', 170.00, 300.00, 10, '123.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1801, 'Nissin Brake Shoe Mio', 180.00, 300.00, 10, '124.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1802, 'saiyan brake shoe click', 61.00, 350.00, 5, '125.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1803, 'Genesis Nut Bolt Plate 6mm Red', 3.00, 10.00, 20, '126.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1804, 'Genesis Nut Bolt Plate 6mm Silver', 3.00, 10.00, 20, '127.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1805, 'Genesis Nut Bolt Plate 6mm Black', 3.00, 10.00, 20, '128.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1806, 'Genesis Nut Bolt Plate 6mm Gold', 3.00, 10.00, 20, '129.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1807, 'Stainless Bolt 6*20', 7.00, 15.00, 20, '130.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1808, 'Yamaha Clip Bolts', 10.00, 30.00, 60, '131.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(1809, 'APCC Lock Nuts 14MM', 10.00, 30.00, 8, '132.jpg', 1, 'none', 'Which provides excellent corrosion resistance and durability in harsh environments'),
(1810, 'APCC Lock Nuts 10MM', 7.00, 25.00, 13, '133.jpg', 1, 'none', 'Which provides excellent corrosion resistance and durability in harsh environments'),
(1811, 'APCC Lock Nuts 8MM', 7.00, 20.00, 11, '134.jpg', 1, 'none', 'Which provides excellent corrosion resistance and durability in harsh environments'),
(1812, 'ncy center spring aerox 1000 rpm', 260.00, 450.00, 3, '135.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1813, 'ncy center spring beat fi 1000 rpm', 250.00, 450.00, 3, '136.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1814, 'ncy center spring mio 110 1000 rpm', 200.00, 450.00, 3, '137.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1815, 'ncy center spring m3 1000 rpm', 280.00, 450.00, 3, '138.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1816, 'ncy center spring nmax 1000 rpm', 255.00, 450.00, 3, '139.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1817, 'racing monkey center spring 1000 rpm click', 195.00, 450.00, 4, '140.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1818, 'speed center spring mio 125/beat/beat fi (1000rpm)', 77.00, 250.00, 3, '141.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1819, 'speed center spring mio 125/beat/beat fi (1200rpm)', 77.00, 250.00, 3, '142.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1820, 'speed center spring click 125-150/pcx-adv150/vario150 (1000rpm)', 87.00, 250.00, 3, '143.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1821, 'speed center spring click 125-150/pcx-adv150/vario150 (1200rpm)', 90.00, 250.00, 3, '144.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1822, 'speed center spring gy6 125/150 (1200rpm)', 81.00, 250.00, 3, '145.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1823, 'speed center spring mio 1000rpm', 87.00, 250.00, 3, '146.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1824, 'speed center spring mio 1200rpm', 77.00, 250.00, 3, '147.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1825, 'speed center spring mio m3 fi 1000rpm', 87.00, 250.00, 3, '148.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1826, 'speed center spring mio me fi 1200rpm', 87.00, 250.00, 3, '149.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1827, 'speed center spring mio mx/nmax/aerox 1000rpm', 90.00, 250.00, 3, '150.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1828, 'speed center spring mio mx/nmax/aerox 1200rpm', 87.00, 250.00, 3, '151.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1829, 'speed center spring skydrive 1000rpm', 90.00, 250.00, 3, '152.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1830, 'speed center spring skydrive 1200rpm', 90.00, 250.00, 3, '153.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(1831, 'koby cvt cleaner 450ml', 95.00, 160.00, 20, '154.jpg', 1, 'none', 'Cleans and restores throttle bodies and CVT components'),
(1832, 'Koby cvt cleaner 600ML', 103.00, 220.00, 20, '155.jpg', 1, 'none', 'Cleans and restores throttle bodies and CVT components'),
(1833, 'otaka clutch cable raider 150', 47.00, 150.00, 3, '156.jpg', 1, 'none', 'High-quality replacement parts for motorcycles, designed for durability and compatible'),
(1834, 'yk clutch cable cb125', 37.00, 150.00, 1, '157.jpg', 1, 'none', 'High-quality replacement parts for motorcycles, designed for durability and compatible'),
(1835, 'GT Power Clutch Spring 1000rpm Mio M3/Nmax/Aerox/Click/GY6/ADV/PCX/Skydrive', 70.00, 250.00, 25, '158.jpg', 1, 'none', 'Engineered with premium materials, this clutch spring delivers enhanced durability and precise tension, ensuring optimal clutch engagement every time.'),
(1836, 'GT Power Clutch Spring 1000rpm Mio/Beat/Beat FI/Beat POP', 70.00, 250.00, 25, '159.jpg', 1, 'none', 'Engineered with premium materials, this clutch spring delivers enhanced durability and precise tension, ensuring optimal clutch engagement every time.'),
(1837, 'Yamaha Genuine Clutch Bell Nut for Mio Sporty/Mio/Amore/Nouvo', 65.00, 150.00, 10, '160.jpg', 1, 'none', 'Secure the clutch bell tightly to the transmission assembly'),
(1838, 'disc bolt ordinary', 7.00, 25.00, 60, '161.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1839, 'rkr disc nmax 260mm', 550.00, 850.00, 4, '162.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1840, 'saiyan mio disc 200mm', 207.00, 285.00, 2, '163.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1841, 'saiyan disc xrm flat type', 207.00, 285.00, 2, '164.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1842, 'ym buta disc raider150 rear 5147', 190.00, 500.00, 1, '165.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1843, 'ym buta disc nmax front 230mm', 200.00, 500.00, 1, '166.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1844, 'ym buta disc skydrive/smash 220mm 4455', 200.00, 500.00, 3, '167.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1845, 'ym disc dash/xrm125 front 220mm 5225', 200.00, 500.00, 2, '168.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(1846, 'Lazx 0088 exciter150 black', 70.00, 200.00, 5, '169.jpg', 1, 'none', '-'),
(1847, 'Lazx 0088 exciter150 red', 70.00, 200.00, 5, '170.jpg', 1, 'none', '-'),
(1848, 'lazx 5214 black sniper', 120.00, 300.00, 5, '171.jpg', 1, 'none', '-'),
(1849, 'lazx 5213 sniper', 200.00, 350.00, 5, '172.jpg', 1, 'none', '-'),
(1850, 'jvt fb mio 8g', 260.00, 450.00, 3, '173.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(1851, 'jvt fb mio 9g', 260.00, 450.00, 3, '174.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(1852, 'jvt fb mio 10g', 260.00, 450.00, 3, '175.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(1853, 'jvt fb nmax/m3 9g', 300.00, 450.00, 5, '176.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(1854, 'jvt fb nmax/m3 10g', 300.00, 450.00, 4, '177.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(1855, 'jvt fb nmax/m3 11g', 300.00, 450.00, 5, '178.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(1856, 'Flat bar thin assorted', 19.00, 100.00, 20, '179.jpg', 1, 'none', 'Stainless Steel Flat Bar'),
(1857, 'Flat Bar/Extention Bar Thin', 40.00, 100.00, 5, '180.jpg', 1, 'none', 'Stainless Steel Flat Bar'),
(1858, 'beat fi flyball', 165.00, 300.00, 4, '181.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1859, 'click 125/150 flyball 10g', 90.00, 250.00, 3, '182.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1860, 'flyball PCX160/click160', 215.00, 300.00, 5, '183.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1861, 'speed flyball beat car 10g', 81.00, 250.00, 3, '184.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1862, 'speed flyball beat car 11g', 93.00, 250.00, 3, '185.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1863, 'speed flyball click 123-150/skydrive 10g', 77.00, 250.00, 6, '186.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1864, 'speed flyball click 125-150/skydrive 11g', 87.00, 250.00, 6, '187.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1865, 'speed flyball gy6 125/beat fi (10g)', 93.00, 250.00, 3, '188.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1866, 'speed flyball gy6 125/beat fi (11g)', 87.00, 250.00, 3, '189.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1867, 'speed flyball gy6 125/beat fi (12g)', 93.00, 250.00, 3, '190.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1868, 'speed flyball gy6 125/beat fi (13g)', 93.00, 250.00, 3, '191.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1869, 'speed flyball mio 9g', 76.00, 250.00, 3, '192.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1870, 'speed flyball mio 10g', 79.00, 250.00, 3, '193.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1871, 'speed flyball mio 11g', 93.00, 250.00, 3, '194.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1872, 'speed flyball mio 125/m3/nmax/aerox (13g)', 90.00, 250.00, 6, '195.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(1873, 'front spork spring aerox', 360.00, 560.00, 3, '196.jpg', 1, 'none', '-'),
(1874, 'front spork spring mio/m3', 360.00, 560.00, 3, '197.jpg', 1, 'none', '-'),
(1875, 'front spork spring sniper', 360.00, 560.00, 3, '198.jpg', 1, 'none', '-'),
(1876, 'saiyan fuel cock beat', 71.00, 150.00, 3, '199.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1877, 'saiyan fuel cock mio', 84.00, 150.00, 5, '200.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1878, 'saiyan fuel cock mio soul', 93.00, 150.00, 3, '201.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1879, 'saiyan fuel cock cg125', 58.00, 100.00, 5, '202.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1880, 'saiyan fuel cock raider150', 71.00, 150.00, 5, '203.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1881, 'saiyan fuel cock smash', 64.00, 150.00, 3, '204.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1882, 'saiyan fuel cock xrm110', 43.00, 100.00, 4, '205.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1883, 'saiyan fuel cock xrm125', 64.00, 120.00, 3, '206.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor');
INSERT INTO `product` (`prod_id`, `prod_name`, `prod_capital`, `prod_price`, `prod_qty`, `prod_img`, `prod_status`, `prod_category`, `prod_description`) VALUES
(1884, 'saiyan fuel cock universal', 43.00, 120.00, 4, '207.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(1885, 'fuel filter click 124', 120.00, 350.00, 6, '208.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1886, 'fuel filter click 150', 120.00, 350.00, 4, '209.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1887, 'fuel filter mio I 125', 120.00, 150.00, 5, '210.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1888, 'genuine fuel filter pcx160', 69.00, 300.00, 10, '211.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1889, 'Sw fuel filter click 150', 35.00, 350.00, 10, '212.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1890, 'Fuel Pump Filter W/Oring Set Beat FI', 103.00, 270.00, 8, '213.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1891, 'Honda Fuel Pump + oring click 125i/rs125/xrm125 OEM', 95.00, 250.00, 5, '214.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1892, 'Yamaha Fuel Filter Pump For Nmax/Aerox/Sniper155 All Version', 60.00, 270.00, 20, '215.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1893, 'Fuel Pump Filter W/Oring Set Click 150', 105.00, 270.00, 8, '216.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1894, 'Fuel Pump Filter W/Oring Set Click 125i', 102.00, 270.00, 8, '217.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(1895, 'flat fuse 20a mini yellow', 1.30, 20.00, 200, '218.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(1896, 'flat fuse 15a mini blue', 1.30, 20.00, 200, '219.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(1897, 'flat fuse 10a mini red', 1.30, 20.00, 200, '220.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(1898, 'flat fuse 20a big yellow', 1.30, 20.00, 100, '221.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(1899, 'flat fuse 15a big blue', 1.30, 20.00, 100, '222.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(1900, 'flat fuse 10a big red', 1.30, 20.00, 100, '223.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(1901, 'jvt gear oil', 45.00, 110.00, 20, '224.jpg', 1, 'none', 'Excellent extreme pressure resistance. Optimize motorcycle performance '),
(1902, 'yamalube gear  oil original 100ml', 60.00, 120.00, 36, '225.jpg', 1, 'none', 'Excellent extreme pressure resistance. Optimize motorcycle performance '),
(1903, 'zeno gear oil 80w90 120ml', 45.00, 110.00, 50, '226.jpg', 1, 'none', 'Excellent extreme pressure resistance. Optimize motorcycle performance '),
(1904, 'Daytona Handle Grip Universal Red', 125.00, 250.00, 2, '227.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1905, 'Daytona Handle Grip Universal Blue', 135.00, 250.00, 2, '228.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1906, 'Daytona Handle Grip Universal Gray', 135.00, 250.00, 2, '229.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1907, 'Daytona Handle Grip Universal Brown', 135.00, 250.00, 2, '230.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1908, 'RCB Handle Grip BLACK-AHG66', 150.00, 350.00, 2, '231.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1909, 'RCB Handle Grip SILVER-AHG66', 150.00, 350.00, 2, '232.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1910, 'RCB Handle Grip RED-AHG55', 185.00, 350.00, 2, '233.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1911, 'RCB Handle Grip BLUE-AHG55', 185.00, 350.00, 2, '234.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1912, 'Universal Handle Grip Rubber Red', 72.00, 150.00, 2, '235.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1913, 'Universal Handle Grip Rubber Blue', 72.00, 150.00, 2, '236.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1914, 'Universal Handle Grip Rubber Gray', 72.00, 150.00, 2, '237.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1915, 'Universal Handle Grip Rubber Pink', 72.00, 159.00, 2, '238.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(1916, 'domino lever cp/chrome', 110.00, 250.00, 2, '239.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(1917, 'domino lever mio black', 110.00, 250.00, 2, '240.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(1918, 'domino lever mio bgb', 110.00, 250.00, 2, '241.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(1919, 'ym lever guard 9011f', 115.00, 250.00, 6, '242.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(1920, 'yk brake lever mio-m', 81.00, 250.00, 5, '243.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(1921, 'T19 Headlight Bulb Stock for Mio/Xrm/tmx/wave', 16.00, 70.00, 20, '244.jpg', 1, 'none', 'Heavy-duty sockets resist deformation, rust, and short circuits caused by moisture or road debris'),
(1922, 'Signal Light Bulb Socket', 12.00, 70.00, 15, '245.jpg', 1, 'none', 'Heavy-duty sockets resist deformation, rust, and short circuits caused by moisture or road debris'),
(1923, 'hylos mags mio', 5000.00, 6500.00, 2, '246.jpg', 1, 'none', 'Made up of Hard Alloy material with high wear resistance and toughness'),
(1924, 'hylos mags lc150', 5100.00, 6500.00, 2, '247.jpg', 1, 'none', 'Made up of Hard Alloy material with high wear resistance and toughness'),
(1925, 'rcb mags beat', 5300.00, 5800.00, 1, '248.jpg', 1, 'none', 'Made up of Hard Alloy material with high wear resistance and toughness'),
(1926, 'Mtr matting aerox (Brown box) g3115', 200.00, 500.00, 5, '249.jpg', 1, 'none', 'It improves both foot stability and aesthetics with its textured matting design, making riding safer and more comfortable'),
(1927, 'Mtr matting pcx (Brown box) g3115', 200.00, 500.00, 5, '250.jpg', 1, 'none', 'It improves both foot stability and aesthetics with its textured matting design, making riding safer and more comfortable'),
(1928, 'Firefly Mini Driving Light V2 (4wire)', 430.00, 1000.00, 2, '251.jpg', 1, 'none', 'Compact and high-performance lighting solution designed for motorcycles'),
(1929, 'Firefly Mini Driving Light White+Yellow Pair', 395.00, 850.00, 2, '252.jpg', 1, 'none', 'Compact and high-performance lighting solution designed for motorcycles'),
(1930, 'mini driving light WHITE+YELLOW', 190.00, 750.00, 3, '253.jpg', 1, 'none', 'Compact and high-performance lighting solution designed for motorcycles'),
(1931, 'engine oil filter yamaha/suzuki/kawasaki', 16.00, 70.00, 10, '254.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(1932, 'engine oil filter raider', 12.00, 70.00, 10, '255.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(1933, 'engine oil filter bajaj', 12.00, 70.00, 5, '256.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(1934, 'Oil filter kawasaki', 14.00, 50.00, 15, '257.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(1935, 'Oil filter suzuki', 15.00, 50.00, 15, '258.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(1936, 'oil filter yamaha', 30.00, 70.00, 20, '259.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(1937, 'Genuine Oil Seal 91202-KVB', 35.00, 150.00, 3, '260.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1938, 'Genuine Oil Seal Pulley Side 93102-25816', 32.00, 150.00, 10, '261.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1939, 'Honda Pulley Oil Seal Click 125/150 91202-KWN-901', 55.00, 230.00, 10, '262.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1940, 'oil seal pulley side aerox/nmax', 48.00, 185.00, 10, '263.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1941, 'Oil Seal Pulley Side Yamaha Nmax V1', 35.00, 150.00, 10, '264.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1942, 'Oil Seal Pulley Side for Mioi125/M3/Souli125', 45.00, 200.00, 10, '265.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1943, 'Oil Seal Pulley Yamaha Mio/Sporty/Soul Pulley/ Oil Seal', 32.00, 150.00, 10, '266.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1944, 'Oil Seal Pulley Side 93102-25816 Mioi125/m3/Soul125 Geniune', 45.00, 150.00, 10, '267.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1945, 'Pulley Oil Seal Suzuki Address/Skydrive/Sport FI', 89.00, 150.00, 5, '268.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1946, 'Yamaha Seal Oring Pully Nmax Lexi 2DP', 145.00, 280.00, 5, '269.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(1947, 'racing monkey ckp aerox', 420.00, 650.00, 3, '270.jpg', 1, 'none', 'Designed to improve engine performance and efficiency while providing accurate readings of engine position and speed.'),
(1948, 'racing monkey lighten valve', 900.00, 1300.00, 2, '271.jpg', 1, 'none', 'Designed to improve engine performance and efficiency while providing accurate readings of engine position and speed.'),
(1949, 'samco hose rad click', 400.00, 350.00, 2, '272.jpg', 1, 'none', 'SAMCO radiator hoses are handcrafted from top-grade silicone to ensure high durability, heat resistance, and reliability in the cooling system.'),
(1950, 'samco hose rad lc155', 400.00, 550.00, 2, '273.jpg', 1, 'none', 'SAMCO radiator hoses are handcrafted from top-grade silicone to ensure high durability, heat resistance, and reliability in the cooling system.'),
(1951, 'samco hose rad nmax', 330.00, 450.00, 2, '274.jpg', 1, 'none', 'SAMCO radiator hoses are handcrafted from top-grade silicone to ensure high durability, heat resistance, and reliability in the cooling system.'),
(1952, 'protaper radiator lc150 ', 5400.00, 6500.00, 2, '275.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1953, 'protaper radiator lc155', 5400.00, 6500.00, 2, '276.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1954, 'racing radiator comp y15zr', 5400.00, 6500.00, 1, '277.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1955, 'racing radiator comp y16zr', 5400.00, 6500.00, 1, '278.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1956, 'smok radiator cover exciter/lc150', 68.00, 250.00, 1, '279.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1957, 'smok radiator sniper155/y16zr red', 110.00, 250.00, 5, '280.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1958, 'smok radiator sniper155/y16zr blue', 110.00, 250.00, 5, '281.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1959, 'uma radiator aerox v2/nmax v2 280mm', 3150.00, 4800.00, 1, '282.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1960, 'uma radiator y16zr/s 155 290mm', 3420.00, 5000.00, 1, '283.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(1961, 'APCC Master Repair Kit Nmax', 30.00, 150.00, 8, '284.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1962, 'APCC Master Repair Kit Mio F', 30.00, 150.00, 8, '285.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1963, 'APCC Master Repair Kit Nmax/F', 30.00, 150.00, 8, '286.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1964, 'APCC Master Repair Kit Beat/Click/Dash', 30.00, 150.00, 8, '287.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1965, 'APCC Master Repair Kit Raider-150/R', 30.00, 150.00, 6, '288.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1966, 'APCC Master Repair Kit XRM/XRM125/F', 30.00, 150.00, 6, '289.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1967, 'APCC Master Repair Kit XRM/R', 30.00, 150.00, 4, '290.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1968, 'APCC Master Repair Kit 12MM', 30.00, 150.00, 6, '291.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(1969, 'Genuine Roller Weight Honda Click LED 15g Roll Set', 174.00, 300.00, 10, '292.jpg', 1, 'none', 'This Roller Weights set is a precise accessory for enhancing your motorcycles performance.'),
(1970, 'KOS Genuine Honda Roller Set ADV 160/PCX 160 19g Roller Set', 245.00, 400.00, 10, '293.jpg', 1, 'none', 'This Roller Weights set is a precise accessory for enhancing your motorcycles performance.'),
(1971, 'otaka rubber dumper barako', 37.00, 100.00, 3, '294.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE.'),
(1972, 'saiyan rubber dumper smash', 28.00, 100.00, 3, '295.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE.'),
(1973, 'motul 3000 plus 1 liter', 290.00, 375.00, 20, '296.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(1974, 'oil motul scooter 10w40 800ml', 285.00, 365.00, 40, '297.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(1975, 'oil motul scooter 1L', 265.00, 395.00, 20, '298.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(1976, 'Zeno scooter pro 10w40 800ML', 165.00, 250.00, 11, '299.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(1977, 'Zeno scooter pro 10w40 1L', 155.00, 270.00, 11, '300.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(1978, 'Oil Seal Front Fork Oil Seal Dust Suzuki/Raider 150/Skydrive/Smash', 32.00, 120.00, 10, '301.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1979, 'GN5 Honda Fork Oil Seal (Shock) for Click V1/V2/RS150/Genio/Scoopy', 150.00, 200.00, 15, '302.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1980, 'Oil Seal Front Shock Yamaha Mio/Mio I/King/Aerox/Fazzio 125', 32.00, 120.00, 10, '303.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1981, 'saiyan shock oil seal tmx155', 17.00, 80.00, 5, '304.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1982, 'saiyan shock oil seal barako', 17.00, 80.00, 5, '305.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1983, 'Yamaha Nmax V1/V2 Front Shock Oil Seal', 40.00, 150.00, 20, '306.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1984, 'Honda Front Shock Oil Seal for XRM Wave/Mio Beat/Scoopy/Click', 25.00, 150.00, 25, '307.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(1985, 'mvr1 shock lc150', 3400.00, 4500.00, 3, '308.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1986, 'protaper front shock lc150', 5800.00, 7500.00, 1, '309.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1987, 'SMOK REAR SHOCK 30MM HONDA CLICK 125/150 black/yellow', 690.00, 1150.00, 1, '310.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1988, 'SMOK REAR SHOCK 30MM HONDA CLICK 125/150 silver/black', 690.00, 1150.00, 1, '311.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1989, 'TAKAGASO Shock 300mm for MIO BLACK', 500.00, 1000.00, 1, '312.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1990, 'TAKAGASO Shock 300mm for MIO RED', 500.00, 1000.00, 1, '313.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1991, 'trc rear shock sniper135/ winnerx 1113-205mm silver/ yellow', 2100.00, 3000.00, 1, '314.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1992, 'trc rear shock sniper135/ winnerx 1113-205mm black/ yellow', 2100.00, 3000.00, 1, '315.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1993, 'trc rear shock sniper135/winnerx 1113-205mm silver/ blue', 2100.00, 3000.00, 1, '316.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(1994, 'Honda 3pcs Set PCX and Click Slider Piece', 65.00, 200.00, 20, '317.jpg', 1, 'none', '-'),
(1995, 'Yamaha Pulley Slider Piece Set for Nmax/Aerox/Mio', 50.00, 250.00, 20, '318.jpg', 1, 'none', '-'),
(1996, 'ncy slider piece click', 75.00, 250.00, 10, '319.jpg', 1, 'none', '-'),
(1997, 'ncy slider piece mio', 60.00, 250.00, 10, '320.jpg', 1, 'none', '-'),
(1998, 'osaki speed cable rusi tc125', 63.00, 150.00, 2, '321.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(1999, 'otaka speed cable wave100/alpha', 40.00, 150.00, 2, '322.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2000, 'otaka speed cable beat/beat fi', 47.00, 150.00, 3, '323.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2001, 'saiyan speed cable wave 125', 40.00, 150.00, 3, '324.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2002, 'sw speed cable xrm 110', 37.00, 150.00, 3, '325.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2003, 'sw speed cable wave 100', 37.00, 150.00, 3, '326.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2004, 'yk speed cable rusi125', 37.00, 150.00, 1, '327.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2005, 'max speed chain 428', 420.00, 750.00, 4, '328.jpg', 1, 'none', '-'),
(2006, 'max speed chain 415', 420.00, 750.00, 4, '329.jpg', 1, 'none', '-'),
(2007, 'max speed chain sniper 428', 650.00, 750.00, 2, '330.jpg', 1, 'none', '-'),
(2008, 'max speed chain raider38/43', 650.00, 1500.00, 2, '331.jpg', 1, 'none', '-'),
(2009, 'max speed chain set raider 38mm', 650.00, 850.00, 1, '332.jpg', 1, 'none', '-'),
(2010, 'air filter click vario 150', 125.00, 350.00, 10, '1.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2011, 'APCC Air Filter Mio Sporty', 80.00, 250.00, 3, '2.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2012, 'APCC Air Filter XRM', 80.00, 250.00, 3, '3.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2013, 'APCC Air Filter Mio-Soul', 90.00, 250.00, 3, '4.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2014, 'APCC Air Filter Shogun/Smash', 90.00, 250.00, 3, '5.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2015, 'APCC Air Filter Beat FI', 90.00, 250.00, 3, '6.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2016, 'APCC Air Filter Honda/PCX150/ADV150', 120.00, 300.00, 3, '7.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2017, 'APCC Air Filter Nmax', 130.00, 300.00, 3, '8.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2018, 'click 160 air filter', 125.00, 350.00, 10, '9.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2019, 'COD Air Filter for Aerox 155', 100.00, 275.00, 10, '10.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2020, 'DNF Yamaha Mio Gear Gravis 125 Air Filter', 120.00, 300.00, 5, '11.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2021, 'fortune air filter aerox', 145.00, 350.00, 5, '12.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2022, 'gpc air filter click 125i/150i', 181.00, 350.00, 3, '13.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2023, 'gpc air filter click 160i', 181.00, 400.00, 4, '14.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2024, 'gpc air filter mio 125 mx', 120.00, 270.00, 4, '15.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2025, 'gpc air filter pcx150', 300.00, 400.00, 3, '16.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2026, 'gpc air filter raider150', 95.00, 300.00, 3, '17.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2027, 'marin air filter sniper washable', 205.00, 500.00, 5, '18.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2028, 'mrtr air filter sniper135', 85.00, 300.00, 1, '19.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2029, 'otaka air filter click 125', 130.00, 350.00, 6, '20.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2030, 'pcx 150 air filter', 125.00, 350.00, 4, '21.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2031, 'raider 150 air filter', 90.00, 250.00, 4, '22.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2032, 'stock air filter aerox v1', 185.00, 450.00, 2, '23.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2033, 'stock air filter beat fi ', 135.00, 350.00, 4, '24.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2034, 'stock air filter burgman', 136.00, 400.00, 3, '25.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2035, 'stock air filter click 125', 135.00, 350.00, 2, '26.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2036, 'stock air filter click 150', 135.00, 350.00, 2, '27.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2037, 'stock air filter m3', 75.00, 275.00, 8, '28.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2038, 'stock air filter mio 125', 135.00, 350.00, 3, '29.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2039, 'stock air filter nmax v1', 185.00, 450.00, 2, '30.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2040, 'stock air filter nmax v2', 185.00, 450.00, 4, '31.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2041, 'stock air filter sniper 150', 91.00, 300.00, 3, '32.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2042, 'sv air filter mio 125/m3', 100.00, 250.00, 5, '33.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2043, 'Universal Air Filter for Aerox 155', 99.00, 300.00, 10, '34.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2044, 'Yamaha Genuine Air Filter Nmax V2/Aerox V2', 170.00, 300.00, 10, '35.jpg', 1, 'none', 'Designed to capture dust, dirt, pollen, and other airborne particles present in the incoming air. This prevents these contaminants from entering the engine, where they could cause damage to internal components like cylinders, pistons, and valves.'),
(2045, 'bearing 6201', 50.00, 120.00, 10, '36.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2046, 'bearing 6301', 50.00, 120.00, 10, '37.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2047, 'bearing 6300', 50.00, 120.00, 10, '38.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2048, 'bearing 6203', 50.00, 120.00, 10, '39.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2049, 'bearing 6202', 50.00, 120.00, 10, '40.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2050, 'bearing 6004', 50.00, 120.00, 10, '41.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2051, 'NTN Bearings 6300 2RS Rubber Seal 10*35*11', 30.00, 150.00, 20, '42.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2052, 'NTN Bearings 6202 2RS Rubber Seal 15*35*11', 30.00, 150.00, 20, '43.jpg', 1, 'none', 'The sealed ball bearing is fitted with synthetic rubber seals to prevent dirt and other items entering the bearing. It is primarily intended for use where the inner ring rotates.'),
(2053, 'beast tire 70x80x14 4pr flash p6240 tl', 684.00, 1000.00, 4, '44.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2054, 'beast tire 70x80x17 4pr flash p6240 tl', 798.00, 1150.00, 4, '45.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2055, 'beast tire 80x80x17 4pr flash p6240 tl', 897.00, 1280.00, 4, '46.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2056, 'beast tire 80x80x14 4pr flash p6240 tl', 897.00, 1400.00, 3, '47.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2057, 'beast tire 90x80x17 4pr flash p6240 tl', 1178.00, 1650.00, 4, '48.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2058, 'beast tire 100x80x17 4pr flash p640 tl ', 1315.00, 1800.00, 2, '49.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2059, 'Beast Tire 90x80x14', 975.00, 1600.00, 1, '50.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2060, 'beast tire 110x70x13', 1280.00, 1700.00, 1, '51.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2061, 'beast tire 110x80x14', 1520.00, 1900.00, 1, '52.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2062, 'beast tire 130x70x13', 1680.00, 2100.00, 1, '53.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2063, 'Quick Tire 80x80x14', 875.00, 1400.00, 1, '54.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2064, 'Quick Tire 90x80x14', 1045.00, 1550.00, 3, '55.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2065, 'Quick Tire 90x80x14 (alt model)', 1440.00, 2000.00, 1, '56.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2066, 'Quick Tire 130x70x13', 1705.00, 2250.00, 2, '57.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2067, 'Quick Tire 140x70x14', 2045.00, 2545.00, 1, '58.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2068, 'zeneos 90xx80x14 49p zn88 tl', 1210.00, 1680.00, 2, '59.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2069, 'ball race click', 135.00, 450.00, 10, '60.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2070, 'ball race nmax', 135.00, 450.00, 10, '61.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2071, 'ball race xrm', 135.00, 450.00, 10, '62.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2072, 'ball race yamaha', 135.00, 450.00, 10, '63.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2073, 'Raider Ball Race Carb/FI', 180.00, 450.00, 6, '64.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2074, 'saiyan ball race aerox', 61.00, 450.00, 5, '65.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2075, 'saiyan ball race beat', 61.00, 450.00, 5, '66.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2076, 'saiyan ball race click', 101.00, 450.00, 5, '67.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2077, 'saiyan ball race mio', 61.00, 450.00, 5, '68.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2078, 'saiyan ball race nmax', 61.00, 450.00, 5, '69.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2079, 'saiyan ball race wave 100', 61.00, 450.00, 3, '70.jpg', 1, 'none', 'Durable and reliable tire that balances safety, ride comfort, and performance, suitable for riders in urban or casual settings looking for versatile motorcycle'),
(2080, 'od battery ytx4l', 550.00, 880.00, 5, '71.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.');
INSERT INTO `product` (`prod_id`, `prod_name`, `prod_capital`, `prod_price`, `prod_qty`, `prod_img`, `prod_status`, `prod_category`, `prod_description`) VALUES
(2081, 'od battery ytz8v', 1050.00, 1650.00, 2, '72.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(2082, 'od battery 12nl', 650.00, 980.00, 3, '73.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(2083, 'od battery 12nl5l-bs', 700.00, 1100.00, 3, '74.jpg', 1, 'none', 'Features high cranking power, a long lifespan, and vibration resistance, making it ideal for both starting power and maintenance-free operation.'),
(2084, 'osaki brake cable beat fi v2', 148.00, 250.00, 3, '75.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2085, 'osaki brake cable euro daan hari', 77.00, 150.00, 1, '76.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2086, 'osaki brake cable tmx125 alpha front', 75.00, 200.00, 2, '77.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2087, 'otaka brake cable mio', 52.00, 150.00, 3, '78.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2088, 'otaka brake cable wave 125', 45.00, 150.00, 3, '79.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2089, 'sw brake cable beat', 55.00, 150.00, 2, '80.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2090, 'sw brake cable smash 115', 39.00, 150.00, 4, '81.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2091, 'sw brake cable r150', 35.00, 150.00, 2, '82.jpg', 1, 'none', 'Brake cables are essential components of a vehicles braking system, used to transfer pressure from the brake pedal to the brakes, allowing the driver to slow down or stop.'),
(2092, 'gpc brake pad shogun/xrm trinity rear', 45.00, 120.00, 5, '83.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2093, 'grs brake pad shogun front', 25.00, 120.00, 5, '84.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2094, 'grs brake pad raider fi', 225.00, 120.00, 10, '85.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2095, 'mehol pcx brake pad R', 50.00, 220.00, 3, '86.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2096, 'mehol pcx brake pad F', 50.00, 220.00, 3, '87.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2097, 'osak pcx brake pad 160 F', 55.00, 200.00, 3, '88.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2098, 'osak pcx brake pad 160 R', 55.00, 200.00, 3, '89.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2099, 'rcb brake pad mio/y15zr/click', 250.00, 350.00, 5, '90.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2100, 'rz brake pad w125', 25.00, 120.00, 5, '91.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2101, 'rz brake pad beat', 25.00, 120.00, 5, '92.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2102, 'rz brake pad 2110/w100', 25.00, 120.00, 5, '93.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2103, 'saiyan brake pad beat new', 37.00, 120.00, 10, '94.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2104, 'saiyan brake pad click 125', 37.00, 120.00, 10, '95.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2105, 'saiyan brake pad m3', 37.00, 120.00, 10, '96.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2106, 'saiyan brake pad mio', 37.00, 120.00, 10, '97.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2107, 'saiyan brake pad pcx160/adv150 rear', 37.00, 120.00, 10, '98.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2108, 'saiyan brake pad wave 110', 37.00, 120.00, 5, '99.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2109, 'saiyan brake pad wave 125', 37.00, 120.00, 5, '100.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2110, 'smok brake pad w100', 65.00, 150.00, 5, '101.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2111, 'smok brake pad raider150 front', 65.00, 150.00, 5, '102.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2112, 'smok brake pad raider150 fi rear', 65.00, 150.00, 5, '103.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2113, 'vgt brake pad xrm trinity', 40.00, 120.00, 5, '104.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2114, 'vgt brake pad r150 rear', 40.00, 120.00, 5, '105.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2115, 'vgt brake pad sniper150 rear', 40.00, 120.00, 5, '106.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2116, 'XKD Brake Pad Beat/BeatFI/Burgman', 50.00, 150.00, 5, '107.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2117, 'zeno brake pad m3/aerox/nmax front', 65.00, 150.00, 10, '108.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2118, 'zeno brake pad beat front', 65.00, 150.00, 5, '109.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2119, 'zeno brake pad sniper155 front', 65.00, 150.00, 5, '110.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2120, 'zeno brake pad sniper 155 rear', 65.00, 150.00, 5, '111.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2121, 'zeno brake pad adv/pcx rear', 65.00, 150.00, 5, '112.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2122, 'zeno brake pad mio', 65.00, 150.00, 10, '113.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2123, 'zeno brake pad xrm trinity', 65.00, 150.00, 10, '114.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2124, 'zeno brake pad w125', 65.00, 150.00, 5, '115.jpg', 1, 'none', 'Say goodbye to mediocre braking. Our Brake Pads are engineered to deliver superior stopping power, ensuring safety and control on every ride. Each Brake Pad is crafted with precision using premium materials and cutting-edge technology, guaranteeing unparalleled performance and reliability.'),
(2125, 'otaka brake rod xrm110', 28.00, 100.00, 5, '116.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE'),
(2126, 'otaka brake rod tmx150', 28.00, 100.00, 5, '117.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE'),
(2127, 'otaka brake rod barako', 27.00, 100.00, 5, '118.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE'),
(2128, 'Brake Shoe XRM/WAVE/DREAM', 60.00, 150.00, 10, '119.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2129, 'MTR Suzuki Nex/Burgman/Crossover/Skydrive/Skydrive FI Brake Shoe', 120.00, 270.00, 10, '120.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2130, 'Nissin Brake Shoe Aerox', 180.00, 300.00, 10, '121.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2131, 'Nissin Brake Shoe Beat', 170.00, 300.00, 10, '122.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2132, 'Nissin Brake Shoe Click', 170.00, 300.00, 10, '123.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2133, 'Nissin Brake Shoe Mio', 180.00, 300.00, 10, '124.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2134, 'saiyan brake shoe click', 61.00, 350.00, 5, '125.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2135, 'Genesis Nut Bolt Plate 6mm Red', 3.00, 10.00, 20, '126.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2136, 'Genesis Nut Bolt Plate 6mm Silver', 3.00, 10.00, 20, '127.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2137, 'Genesis Nut Bolt Plate 6mm Black', 3.00, 10.00, 20, '128.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2138, 'Genesis Nut Bolt Plate 6mm Gold', 3.00, 10.00, 20, '129.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2139, 'Stainless Bolt 6*20', 7.00, 15.00, 20, '130.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2140, 'Yamaha Clip Bolts', 10.00, 30.00, 60, '131.jpg', 1, 'none', 'Aluminum alloy or stainless steel, offering high strength and corrosion resistance'),
(2141, 'APCC Lock Nuts 14MM', 10.00, 30.00, 8, '132.jpg', 1, 'none', 'Which provides excellent corrosion resistance and durability in harsh environments'),
(2142, 'APCC Lock Nuts 10MM', 7.00, 25.00, 13, '133.jpg', 1, 'none', 'Which provides excellent corrosion resistance and durability in harsh environments'),
(2143, 'APCC Lock Nuts 8MM', 7.00, 20.00, 11, '134.jpg', 1, 'none', 'Which provides excellent corrosion resistance and durability in harsh environments'),
(2144, 'ncy center spring aerox 1000 rpm', 260.00, 450.00, 3, '135.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2145, 'ncy center spring beat fi 1000 rpm', 250.00, 450.00, 3, '136.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2146, 'ncy center spring mio 110 1000 rpm', 200.00, 450.00, 3, '137.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2147, 'ncy center spring m3 1000 rpm', 280.00, 450.00, 3, '138.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2148, 'ncy center spring nmax 1000 rpm', 255.00, 450.00, 3, '139.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2149, 'racing monkey center spring 1000 rpm click', 195.00, 450.00, 4, '140.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2150, 'speed center spring mio 125/beat/beat fi (1000rpm)', 77.00, 250.00, 3, '141.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2151, 'speed center spring mio 125/beat/beat fi (1200rpm)', 77.00, 250.00, 3, '142.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2152, 'speed center spring click 125-150/pcx-adv150/vario150 (1000rpm)', 87.00, 250.00, 3, '143.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2153, 'speed center spring click 125-150/pcx-adv150/vario150 (1200rpm)', 90.00, 250.00, 3, '144.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2154, 'speed center spring gy6 125/150 (1200rpm)', 81.00, 250.00, 3, '145.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2155, 'speed center spring mio 1000rpm', 87.00, 250.00, 3, '146.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2156, 'speed center spring mio 1200rpm', 77.00, 250.00, 3, '147.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2157, 'speed center spring mio m3 fi 1000rpm', 87.00, 250.00, 3, '148.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2158, 'speed center spring mio me fi 1200rpm', 87.00, 250.00, 3, '149.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2159, 'speed center spring mio mx/nmax/aerox 1000rpm', 90.00, 250.00, 3, '150.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2160, 'speed center spring mio mx/nmax/aerox 1200rpm', 87.00, 250.00, 3, '151.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2161, 'speed center spring skydrive 1000rpm', 90.00, 250.00, 3, '152.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2162, 'speed center spring skydrive 1200rpm', 90.00, 250.00, 3, '153.jpg', 1, 'none', 'Provides longitudinal stability and comfort during rides '),
(2163, 'koby cvt cleaner 450ml', 95.00, 160.00, 20, '154.jpg', 1, 'none', 'Cleans and restores throttle bodies and CVT components'),
(2164, 'Koby cvt cleaner 600ML', 103.00, 220.00, 20, '155.jpg', 1, 'none', 'Cleans and restores throttle bodies and CVT components'),
(2165, 'otaka clutch cable raider 150', 47.00, 150.00, 3, '156.jpg', 1, 'none', 'High-quality replacement parts for motorcycles, designed for durability and compatible'),
(2166, 'yk clutch cable cb125', 37.00, 150.00, 1, '157.jpg', 1, 'none', 'High-quality replacement parts for motorcycles, designed for durability and compatible'),
(2167, 'GT Power Clutch Spring 1000rpm Mio M3/Nmax/Aerox/Click/GY6/ADV/PCX/Skydrive', 70.00, 250.00, 25, '158.jpg', 1, 'none', 'Engineered with premium materials, this clutch spring delivers enhanced durability and precise tension, ensuring optimal clutch engagement every time.'),
(2168, 'GT Power Clutch Spring 1000rpm Mio/Beat/Beat FI/Beat POP', 70.00, 250.00, 25, '159.jpg', 1, 'none', 'Engineered with premium materials, this clutch spring delivers enhanced durability and precise tension, ensuring optimal clutch engagement every time.'),
(2169, 'Yamaha Genuine Clutch Bell Nut for Mio Sporty/Mio/Amore/Nouvo', 65.00, 150.00, 10, '160.jpg', 1, 'none', 'Secure the clutch bell tightly to the transmission assembly'),
(2170, 'disc bolt ordinary', 7.00, 25.00, 60, '161.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2171, 'rkr disc nmax 260mm', 550.00, 850.00, 4, '162.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2172, 'saiyan mio disc 200mm', 207.00, 285.00, 2, '163.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2173, 'saiyan disc xrm flat type', 207.00, 285.00, 2, '164.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2174, 'ym buta disc raider150 rear 5147', 190.00, 500.00, 1, '165.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2175, 'ym buta disc nmax front 230mm', 200.00, 500.00, 1, '166.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2176, 'ym buta disc skydrive/smash 220mm 4455', 200.00, 500.00, 3, '167.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2177, 'ym disc dash/xrm125 front 220mm 5225', 200.00, 500.00, 2, '168.jpg', 1, 'none', 'Stainless steel and lightweight discs may offer better heat management and handling.'),
(2178, 'Lazx 0088 exciter150 black', 70.00, 200.00, 5, '169.jpg', 1, 'none', '-'),
(2179, 'Lazx 0088 exciter150 red', 70.00, 200.00, 5, '170.jpg', 1, 'none', '-'),
(2180, 'lazx 5214 black sniper', 120.00, 300.00, 5, '171.jpg', 1, 'none', '-'),
(2181, 'lazx 5213 sniper', 200.00, 350.00, 5, '172.jpg', 1, 'none', '-'),
(2182, 'jvt fb mio 8g', 260.00, 450.00, 3, '173.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(2183, 'jvt fb mio 9g', 260.00, 450.00, 3, '174.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(2184, 'jvt fb mio 10g', 260.00, 450.00, 3, '175.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(2185, 'jvt fb nmax/m3 9g', 300.00, 450.00, 5, '176.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(2186, 'jvt fb nmax/m3 10g', 300.00, 450.00, 4, '177.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(2187, 'jvt fb nmax/m3 11g', 300.00, 450.00, 5, '178.jpg', 1, 'none', 'Feel the power instantly in your Motorcycle. Heavy duty use, highly durable, and top performance'),
(2188, 'Flat bar thin assorted', 19.00, 100.00, 20, '179.jpg', 1, 'none', 'Stainless Steel Flat Bar'),
(2189, 'Flat Bar/Extention Bar Thin', 40.00, 100.00, 5, '180.jpg', 1, 'none', 'Stainless Steel Flat Bar'),
(2190, 'beat fi flyball', 165.00, 300.00, 4, '181.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2191, 'click 125/150 flyball 10g', 90.00, 250.00, 3, '182.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2192, 'flyball PCX160/click160', 215.00, 300.00, 5, '183.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2193, 'speed flyball beat car 10g', 81.00, 250.00, 3, '184.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2194, 'speed flyball beat car 11g', 93.00, 250.00, 3, '185.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2195, 'speed flyball click 123-150/skydrive 10g', 77.00, 250.00, 6, '186.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2196, 'speed flyball click 125-150/skydrive 11g', 87.00, 250.00, 6, '187.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2197, 'speed flyball gy6 125/beat fi (10g)', 93.00, 250.00, 3, '188.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2198, 'speed flyball gy6 125/beat fi (11g)', 87.00, 250.00, 3, '189.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2199, 'speed flyball gy6 125/beat fi (12g)', 93.00, 250.00, 3, '190.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2200, 'speed flyball gy6 125/beat fi (13g)', 93.00, 250.00, 3, '191.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2201, 'speed flyball mio 9g', 76.00, 250.00, 3, '192.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2202, 'speed flyball mio 10g', 79.00, 250.00, 3, '193.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2203, 'speed flyball mio 11g', 93.00, 250.00, 3, '194.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2204, 'speed flyball mio 125/m3/nmax/aerox (13g)', 90.00, 250.00, 6, '195.jpg', 1, 'none', 'Allowing riders to balance acceleration and top speed according to their riding needs while maintaining reliable drivetrain operation '),
(2205, 'front spork spring aerox', 360.00, 560.00, 3, '196.jpg', 1, 'none', '-'),
(2206, 'front spork spring mio/m3', 360.00, 560.00, 3, '197.jpg', 1, 'none', '-'),
(2207, 'front spork spring sniper', 360.00, 560.00, 3, '198.jpg', 1, 'none', '-'),
(2208, 'saiyan fuel cock beat', 71.00, 150.00, 3, '199.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2209, 'saiyan fuel cock mio', 84.00, 150.00, 5, '200.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2210, 'saiyan fuel cock mio soul', 93.00, 150.00, 3, '201.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2211, 'saiyan fuel cock cg125', 58.00, 100.00, 5, '202.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2212, 'saiyan fuel cock raider150', 71.00, 150.00, 5, '203.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2213, 'saiyan fuel cock smash', 64.00, 150.00, 3, '204.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2214, 'saiyan fuel cock xrm110', 43.00, 100.00, 4, '205.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2215, 'saiyan fuel cock xrm125', 64.00, 120.00, 3, '206.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2216, 'saiyan fuel cock universal', 43.00, 120.00, 4, '207.jpg', 1, 'none', 'Replacement fuel valve that allows controlled fuel flow from the gas tank to the carburetor'),
(2217, 'fuel filter click 124', 120.00, 350.00, 6, '208.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2218, 'fuel filter click 150', 120.00, 350.00, 4, '209.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2219, 'fuel filter mio I 125', 120.00, 150.00, 5, '210.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2220, 'genuine fuel filter pcx160', 69.00, 300.00, 10, '211.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2221, 'Sw fuel filter click 150', 35.00, 350.00, 10, '212.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2222, 'Fuel Pump Filter W/Oring Set Beat FI', 103.00, 270.00, 8, '213.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2223, 'Honda Fuel Pump + oring click 125i/rs125/xrm125 OEM', 95.00, 250.00, 5, '214.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2224, 'Yamaha Fuel Filter Pump For Nmax/Aerox/Sniper155 All Version', 60.00, 270.00, 20, '215.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2225, 'Fuel Pump Filter W/Oring Set Click 150', 105.00, 270.00, 8, '216.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2226, 'Fuel Pump Filter W/Oring Set Click 125i', 102.00, 270.00, 8, '217.jpg', 1, 'none', 'Keep your motorcycle running smoothly Fuel Filter Pump, designed for efficient fuel delivery and filtration. Compatible with a wide range of popular models. Efficient Fuel Flow & Filtration. Durable and Long-Lasting Performance. Essential for Smooth Engine Operation.'),
(2227, 'flat fuse 20a mini yellow', 1.30, 20.00, 200, '218.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(2228, 'flat fuse 15a mini blue', 1.30, 20.00, 200, '219.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(2229, 'flat fuse 10a mini red', 1.30, 20.00, 200, '220.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(2230, 'flat fuse 20a big yellow', 1.30, 20.00, 100, '221.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(2231, 'flat fuse 15a big blue', 1.30, 20.00, 100, '222.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(2232, 'flat fuse 10a big red', 1.30, 20.00, 100, '223.jpg', 1, 'none', 'Designed to protect automotive circuits from overcurrent or short circuits'),
(2233, 'jvt gear oil', 45.00, 110.00, 20, '224.jpg', 1, 'none', 'Excellent extreme pressure resistance. Optimize motorcycle performance '),
(2234, 'yamalube gear  oil original 100ml', 60.00, 120.00, 36, '225.jpg', 1, 'none', 'Excellent extreme pressure resistance. Optimize motorcycle performance '),
(2235, 'zeno gear oil 80w90 120ml', 45.00, 110.00, 50, '226.jpg', 1, 'none', 'Excellent extreme pressure resistance. Optimize motorcycle performance '),
(2236, 'Daytona Handle Grip Universal Red', 125.00, 250.00, 2, '227.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2237, 'Daytona Handle Grip Universal Blue', 135.00, 250.00, 2, '228.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2238, 'Daytona Handle Grip Universal Gray', 135.00, 250.00, 2, '229.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2239, 'Daytona Handle Grip Universal Brown', 135.00, 250.00, 2, '230.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2240, 'RCB Handle Grip BLACK-AHG66', 150.00, 350.00, 2, '231.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2241, 'RCB Handle Grip SILVER-AHG66', 150.00, 350.00, 2, '232.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2242, 'RCB Handle Grip RED-AHG55', 185.00, 350.00, 2, '233.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2243, 'RCB Handle Grip BLUE-AHG55', 185.00, 350.00, 2, '234.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2244, 'Universal Handle Grip Rubber Red', 72.00, 150.00, 2, '235.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2245, 'Universal Handle Grip Rubber Blue', 72.00, 150.00, 2, '236.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2246, 'Universal Handle Grip Rubber Gray', 72.00, 150.00, 2, '237.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2247, 'Universal Handle Grip Rubber Pink', 72.00, 159.00, 2, '238.jpg', 1, 'none', 'These grips are generally made from high-quality rubber, ensuring long-lasting durability, resistance to fading, corrosion, and low temperatures.'),
(2248, 'domino lever cp/chrome', 110.00, 250.00, 2, '239.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(2249, 'domino lever mio black', 110.00, 250.00, 2, '240.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(2250, 'domino lever mio bgb', 110.00, 250.00, 2, '241.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(2251, 'ym lever guard 9011f', 115.00, 250.00, 6, '242.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(2252, 'yk brake lever mio-m', 81.00, 250.00, 5, '243.jpg', 1, 'none', 'Ergonomic to ensure comfortable operation and good grip during braking.'),
(2253, 'T19 Headlight Bulb Stock for Mio/Xrm/tmx/wave', 16.00, 70.00, 20, '244.jpg', 1, 'none', 'Heavy-duty sockets resist deformation, rust, and short circuits caused by moisture or road debris'),
(2254, 'Signal Light Bulb Socket', 12.00, 70.00, 15, '245.jpg', 1, 'none', 'Heavy-duty sockets resist deformation, rust, and short circuits caused by moisture or road debris'),
(2255, 'hylos mags mio', 5000.00, 6500.00, 2, '246.jpg', 1, 'none', 'Made up of Hard Alloy material with high wear resistance and toughness'),
(2256, 'hylos mags lc150', 5100.00, 6500.00, 2, '247.jpg', 1, 'none', 'Made up of Hard Alloy material with high wear resistance and toughness'),
(2257, 'rcb mags beat', 5300.00, 5800.00, 1, '248.jpg', 1, 'none', 'Made up of Hard Alloy material with high wear resistance and toughness'),
(2258, 'Mtr matting aerox (Brown box) g3115', 200.00, 500.00, 5, '249.jpg', 1, 'none', 'It improves both foot stability and aesthetics with its textured matting design, making riding safer and more comfortable'),
(2259, 'Mtr matting pcx (Brown box) g3115', 200.00, 500.00, 5, '250.jpg', 1, 'none', 'It improves both foot stability and aesthetics with its textured matting design, making riding safer and more comfortable'),
(2260, 'Firefly Mini Driving Light V2 (4wire)', 430.00, 1000.00, 2, '251.jpg', 1, 'none', 'Compact and high-performance lighting solution designed for motorcycles'),
(2261, 'Firefly Mini Driving Light White+Yellow Pair', 395.00, 850.00, 2, '252.jpg', 1, 'none', 'Compact and high-performance lighting solution designed for motorcycles'),
(2262, 'mini driving light WHITE+YELLOW', 190.00, 750.00, 3, '253.jpg', 1, 'none', 'Compact and high-performance lighting solution designed for motorcycles'),
(2263, 'engine oil filter yamaha/suzuki/kawasaki', 16.00, 70.00, 10, '254.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(2264, 'engine oil filter raider', 12.00, 70.00, 10, '255.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(2265, 'engine oil filter bajaj', 12.00, 70.00, 5, '256.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(2266, 'Oil filter kawasaki', 14.00, 50.00, 15, '257.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(2267, 'Oil filter suzuki', 15.00, 50.00, 15, '258.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(2268, 'oil filter yamaha', 30.00, 70.00, 20, '259.jpg', 1, 'none', 'These filters offer high-performance filtration and durability, crafted from high-grade materials. Designed for effective cleaning and purification of engine oil, they remove dirt, debris, and metal particles to extend engine life and maintain optimal performance.'),
(2269, 'Genuine Oil Seal 91202-KVB', 35.00, 150.00, 3, '260.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2270, 'Genuine Oil Seal Pulley Side 93102-25816', 32.00, 150.00, 10, '261.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2271, 'Honda Pulley Oil Seal Click 125/150 91202-KWN-901', 55.00, 230.00, 10, '262.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2272, 'oil seal pulley side aerox/nmax', 48.00, 185.00, 10, '263.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2273, 'Oil Seal Pulley Side Yamaha Nmax V1', 35.00, 150.00, 10, '264.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2274, 'Oil Seal Pulley Side for Mioi125/M3/Souli125', 45.00, 200.00, 10, '265.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2275, 'Oil Seal Pulley Yamaha Mio/Sporty/Soul Pulley/ Oil Seal', 32.00, 150.00, 10, '266.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2276, 'Oil Seal Pulley Side 93102-25816 Mioi125/m3/Soul125 Geniune', 45.00, 150.00, 10, '267.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2277, 'Pulley Oil Seal Suzuki Address/Skydrive/Sport FI', 89.00, 150.00, 5, '268.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2278, 'Yamaha Seal Oring Pully Nmax Lexi 2DP', 145.00, 280.00, 5, '269.jpg', 1, 'none', 'This oil seal is installed on the pulley side of the engines crankcase to prevent oil leakage and maintain smooth operation of the transmission system.'),
(2279, 'racing monkey ckp aerox', 420.00, 650.00, 3, '270.jpg', 1, 'none', 'Designed to improve engine performance and efficiency while providing accurate readings of engine position and speed.'),
(2280, 'racing monkey lighten valve', 900.00, 1300.00, 2, '271.jpg', 1, 'none', 'Designed to improve engine performance and efficiency while providing accurate readings of engine position and speed.'),
(2281, 'samco hose rad click', 400.00, 350.00, 2, '272.jpg', 1, 'none', 'SAMCO radiator hoses are handcrafted from top-grade silicone to ensure high durability, heat resistance, and reliability in the cooling system.'),
(2282, 'samco hose rad lc155', 400.00, 550.00, 2, '273.jpg', 1, 'none', 'SAMCO radiator hoses are handcrafted from top-grade silicone to ensure high durability, heat resistance, and reliability in the cooling system.'),
(2283, 'samco hose rad nmax', 330.00, 450.00, 2, '274.jpg', 1, 'none', 'SAMCO radiator hoses are handcrafted from top-grade silicone to ensure high durability, heat resistance, and reliability in the cooling system.'),
(2284, 'protaper radiator lc150 ', 5400.00, 6500.00, 2, '275.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2285, 'protaper radiator lc155', 5400.00, 6500.00, 2, '276.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2286, 'racing radiator comp y15zr', 5400.00, 6500.00, 1, '277.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2287, 'racing radiator comp y16zr', 5400.00, 6500.00, 1, '278.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2288, 'smok radiator cover exciter/lc150', 68.00, 250.00, 1, '279.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2289, 'smok radiator sniper155/y16zr red', 110.00, 250.00, 5, '280.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2290, 'smok radiator sniper155/y16zr blue', 110.00, 250.00, 5, '281.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2291, 'uma radiator aerox v2/nmax v2 280mm', 3150.00, 4800.00, 1, '282.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2292, 'uma radiator y16zr/s 155 290mm', 3420.00, 5000.00, 1, '283.jpg', 1, 'none', 'Designed to upgrade your motorcycles cooling system, providing better heat dissipation compared to the stock radiator. Improved thermal management helps protect the engine from overheating, especially during extended rides or hot climates.'),
(2293, 'APCC Master Repair Kit Nmax', 30.00, 150.00, 8, '284.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2294, 'APCC Master Repair Kit Mio F', 30.00, 150.00, 8, '285.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2295, 'APCC Master Repair Kit Nmax/F', 30.00, 150.00, 8, '286.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2296, 'APCC Master Repair Kit Beat/Click/Dash', 30.00, 150.00, 8, '287.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2297, 'APCC Master Repair Kit Raider-150/R', 30.00, 150.00, 6, '288.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.');
INSERT INTO `product` (`prod_id`, `prod_name`, `prod_capital`, `prod_price`, `prod_qty`, `prod_img`, `prod_status`, `prod_category`, `prod_description`) VALUES
(2298, 'APCC Master Repair Kit XRM/XRM125/F', 30.00, 150.00, 6, '289.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2299, 'APCC Master Repair Kit XRM/R', 30.00, 150.00, 4, '290.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2300, 'APCC Master Repair Kit 12MM', 30.00, 150.00, 6, '291.jpg', 1, 'none', 'The APCC Master Repair Kit is a high-quality, genuine part essential for repairing or rebuilding the brake master cylinder, available for front/rear and left/right positions.'),
(2301, 'Genuine Roller Weight Honda Click LED 15g Roll Set', 174.00, 300.00, 10, '292.jpg', 1, 'none', 'This Roller Weights set is a precise accessory for enhancing your motorcycles performance.'),
(2302, 'KOS Genuine Honda Roller Set ADV 160/PCX 160 19g Roller Set', 245.00, 400.00, 10, '293.jpg', 1, 'none', 'This Roller Weights set is a precise accessory for enhancing your motorcycles performance.'),
(2303, 'otaka rubber dumper barako', 37.00, 100.00, 3, '294.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE.'),
(2304, 'saiyan rubber dumper smash', 28.00, 100.00, 3, '295.jpg', 1, 'none', 'IT IS MADE FROM A HIGH QUALITY THAT MAKES IT DURABLE FOR A LONG-TERM USE.'),
(2305, 'motul 3000 plus 1 liter', 290.00, 375.00, 20, '296.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(2306, 'oil motul scooter 10w40 800ml', 285.00, 365.00, 40, '297.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(2307, 'oil motul scooter 1L', 265.00, 395.00, 20, '298.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(2308, 'Zeno scooter pro 10w40 800ML', 165.00, 250.00, 11, '299.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(2309, 'Zeno scooter pro 10w40 1L', 155.00, 270.00, 11, '300.jpg', 1, 'none', 'Helps increase fuel efficiency, maximize engine performance, and extend the recommended oil change interval, making it suitable for long rides and daily commuting.'),
(2310, 'Oil Seal Front Fork Oil Seal Dust Suzuki/Raider 150/Skydrive/Smash', 32.00, 120.00, 10, '301.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2311, 'GN5 Honda Fork Oil Seal (Shock) for Click V1/V2/RS150/Genio/Scoopy', 150.00, 200.00, 15, '302.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2312, 'Oil Seal Front Shock Yamaha Mio/Mio I/King/Aerox/Fazzio 125', 32.00, 120.00, 10, '303.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2313, 'saiyan shock oil seal tmx155', 17.00, 80.00, 5, '304.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2314, 'saiyan shock oil seal barako', 17.00, 80.00, 5, '305.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2315, 'Yamaha Nmax V1/V2 Front Shock Oil Seal', 40.00, 150.00, 20, '306.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2316, 'Honda Front Shock Oil Seal for XRM Wave/Mio Beat/Scoopy/Click', 25.00, 150.00, 25, '307.jpg', 1, 'none', 'Designed to provide a reliable barrier against dirt and moisture, it ensures the longevity of your motorcycles front fork system.'),
(2317, 'mvr1 shock lc150', 3400.00, 4500.00, 3, '308.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2318, 'protaper front shock lc150', 5800.00, 7500.00, 1, '309.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2319, 'SMOK REAR SHOCK 30MM HONDA CLICK 125/150 black/yellow', 690.00, 1150.00, 1, '310.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2320, 'SMOK REAR SHOCK 30MM HONDA CLICK 125/150 silver/black', 690.00, 1150.00, 1, '311.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2321, 'TAKAGASO Shock 300mm for MIO BLACK', 500.00, 1000.00, 1, '312.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2322, 'TAKAGASO Shock 300mm for MIO RED', 500.00, 1000.00, 1, '313.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2323, 'trc rear shock sniper135/ winnerx 1113-205mm silver/ yellow', 2100.00, 3000.00, 1, '314.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2324, 'trc rear shock sniper135/ winnerx 1113-205mm black/ yellow', 2100.00, 3000.00, 1, '315.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2325, 'trc rear shock sniper135/winnerx 1113-205mm silver/ blue', 2100.00, 3000.00, 1, '316.jpg', 1, 'none', 'Designed to absorb bumps and uneven surfaces, making it suitable for city commuting and heavy-use scenarios. Enhances ride quality and suspension performance for smoother handling. Improves control and reduces strain on the rider during long rides.'),
(2326, 'Honda 3pcs Set PCX and Click Slider Piece', 65.00, 200.00, 20, '317.jpg', 1, 'none', '-'),
(2327, 'Yamaha Pulley Slider Piece Set for Nmax/Aerox/Mio', 50.00, 250.00, 20, '318.jpg', 1, 'none', '-'),
(2328, 'ncy slider piece click', 75.00, 250.00, 10, '319.jpg', 1, 'none', '-'),
(2329, 'ncy slider piece mio', 60.00, 250.00, 10, '320.jpg', 1, 'none', '-'),
(2330, 'osaki speed cable rusi tc125', 63.00, 150.00, 2, '321.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2331, 'otaka speed cable wave100/alpha', 40.00, 150.00, 2, '322.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2332, 'otaka speed cable beat/beat fi', 47.00, 150.00, 3, '323.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2333, 'saiyan speed cable wave 125', 40.00, 150.00, 3, '324.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2334, 'sw speed cable xrm 110', 37.00, 150.00, 3, '325.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2335, 'sw speed cable wave 100', 37.00, 150.00, 3, '326.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2336, 'yk speed cable rusi125', 37.00, 150.00, 1, '327.jpg', 1, 'none', 'Designed with durable materials and OEM specifications, ensuring proper functionality and long-lasting performance'),
(2337, 'max speed chain 428', 420.00, 750.00, 4, '328.jpg', 1, 'none', '-'),
(2338, 'max speed chain 415', 420.00, 750.00, 4, '329.jpg', 1, 'none', '-'),
(2339, 'max speed chain sniper 428', 650.00, 750.00, 2, '330.jpg', 1, 'none', '-'),
(2340, 'max speed chain raider38/43', 650.00, 1500.00, 2, '331.jpg', 1, 'none', '-'),
(2341, 'max speed chain set raider 38mm', 650.00, 850.00, 1, '332.jpg', 1, 'none', '-');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int NOT NULL,
  `return_transaction_item` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `return_qty` int NOT NULL,
  `return_transaction_id` int NOT NULL
) ;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `return_transaction_item`, `return_qty`, `return_transaction_id`) VALUES
(25, '[{\"prod_id\":14,\"name\":\"prod 11\",\"qty\":2,\"type\":\"refund\"}]', 2, 85),
(26, '[{\"prod_id\":15,\"name\":\"product 12\",\"qty\":10,\"type\":\"refund\"}]', 10, 85),
(27, '[{\"prod_id\":13,\"name\":\"prod 9\",\"qty\":10,\"type\":\"refund\"}]', 10, 85),
(28, '[{\"prod_id\":16,\"name\":\"prod 25\",\"qty\":1,\"type\":\"refund\"}]', 1, 84);

-- --------------------------------------------------------

--
-- Table structure for table `service_cart`
--

CREATE TABLE `service_cart` (
  `service_id` int NOT NULL,
  `service_user_id` int NOT NULL,
  `service_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `service_price` decimal(10,2) NOT NULL,
  `service_employee_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `transaction_service` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `transaction_item` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `transaction_discount` decimal(10,2) NOT NULL,
  `transaction_vat` decimal(5,2) NOT NULL,
  `transaction_total` decimal(10,2) NOT NULL,
  `transaction_payment` decimal(10,2) NOT NULL,
  `transaction_change` decimal(10,2) NOT NULL,
  `transaction_by` int NOT NULL,
  `transaction_status` int NOT NULL COMMENT '0=archived,1=active'
) ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_date`, `transaction_service`, `transaction_item`, `transaction_discount`, `transaction_vat`, `transaction_total`, `transaction_payment`, `transaction_change`, `transaction_by`, `transaction_status`) VALUES
(83, '2025-09-24 05:50:16', '[]', '[{\"prod_id\":\"13\",\"name\":\"prod 9\",\"qty\":\"1\",\"subtotal\":\"60\",\"capital\":\"50\"},{\"prod_id\":\"16\",\"name\":\"prod 25\",\"qty\":\"1\",\"subtotal\":\"70\",\"capital\":\"50\"}]', 0.00, 13.93, 130.00, 140.00, 10.00, 1, 1),
(84, '2025-08-28 05:56:04', '[]', '[{\"prod_id\":\"13\",\"name\":\"prod 9\",\"qty\":\"1\",\"subtotal\":\"60\",\"capital\":\"50\"},{\"prod_id\":\"16\",\"name\":\"prod 25\",\"qty\":\"1\",\"subtotal\":\"70\",\"capital\":\"50\"}]', 0.00, 13.93, 130.00, 140.00, 10.00, 1, 1),
(85, '2025-10-08 05:57:44', '[]', '[{\"prod_id\":\"14\",\"name\":\"prod 11\",\"qty\":\"2\",\"subtotal\":\"200\",\"capital\":\"80\"},{\"prod_id\":\"15\",\"name\":\"product 12\",\"qty\":\"10\",\"subtotal\":\"900\",\"capital\":\"80\"},{\"prod_id\":\"13\",\"name\":\"prod 9\",\"qty\":\"10\",\"subtotal\":\"600\",\"capital\":\"50\"}]', 0.00, 182.14, 1700.00, 2000.00, 300.00, 1, 1),
(86, '2025-10-08 06:05:34', '[{\"service_id\":\"63\",\"name\":\"change oil\",\"price\":\"100\",\"user_id\":\"1\"}]', '[]', 0.00, 10.71, 100.00, 100.00, 0.00, 1, 1),
(88, '2025-10-08 06:38:14', '[]', '[{\"prod_id\":\"17\",\"name\":\"product999\",\"qty\":\"1\",\"subtotal\":\"70\",\"capital\":\"50\"},{\"prod_id\":\"8\",\"name\":\"test 2\",\"qty\":\"10\",\"subtotal\":\"600\",\"capital\":\"50\"}]', 0.00, 71.79, 670.00, 700.00, 30.00, 11, 1),
(89, '2025-10-10 02:00:55', '[{\"service_id\":\"56\",\"name\":\"asdasd\",\"price\":\"343\",\"user_id\":\"9\"}]', '[{\"prod_id\":\"3\",\"name\":\"product 2\",\"qty\":\"1\",\"subtotal\":\"11\",\"capital\":\"5\"}]', 0.00, 37.93, 354.00, 500.00, 146.00, 1, 1),
(90, '2025-10-11 07:31:15', '[]', '[{\"prod_id\":\"10\",\"name\":\"YumBurger\",\"qty\":\"1\",\"subtotal\":\"78\",\"capital\":\"68\"},{\"prod_id\":\"7\",\"name\":\"test\",\"qty\":\"1\",\"subtotal\":\"600\",\"capital\":\"500\"},{\"prod_id\":\"9\",\"name\":\"NSCJRIC\",\"qty\":\"1\",\"subtotal\":\"93\",\"capital\":\"83\"},{\"prod_id\":\"6\",\"name\":\"product 6\",\"qty\":\"1\",\"subtotal\":\"55\",\"capital\":\"50\"},{\"prod_id\":\"5\",\"name\":\"product 3\",\"qty\":\"1\",\"subtotal\":\"300\",\"capital\":\"280\"},{\"prod_id\":\"4\",\"name\":\"product 1\",\"qty\":\"1\",\"subtotal\":\"150\",\"capital\":\"130\"}]', 0.00, 136.71, 1276.00, 1276.00, 0.00, 1, 1),
(91, '2025-10-11 07:46:35', '[]', '[{\"prod_id\":\"6\",\"name\":\"product 6\",\"qty\":\"1\",\"subtotal\":\"55\",\"capital\":\"50\"},{\"prod_id\":\"11\",\"name\":\"product 7\",\"qty\":\"1\",\"subtotal\":\"60\",\"capital\":\"50\"}]', 0.00, 12.32, 115.00, 115.00, 0.00, 1, 1),
(92, '2025-10-11 07:49:17', '[]', '[{\"prod_id\":\"12\",\"name\":\"prod 8\",\"qty\":\"1\",\"subtotal\":\"60\",\"capital\":\"50\"}]', 0.00, 6.43, 60.00, 90.00, 30.00, 1, 1),
(94, '2025-10-11 11:20:09', '[]', '[{\"prod_id\":\"10\",\"name\":\"YumBurger\",\"qty\":\"1\",\"subtotal\":\"78\",\"capital\":\"68\"}]', 0.00, 8.36, 78.00, 90.00, 12.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pin` text COLLATE utf8mb4_general_ci,
  `position` enum('admin','employee','','') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'employee',
  `status` int NOT NULL DEFAULT '1' COMMENT '0=not active , 1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `pin`, `position`, `status`) VALUES
(1, 'juan', 'dela cruz', 'admin@gmail.com', 'admin', '$2a$12$jsAMWl2OcxUyo8OP7mLH4uTRYd5ln04QTtjU5O3qS1Q5N1o6f6yzm', NULL, 'admin', 1),
(7, 'Employee', 'Five', 'emp5@gmail.com', 'masterparj', '12345', '123451', 'employee', 1),
(8, 'Employee', 'Four', 'emp4@gmail.com', 'johndoe', NULL, '123459', 'employee', 1),
(9, 'Employee', 'One', 'emp1@gmail.com', 'jhonload123', NULL, '123456', 'employee', 1),
(10, 'Employee', 'Two', 'emp2@gmail.com', NULL, NULL, '123457', 'employee', 1),
(11, 'Employee', 'Three', 'emp3@gmail.com', '', NULL, '123458', 'employee', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `fk_employee` (`employee_id`),
  ADD KEY `fk_customer` (`appointment_customer_id`);

--
-- Indexes for table `business_details`
--
ALTER TABLE `business_details`
  ADD PRIMARY KEY (`business_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `deduction`
--
ALTER TABLE `deduction`
  ADD PRIMARY KEY (`deduction_id`),
  ADD KEY `deduction_emp_id` (`deduction_user_id`);

--
-- Indexes for table `item_cart`
--
ALTER TABLE `item_cart`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `return_transaction_id` (`return_transaction_id`);

--
-- Indexes for table `service_cart`
--
ALTER TABLE `service_cart`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `service_employee_id` (`service_employee_id`),
  ADD KEY `service_user_id` (`service_user_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `business_details`
--
ALTER TABLE `business_details`
  MODIFY `business_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deduction`
--
ALTER TABLE `deduction`
  MODIFY `deduction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item_cart`
--
ALTER TABLE `item_cart`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2342;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_cart`
--
ALTER TABLE `service_cart`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`appointment_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `deduction`
--
ALTER TABLE `deduction`
  ADD CONSTRAINT `deduction_ibfk_1` FOREIGN KEY (`deduction_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`return_transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_cart`
--
ALTER TABLE `service_cart`
  ADD CONSTRAINT `service_cart_ibfk_1` FOREIGN KEY (`service_employee_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_cart_ibfk_2` FOREIGN KEY (`service_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
