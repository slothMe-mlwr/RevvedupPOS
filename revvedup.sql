-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2025 at 09:28 AM
-- Server version: 10.4.32-MariaDB
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
  `appointment_id` int(11) NOT NULL,
  `reference_number` int(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `appointment_customer_id` int(11) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `city` varchar(60) NOT NULL,
  `street` text NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` time NOT NULL,
  `emergency` tinyint(1) DEFAULT 0,
  `status` enum('pending','request canceled','approved','canceled') DEFAULT 'pending',
  `seen` int(11) NOT NULL DEFAULT 0 COMMENT '0=unseen,1=seen',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `reference_number`, `service`, `employee_id`, `appointment_customer_id`, `fullname`, `contact`, `city`, `street`, `appointmentDate`, `appointmentTime`, `emergency`, `status`, `seen`, `created_at`) VALUES
(17, 561535, 'Brake Service', 8, 1, 'john doe', '09454454744', '', '', '2025-09-30', '14:45:00', 1, 'approved', 1, '2025-09-30 06:46:02'),
(18, 635986, 'Engine Repair', 9, 1, 'john doe', '09454454744', '', '', '2025-10-08', '09:12:00', 1, 'approved', 1, '2025-10-08 02:12:39'),
(19, 755112, 'Engine Repair', 9, 1, 'joshua san padilla', '09454454741', 'Angono', 'sta.rosa 2 marilao', '2025-10-08', '10:40:00', 0, 'pending', 1, '2025-10-08 02:40:09'),
(20, 247723, 'Engine Repair', 10, 1, 'Joshua Anderson Padilla', '09454454741', 'Antipolo', 'acacia123', '2025-10-09', '08:00:00', 0, 'approved', 1, '2025-10-08 06:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `business_details`
--

CREATE TABLE `business_details` (
  `business_id` int(11) NOT NULL,
  `business_name` varchar(60) NOT NULL,
  `business_address` text NOT NULL,
  `business_contact_num` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_details`
--

INSERT INTO `business_details` (`business_id`, `business_name`, `business_address`, `business_contact_num`) VALUES
(1, 'reveveveup', 'sta.maria bulacan', '09454454744');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_fullname` varchar(60) NOT NULL,
  `customer_email` varchar(60) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_status` int(11) NOT NULL DEFAULT 1 COMMENT '0=notactive,1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_fullname`, `customer_email`, `customer_password`, `customer_status`) VALUES
(1, 'joshua', 'joshua@gmail.com', '$2y$10$q4ZHWGUQ4NHj8ySLgBzTXOmP2SGMDlfYrDxv8j89sDTaX5A/YPqV2', 1),
(2, 'andy anderson', 'andersonandy046@gmail.com', '$2y$10$EbOfPhVjI/d9oOoAbIhpJ.qwJmiw8LP9SyZilCQq2FQaBvYMDRyUC', 1),
(3, 'honey jane', 'honey@gmail.com', '$2y$10$61znkLaYwPKvI6yhyg6ToeCZLXejP6kE4FhJkNPzXlPO1hi1wxTlu', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deduction`
--

CREATE TABLE `deduction` (
  `deduction_id` int(11) NOT NULL,
  `deduction_date` varchar(60) NOT NULL,
  `deduction_user_id` int(11) NOT NULL,
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
  `item_id` int(11) NOT NULL,
  `item_user_id` int(11) NOT NULL,
  `item_prod_id` int(60) NOT NULL,
  `item_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(60) NOT NULL,
  `prod_capital` decimal(10,2) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `prod_img` varchar(255) NOT NULL,
  `prod_status` int(11) NOT NULL DEFAULT 1 COMMENT '0=deleted,1=archived',
  `prod_category` varchar(60) NOT NULL,
  `prod_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_capital`, `prod_price`, `prod_qty`, `prod_img`, `prod_status`, `prod_category`, `prod_description`) VALUES
(3, 'product 2', 5.00, 11.00, 74, 'item_68d60b3664f741.76866050.png', 1, 'Exhaust Systems', ''),
(4, 'product 1', 130.00, 150.00, 78, 'item_68d6430495df58.36133211.jpg', 1, 'Exhaust Systems', ''),
(5, 'product 3', 280.00, 300.00, 45, 'item_68d643420bba08.70461903.jpg', 1, 'Wheels & Tires', ''),
(6, 'product 6', 50.00, 55.00, 44, 'item_68d77ad7dc2db3.03460954.avif', 1, 'Exhaust Systems', ''),
(7, 'test', 500.00, 600.00, 1, 'item_68d776d7db06b6.21276657.jpg', 1, 'Brakes', ''),
(8, 'test 2', 50.00, 60.00, 90, 'item_68d9f9e9b27152.72092957.jpg', 1, 'Engine & Transmission', ''),
(9, 'NSCJRIC', 83.00, 93.00, 99, 'item_68dbfe90131176.75854224.jpg', 1, 'Exhaust Systems', ''),
(10, 'YumBurger', 68.00, 78.00, 98, 'item_68dbfe7e4f9863.95790433.jpg', 1, 'Brakes', ''),
(11, 'product 7', 50.00, 60.00, 100, 'item_68e5ca3b3f18f8.74338685.png', 1, 'Exhaust Systems', ''),
(12, 'prod 8', 50.00, 60.00, 100, 'item_68e5ca4dc15d48.64074690.png', 1, 'Brakes', ''),
(13, 'prod 9', 50.00, 60.00, 84, 'item_68e5ca6640d9e9.53380142.jpg', 1, 'Brakes', ''),
(14, 'prod 11', 80.00, 100.00, 98, 'item_68e5cb005dd2f4.49248458.jpg', 1, 'Brakes', ''),
(15, 'product 12', 80.00, 90.00, 88, 'item_68e5cb19de9963.71942622.webp', 1, 'Brakes', 'test'),
(16, 'prod 25', 50.00, 70.00, 94, 'item_68e5d3e68a1168.69512322.jpg', 0, 'Brakes', 'esfsefefs'),
(17, 'product999', 50.00, 70.00, 0, 'item_68e6035ea67784.36488944.jpg', 1, 'Engine & Transmission', 'loremloremloremloremloremloremloremloremloremlorem');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(11) NOT NULL,
  `return_transaction_item` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`return_transaction_item`)),
  `return_qty` int(11) NOT NULL,
  `return_transaction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `service_id` int(11) NOT NULL,
  `service_user_id` int(11) NOT NULL,
  `service_name` varchar(60) NOT NULL,
  `service_price` decimal(10,2) NOT NULL,
  `service_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `transaction_service` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`transaction_service`)),
  `transaction_item` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`transaction_item`)),
  `transaction_discount` decimal(10,2) NOT NULL,
  `transaction_vat` decimal(5,2) NOT NULL,
  `transaction_total` decimal(10,2) NOT NULL,
  `transaction_payment` decimal(10,2) NOT NULL,
  `transaction_change` decimal(10,2) NOT NULL,
  `transaction_by` int(11) NOT NULL,
  `transaction_status` int(11) NOT NULL COMMENT '0=archived,1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_date`, `transaction_service`, `transaction_item`, `transaction_discount`, `transaction_vat`, `transaction_total`, `transaction_payment`, `transaction_change`, `transaction_by`, `transaction_status`) VALUES
