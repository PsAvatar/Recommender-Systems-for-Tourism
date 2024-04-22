-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1
-- Χρόνος δημιουργίας: 22 Απρ 2024 στις 12:01:07
-- Έκδοση διακομιστή: 10.4.28-MariaDB
-- Έκδοση PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `signup`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `login`
--

CREATE TABLE `login` (
                         `id` int(11) NOT NULL,
                         `name` varchar(30) NOT NULL,
                         `email` varchar(50) NOT NULL,
                         `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `login`
--

INSERT INTO `login` (`id`, `name`, `email`, `password`) VALUES
                                                            (50, '1', '1@gmail.com', '$2b$12$qgEf34N7hnc8az9HNhy9JuV0vAGmIGqSX1t0pyT9dFEd.MYDiHLlC'),
                                                            (51, '2', '2@gmail.com', '$2b$12$dtJ3dyHmtUTXlKEo2F8tPOSVobmsiNbu2mVX64GTZqnETdcTlpubK'),
                                                            (52, '3', '3@gmail.com', '$2b$12$frBGDld0yNQAK39Rf9Orq.YLAOTKBzJeGZ7LrZuFx5ED/gmb3ixpO'),
                                                            (54, '5', '5@gmai.com', '$2b$12$hW/gzbPzpvbSe9Lj4mGLCOxy3ntwjjal3bbhRwUGls2ICPplWCBra'),
                                                            (67, 'panos', 's_panos@hotmail.com', '$2b$12$Lb6bOMD/5vtN5Lciv9wW7esIncSiE6zja1PeaTzLTnLMcQkfIlM5q');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `ratings`
--

CREATE TABLE `ratings` (
                           `id` int(11) NOT NULL,
                           `user_id` int(11) DEFAULT NULL,
                           `restaurant_id` int(11) DEFAULT NULL,
                           `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `restaurant_id`, `rating`) VALUES
                                                                       (12, 51, 5, 5),
                                                                       (13, 50, 5, 2),
                                                                       (14, 50, 6, 5),
                                                                       (15, 51, 6, 1),
                                                                       (16, 50, 4, 5),
                                                                       (22, 52, 5, 1),
                                                                       (23, 52, 4, 5),
                                                                       (24, 54, 4, 1),
                                                                       (25, 54, 5, 5),
                                                                       (26, 50, 8, 5),
                                                                       (27, 50, 7, 1),
                                                                       (28, 67, 10, 4);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `restaurants`
--

CREATE TABLE `restaurants` (
                               `id` int(11) NOT NULL,
                               `name` varchar(255) NOT NULL,
                               `description` text DEFAULT NULL,
                               `location` varchar(255) DEFAULT NULL,
                               `image` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
                               `total_ratings` int(11) DEFAULT 0,
                               `total_rating_sum` int(11) DEFAULT 0,
                               `average_rating` float DEFAULT 0,
                               `latitude` varchar(255) NOT NULL,
                               `longitude` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Άδειασμα δεδομένων του πίνακα `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `description`, `location`, `image`, `total_ratings`, `total_rating_sum`, `average_rating`, `latitude`, `longitude`) VALUES
                                                                                                                                                                 (4, 'Mira Me Athens', 'A great place to eat!', 'Athens', 'https://media-cdn.tripadvisor.com/media/photo-s/23/52/af/5a/nice-rooftop-view-of.jpg', 3, 11, 3.66667, '37.977370', '23.721870'),
                                                                                                                                                                 (5, 'Jonahs Restaurant', 'Delicious food and cozy atmosphere.', 'Athens', 'https://media-cdn.tripadvisor.com/media/photo-s/2a/79/6c/c7/place.jpg', 4, 13, 3.25, '37.985480', '23.755850'),
                                                                                                                                                                 (6, 'Aleria', 'Specializing in international cuisine.', 'Athens', 'https://www.fnl-guide.com/uploads_image/2019/06/18/p1ddl8f1bl1slf3rb14c014ns16gui_1400x800.jpg?v=33.0.0', 2, 6, 3, '37.983150', '23.717930'),
                                                                                                                                                                 (7, 'Loupino', 'In a disarmingly intimate and warm place with unobtrusive aesthetic and luxury.', 'Thessaloniki', 'https://media-cdn.tripadvisor.com/media/photo-s/17/cb/28/da/loupino.jpg', 1, 1, 1, '40.634260', '22.936840'),
                                                                                                                                                                 (8, 'Akratos Oinos', 'Pivoting back to the traditional Greek cooking but with a constant eye on the future, the menu celebrates authentic Greek recipes interpreted into refined, fine-dining dishes.', 'Thessaloniki', 'https://media-cdn.tripadvisor.com/media/photo-s/17/a7/b2/d9/caption.jpg', 1, 5, 5, '40.634770', '22.937460'),
                                                                                                                                                                 (9, 'Du Sel at Hotel du Lac', 'Very nice place, with tasty food and very kind service with a nice view towards the lake, suitable for a pleasant meal', 'Ioannina ', 'https://media-cdn.tripadvisor.com/media/photo-o/0f/08/2c/db/the-view-to-the-lake.jpg', 0, 0, 0, '39.668260', '20.858700'),
                                                                                                                                                                 (10, 'Frontzu Police', 'Everything was perfect as always. The quality of the food, the wines and the perfect service make it the best restaurant in town.', 'Ioannina', 'https://media-cdn.tripadvisor.com/media/photo-m/1280/15/17/f7/f9/frontzu-politia-from.jpg', 1, 4, 4, '39.669880', '20.840890'),
                                                                                                                                                                 (11, 'Zamos Cafe Bar Resto', 'Excellent food - very special flavors, very good service, kind staff. It is located in a very central spot.', 'Ioannina', 'https://media-cdn.tripadvisor.com/media/photo-m/1280/1c/b8/7f/fa/menu.jpg', 0, 0, 0, '39.665410', '20.852990');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `login`
--
ALTER TABLE `login`
    ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `ratings`
--
ALTER TABLE `ratings`
    ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Ευρετήρια για πίνακα `restaurants`
--
ALTER TABLE `restaurants`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `login`
--
ALTER TABLE `login`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT για πίνακα `ratings`
--
ALTER TABLE `ratings`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT για πίνακα `restaurants`
--
ALTER TABLE `restaurants`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `ratings`
--
ALTER TABLE `ratings`
    ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
