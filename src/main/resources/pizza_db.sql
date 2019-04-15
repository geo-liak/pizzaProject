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


-- insert data --
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN');
INSERT INTO `role` VALUES (2,'ROLE_EMPLOYEE');
INSERT INTO `role` VALUES (3,'ROLE_CUSTOMER');
UNLOCK TABLES;
