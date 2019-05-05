drop database if exists `pizza_project`;

-- `create schema`
CREATE SCHEMA if not exists `pizza_project` DEFAULT CHARACTER SET utf8mb4;

use `pizza_project`;

--  `role table`
CREATE TABLE `role`
(
 `id`   int(1) NOT NULL AUTO_INCREMENT,
 `name` varchar(20) NOT NULL ,
PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


--  `user table`
CREATE TABLE `user`
(
 `id`        int(11) NOT NULL AUTO_INCREMENT,
 `firstName` varchar(45) NOT NULL ,
 `lastName`  varchar(45) NOT NULL ,
 `username`  varchar(255) NOT NULL ,
 `password`  varchar(200) NOT NULL ,
PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

# DROP TABLE IF EXISTS `user_role`;
CREATE TABLE if not exists `user_role` (
  `id` int(11) not null auto_increment,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role_roleid_idx` (`role_id`),
  CONSTRAINT `fk_user_role_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

-- `credit_card table`
CREATE TABLE if not exists `credit_card`
(
 `id`             int(11) NOT NULL AUTO_INCREMENT,
 `cardNumber`     int(16) NOT NULL ,
 `ccv`            int(3) NOT NULL ,
 `expiryMonth`    int(2) NOT NULL ,
 `expiryYear`     int(2) NOT NULL ,
 `cardHolderName` varchar(30) NOT NULL ,
 `fk_user`        int(11) NOT NULL ,
PRIMARY KEY (`id`),
KEY `fkIdx_248` (`fk_user`),
CONSTRAINT `FK_248` FOREIGN KEY `fkIdx_248` (`fk_user`) REFERENCES `user` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- `address table`
CREATE TABLE `address`
(
 `id`      int(11) NOT NULL AUTO_INCREMENT,
 `street`  varchar(45) NOT NULL ,
 `number`  int(3) NULL ,
 `postal_code` varchar(45) NULL ,
 `floor`   int(2) NULL ,
 `notes`   varchar(140) NULL ,
 `telephone`   varchar(140) NULL ,
 `user_id` int(11) NOT NULL ,
PRIMARY KEY (`id`),
CONSTRAINT `FK_259` FOREIGN KEY `fkIdx_259` (`user_id`) REFERENCES `user` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- products table
create table if not exists `product` (
`id` int(11) not null auto_increment,
`name` varchar(45) not null,
`description` varchar(200),
`ingredients` varchar(200),
`price` decimal (5,2),
`imagePath` varchar(260),
primary key (`id`))
engine = InnoDB
default character set = utf8mb4;


-- Table structure for table `orders`
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `price` decimal (5,2),
  `user_id` int(11),
  `address_id` int(11),
  `order_date` timestamp,
  `progress` int(11),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_address_idx` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Table structure for table `order_description`
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_idx` (`order_id`),
  CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





-- insert data --
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN');
INSERT INTO `role` VALUES (2,'ROLE_EMPLOYEE');
INSERT INTO `role` VALUES (3,'ROLE_CUSTOMER');
UNLOCK TABLES;


insert into `user` values ('1', 'admin1', 'admin1', 'admin1234@xyz.com', '$2a$11$PHZUahDIpGGD/UJhHizjnuhSt4r60a580nsHIhn3y4.nMiFnZzC0W');
insert into `user` values ('2', 'employee1', 'employee1', 'empl1234@xyz.com', '$2a$11$ZpaxTgSkKsW0MfJTNmVeKOkeLdc/RnKYgDF5udyCoy3W5lMhIrF6G');
insert into `user` values ('3', 'customer1', 'customer1', 'cust1234@xyz.com', '$2a$11$lwcI6HZJRV2W6XEdYaL4duQYgG9ce70ldOkSIVHW67TUbWIBelTJm');

insert into `user_role` values ('1', '1', '1');
insert into `user_role` values ('2', '2', '2');
insert into `user_role` values ('3', '3', '3');

INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('1', 'Margherita', 'Pizza margherita', 'Tomato, cheese', '10');
INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('2', 'Pepperoni', 'Pizza pepperoni', 'Tomato, cheese, pepperoni', '12');
INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('3', 'Carbonara', 'Spaghetti Carbonara', 'Fresh cream, bacon', '15');
INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('4', 'Water 0.5l', 'Table water', 'water', '3');

INSERT INTO `pizza_project`.`address` (`id`, `street`, `number`, `postal_code`, `floor`, `notes`, `user_id`) VALUES ('1', '52nd Avenue', '456', '22908', '2', '0', '3');
INSERT INTO `pizza_project`.`address` (`id`, `street`, `number`, `postal_code`, `floor`, `notes`, `user_id`) VALUES ('2', '33rd street', '140', '22909', '3', '0', '3');
INSERT INTO `pizza_project`.`orders` (`id`, `price`, `user_id`, `address_id`, `order_date`, `progress`) VALUES ('1', '10', '3', '1', '2019-05-03', '1');
INSERT INTO `pizza_project`.`order_product` (`id`, `product_id`, `quantity`, `order_id`) VALUES ('1', '1', '3', '1');
INSERT INTO `pizza_project`.`order_product` (`id`, `product_id`, `quantity`, `order_id`) VALUES ('2', '2', '4', '1');
INSERT INTO `pizza_project`.`order_product` (`id`, `product_id`, `quantity`, `order_id`) VALUES ('3', '6', '1', '1');