(83, '2025-10-08 05:50:16', '[]', '[{\"prod_id\":\"13\",\"name\":\"prod 9\",\"qty\":\"1\",\"subtotal\":\"60\",\"capital\":\"50\"},{\"prod_id\":\"16\",\"name\":\"prod 25\",\"qty\":\"1\",\"subtotal\":\"70\",\"capital\":\"50\"}]', 0.00, 13.93, 130.00, 140.00, 10.00, 1, 1),
(84, '2025-10-08 05:56:04', '[]', '[{\"prod_id\":\"13\",\"name\":\"prod 9\",\"qty\":\"1\",\"subtotal\":\"60\",\"capital\":\"50\"},{\"prod_id\":\"16\",\"name\":\"prod 25\",\"qty\":\"1\",\"subtotal\":\"70\",\"capital\":\"50\"}]', 0.00, 13.93, 130.00, 140.00, 10.00, 1, 1),
(85, '2025-10-08 05:57:44', '[]', '[{\"prod_id\":\"14\",\"name\":\"prod 11\",\"qty\":\"2\",\"subtotal\":\"200\",\"capital\":\"80\"},{\"prod_id\":\"15\",\"name\":\"product 12\",\"qty\":\"10\",\"subtotal\":\"900\",\"capital\":\"80\"},{\"prod_id\":\"13\",\"name\":\"prod 9\",\"qty\":\"10\",\"subtotal\":\"600\",\"capital\":\"50\"}]', 0.00, 182.14, 1700.00, 2000.00, 300.00, 1, 1),
(86, '2025-10-08 06:05:34', '[{\"service_id\":\"63\",\"name\":\"change oil\",\"price\":\"100\",\"user_id\":\"1\"}]', '[]', 0.00, 10.71, 100.00, 100.00, 0.00, 1, 1),
(88, '2025-10-08 06:38:14', '[]', '[{\"prod_id\":\"17\",\"name\":\"product999\",\"qty\":\"1\",\"subtotal\":\"70\",\"capital\":\"50\"},{\"prod_id\":\"8\",\"name\":\"test 2\",\"qty\":\"10\",\"subtotal\":\"600\",\"capital\":\"50\"}]', 0.00, 71.79, 670.00, 700.00, 30.00, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pin` text DEFAULT NULL,
  `position` enum('admin','employee','','') NOT NULL DEFAULT 'employee',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0=not active , 1=active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `pin`, `position`, `status`) VALUES
(1, 'juan', 'dela cruz', 'admin@gmail.com', 'admin', '$2a$12$jsAMWl2OcxUyo8OP7mLH4uTRYd5ln04QTtjU5O3qS1Q5N1o6f6yzm', NULL, 'admin', 1),
(7, 'joshua', 'padilla', 'joshua@gmail.com', 'masterparj', NULL, '54321', 'employee', 1),
(8, 'john', 'doe', 'johndoe123@gmail.com', 'johndoe', NULL, '000000', 'employee', 1),
(9, 'johnloyd', 'richard', 'johnloyd@gmail.com', 'jhonload123', NULL, '3409834', 'employee', 1),
(10, 'Daniel', 'Padilla', 'djpadilla@gmail.com', NULL, NULL, '87000', 'employee', 1),
(11, 'samantha', 'conception', 'sam@gmail.com', '', NULL, '88888', 'employee', 1);

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
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `business_details`
--
ALTER TABLE `business_details`
  MODIFY `business_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deduction`
--
ALTER TABLE `deduction`
  MODIFY `deduction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item_cart`
--
ALTER TABLE `item_cart`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `service_cart`
--
ALTER TABLE `service_cart`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
