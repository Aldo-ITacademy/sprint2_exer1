-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cul_dampolla
-- Una òptica anomenada Cul d'Ampolla vol informatitzar la gestió dels clients i la venda d'ulleres:
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS `cul_dampolla` ;

CREATE SCHEMA IF NOT EXISTS `cul_dampolla` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `cul_dampolla` ;

-- -----------------------------------------------------
-- Table `cul_dampolla`.`proveidors`
-- En primer lloc l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. 
-- En concret vol saber de cada proveïdor el nom, l'adreça (carrer, número, pis, porta, ciutat, codi postal i país), telèfon, fax, NIF.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cul_dampolla`.`proveidors` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`proveidors` (
  `id_proveidor` INT NOT NULL,
  `nom` VARCHAR(45) ,
  `adreca` VARCHAR(45) COMMENT ' l\'adreça (carrer, número, pis, porta, ciutat, codi postal i país)',
  `telefon` VARCHAR(45) ,
  `fax` VARCHAR(45) ,
  `nif` VARCHAR(45),
  PRIMARY KEY (`id_proveidor`))
ENGINE = InnoDB;
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`, `adreca`, `telefon`, `nif`) VALUES ('0001', 'wholesale eyewear', 'haoxin road, louqiao industrial zone, china', '+8613567788338', 'ch246555');
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`) VALUES ('0002', 'eyewear international');
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`) VALUES ('0003', 'gafas para zurdos');
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`) VALUES ('0004', 'gafas world');
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`) VALUES ('0005', 'best glasses ever');
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`) VALUES ('0006', 'glasses better look');
INSERT INTO `cul_dampolla`.`proveidors` (`id_proveidor`, `nom`) VALUES ('0007', 'light glasses');


-- -----------------------------------------------------
-- Table `cul_dampolla`. `tipus_muntura`
-- options (flotant, pasta o metàl·lica)
-- -----------------------------------------------------

DROP TABLE IF EXISTS `cul_dampolla`.`tipus_muntura` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`tipus_muntura` (
  `id_tipus_muntura` INT NOT NULL,
  `tipus_muntura` VARCHAR(45) ,
  PRIMARY KEY (`id_tipus_muntura`)
) ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`tipus_muntura` (`id_tipus_muntura`, `tipus_muntura`) VALUES ('1', 'flotant');
INSERT INTO `cul_dampolla`.`tipus_muntura` (`id_tipus_muntura`, `tipus_muntura`) VALUES ('2', 'pasta');
INSERT INTO `cul_dampolla`.`tipus_muntura` (`id_tipus_muntura`, `tipus_muntura`) VALUES ('3', 'metallica');


-- -----------------------------------------------------
-- Table `cul_dampolla`. `colors_muntura`
-- options (flotant, pasta o metàl·lica)
-- -----------------------------------------------------

DROP TABLE IF EXISTS `cul_dampolla`.`colors_muntura` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`colors_muntura` (
  `id_color_muntura` INT NOT NULL,
  `color_muntura` VARCHAR(45) ,
  PRIMARY KEY (`id_color_muntura`)
) ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`colors_muntura` (`id_color_muntura`, `color_muntura`) VALUES ('1', 'chocolate havana fade');
INSERT INTO `cul_dampolla`.`colors_muntura` (`id_color_muntura`, `color_muntura`) VALUES ('2', 'tigerwood');
INSERT INTO `cul_dampolla`.`colors_muntura` (`id_color_muntura`, `color_muntura`) VALUES ('3', 'hazel');
INSERT INTO `cul_dampolla`.`colors_muntura` (`id_color_muntura`, `color_muntura`) VALUES ('4', 'black');
INSERT INTO `cul_dampolla`.`colors_muntura` (`id_color_muntura`, `color_muntura`) VALUES ('5', 'fizz');


-- -----------------------------------------------------
-- Table `cul_dampolla`. `colors_vidres`
-- options (flotant, pasta o metàl·lica)
-- -----------------------------------------------------

DROP TABLE IF EXISTS `cul_dampolla`.`colors_vidres` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`colors_vidres` (
  `id_color_vidres` INT NOT NULL,
  `color_vidres` VARCHAR(45) ,
  PRIMARY KEY (`id_color_vidres`)
) ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`colors_vidres` (`id_color_vidres`, `color_vidres`) VALUES ('1', 'transparent');
INSERT INTO `cul_dampolla`.`colors_vidres` (`id_color_vidres`, `color_vidres`) VALUES ('2', 'filtre azul');
INSERT INTO `cul_dampolla`.`colors_vidres` (`id_color_vidres`, `color_vidres`) VALUES ('3', 'black');



