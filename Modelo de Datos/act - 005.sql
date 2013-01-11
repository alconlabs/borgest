SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`tiposdocumento` ADD COLUMN `tipodocu_debcred` VARCHAR(45) NULL DEFAULT NULL  AFTER `tipodocu_letra` ;

ALTER TABLE `dbborgest`.`clientes` ADD COLUMN `localidad_id` INT(11) NOT NULL  AFTER `cliente_condicionventa` , 
  ADD CONSTRAINT `fk_clientes_localidades1`
  FOREIGN KEY (`localidad_id` )
  REFERENCES `dbborgest`.`localidades` (`localidad_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_clientes_localidades1` (`localidad_id` ASC) ;

ALTER TABLE `dbborgest`.`productos` ADD COLUMN `proveedor_id` INT(11) NOT NULL  AFTER `producto_neto4` , ADD COLUMN `producto_fechaactualizacionprecio` DATE NULL DEFAULT NULL  AFTER `proveedor_id` , 
  ADD CONSTRAINT `fk_productos_proveedores1`
  FOREIGN KEY (`proveedor_id` )
  REFERENCES `dbborgest`.`proveedores` (`proveedor_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_productos_proveedores1` (`proveedor_id` ASC) ;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`depositos` (
  `deposito_id` INT(11) NOT NULL ,
  `deposito_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  `deposito_domicilio` VARCHAR(150) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`deposito_id`) ,
  INDEX `fk_depositos_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_depositos_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`productodeposito` (
  `producdepo_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `producdepo_stockactual` FLOAT(20,4) NULL DEFAULT NULL ,
  `producto_id` INT(11) NOT NULL ,
  `deposito_id` INT(11) NOT NULL ,
  `producdepo_stockminimo` FLOAT(20,4) NULL DEFAULT NULL ,
  `producdepo_puntorepos` FLOAT(20,4) NULL DEFAULT NULL ,
  PRIMARY KEY (`producdepo_id`) ,
  INDEX `fk_productodeposito_productos1` (`producto_id` ASC) ,
  INDEX `fk_productodeposito_depositos1` (`deposito_id` ASC) ,
  CONSTRAINT `fk_productodeposito_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `dbborgest`.`productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productodeposito_depositos1`
    FOREIGN KEY (`deposito_id` )
    REFERENCES `dbborgest`.`depositos` (`deposito_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`config` (
  `config_id` INT(11) NOT NULL ,
  `config_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  `config_valor` VARCHAR(150) NULL DEFAULT NULL ,
  PRIMARY KEY (`config_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`temp` (
  `i` INT(11) NULL DEFAULT NULL ,
  `t` VARCHAR(255) NULL DEFAULT NULL ,
  `m` VARCHAR(400) NULL DEFAULT NULL ,
  `d` FLOAT(11) NULL DEFAULT NULL ,
  `f` DATE NULL DEFAULT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`proveedores` (
  `proveedor_id` INT(11) NOT NULL ,
  `proveedor_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  `proveedor_domicilio` VARCHAR(150) NULL DEFAULT NULL ,
  `proveedor_documentonro` VARCHAR(45) NULL DEFAULT NULL ,
  `proveedor_documentotipo` VARCHAR(45) NULL DEFAULT NULL ,
  `proveedor_telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `proveedor_celular` VARCHAR(45) NULL DEFAULT NULL ,
  `proveedor_mail` VARCHAR(45) NULL DEFAULT NULL ,
  `condicioniva_id` INT(11) NOT NULL ,
  `proveedor_condicionventa` VARCHAR(45) NULL DEFAULT NULL ,
  `proveedor_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `localidad_id` INT(11) NOT NULL ,
  PRIMARY KEY (`proveedor_id`) ,
  INDEX `fk_clientes_condicioniva1` (`condicioniva_id` ASC) ,
  INDEX `fk_proveedores_localidades1` (`localidad_id` ASC) ,
  CONSTRAINT `fk_clientes_condicioniva10`
    FOREIGN KEY (`condicioniva_id` )
    REFERENCES `dbborgest`.`condicioniva` (`condicioniva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_localidades1`
    FOREIGN KEY (`localidad_id` )
    REFERENCES `dbborgest`.`localidades` (`localidad_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`provincias` (
  `provincia_id` INT(11) NOT NULL ,
  `provincia_nombre` VARCHAR(50) NULL DEFAULT NULL ,
  PRIMARY KEY (`provincia_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`localidades` (
  `localidad_id` INT(11) NOT NULL ,
  `localidad_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  `localidad_codigopostal` VARCHAR(45) NULL DEFAULT NULL ,
  `provincia_id` INT(11) NOT NULL ,
  PRIMARY KEY (`localidad_id`) ,
  INDEX `fk_localidades_provincias1` (`provincia_id` ASC) ,
  CONSTRAINT `fk_localidades_provincias1`
    FOREIGN KEY (`provincia_id` )
    REFERENCES `dbborgest`.`provincias` (`provincia_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
