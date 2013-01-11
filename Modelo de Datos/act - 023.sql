SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`documentosventas` ADD COLUMN `documentoventa_nrodetallepago` VARCHAR(45) NULL DEFAULT NULL  AFTER `documentoventa_formapago` ;


CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoscompras` (
  `documentocompra_id` INT(11) NOT NULL ,
  `documentocompra_numero` INT(11) NULL DEFAULT NULL ,
  `documentocompra_fecha` DATE NULL DEFAULT NULL ,
  `documentocompra_hora` TIME NULL DEFAULT NULL ,
  `documentocompra_total` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentocompra_pagado` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_saldo` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_observacion` VARCHAR(255) NULL DEFAULT NULL ,
  `documentocompra_condicionventa` INT(3) NULL DEFAULT NULL ,
  `documentocompra_fechavenc` DATE NULL DEFAULT NULL ,
  `personal_id` INT(11) NOT NULL ,
  `proveedor_id` INT(11) NOT NULL ,
  `tipodocu_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentocompra_id`) ,
  INDEX `fk_documentoscompras_personal1` (`personal_id` ASC) ,
  INDEX `fk_documentoscompras_proveedores1` (`proveedor_id` ASC) ,
  INDEX `fk_documentoscompras_tiposdocumento1` (`tipodocu_id` ASC) ,
  CONSTRAINT `fk_documentoscompras_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `dbborgest`.`personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentoscompras_proveedores1`
    FOREIGN KEY (`proveedor_id` )
    REFERENCES `dbborgest`.`proveedores` (`proveedor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentoscompras_tiposdocumento1`
    FOREIGN KEY (`tipodocu_id` )
    REFERENCES `dbborgest`.`tiposdocumento` (`tipodocu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentocompradetalles` (
  `documentocompradetalle_id` INT(11) NOT NULL ,
  `documentocompradetalle_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  `documentocompradetalle_cantidad` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompradetalle_precio` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompradetalle_total` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompradetalle_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentocompradetalle_observacion` VARCHAR(255) NULL DEFAULT NULL ,
  `documentocompradetalle_idorig` INT(11) NULL DEFAULT NULL ,
  `documentocompradetalle_cantidadpendiente` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_id` INT(11) NOT NULL ,
  `producto_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentocompradetalle_id`) ,
  INDEX `fk_documentocompradetalles_documentoscompras1` (`documentocompra_id` ASC) ,
  INDEX `fk_documentocompradetalles_productos1` (`producto_id` ASC) ,
  CONSTRAINT `fk_documentocompradetalles_documentoscompras1`
    FOREIGN KEY (`documentocompra_id` )
    REFERENCES `dbborgest`.`documentoscompras` (`documentocompra_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentocompradetalles_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `dbborgest`.`productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
