SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`sucursales` CHANGE COLUMN `sucursal_nombre` `sucursal_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `sucursal_domicilio` `sucursal_domicilio` VARCHAR(150) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`empresas` CHANGE COLUMN `empresa_nombre` `empresa_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `empresa_domicilio` `empresa_domicilio` VARCHAR(150) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`documentosventas` ADD COLUMN `documentoventa_condicionventa` INT(3) NULL DEFAULT NULL  AFTER `tipodocu_id` , ADD COLUMN `documentoventa_fechavenc` DATE NULL DEFAULT NULL  AFTER `documentoventa_condicionventa` , ADD COLUMN `documentoventa_listaprecio` INT(3) NULL DEFAULT NULL  AFTER `documentoventa_fechavenc` ;

ALTER TABLE `dbborgest`.`clientes` ADD COLUMN `condicioniva_id` INT(11) NOT NULL  AFTER `cliente_mail` , ADD COLUMN `cliente_listaprecio` INT(3) NULL DEFAULT NULL  AFTER `condicioniva_id` , ADD COLUMN `cliente_condicionventa` VARCHAR(45) NULL DEFAULT NULL  AFTER `cliente_listaprecio` , CHANGE COLUMN `cliente_nombre` `cliente_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `cliente_domicilio` `cliente_domicilio` VARCHAR(150) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `fk_clientes_condicioniva1`
  FOREIGN KEY (`condicioniva_id` )
  REFERENCES `dbborgest`.`condicioniva` (`condicioniva_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_clientes_condicioniva1` (`condicioniva_id` ASC) ;

ALTER TABLE `dbborgest`.`personal` CHANGE COLUMN `personal_nombre` `personal_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `personal_domicilio` `personal_domicilio` VARCHAR(150) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`productos` DROP COLUMN `producto_precioventa` , ADD COLUMN `producto_precioventabase` FLOAT(11) NULL DEFAULT NULL  AFTER `producto_preciocosto` , ADD COLUMN `producto_precioventa1` FLOAT(11) NULL DEFAULT NULL  AFTER `producto_estado` , ADD COLUMN `producto_precioventa2` FLOAT(11) NULL DEFAULT NULL  AFTER `rubro_id` , ADD COLUMN `producto_precioventa3` FLOAT(11) NULL DEFAULT NULL  AFTER `producto_precioventa2` , ADD COLUMN `producto_precioventa4` FLOAT(11) NULL DEFAULT NULL  AFTER `producto_precioventa3` , ADD COLUMN `calculoprecio_id` INT(11) NOT NULL  AFTER `producto_precioventa4` , ADD COLUMN `politicaprecio_id` INT(11) NOT NULL  AFTER `calculoprecio_id` , CHANGE COLUMN `producto_nombre` `producto_nombre` VARCHAR(150) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `fk_productos_calculoprecios1`
  FOREIGN KEY (`calculoprecio_id` )
  REFERENCES `dbborgest`.`calculoprecios` (`calculoprecio_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_productos_politicasdeprecios1`
  FOREIGN KEY (`politicaprecio_id` )
  REFERENCES `dbborgest`.`politicasdeprecios` (`politicaprecio_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_productos_calculoprecios1` (`calculoprecio_id` ASC) 
, ADD INDEX `fk_productos_politicasdeprecios1` (`politicaprecio_id` ASC) ;

ALTER TABLE `dbborgest`.`documentoventadetalles` ADD COLUMN `documentoventa_id` INT(11) NOT NULL  AFTER `documentoventadetalle_cantidadpendiente` , CHANGE COLUMN `documentoventadetalle_descripcion` `documentoventadetalle_descripcion` VARCHAR(150) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `fk_documentoventadetalles_documentosventas1`
  FOREIGN KEY (`documentoventa_id` )
  REFERENCES `dbborgest`.`documentosventas` (`documentoventa_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_documentoventadetalles_documentosventas1` (`documentoventa_id` ASC) ;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`condicioniva` (
  `condicioniva_id` INT(11) NOT NULL ,
  `condicioniva_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`condicioniva_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`calculoprecios` (
  `calculoprecio_id` INT(11) NOT NULL ,
  `calculoprecio_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`calculoprecio_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`calculopreciodeta` (
  `calculopreciodeta_id` INT(11) NOT NULL ,
  `calculopreciodeta_descr` VARCHAR(45) NULL DEFAULT NULL ,
  `calculopreciodeta_orden` INT(3) NULL DEFAULT NULL ,
  `calculopreciodeta_tipo` VARCHAR(15) NULL DEFAULT NULL ,
  `calculopreciodeta_valor` FLOAT(11) NULL DEFAULT NULL ,
  `calculoprecio_id` INT(11) NOT NULL ,
  PRIMARY KEY (`calculopreciodeta_id`) ,
  INDEX `fk_calculopreciodeta_calculoprecios1` (`calculoprecio_id` ASC) ,
  CONSTRAINT `fk_calculopreciodeta_calculoprecios1`
    FOREIGN KEY (`calculoprecio_id` )
    REFERENCES `dbborgest`.`calculoprecios` (`calculoprecio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`politicasdeprecios` (
  `politicaprecio_id` INT(11) NOT NULL ,
  `politicaprecio_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `politicaprecio_politica1` FLOAT(11) NULL DEFAULT NULL ,
  `politicaprecio_politica2` FLOAT(11) NULL DEFAULT NULL ,
  `politicaprecio_politica3` FLOAT(11) NULL DEFAULT NULL ,
  `politicaprecio_politica4` FLOAT(11) NULL DEFAULT NULL ,
  `politicaprecio_obse` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`politicaprecio_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
