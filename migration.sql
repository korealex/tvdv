-- MySQL Script generated by MySQL Workbench
-- jue 06 jul 2017 15:14:37 AST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tvdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tvdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tvdb` DEFAULT CHARACTER SET utf8 ;
USE `tvdb` ;

-- -----------------------------------------------------
-- Table `tvdb`.`search`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tvdb`.`search` ;

CREATE TABLE IF NOT EXISTS `tvdb`.`search` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `query` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tvdb`.`tvshow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tvdb`.`tvshow` ;

CREATE TABLE IF NOT EXISTS `tvdb`.`tvshow` (
  `id` INT UNSIGNED NOT NULL,
  `firstAired` VARCHAR(255) NULL,
  `network` VARCHAR(255) NULL,
  `overview` LONGTEXT NULL,
  `seriesName` VARCHAR(255) NULL,
  `status` VARCHAR(45) NULL,
  `banner` VARCHAR(255) NULL,
  `imdbId` VARCHAR(255) NULL,
  `zap2itId` VARCHAR(255) NULL,
  `rating` VARCHAR(255) NULL,
  `airsDayOfWeek` VARCHAR(255) NULL,
  `airsTime` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tvdb`.`show_seach`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tvdb`.`show_seach` ;

CREATE TABLE IF NOT EXISTS `tvdb`.`show_seach` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `search_id` INT UNSIGNED NULL,
  `show_id` INT UNSIGNED NULL,
  INDEX `fk_show_id_idx` (`show_id` ASC),
  INDEX `fk_search_id_idx` (`search_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_seach_id`
    FOREIGN KEY (`search_id`)
    REFERENCES `tvdb`.`search` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_show_id`
    FOREIGN KEY (`show_id`)
    REFERENCES `tvdb`.`tvshow` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tvdb`.`image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tvdb`.`image` ;

CREATE TABLE IF NOT EXISTS `tvdb`.`image` (
  `id` INT UNSIGNED NOT NULL,
  `subKey` VARCHAR(45) NULL,
  `fileName` VARCHAR(128) NULL,
  `resolution` VARCHAR(45) NULL,
  `show_id` INT UNSIGNED NULL,
  `keyType` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_show_image_id_idx` (`show_id` ASC),
  CONSTRAINT `fk_show_image_id`
    FOREIGN KEY (`show_id`)
    REFERENCES `tvdb`.`tvshow` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tvdb`.`episode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tvdb`.`episode` ;

CREATE TABLE IF NOT EXISTS `tvdb`.`episode` (
  `id` INT UNSIGNED NOT NULL,
  `absoluteNumber` INT UNSIGNED NULL,
  `airedEpisodeNumber` INT UNSIGNED NULL,
  `airedSeason` INT UNSIGNED NULL,
  `airedSeasonID` INT UNSIGNED NULL,
  `dvdEpisodeNumber` INT UNSIGNED NULL,
  `dvdSeason` INT NULL,
  `episodeName` VARCHAR(255) NULL,
  `firstAired` VARCHAR(255) NULL,
  `lastUpdated` INT UNSIGNED NULL,
  `overview` LONGTEXT NULL,
  `show_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_show_ep_id_idx` (`show_id` ASC),
  CONSTRAINT `fk_show_ep_id`
    FOREIGN KEY (`show_id`)
    REFERENCES `tvdb`.`tvshow` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
