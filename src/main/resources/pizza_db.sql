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
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
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
 `number`  int(3) NOT NULL ,
 `pc`      int(5) NOT NULL ,
 `floor`   int(2) NOT NULL ,
 `notes`   varchar(140) NOT NULL ,
 `fk_user` int(11) NOT NULL ,
PRIMARY KEY (`id`),
KEY `fkIdx_259` (`fk_user`),
CONSTRAINT `FK_259` FOREIGN KEY `fkIdx_259` (`fk_user`) REFERENCES `user` (`id`)
ON DELETE CASCADE
ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


--  `contact table`
CREATE TABLE `contact`
(
 `id`        int(11) NOT NULL AUTO_INCREMENT,
 `telephone` int(20) NOT NULL ,
 `dob`       date NOT NULL ,
 `fk_user`   int(11) NOT NULL ,
PRIMARY KEY (`id`),
KEY `fkIdx_268` (`fk_user`),
CONSTRAINT `FK_268` FOREIGN KEY `fkIdx_268` (`fk_user`) REFERENCES `user` (`id`)
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

DROP TABLE IF EXISTS `addresses_per_user`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `addresses_per_user` (
  `id` int(11) NOT NULL,
  `fk_address` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_idx` (`fk_address`),
  KEY `fk_user_idx` (`fk_user`),
  KEY `fk_userpp_idx` (`id`,`fk_user`),
  CONSTRAINT `fk_address` FOREIGN KEY (`fk_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_userpp` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `menu`
DROP TABLE IF EXISTS `menu`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `itemName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table structure for table `order`
DROP TABLE IF EXISTS `order`;
SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `fk_addresses_per_user` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addresses_per_user_idx_idx` (`fk_addresses_per_user`),
  CONSTRAINT `fk_addresses_per_user_idx` FOREIGN KEY (`fk_addresses_per_user`) REFERENCES `addresses_per_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Table structure for table `order_description`
DROP TABLE IF EXISTS `order_description`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_description` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `fk_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_idx` (`fk_order`),
  CONSTRAINT `fk_order` FOREIGN KEY (`fk_order`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





-- insert data --
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN');
INSERT INTO `role` VALUES (2,'ROLE_EMPLOYEE');
INSERT INTO `role` VALUES (3,'ROLE_CUSTOMER');
UNLOCK TABLES;


insert into `user` values ('1', 'admin1', 'admin1', 'admin1234@xyz.com', '$2a$11$PHZUahDIpGGD/UJhHizjnuhSt4r60a580nsHIhn3y4.nMiFnZzC0W');
insert into `user` values ('2', 'employee1', 'employee1', 'empl1234@xyz.com', '$2a$11$ZpaxTgSkKsW0MfJTNmVeKOkeLdc/RnKYgDF5udyCoy3W5lMhIrF6G');
insert into `user` values ('3', 'customer1', 'customer1', 'cust1234@xyz.com', '$2a$11$lwcI6HZJRV2W6XEdYaL4duQYgG9ce70ldOkSIVHW67TUbWIBelTJm');

insert into `user_role` values ('1', '1');
insert into `user_role` values ('2', '2');
insert into `user_role` values ('3', '3');

INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('1', 'Margheritta', 'Pizza margheritta', 'Tomato, cheese', '10');
INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('2', 'Pepperoni', 'Pizza pepperoni', 'Tomato, cheese, pepperoni', '12');
INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('3', 'Carbonara', 'Spaghetti Carbonara', 'Fresh cream, bacon', '15');
INSERT INTO `pizza_project`.`product` (`id`, `name`, `description`, `ingredients`, `price`) VALUES ('4', 'Water 0.5l', 'Table water', 'water', '3');
