-- MySQL Script generated by MySQL Workbench
-- Tue Aug  20 15:10:23 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb2` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `mydb2` ;

-- -----------------------------------------------------
-- Table `mydb2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`users` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NULL,
  `billing_address` VARCHAR(100) NULL,
  `login` VARCHAR(20) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`items` (
  `item_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(100) NULL,
  `descriptions` VARCHAR(100) NULL,
  `start_price` DOUBLE NULL,
  `bid_increment` DOUBLE NULL,
  `start_date` DATE NULL,
  `stop_date` DATE NULL,
  `by_it_now` BINARY NULL,
  `users_user_id` INT UNSIGNED NULL,
  PRIMARY KEY (`item_id`),
  INDEX `item_user_idx` (`users_user_id` ASC) VISIBLE,
  CONSTRAINT `item_user`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `mydb2`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb2`.`bids`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb2`.`bids` (
  `bid_id` INT UNSIGNED NOT NULL,
  `bid_date` DATE NULL,
  `bid_value` DOUBLE NULL,
  `items_item_id` INT UNSIGNED NULL,
  `users_user_id` INT UNSIGNED NULL,
  PRIMARY KEY (`bid_id`),
  INDEX `bids_item_idx` (`items_item_id` ASC) VISIBLE,
  INDEX `bids_user_idx` (`users_user_id` ASC) VISIBLE,
  CONSTRAINT `bids_item`
    FOREIGN KEY (`items_item_id`)
    REFERENCES `mydb2`.`items` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `bids_user`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `mydb2`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb2`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb2`;
INSERT INTO `mydb2`.`users` (`user_id`, `full_name`, `billing_address`, `login`, `password`) VALUES (1, 'Ариманов Константин Васильевич', 'Архангельск', 'arim', 'qwe123');
INSERT INTO `mydb2`.`users` (`user_id`, `full_name`, `billing_address`, `login`, `password`) VALUES (2, 'Всеволодов Владислав Дмитриевич', 'Мурманск', 'v0lodya', 'vol333');
INSERT INTO `mydb2`.`users` (`user_id`, `full_name`, `billing_address`, `login`, `password`) VALUES (3, 'Стрельник Виктор Олегович ', 'Омск', 'Serious', 'SamIAm');
INSERT INTO `mydb2`.`users` (`user_id`, `full_name`, `billing_address`, `login`, `password`) VALUES (4, 'Коробкин Анатолий Петрович', 'Санкт-Петербург', 'ShrodBox', 'Catin000');
INSERT INTO `mydb2`.`users` (`user_id`, `full_name`, `billing_address`, `login`, `password`) VALUES (5, 'Зорник Александр Кирилович', 'Сарапул', 'Zryachiy', 'UnfallenLandmark');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb2`.`items`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb2`;
INSERT INTO `mydb2`.`items` (`item_id`, `title`, `descriptions`, `start_price`, `bid_increment`, `start_date`, `stop_date`, `by_it_now`, `users_user_id`) VALUES (1, 'Toyota', 'car', 1000000, 1000, '2019-01-01', '2020-01-01', 0, 1);
INSERT INTO `mydb2`.`items` (`item_id`, `title`, `descriptions`, `start_price`, `bid_increment`, `start_date`, `stop_date`, `by_it_now`, `users_user_id`) VALUES (2, 'Samsung', 'phone', 100, 100, '2019-02-15', '2019-02-30', 0, 2);
INSERT INTO `mydb2`.`items` (`item_id`, `title`, `descriptions`, `start_price`, `bid_increment`, `start_date`, `stop_date`, `by_it_now`, `users_user_id`) VALUES (3, 'Laptop', 'electronics', 1100, 25, '2019-03-10', '2019-04-10', 0, 3);
INSERT INTO `mydb2`.`items` (`item_id`, `title`, `descriptions`, `start_price`, `bid_increment`, `start_date`, `stop_date`, `by_it_now`, `users_user_id`) VALUES (4, 'Commador', 'electronics', 800, 50, '2019-03-15', '2020-03-15', 0, 4);
INSERT INTO `mydb2`.`items` (`item_id`, `title`, `descriptions`, `start_price`, `bid_increment`, `start_date`, `stop_date`, `by_it_now`, `users_user_id`) VALUES (5, 'Volga', '"car"', 100000, 1, '2019-05-05', '2019-06-05', 1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb2`.`bids`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb2`;
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (1, '2019-01-01', 1001000, 1, 2);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (2, '2019-01-02', 1002000, 1, 3);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (4, '2019-01-03', 1003000, 1, 5);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (5, '2019-02-15', 200, 2, 3);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (6, '2019-02-16', 300, 2, 1);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (7, '2019-02-17', 400, 2, 3);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (8, '2019-03-10', 1125, 3, 4);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (9, '2019-03-15', 850, 4, 2);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (10, '2019-03-15', 900, 4, 1);
INSERT INTO `mydb2`.`bids` (`bid_id`, `bid_date`, `bid_value`, `items_item_id`, `users_user_id`) VALUES (11, '2019-05-05', 100001, 4, 1);
COMMIT;