-- -----------------------------------------------------
-- Table `cul_dampolla`.`ulleres`
-- De les ulleres vol saber, la marca, la graduació de cadascun dels vidres, el tipus de muntura (flotant, pasta o metàl·lica),
-- el color de la muntura, el color dels vidres i el preu.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cul_dampolla`.`ulleres` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`ulleres` (
  `id_ulleres` INT NOT NULL,
  `marca` VARCHAR(45) ,
  `tipus_muntura` INT,
  `color_muntura` INT,
  `color_vidres` INT ,
  `preu` DECIMAL ,
  `id_proveidor` INT,
  PRIMARY KEY (`id_ulleres`),
  INDEX `id_proveidor_idx` (`id_proveidor` ASC) VISIBLE,
  INDEX `tipus_muntura_idx` (`tipus_muntura` ASC) VISIBLE,
  INDEX `color_muntura_idx` (`color_muntura` ASC) VISIBLE,
  INDEX `color_vidres_idx` (`color_vidres` ASC) VISIBLE,
  CONSTRAINT `id_proveidor`
    FOREIGN KEY (`id_proveidor`)
    REFERENCES `cul_dampolla`.`proveidors` (`id_proveidor`),
  CONSTRAINT `tipus_muntura`
	FOREIGN KEY (`tipus_muntura`)
    REFERENCES `cul_dampolla`.`tipus_muntura` (`id_tipus_muntura`),
  CONSTRAINT `color_muntura`
	FOREIGN KEY (`color_muntura`)
    REFERENCES `cul_dampolla`.`colors_muntura` (`id_color_muntura`),
  CONSTRAINT `color_vidres`
	FOREIGN KEY (`color_vidres`)
    REFERENCES `cul_dampolla`.`colors_vidres` (`id_color_vidres`)
)
ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('1', 'nate&tate', '1', '1', '1', '69', '1');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('2', 'nate&tate', '2', '2', '2', '79', '2');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('3', 'nate&tate', '3', '3', '3', '89', '3');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('4', 'nate&tate', '1', '4', '3', '69', '4');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('5', 'nate&tate', '2', '5', '2', '79', '5');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('6', 'marc&miller', '3', '5', '1', '89', '6');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('7', 'marc&miller', '1', '4', '2', '69', '7');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('8', 'marc&miller', '2', '3', '1', '79', '1');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('9', 'marc&miller', '3', '2', '3', '89', '2');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('10', 'marc&miller', '1', '1', '1', '99', '3');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('11', 'project lobster', '2', '1', '2', '99', '4');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('12', 'project lobster', '3', '2', '3', '89', '5');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('13', 'project lobster', '3', '3', '1', '79', '6');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('14', 'project lobster', '2', '4', '2', '69', '7');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('15', 'project lobster', '1', '5', '3', '79', '1');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('16', 'etnia', '3', '5', '3', '89', '2');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('17', 'etnia', '2', '4', '2', '69', '3');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('18', 'etnia', '1', '3', '1', '99', '4');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('19', 'etnia', '3', '2', '1', '69', '5');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('20', 'etnia', '2', '1', '2', '79', '6');
INSERT INTO `cul_dampolla`.`ulleres` (`id_ulleres`, `marca`, `tipus_muntura`, `color_muntura`, `color_vidres`, `preu`, `id_proveidor`) VALUES ('21', 'nate&tate', '1', '1', '3', '89', '7');



-- -----------------------------------------------------
-- Table `cul_dampolla`.`clients`
-- Dels clients vol emmagatzemar el nom, l'adreça postal, el telèfon, el correu electrònic i la data de registre.
-- També ens demanen, quan arriba un client nou, d'emmagatzemar el client que li ha recomanat l'establiment (sempre i quan algú li hagi recomanat).
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cul_dampolla`.`clients` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`clients` (
  `id_client` INT NOT NULL,
  `nom` VARCHAR(45),
  `adreca` VARCHAR(45),
  `telefon` VARCHAR(45),
  `email` VARCHAR(45),
  `data_registre` DATE,
  `afilliation_client` INT null,
  PRIMARY KEY (`id_client`))
ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`) VALUES ('1', 'alfredo', 'barcelona', '+34696396581', 'alfredo@gmail.com', '2021/01/01');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`) VALUES ('2', 'alberto', 'barcelona', '+34696396582', 'alberto@gmail.com', '2021/01/15');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`) VALUES ('3', 'alfonso', 'barcelona', '+34696396583', 'alfonso@gmail.com', '2021/02/02');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`) VALUES ('4', 'aldo', 'barcelona', '+34696396584', 'aldo@gmail.com', '2020/08/15');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`, `afilliation_client`) VALUES ('5', 'lucy', 'barcelona', '+34696396585', 'lucy@gmail.com', '2020/11/15', '1');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`, `afilliation_client`) VALUES ('6', 'sara', 'barcelona', '+346963965846', 'sara@gmail.com', '2021/04/15', '2');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`, `afilliation_client`) VALUES ('7', 'andrea', 'barcelona', '+34696396587', 'andrea@gmail.com', '2021/03/08', '3');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`, `afilliation_client`) VALUES ('8', 'sofia', 'barcelona', '+34696396588', 'sofia@gmail.com', '2021/05/05', '4');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`, `afilliation_client`) VALUES ('9', 'emiliano', 'barcelona', '+34696396589', 'emi@gmail.com', '2021/10/21', '1');
INSERT INTO `cul_dampolla`.`clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`, `afilliation_client`) VALUES ('10', 'gabriela', 'barcelona', '+34696396590', 'gaby@gmail.com', '2021/09/21', '2');



-- -----------------------------------------------------
-- Table `cul_dampolla`.`empleats`
--  El nostre sistema haurà d’indicar qui ha sigut l’empleat que ha venut cada ullera i quan.
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cul_dampolla`.`empleats` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`empleats` (
  `id_empleat` INT NOT NULL,
  `nom` VARCHAR(45) ,
  `num_ss` VARCHAR(45),
  PRIMARY KEY (`id_empleat`))
ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('1', 'andres', '30895890N');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('2', 'cristiano', '30895890T');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('3', 'gerard', '30895890');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('4', 'lionel', '30895890J');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('5', 'neymar', '30895890W');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('6', 'ana', '30895890S');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('7', 'enzo', '30895890M');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('8', 'eric', '30895890C');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('9', 'carolina', '305640877T');
INSERT INTO `cul_dampolla`.`empleats` (`id_empleat`, `nom`, `num_ss`) VALUES ('10', 'eva', '30895890D');


