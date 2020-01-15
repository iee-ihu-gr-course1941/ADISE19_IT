-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 15 Ιαν 2020 στις 19:08:55
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
update `players` set username=null, token=null;

update `game_status` set `status`='not active', `p_turn`=null, `result`=null;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece` (IN `x1` TINYINT, IN `y1` TINYINT, IN `x2` TINYINT, IN `y2` TINYINT)  BEGIN
	declare  p, p_color,pnew,pnew_color char;
	
	select  piece, piece_color into p, p_color FROM `board` WHERE X=x1 AND Y=y1;
    select  piece, piece_color into pnew, pnew_color FROM `board` WHERE X=x2 AND Y=y2;
	
    if (p='10') THEN
       if (pnew='B' OR pnew='10') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;

   if (p='9') THEN
       if (pnew='B' OR pnew='9') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;

   if (p='8') THEN
       if (pnew='B' OR pnew='8') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;

  if (p='7') THEN
       if (pnew='B' OR pnew='7') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9' OR pnew='8') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;

if (p='6') THEN
       if (pnew='B' OR pnew='6') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9' OR pnew='8' OR pnew='7') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;

if (p='5') THEN
       if (pnew='B' OR pnew='5') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9' OR pnew='8'OR pnew='7' OR pnew='6') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;

if (p='4') THEN
       if (pnew='B' OR pnew='4') THEN 
                 UPDATE board
	             SET piece=null,piece_color=null
	             WHERE X=x1 AND Y=y1;
                 update board
	             set piece=null, piece_color=null
	             where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9' OR pnew='8'OR pnew='7' OR pnew='6' OR   pnew='5') then
	           UPDATE board
	           SET piece=null,piece_color=null
	           WHERE X=x1 AND Y=y1;
               elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
           UPDATE board
	             SET piece=p,piece_color=p_color
	             WHERE X=x2 AND Y=y2;
                 UPDATE board
	             SET piece=null,piece_color=null
	             WHERE X=x1 AND Y=y1;
       end if;
    end if;

if (p='3') THEN
       if (pnew='3') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9' OR pnew='8'OR pnew='7' OR pnew='6' OR pnew='5' OR pnew='4') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;


if (p='2') THEN
       if (pnew='B' OR pnew='2') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='10' OR pnew='9' OR pnew='8'OR pnew='7' OR pnew='6' OR pnew='5' OR pnew='4' OR pnew='3') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;


 elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	      SET piece=p,piece_color=p_color
	      WHERE X=x2 AND Y=y2;
          UPDATE board
	      SET piece=null,piece_color=null
	      WHERE X=x1 AND Y=y1;
       end if;
    end if;
  
if (p='1') THEN
       if (pnew='B' OR pnew='1') THEN 
          UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
          update board
	    set piece=null, piece_color=null
	    where x=x2 and y=y2;
       elseif (pnew='9' OR pnew='8'OR pnew='7' OR pnew='6' OR pnew='5' OR pnew='4' OR pnew='3'OR pnew='2') then
	  UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
        elseif (pnew='F') then
	  UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
        update game_status
            set status='ended';
            update game_status
            set result=p_color;
       else 
          UPDATE board
	    SET piece=p,piece_color=p_color
	    WHERE X=x2 AND Y=y2;
 UPDATE board
	    SET piece=null,piece_color=null
	    WHERE X=x1 AND Y=y1;
       end if;
    end if;







	update game_status set p_turn=if(p_color='R','B','R');
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_move` ()  BEGIN
SELECT * FROM
board B1 INNER JOIN board B2
WHERE B1.x=2 AND B1.y=2
AND (B2.`piece_color` IS NULL OR B2.`piece_color`<>B1.`piece_color`)
AND B1.x=B2.x AND B1.y<B2.y AND (B2.y-B1.y)<=2 ;
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
  `piece` enum('F','B','10','9','8','7','6','5','4','3','2','1') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`x`, `y`, `board_color`, `piece_color`, `piece`) VALUES
