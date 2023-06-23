-- MySQL Script generated by MySQL Workbench
-- Fri Nov 19 15:16:53 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema syscash
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema syscash
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `syscash` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `syscash` ;

-- -----------------------------------------------------
-- Table `syscash`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `syscash`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `tipo` SMALLINT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoria_usuario` (`usuario_id` ASC),
  CONSTRAINT `fk_categoria_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `syscash`.`conta_receber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `syscash`.`conta_receber` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  `favorecido` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `categoria_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conta_receber_categoria` (`categoria_id` ASC),
  INDEX `fk_conta_receber_usuario` (`usuario_id` ASC),
  CONSTRAINT `fk_conta_receber_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `syscash`.`categoria` (`id`),
  CONSTRAINT `fk_conta_receber_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `syscash`.`conta_pagar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  `favorecido` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_vencimento` DATE NOT NULL,
  `categoria_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conta_pagar_categoria` (`categoria_id` ASC),
  INDEX `fk_conta_pagar_usuario` (`usuario_id` ASC),
  CONSTRAINT `fk_conta_pagar_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `syscash`.`categoria` (`id`),
  CONSTRAINT `fk_conta_pagar_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `syscash`.`favorecido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_favorecido_usuario` (`usuario_id` ASC),
  CONSTRAINT `fk_favorecido_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `syscash`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;