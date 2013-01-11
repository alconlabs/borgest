SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`documentosventas` CHANGE COLUMN `documentoventa_equipo1` `documentoventa_equipo1` VARCHAR(45) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_equipo2` `documentoventa_equipo2` VARCHAR(45) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_formapago` `documentoventa_formapago` VARCHAR(255) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`productos` CHANGE COLUMN `producto_codigoreferencia` `producto_codigoreferencia` VARCHAR(45) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `fk_productos_tipoiva1`
  FOREIGN KEY (`tipoiva_id` )
  REFERENCES `dbborgest`.`tipoiva` (`tipoiva_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_productos_rubros1`
  FOREIGN KEY (`rubro_id` )
  REFERENCES `dbborgest`.`rubros` (`rubro_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `dbborgest`.`documentoventadetalles` CHANGE COLUMN `documentoventadetalle_importe1` `documentoventadetalle_importe1` FLOAT(20,4) NULL DEFAULT 0  , CHANGE COLUMN `documentoventadetalle_importe2` `documentoventadetalle_importe2` FLOAT(20,4) NULL DEFAULT 0  , CHANGE COLUMN `documentoventadetalle_importe3` `documentoventadetalle_importe3` FLOAT(20,4) NULL DEFAULT 0  , CHANGE COLUMN `documentoventadetalle_importe4` `documentoventadetalle_importe4` FLOAT(20,4) NULL DEFAULT 0  , CHANGE COLUMN `documentoventadetalle_importe5` `documentoventadetalle_importe5` FLOAT(20,4) NULL DEFAULT 0  , CHANGE COLUMN `documentoventadetalle_importe6` `documentoventadetalle_importe6` FLOAT(20,4) NULL DEFAULT 0  , DROP FOREIGN KEY `fk_documentoventadetalles_productos1` ;

ALTER TABLE `dbborgest`.`documentoventadetalles` 
  ADD CONSTRAINT `fk_documentoventadetalles_productos1`
  FOREIGN KEY (`producto_id` )
  REFERENCES `dbborgest`.`productos` (`producto_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`equipos` (
  `equipo_id` INT(11) NOT NULL ,
  `equipo_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `equipo_numero` VARCHAR(45) NULL DEFAULT NULL ,
  `equipo_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`equipo_id`) ,
  INDEX `fk_equipos_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_equipos_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`perfiles` (
  `perfil_id` INT(11) NOT NULL ,
  `perfil_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`perfil_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`menuperfil` (
  `menuperfil_id` INT(11) NOT NULL ,
  `menuperfil_habilitado` INT(3) NULL DEFAULT NULL ,
  `menuperfil_agregar` INT(3) NULL DEFAULT NULL ,
  `menuperfil_eliminar` INT(3) NULL DEFAULT NULL ,
  `menuperfil_modificar` INT(3) NULL DEFAULT NULL ,
  `menuperfil_anular` INT(3) NULL DEFAULT NULL ,
  `menuperfil_imprimir` INT(3) NULL DEFAULT NULL ,
  `menuperfil_ver` INT(3) NULL DEFAULT NULL ,
  `menu_id` INT(11) NOT NULL ,
  `perfil_id` INT(11) NOT NULL ,
  PRIMARY KEY (`menuperfil_id`) ,
  INDEX `fk_menuperfil_menu1` (`menu_id` ASC) ,
  INDEX `fk_menuperfil_perfiles1` (`perfil_id` ASC) ,
  CONSTRAINT `fk_menuperfil_menu1`
    FOREIGN KEY (`menu_id` )
    REFERENCES `dbborgest`.`menu` (`menu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menuperfil_perfiles1`
    FOREIGN KEY (`perfil_id` )
    REFERENCES `dbborgest`.`perfiles` (`perfil_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


USE `dbborgest`;
DROP procedure IF EXISTS `dbborgest`.`actualizarsaldoventa`;

DELIMITER $$
USE `dbborgest`$$
CREATE PROCEDURE `dbborgest`.`actualizarsaldoventa` (id int, pago float)
BEGIN
    update documentosventas set documentoventa_saldo=documentoventa_saldo-(pago), 
    documentoventa_pagado=documentoventa_pagado+(pago),
    documentoventa_estado=if(documentoventa_saldo=0,'PAGADA','PENDIENTE')
    where documentoventa_id=id;

END



$$

DELIMITER ;
USE `dbborgest`;
DROP procedure IF EXISTS `dbborgest`.`actualizarstockproductos`;

DELIMITER $$
USE `dbborgest`$$
CREATE PROCEDURE `dbborgest`.`actualizarstockproductos` (produ_id int, depo_id int, cantidad float)
BEGIN
    update productodeposito set producdepo_stockactual=producdepo_stockactual+(cantidad)
    where producto_id=produ_id and deposito_id=depo_id;


END

$$

DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