(1, 1, 'green', 'R', '2'),
(1, 2, 'green', 'R', '4'),
(1, 3, 'green', 'R', '5'),
(1, 4, 'green', 'R', '6'),
(1, 5, 'green', NULL, NULL),
(1, 6, 'green', NULL, NULL),
(1, 7, 'green', 'B', '6'),
(1, 8, 'green', 'B', '2'),
(1, 9, 'green', 'B', '4'),
(1, 10, 'green', 'B', '3'),
(2, 1, 'green', 'R', '3'),
(2, 2, 'green', 'R', 'B'),
(2, 3, 'green', 'R', '4'),
(2, 4, 'green', 'R', 'F'),
(2, 5, 'green', NULL, NULL),
(2, 6, 'green', NULL, NULL),
(2, 7, 'green', 'B', '2'),
(2, 8, 'green', 'B', '8'),
(2, 9, 'green', 'B', '6'),
(2, 10, 'green', 'B', '3'),
(3, 1, 'green', 'R', 'B'),
(3, 2, 'green', 'R', '4'),
(3, 3, 'green', 'R', 'B'),
(3, 4, 'green', 'R', '7'),
(3, 5, 'blue', NULL, NULL),
(3, 6, 'blue', NULL, NULL),
(3, 7, 'green', 'B', '10'),
(3, 8, 'green', 'B', '7'),
(3, 9, 'green', 'B', '5'),
(3, 10, 'green', 'B', 'B'),
(4, 1, 'green', 'R', '2'),
(4, 2, 'green', 'R', '7'),
(4, 3, 'green', 'R', '1'),
(4, 4, 'green', 'R', '5'),
(4, 5, 'blue', NULL, NULL),
(4, 6, 'blue', NULL, NULL),
(4, 7, 'green', 'B', '3'),
(4, 8, 'green', 'B', '7'),
(4, 9, 'green', 'B', 'B'),
(4, 10, 'green', 'B', 'F'),
(5, 1, 'green', 'R', '3'),
(5, 2, 'green', 'R', '8'),
(5, 3, 'green', 'R', '9'),
(5, 4, 'green', NULL, NULL),
(5, 5, 'green', NULL, NULL),
(5, 6, 'green', NULL, NULL),
(5, 7, 'green', 'B', '6'),
(5, 8, 'green', 'B', '2'),
(5, 9, 'green', 'B', '5'),
(5, 10, 'green', 'B', 'B'),
(6, 1, 'green', 'R', 'B'),
(6, 2, 'green', 'R', '5'),
(6, 3, 'green', 'R', '2'),
(6, 4, 'green', 'R', '6'),
(6, 5, 'green', NULL, NULL),
(6, 6, 'green', NULL, NULL),
(6, 7, 'green', 'B', '2'),
(6, 8, 'green', 'B', '9'),
(6, 9, 'green', 'B', '8'),
(6, 10, 'green', 'B', '3'),
(7, 1, 'green', 'R', 'F'),
(7, 2, 'green', 'R', 'B'),
(7, 3, 'green', 'R', '7'),
(7, 4, 'green', 'R', '3'),
(7, 5, 'blue', NULL, NULL),
(7, 6, 'blue', NULL, NULL),
(7, 7, 'green', 'B', '5'),
(7, 8, 'green', 'B', '1'),
(7, 9, 'green', 'B', '7'),
(7, 10, 'green', 'B', '2'),
(8, 1, 'green', 'R', 'B'),
(8, 2, 'green', 'R', '5'),
(8, 3, 'green', 'R', '2'),
(8, 4, 'green', 'R', '10'),
(8, 5, 'blue', NULL, NULL),
(8, 6, 'blue', NULL, NULL),
(8, 7, 'green', 'B', '2'),
(8, 8, 'green', 'B', 'B'),
(8, 9, 'green', 'B', '4'),
(8, 10, 'green', 'B', 'B'),
(9, 1, 'green', 'R', '3'),
(9, 2, 'green', 'R', '6'),
(9, 3, 'green', 'R', '8'),
(9, 4, 'green', 'R', '2'),
(9, 5, 'green', NULL, NULL),
(9, 6, 'green', NULL, NULL),
(9, 7, 'green', 'B', '2'),
(9, 8, 'green', 'B', '4'),
(9, 9, 'green', 'B', 'B'),
(9, 10, 'green', 'B', '3'),
(10, 1, 'green', 'R', '3'),
(10, 2, 'green', 'R', '4'),
(10, 3, 'green', 'R', '2'),
(10, 4, 'green', 'R', '6'),
(10, 5, 'green', NULL, NULL),
(10, 6, 'green', NULL, NULL),
(10, 7, 'green', 'B', '6'),
(10, 8, 'green', 'B', '5'),
(10, 9, 'green', 'B', '4'),
(10, 10, 'green', 'B', '2');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `empty_board`
--

