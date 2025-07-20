-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2025 at 05:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `location`, `budget`) VALUES
(1, 'Sales', 'New York', 1000000.00),
(2, 'Marketing', 'Chicago', 800000.00),
(3, 'IT', 'San Francisco', 1200000.00),
(4, 'HR', 'Boston', 600000.00),
(5, 'Finance', 'New York', 900000.00);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `hire_date`, `department_id`, `salary`) VALUES
(101, 'John', 'Smith', 'john.smith@company.com', '2018-06-15', 1, 75000.00),
(102, 'Sarah', 'Johnson', 'sarah.johnson@company.com', '2019-03-22', 2, 68000.00),
(103, 'Michael', 'Williams', 'michael.williams@company.com', '2020-11-05', 3, 82000.00),
(104, 'Emily', 'Brown', 'emily.brown@company.com', '2017-09-10', 1, 78000.00),
(105, 'David', 'Jones', 'david.jones@company.com', '2021-01-30', 4, 65000.00),
(106, 'Jessica', 'Garcia', 'jessica.garcia@company.com', '2019-07-12', 3, 88000.00),
(107, 'Daniel', 'Miller', 'daniel.miller@company.com', '2020-05-18', 5, 72000.00),
(108, 'Lisa', 'Davis', 'lisa.davis@company.com', '2018-02-14', 2, 69000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `price`, `stock_quantity`) VALUES
(1001, 'Laptop Pro', 'Electronics', 999.99, 50),
(1002, 'Smartphone X', 'Electronics', 799.99, 100),
(1003, 'Wireless Headphones', 'Electronics', 149.99, 200),
(1004, 'Desk Chair', 'Furniture', 199.99, 75),
(1005, 'Coffee Maker', 'Appliances', 89.99, 120),
(1006, 'Notebook Set', 'Office Supplies', 24.99, 300),
(1007, 'Backpack', 'Accessories', 59.99, 150);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `employee_id`, `sale_date`, `quantity`, `total_amount`) VALUES
(5001, 1001, 101, '2023-01-15', 1, 999.99),
(5002, 1002, 101, '2023-01-16', 2, 1599.98),
(5003, 1003, 104, '2023-01-17', 3, 449.97),
(5004, 1005, 104, '2023-01-18', 1, 89.99),
(5005, 1007, 102, '2023-01-19', 5, 299.95),
(5006, 1004, 103, '2023-01-20', 2, 399.98),
(5007, 1006, 105, '2023-01-21', 10, 249.90),
(5008, 1002, 106, '2023-01-22', 1, 799.99),
(5009, 1003, 107, '2023-01-23', 4, 599.96),
(5010, 1001, 108, '2023-01-24', 1, 999.99);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sales_analysis`
-- (See below for the actual view)
--
CREATE TABLE `sales_analysis` (
`sale_id` int(11)
,`sale_date` date
,`product_name` varchar(100)
,`category` varchar(50)
,`price` decimal(10,2)
,`quantity` int(11)
,`total_amount` decimal(10,2)
,`employee_name` varchar(101)
,`department_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure for view `sales_analysis`
--
DROP TABLE IF EXISTS `sales_analysis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_analysis`  AS SELECT `s`.`sale_id` AS `sale_id`, `s`.`sale_date` AS `sale_date`, `p`.`product_name` AS `product_name`, `p`.`category` AS `category`, `p`.`price` AS `price`, `s`.`quantity` AS `quantity`, `s`.`total_amount` AS `total_amount`, concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee_name`, `d`.`department_name` AS `department_name` FROM (((`sales` `s` join `products` `p` on(`s`.`product_id` = `p`.`product_id`)) join `employees` `e` on(`s`.`employee_id` = `e`.`employee_id`)) join `departments` `d` on(`e`.`department_id` = `d`.`department_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
