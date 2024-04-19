-- -------------------------------------------------------------
-- TablePlus 5.9.6(546)
--
-- https://tableplus.com/
--
-- Database: db_food
-- Generation Time: 2024-04-20 01:30:06.3920
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `arr_sub_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT '0',
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Apple', 'apple.jpg', 1.5, 'Fresh and crunchy fruit', 1),
(2, 'Broccoli', 'broccoli.jpg', 2, 'Nutritious green vegetable', 2),
(3, 'Chicken', 'chicken.jpg', 5, 'Juicy and tender meat', 3),
(4, 'Spaghetti', 'spaghetti.jpg', 8, 'Classic Italian pasta dish', 4),
(5, 'Burger', 'burger.jpg', 6.5, 'Delicious fast food', 5),
(6, 'Salmon', 'salmon.jpg', 10, 'Healthy and flavorful seafood', 6),
(7, 'Chocolate Cake', 'chocolate_cake.jpg', 4.5, 'Decadent dessert', 7),
(8, 'Banana', 'banana.jpg', 0.5, 'Sweet and nutritious fruit', 1),
(9, 'Carrot', 'carrot.jpg', 1, 'Crunchy and vibrant vegetable', 2),
(10, 'Beef', 'beef.jpg', 7, 'Tender and savory meat', 3),
(11, 'Ramen', 'ramen.jpg', 9, 'Japanese noodle soup', 4),
(12, 'Pizza', 'pizza.jpg', 8.5, 'Popular Italian dish', 5),
(13, 'Shrimp', 'shrimp.jpg', 12, 'Delicious seafood option', 6),
(14, 'Ice Cream', 'ice_cream.jpg', 3.5, 'Cool and creamy treat', 7),
(15, 'Orange', 'orange.jpg', 1.2, 'Juicy citrus fruit', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Fruit'),
(2, 'Vegetable'),
(3, 'Meat'),
(4, 'Noodle'),
(5, 'Fastfood'),
(6, 'Seafood'),
(7, 'Sweets');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-04-01 13:00:00'),
(2, 1, '2024-04-06 10:00:00'),
(2, 3, '2024-04-02 16:00:00'),
(3, 5, '2024-04-03 11:00:00'),
(4, 4, '2024-04-04 19:00:00'),
(4, 5, '2024-04-08 15:00:00'),
(5, 3, '2024-04-07 13:30:00'),
(5, 5, '2024-04-05 15:00:00'),
(8, 1, '2024-04-19 18:16:50'),
(8, 4, '2024-04-09 17:45:00'),
(10, 5, '2024-04-10 12:30:00');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ABCD1234', '1,2,3'),
(2, 2, 3, 1, 'EFGH5678', '4,5'),
(3, 3, 2, 3, 'IJKL91011', '6,7,8,9'),
(4, 4, 4, 1, 'MNOP121314', '10'),
(5, 5, 5, 2, 'QRST151617', '1,2,3'),
(6, 6, 1, 2, 'UVWX181920', '4,5'),
(7, 4, 2, 3, 'WXYZ394041', '1,2,3'),
(8, 3, 4, 1, '123456424344', '4,5'),
(9, 6, 5, 2, '789101444546', '6,7,8,9'),
(10, 5, 1, 2, '121314474849', '10'),
(11, 2, 3, 1, '151617505152', '1,2,3'),
(12, 3, 2, 3, '181920535455', '4,5'),
(13, 4, 5, 2, '242526596061', '10'),
(14, 1, 3, 2, 'RANDOMCOUPONCODE', '1, 3, 5 ,6'),
(15, 1, 3, 2, 'RANDOMCOUPONCODE', '1, 3, 5 ,6');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2024-04-01 12:30:00'),
(2, 1, 3, '2024-04-06 09:30:00'),
(2, 3, 5, '2024-04-02 15:45:00'),
(2, 5, 4, '2024-04-10 11:00:00'),
(3, 2, 3, '2024-04-03 10:20:00'),
(3, 4, 3, '2024-04-09 16:30:00'),
(4, 3, 4, '2024-04-07 12:15:00'),
(4, 4, 4, '2024-04-04 18:00:00'),
(5, 5, 5, '2024-04-05 14:00:00'),
(6, 2, 5, '2024-04-08 14:45:00'),
(8, 1, 2, '2024-04-19 18:16:10');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'The Grill House', 'grill_house.jpg', 'A cozy place for grilled specialties'),
(2, 'Pasta Italia', 'pasta_italia.jpg', 'Authentic Italian cuisine in a romantic setting'),
(3, 'Sushi Haven', 'sushi_haven.jpg', 'Fresh and delicious sushi rolls made to order'),
(4, 'Burger Kingdom', 'burger_kingdom.jpg', 'Home of the juiciest burgers in town'),
(5, 'Sweet Treats Cafe', 'sweet_treats_cafe.jpg', 'Indulge in a variety of desserts and pastries');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Crispy Fries', 2.5, 5),
(2, 'Garlic Bread', 3, 5),
(3, 'Mashed Potatoes', 2, 5),
(4, 'Soy Sauce', 0.5, 4),
(5, 'Kimchi', 1.5, 4),
(6, 'Tempura', 4, 6),
(7, 'Cheesecake', 5, 7),
(8, 'Brownie', 3.5, 7),
(9, 'Whipped Cream', 1, 7),
(10, 'Vanilla Ice Cream', 2, 14);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john@example.com', 'password123'),
(2, 'Alice Smith', 'alice@example.com', 'securepassword'),
(3, 'Bob Johnson', 'bob@example.com', 'bob123'),
(4, 'Emma Brown', 'emma@example.com', 'emma456'),
(5, 'Michael Wilson', 'michael@example.com', 'michael789'),
(6, 'Sarah Lee', 'sarah@example.com', 'sarah123'),
(7, 'David Miller', 'david@example.com', 'david456'),
(8, 'Emily Davis', 'emily@example.com', 'emily789'),
(9, 'James Brown', 'james@example.com', 'james123'),
(10, 'Olivia Taylor', 'olivia@example.com', 'olivia456'),
(11, 'William Wilson', 'william@example.com', 'william789'),
(12, 'Sophia Johnson', 'sophia@example.com', 'sophia123'),
(13, 'Alexander Smith', 'alexander@example.com', 'alexander456'),
(14, 'Ava Brown', 'ava@example.com', 'ava789'),
(15, 'Daniel Lee', 'daniel@example.com', 'daniel123');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;