CREATE TABLE `empty_board` (
  `x` tinyint(2) NOT NULL,
  `y` tinyint(2) NOT NULL,
  `board_color` enum('green','blue') CHARACTER SET utf8 NOT NULL,
  `piece_color` enum('R','B') CHARACTER SET utf8 DEFAULT NULL,
  `piece` enum('F','B','10','9','8','7','6','5','4','3','2','1') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `empty_board`
--

INSERT INTO `empty_board` (`x`, `y`, `board_color`, `piece_color`, `piece`) VALUES
(1, 1, 'green', 'R', '2'),
(1, 2, 'green', 'R', '4'),
(1, 3, 'green', 'R', '5'),
(1, 4, 'green', 'R', '6'),
(1, 5, 'green', NULL, NULL),
(1, 6, 'green', NULL, NULL),
(1, 7, 'green', 'B', '6'),
(1, 8, 'green', 'B', '2'),
(1, 9, 'green', 'B', '4'),
(1, 10, 'green', 'B', '3'),
(2, 1, 'green', 'R', '3'),
(2, 2, 'green', 'R', 'B'),
(2, 3, 'green', 'R', '4'),
(2, 4, 'green', 'R', 'F'),
(2, 5, 'green', NULL, NULL),
(2, 6, 'green', NULL, NULL),
(2, 7, 'green', 'B', '2'),
(2, 8, 'green', 'B', '8'),
(2, 9, 'green', 'B', '6'),
(2, 10, 'green', 'B', '3'),
(3, 1, 'green', 'R', 'B'),
(3, 2, 'green', 'R', '4'),
(3, 3, 'green', 'R', 'B'),
(3, 4, 'green', 'R', '7'),
(3, 5, 'blue', NULL, NULL),
(3, 6, 'blue', NULL, NULL),
(3, 7, 'green', 'B', '10'),
(3, 8, 'green', 'B', '7'),
(3, 9, 'green', 'B', '5'),
(3, 10, 'green', 'B', 'B'),
(4, 1, 'green', 'R', '2'),
(4, 2, 'green', 'R', '7'),
(4, 3, 'green', 'R', '1'),
(4, 4, 'green', 'R', '5'),
(4, 5, 'blue', NULL, NULL),
(4, 6, 'blue', NULL, NULL),
(4, 7, 'green', 'B', '3'),
(4, 8, 'green', 'B', '7'),
(4, 9, 'green', 'B', 'B'),
(4, 10, 'green', 'B', 'F'),
(5, 1, 'green', 'R', '3'),
(5, 2, 'green', 'R', '8'),
(5, 3, 'green', 'R', '9'),
(5, 4, 'green', 'R', '2'),
(5, 5, 'green', NULL, NULL),
(5, 6, 'green', NULL, NULL),
(5, 7, 'green', 'B', '6'),
(5, 8, 'green', 'B', '2'),
(5, 9, 'green', 'B', '5'),
(5, 10, 'green', 'B', 'B'),
(6, 1, 'green', 'R', 'B'),
(6, 2, 'green', 'R', '5'),
(6, 3, 'green', 'R', '2'),
(6, 4, 'green', 'R', '6'),
(6, 5, 'green', NULL, NULL),
(6, 6, 'green', NULL, NULL),
(6, 7, 'green', 'B', '2'),
(6, 8, 'green', 'B', '9'),
(6, 9, 'green', 'B', '8'),
(6, 10, 'green', 'B', '3'),
(7, 1, 'green', 'R', 'F'),
(7, 2, 'green', 'R', 'B'),
(7, 3, 'green', 'R', '7'),
(7, 4, 'green', 'R', '3'),
(7, 5, 'blue', NULL, NULL),
(7, 6, 'blue', NULL, NULL),
(7, 7, 'green', 'B', '5'),
(7, 8, 'green', 'B', '1'),
(7, 9, 'green', 'B', '7'),
(7, 10, 'green', 'B', '2'),
(8, 1, 'green', 'R', 'B'),
(8, 2, 'green', 'R', '5'),
(8, 3, 'green', 'R', '2'),
(8, 4, 'green', 'R', '10'),
(8, 5, 'blue', NULL, NULL),
(8, 6, 'blue', NULL, NULL),
(8, 7, 'green', 'B', '2'),
(8, 8, 'green', 'B', 'B'),
(8, 9, 'green', 'B', '4'),
(8, 10, 'green', 'B', 'B'),
(9, 1, 'green', 'R', '3'),
(9, 2, 'green', 'R', '6'),
(9, 3, 'green', 'R', '8'),
(9, 4, 'green', 'R', '2'),
(9, 5, 'green', NULL, NULL),
(9, 6, 'green', NULL, NULL),
(9, 7, 'green', 'B', '2'),
(9, 8, 'green', 'B', '4'),
(9, 9, 'green', 'B', 'B'),
(9, 10, 'green', 'B', '3'),
(10, 1, 'green', 'R', '3'),
(10, 2, 'green', 'R', '4'),
(10, 3, 'green', 'R', '2'),
(10, 4, 'green', 'R', '6'),
(10, 5, 'green', NULL, NULL),
(10, 6, 'green', NULL, NULL),
(10, 7, 'green', 'B', '6'),
(10, 8, 'green', 'B', '5'),
(10, 9, 'green', 'B', '4'),
(10, 10, 'green', 'B', '2');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('R','B') DEFAULT NULL,
  `result` enum('R','B','D') DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `game_status`
--

INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
('aborded', NULL, 'R', '2020-01-15 16:10:16');

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW set NEW.last_change = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('R','B') NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
('kostaspexli@gmail.co', 'R', '4b56cf0809e0fab6e3a72c9aa330c8ce', '2020-01-15 16:04:54'),
('it174908@it.teithe.g', 'B', '70d9dbbcacdfde8139c8ab5ae92e415c', '2020-01-15 16:04:58');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(2, 'testuser', 'testpass'),
(3, 'kostas', 'pass1'),
(4, 'gkap', 'gkap'),
(5, 'user2', 'pass2');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`y`);

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

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
