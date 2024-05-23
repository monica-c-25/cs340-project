-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2024 at 08:17 PM
-- Server version: 10.6.17-MariaDB-log
-- PHP Version: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_wongsid`
--

-- --------------------------------------------------------

--
-- Table structure for table `Collections`
--

CREATE TABLE `Collections` (
  `collection_id` int(11) NOT NULL,
  `collection_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Collections`
--

INSERT INTO `Collections` (`collection_id`, `collection_name`) VALUES
(123, 'Technic'),
(456, 'Botanical'),
(789, 'Lunar New Year');

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customer_id` int(11) NOT NULL,
  `customer_location` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customer_id`, `customer_location`) VALUES
(1, 'San Francisco, CA'),
(2, 'Las Vegas, NV'),
(3, 'Seattle, WA'),
(4, 'Los Angeles, CA'),
(5, 'Miami, FL'),
(6, 'San Francisco, CA');

-- --------------------------------------------------------

--
-- Table structure for table `Pieces`
--

CREATE TABLE `Pieces` (
  `piece_id` int(11) NOT NULL,
  `piece_color` varchar(45) NOT NULL,
  `piece_name` varchar(45) NOT NULL,
  `piece_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Pieces`
--

INSERT INTO `Pieces` (`piece_id`, `piece_color`, `piece_name`, `piece_price`) VALUES
(300326, 'Black', 'Brick 2x2', 0.18),
(4177431, 'Black', 'Double conical', 0.02),
(4547224, 'Earth green', 'Left shell 3x10', 0.15),
(6266964, 'Bright green', 'Limb element', 0.05),
(6267125, 'Bright orange', 'Vegetable no.3', 0.02),
(6338181, 'Bright bluish green', 'Plate 2x4', 0.01);

-- --------------------------------------------------------

--
-- Table structure for table `Sets`
--

CREATE TABLE `Sets` (
  `set_id` int(11) NOT NULL,
  `set_name` varchar(45) NOT NULL,
  `set_release` date NOT NULL,
  `set_min_age` int(11) NOT NULL,
  `set_retired` date DEFAULT NULL,
  `set_price` decimal(10,2) NOT NULL,
  `Collections_collection_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Sets`
--

INSERT INTO `Sets` (`set_id`, `set_name`, `set_release`, `set_min_age`, `set_retired`, `set_price`, `Collections_collection_id`) VALUES
(10281, 'Bonsai Tree', '2021-01-02', 18, NULL, 49.99, 456),
(10295, 'Porsche 911', '2021-03-01', 18, NULL, 169.99, 123),
(10311, 'Orchid', '2022-05-01', 18, NULL, 49.99, 456),
(40611, 'Year of the Dragon', '2024-01-20', 8, '2024-02-06', 9.99, 789),
(40648, 'Money Tree', '2022-12-25', 9, NULL, 24.99, 456),
(42083, 'Bugatti Chiron', '2018-06-01', 16, '2022-12-31', 349.99, 123);

-- --------------------------------------------------------

--
-- Table structure for table `Sets_has_Customers`
--

CREATE TABLE `Sets_has_Customers` (
  `sets_set_id` int(11) NOT NULL,
  `customers_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Sets_has_Customers`
--

INSERT INTO `Sets_has_Customers` (`sets_set_id`, `customers_customer_id`) VALUES
(10281, 3),
(10295, 1),
(10311, 2),
(40611, 4),
(40648, 5),
(42083, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Sets_has_Pieces`
--

CREATE TABLE `Sets_has_Pieces` (
  `sets_set_id` int(11) NOT NULL,
  `pieces_piece_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `Sets_has_Pieces`
--

INSERT INTO `Sets_has_Pieces` (`sets_set_id`, `pieces_piece_id`) VALUES
(10281, 6266964),
(10295, 300326),
(10311, 4547224),
(40611, 6338181),
(40648, 4177431),
(42083, 6267125);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Collections`
--
ALTER TABLE `Collections`
  ADD PRIMARY KEY (`collection_id`),
  ADD UNIQUE KEY `collection_id_UNIQUE` (`collection_id`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_id_UNIQUE` (`customer_id`);

--
-- Indexes for table `Pieces`
--
ALTER TABLE `Pieces`
  ADD PRIMARY KEY (`piece_id`);

--
-- Indexes for table `Sets`
--
ALTER TABLE `Sets`
  ADD PRIMARY KEY (`set_id`,`Collections_collection_id`),
  ADD UNIQUE KEY `set_id_UNIQUE` (`set_id`),
  ADD KEY `fk_Sets_Collections1_idx` (`Collections_collection_id`);

--
-- Indexes for table `Sets_has_Customers`
--
ALTER TABLE `Sets_has_Customers`
  ADD PRIMARY KEY (`sets_set_id`,`customers_customer_id`),
  ADD KEY `fk_sets_has_customers_customers1_idx` (`customers_customer_id`),
  ADD KEY `fk_sets_has_customers_sets_idx` (`sets_set_id`);

--
-- Indexes for table `Sets_has_Pieces`
--
ALTER TABLE `Sets_has_Pieces`
  ADD PRIMARY KEY (`sets_set_id`,`pieces_piece_id`),
  ADD KEY `fk_sets_has_pieces_pieces1_idx` (`pieces_piece_id`),
  ADD KEY `fk_sets_has_pieces_sets1_idx` (`sets_set_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=778;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Sets`
--
ALTER TABLE `Sets`
  ADD CONSTRAINT `fk_Sets_Collections1` FOREIGN KEY (`Collections_collection_id`) REFERENCES `Collections` (`collection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Sets_has_Customers`
--
ALTER TABLE `Sets_has_Customers`
  ADD CONSTRAINT `fk_sets_has_customers_customers1` FOREIGN KEY (`customers_customer_id`) REFERENCES `Customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sets_has_customers_sets` FOREIGN KEY (`sets_set_id`) REFERENCES `Sets` (`set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Sets_has_Pieces`
--
ALTER TABLE `Sets_has_Pieces`
  ADD CONSTRAINT `fk_sets_has_pieces_pieces1` FOREIGN KEY (`pieces_piece_id`) REFERENCES `Pieces` (`piece_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sets_has_pieces_sets1` FOREIGN KEY (`sets_set_id`) REFERENCES `Sets` (`set_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
