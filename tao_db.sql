-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TAO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TAO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TAO` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema tao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tao` DEFAULT CHARACTER SET utf8 ;
USE `TAO` ;

-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `ID` INT NOT NULL,
  `zip_code` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `number` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

CREATE TABLE IF NOT EXISTS `User` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `Address_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Address_ID`),
  INDEX `fk_User_Address1_idx` (`Address_ID` ASC) VISIBLE,
  CONSTRAINT `fk_User_Address1`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `Address` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Usage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usage` ;

CREATE TABLE IF NOT EXISTS `Usage` (
  `ID` INT NOT NULL,
  `date` DATE NULL,
  `power` DOUBLE NULL,
  `water` DOUBLE NULL,
  `temp_in` DOUBLE NULL,
  `temp_out` DOUBLE NULL,
  `Address_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Address_ID`),
  INDEX `fk_Usage_Address_idx` (`Address_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Usage_Address`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `Address` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tao` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `ID` INT NOT NULL,
  `zip_code` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `number` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `usage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usage` ;

CREATE TABLE IF NOT EXISTS `usage` (
  `ID` INT NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  `power` DOUBLE NULL DEFAULT NULL,
  `water` DOUBLE NULL DEFAULT NULL,
  `temp_in` DOUBLE NULL DEFAULT NULL,
  `temp_out` DOUBLE NULL DEFAULT NULL,
  `Address_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Address_ID`),
  INDEX `fk_Usage_Address_idx` (`Address_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Usage_Address`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `address` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `Address_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Address_ID`),
  INDEX `fk_User_Address1_idx` (`Address_ID` ASC) VISIBLE,
  CONSTRAINT `fk_User_Address1`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `address` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
