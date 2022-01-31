-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itadakifood
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itadakifood
-- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `itadakifood` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
-- USE `itadakifood` ;

-- -----------------------------------------------------
-- Table `itadakifood`.`assets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itadakifood`.`assets` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `restaurantId2` INT NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `restaurantId_idx` (`restaurantId2` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `itadakifood`.`restaurants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itadakifood`.`restaurants` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `cuisine` VARCHAR(255) NOT NULL,
  `restaurant_name` VARCHAR(255) NOT NULL,
  `rating` FLOAT NOT NULL,
  `cost` FLOAT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `operating_hours` VARCHAR(24) NULL DEFAULT NULL,
  `website` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(2049) NULL DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `restaurant_name_UNIQUE` (`restaurant_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `itadakifood`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itadakifood`.`users` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(72) NOT NULL,
  `gender` VARCHAR(6) NOT NULL,
  `address` VARCHAR(90) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `mobile_number` VARCHAR(8) NOT NULL,
  `profile_pic` LONGTEXT NULL DEFAULT NULL,
  `likes` INT NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `itadakifood`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itadakifood`.`reviews` (
  `_id` INT NOT NULL AUTO_INCREMENT,
  `restaurantId` INT NOT NULL,
  `userId` INT NULL DEFAULT NULL,
  `review` VARCHAR(2048) NOT NULL,
  `rating` INT NOT NULL,
  `likes` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`_id`),
  INDEX `restaurantId_idx` (`restaurantId` ASC) VISIBLE,
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `restaurantId`
    FOREIGN KEY (`restaurantId`)
    REFERENCES `itadakifood`.`restaurants` (`_id`),
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `itadakifood`.`users` (`_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
