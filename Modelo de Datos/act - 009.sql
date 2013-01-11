SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`tiposdocumento` ADD COLUMN `tipodocu_preimpresos` INT(11) NULL DEFAULT NULL  AFTER `tipodocufiscal_id` , ADD COLUMN `tipodocu_impresora` VARCHAR(200) NULL DEFAULT NULL  AFTER `tipodocu_preimpresos` , ADD COLUMN `tipodocu_copias` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_impresora` , ADD COLUMN `tipodocu_preview` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_copias` , ADD COLUMN `tipodocu_prompt` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_preview` , CHANGE COLUMN `tipodocu_fiscal` `tipodocu_fiscal` INT(3) NULL DEFAULT NULL  AFTER `tipodocu_iva` ;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`cajaasientos` (
  `cajaasiento_id` INT(11) NOT NULL ,
  `cajaasiento_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  `cajaasiento_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `cajaasiento_fecha` DATE NULL DEFAULT NULL ,
  `cajaasiento_importe` FLOAT(20,2) NULL DEFAULT NULL ,
  `concepto_id` INT(11) NOT NULL ,
  PRIMARY KEY (`cajaasiento_id`) ,
  INDEX `fk_cajaasientos_conceptos1` (`concepto_id` ASC) ,
  CONSTRAINT `fk_cajaasientos_conceptos1`
    FOREIGN KEY (`concepto_id` )
    REFERENCES `dbborgest`.`conceptos` (`concepto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`conceptos` (
  `concepto_id` INT(11) NOT NULL ,
  `concepto_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  PRIMARY KEY (`concepto_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