-- -----------------------------------------------------
-- Table `cul_dampolla`.`vendes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cul_dampolla`.`vendes` ;

CREATE TABLE IF NOT EXISTS `cul_dampolla`.`vendes` (
  `id_venda` INT NOT NULL,
  `referencia_venda` VARCHAR (45),
  `id_client` INT,
  `data_venda` DATE,
  `quantitat` INT,
  `id_ulleres` INT,
  `graduacio_vidre_esq` FLOAT ,
  `graduacio_vidre_dre` FLOAT ,
  `id_empleat` INT,
  PRIMARY KEY (`id_venda`),
  INDEX `id_ulleres_idx` (`id_ulleres` ASC) VISIBLE,
  INDEX `id_empleat_idx` (`id_empleat` ASC) VISIBLE,
  INDEX `id_client_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `id_ulleres`
    FOREIGN KEY (`id_ulleres`)
    REFERENCES `cul_dampolla`.`ulleres` (`id_ulleres`),
  CONSTRAINT `id_empleat`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `cul_dampolla`.`empleats` (`id_empleat`),
  CONSTRAINT `id_client`
    FOREIGN KEY (`id_client`)
    REFERENCES `cul_dampolla`.`clients` (`id_client`)
    )
ENGINE = InnoDB;

INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('1','BCN001', '2', '2021/10/01', '1', '1');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('2','BCN001', '2', '2021/10/01', '3', '3');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('3','BCN001', '2', '2021/10/01', '4', '6');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('4','BCN002', '10', '2021/10/03', '1', '8');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('5','BCN002', '10', '2021/10/05', '5', '12');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('6','BCN003', '1', '2021/10/08', '3', '16');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('7','BCN003', '1', '2021/10/08', '4', '21');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('8','BCN003', '1', '2021/10/08', '5', '20');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('9','BCN004', '3', '2021/10/01', '8', '19');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('10','BCN005', '4', '2021/10/01', '4', '18');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('11','BCN006', '5', '2021/10/01', '6', '16');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('12','BCN006', '5', '2021/10/01', '2', '2');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('13','BCN007', '6', '2021/10/01', '3', '1');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('14','BCN008', '7', '2021/10/01', '4', '4');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('15','BCN009', '8', '2021/10/01', '4', '3');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('16','BCN009', '8', '2021/10/01', '3', '5');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('17','BCN009', '8', '2021/10/01', '2', '7');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('18','BCN0010', '9', '2021/10/01', '1', '3');
INSERT INTO `cul_dampolla`.`vendes` (`id_venda`, `referencia_venda`, `id_client`, `data_venda`, `quantitat`, `id_ulleres`) VALUES ('19','BCN0011', '10', '2021/10/01', '2', '1');

UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '1' WHERE (`id_venda` = '1');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '2' WHERE (`id_venda` = '2');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '3' WHERE (`id_venda` = '3');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '4' WHERE (`id_venda` = '4');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '5' WHERE (`id_venda` = '5');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '6' WHERE (`id_venda` = '6');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '7' WHERE (`id_venda` = '7');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '1' WHERE (`id_venda` = '8');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '2' WHERE (`id_venda` = '9');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '4' WHERE (`id_venda` = '10');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '3' WHERE (`id_venda` = '11');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '5' WHERE (`id_venda` = '12');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '4' WHERE (`id_venda` = '13');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '7' WHERE (`id_venda` = '14');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '5' WHERE (`id_venda` = '15');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '3' WHERE (`id_venda` = '16');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '1' WHERE (`id_venda` = '17');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '5' WHERE (`id_venda` = '18');
UPDATE `cul_dampolla`.`vendes` SET `id_empleat` = '4' WHERE (`id_venda` = '19');



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
