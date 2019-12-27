-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 27 Δεκ 2019 στις 19:11:52
-- Έκδοση διακομιστή: 10.4.8-MariaDB
-- Έκδοση PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `stratego`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN

REPLACE INTO board SELECT * FROM empty_board;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `x` tinyint(2) NOT NULL,
  `y` tinyint(2) NOT NULL,
  `board_color` enum('green','blue') CHARACTER SET utf8 NOT NULL,
  `piece_color` enum('R','B') CHARACTER SET utf8 DEFAULT NULL,
  `piece` enum('F','B','10','9','8','7','6','5','4','3','2','S') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`x`, `y`, `board_color`, `piece_color`, `piece`) VALUES
(1, 1, 'green', NULL, NULL),
(1, 2, 'green', NULL, NULL),
(1, 3, 'green', NULL, NULL),
(1, 4, 'green', NULL, NULL),
(1, 5, 'green', NULL, NULL),
(1, 6, 'green', NULL, NULL),
(1, 7, 'green', NULL, NULL),
(1, 8, 'green', NULL, NULL),
(1, 9, 'green', NULL, NULL),
(1, 10, 'green', NULL, NULL),
(2, 1, 'green', NULL, NULL),
(2, 2, 'green', NULL, NULL),
(2, 3, 'green', NULL, NULL),
(2, 4, 'green', NULL, NULL),
(2, 5, 'green', NULL, NULL),
(2, 6, 'green', NULL, NULL),
(2, 7, 'green', NULL, NULL),
(2, 8, 'green', NULL, NULL),
(2, 9, 'green', NULL, NULL),
(2, 10, 'green', NULL, NULL),
(3, 1, 'green', NULL, NULL),
(3, 2, 'green', NULL, NULL),
(3, 3, 'green', NULL, NULL),
(3, 4, 'green', NULL, NULL),
(3, 5, 'blue', NULL, NULL),
(3, 6, 'blue', NULL, NULL),
(3, 7, 'green', NULL, NULL),
(3, 8, 'green', NULL, NULL),
(3, 9, 'green', NULL, NULL),
(3, 10, 'green', NULL, NULL),
(4, 1, 'green', NULL, NULL),
(4, 2, 'green', NULL, NULL),
(4, 3, 'green', NULL, NULL),
(4, 4, 'green', NULL, NULL),
(4, 5, 'blue', NULL, NULL),
(4, 6, 'blue', NULL, NULL),
(4, 7, 'green', NULL, NULL),
(4, 8, 'green', NULL, NULL),
(4, 9, 'green', NULL, NULL),
(4, 10, 'green', NULL, NULL),
(5, 1, 'green', NULL, NULL),
(5, 2, 'green', NULL, NULL),
(5, 3, 'green', NULL, NULL),
(5, 4, 'green', NULL, NULL),
(5, 5, 'green', NULL, NULL),
(5, 6, 'green', NULL, NULL),
(5, 7, 'green', NULL, NULL),
(5, 8, 'green', NULL, NULL),
(5, 9, 'green', NULL, NULL),
(5, 10, 'green', NULL, NULL),
(7, 1, 'green', NULL, NULL),
(7, 2, 'green', NULL, NULL),
(7, 3, 'green', NULL, NULL),
(7, 4, 'green', NULL, NULL),
(7, 5, 'blue', NULL, NULL),
(7, 6, 'blue', NULL, NULL),
(7, 7, 'green', NULL, NULL),
(7, 8, 'green', NULL, NULL),
(7, 9, 'green', NULL, NULL),
(7, 10, 'green', NULL, NULL),
(8, 1, 'green', NULL, NULL),
(8, 2, 'green', NULL, NULL),
(8, 3, 'green', NULL, NULL),
(8, 4, 'green', NULL, NULL),
(8, 5, 'blue', NULL, NULL),
(8, 6, 'blue', NULL, NULL),
(8, 7, 'green', NULL, NULL),
(8, 8, 'green', NULL, NULL),
(8, 9, 'green', NULL, NULL),
(8, 10, 'green', NULL, NULL),
(9, 1, 'green', NULL, NULL),
(9, 2, 'green', NULL, NULL),
(9, 3, 'green', NULL, NULL),
(9, 4, 'green', NULL, NULL),
(9, 5, 'green', NULL, NULL),
(9, 6, 'green', NULL, NULL),
(9, 7, 'green', NULL, NULL),
(9, 8, 'green', NULL, NULL),
(9, 9, 'green', NULL, NULL),
(9, 10, 'green', NULL, NULL),
(10, 1, 'green', NULL, NULL),
(10, 2, 'green', NULL, NULL),
(10, 3, 'green', NULL, NULL),
(10, 4, 'green', NULL, NULL),
(10, 5, 'green', NULL, NULL),
(10, 6, 'green', NULL, NULL),
(10, 7, 'green', NULL, NULL),
(10, 8, 'green', NULL, NULL),
(10, 9, 'green', NULL, NULL),
(10, 10, 'green', NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_player`
--

CREATE TABLE `board_player` (
  `piece` enum('F','B','10','9','8','7','6','5','4','3','2','S') COLLATE utf8_bin NOT NULL,
  `x` tinyint(2) NOT NULL,
  `y` tinyint(2) NOT NULL,
  `piece_color` enum('R','B') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `board_player`
--

INSERT INTO `board_player` (`piece`, `x`, `y`, `piece_color`) VALUES
('F', 1, 1, NULL),
('9', 2, 1, NULL),
('6', 3, 1, NULL),
('4', 4, 1, NULL),
('2', 5, 1, NULL),
('B', 1, 2, NULL),
('8', 2, 2, NULL),
('6', 3, 2, NULL),
('4', 4, 2, NULL),
('2', 5, 2, NULL),
('B', 1, 3, NULL),
('8', 2, 3, NULL),
('5', 3, 3, NULL),
('3', 4, 3, NULL),
('2', 5, 3, NULL),
('B', 1, 4, NULL),
('7', 2, 4, NULL),
('5', 3, 4, NULL),
('3', 4, 4, NULL),
('2', 5, 4, NULL),
('B', 1, 5, NULL),
('7', 2, 5, NULL),
('5', 3, 5, NULL),
('3', 4, 5, NULL),
('2', 5, 5, NULL),
('B', 1, 6, NULL),
('7', 2, 6, NULL),
('5', 3, 6, NULL),
('3', 4, 6, NULL),
('2', 5, 6, NULL),
('B', 1, 7, NULL),
('6', 2, 7, NULL),
('4', 3, 7, NULL),
('3', 4, 7, NULL),
('2', 5, 7, NULL),
('10', 1, 8, NULL),
('6', 2, 8, NULL),
('4', 3, 8, NULL),
('2', 4, 8, NULL),
('S', 5, 8, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `empty_board`
--

CREATE TABLE `empty_board` (
  `x` tinyint(2) NOT NULL,
  `y` tinyint(2) NOT NULL,
  `board_color` enum('green','blue') CHARACTER SET utf8 NOT NULL,
  `piece` enum('F','B','10','9','8','7','6','5','4','3','2','S') CHARACTER SET utf8 DEFAULT NULL,
  `piece_color` enum('R','B') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `empty_board`
--

INSERT INTO `empty_board` (`x`, `y`, `board_color`, `piece`, `piece_color`) VALUES
(1, 1, 'green', NULL, NULL),
(1, 2, 'green', NULL, NULL),
(1, 3, 'green', NULL, NULL),
(1, 4, 'green', NULL, NULL),
(1, 5, 'green', NULL, NULL),
(1, 6, 'green', NULL, NULL),
(1, 7, 'green', NULL, NULL),
(1, 8, 'green', NULL, NULL),
(1, 9, 'green', NULL, NULL),
(1, 10, 'green', NULL, NULL),
(2, 1, 'green', NULL, NULL),
(2, 2, 'green', NULL, NULL),
(2, 3, 'green', NULL, NULL),
(2, 4, 'green', NULL, NULL),
(2, 5, 'green', NULL, NULL),
(2, 6, 'green', NULL, NULL),
(2, 7, 'green', NULL, NULL),
(2, 8, 'green', NULL, NULL),
(2, 9, 'green', NULL, NULL),
(2, 10, 'green', NULL, NULL),
(3, 1, 'green', NULL, NULL),
(3, 2, 'green', NULL, NULL),
(3, 3, 'green', NULL, NULL),
(3, 4, 'green', NULL, NULL),
(3, 5, 'blue', NULL, NULL),
(3, 6, 'blue', NULL, NULL),
(3, 7, 'green', NULL, NULL),
(3, 8, 'green', NULL, NULL),
(3, 9, 'green', NULL, NULL),
(3, 10, 'green', NULL, NULL),
(4, 1, 'green', NULL, NULL),
(4, 2, 'green', NULL, NULL),
(4, 3, 'green', NULL, NULL),
(4, 4, 'green', NULL, NULL),
(4, 5, 'blue', NULL, NULL),
(4, 6, 'blue', NULL, NULL),
(4, 7, 'green', NULL, NULL),
(4, 8, 'green', NULL, NULL),
(4, 9, 'green', NULL, NULL),
(4, 10, 'green', NULL, NULL),
(5, 1, 'green', NULL, NULL),
(5, 2, 'green', NULL, NULL),
(5, 3, 'green', NULL, NULL),
(5, 4, 'green', NULL, NULL),
(5, 5, 'green', NULL, NULL),
(5, 6, 'green', NULL, NULL),
(5, 7, 'green', NULL, NULL),
(5, 8, 'green', NULL, NULL),
(5, 9, 'green', NULL, NULL),
(5, 10, 'green', NULL, NULL),
(7, 1, 'green', NULL, NULL),
(7, 2, 'green', NULL, NULL),
(7, 3, 'green', NULL, NULL),
(7, 4, 'green', NULL, NULL),
(7, 5, 'blue', NULL, NULL),
(7, 6, 'blue', NULL, NULL),
(7, 7, 'green', NULL, NULL),
(7, 8, 'green', NULL, NULL),
(7, 9, 'green', NULL, NULL),
(7, 10, 'green', NULL, NULL),
(8, 1, 'green', NULL, NULL),
(8, 2, 'green', NULL, NULL),
(8, 3, 'green', NULL, NULL),
(8, 4, 'green', NULL, NULL),
(8, 5, 'blue', NULL, NULL),
(8, 6, 'blue', NULL, NULL),
(8, 7, 'green', NULL, NULL),
(8, 8, 'green', NULL, NULL),
(8, 9, 'green', NULL, NULL),
(8, 10, 'green', NULL, NULL),
(9, 1, 'green', NULL, NULL),
(9, 2, 'green', NULL, NULL),
(9, 3, 'green', NULL, NULL),
(9, 4, 'green', NULL, NULL),
(9, 5, 'green', NULL, NULL),
(9, 6, 'green', NULL, NULL),
(9, 7, 'green', NULL, NULL),
(9, 8, 'green', NULL, NULL),
(9, 9, 'green', NULL, NULL),
(9, 10, 'green', NULL, NULL),
(10, 1, 'green', NULL, NULL),
(10, 2, 'green', NULL, NULL),
(10, 3, 'green', NULL, NULL),
(10, 4, 'green', NULL, NULL),
(10, 5, 'green', NULL, NULL),
(10, 6, 'green', NULL, NULL),
(10, 7, 'green', NULL, NULL),
(10, 8, 'green', NULL, NULL),
(10, 9, 'green', NULL, NULL),
(10, 10, 'green', NULL, NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','\r\nended','aborded') COLLATE utf8_bin NOT NULL DEFAULT 'not active',
  `p_turn` enum('R','B') COLLATE utf8_bin DEFAULT NULL,
  `result` enum('B','R','D') COLLATE utf8_bin DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN

SET NEW.last_change = NOW();

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `piece_color` enum('R','B') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `piece_color`) VALUES
(NULL, 'R'),
(NULL, 'B');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Ευρετήρια για πίνακα `board_player`
--
ALTER TABLE `board_player`
  ADD PRIMARY KEY (`y`,`x`);

--
-- Ευρετήρια για πίνακα `empty_board`
--
ALTER TABLE `empty_board`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`piece_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
