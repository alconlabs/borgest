SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE  TABLE IF NOT EXISTS `dbborgest`.`tiposdocumento` (
  `tipodocu_id` INT(11) NOT NULL ,
  `tipodocu_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `tipodocu_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `tipodocu_caja` INT(3) NULL DEFAULT NULL ,
  `tipodocu_stock` INT(3) NULL DEFAULT NULL ,
  `tipodocu_iva` INT(3) NULL DEFAULT NULL ,
  `tipodocu_fiscal` INT(3) NULL DEFAULT NULL ,
  `tipodocu_ultimonumero` INT(11) NULL DEFAULT NULL ,
  `puntoventa_id` INT(11) NOT NULL ,
  `tipodocu_letra` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tipodocu_id`) ,
  INDEX `fk_tiposdocumento_puntodeventa` (`puntoventa_id` ASC) ,
  CONSTRAINT `fk_tiposdocumento_puntodeventa`
    FOREIGN KEY (`puntoventa_id` )
    REFERENCES `dbborgest`.`puntodeventa` (`puntoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`puntodeventa` (
  `puntoventa_id` INT(11) NOT NULL ,
  `puntoventa_numero` INT(11) NULL DEFAULT NULL ,
  `puntoventa_descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`puntoventa_id`) ,
  INDEX `fk_puntodeventa_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_puntodeventa_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`sucursales` (
  `sucursal_id` INT(11) NOT NULL ,
  `sucursal_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `sucursal_domicilio` VARCHAR(45) NULL DEFAULT NULL ,
  `sucursal_telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `empresa_id` INT(11) NOT NULL ,
  PRIMARY KEY (`sucursal_id`) ,
  INDEX `fk_sucursales_empresas1` (`empresa_id` ASC) ,
  CONSTRAINT `fk_sucursales_empresas1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `dbborgest`.`empresas` (`empresa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`empresas` (
  `empresa_id` INT(11) NOT NULL ,
  `empresa_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `empresa_domicilio` VARCHAR(45) NULL DEFAULT NULL ,
  `empresa_telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `empresa_cuit` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`empresa_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentosventas` (
  `documentoventa_id` INT(11) NOT NULL ,
  `documentoventa_numero` INT(11) NULL DEFAULT NULL ,
  `documentoventa_fecha` DATE NULL DEFAULT NULL ,
  `documentoventa_hora` TIME NULL DEFAULT NULL ,
  `documentoventa_neto21` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_iva21` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_neto105` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_iva105` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_netonogravado` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_total` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentoventa_pagado` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_saldo` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_observacion` VARCHAR(255) NULL DEFAULT NULL ,
  `cliente_id` INT(11) NOT NULL ,
  `personal_id` INT(11) NOT NULL ,
  `tipodocu_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentoventa_id`) ,
  INDEX `fk_documentosventas_clientes1` (`cliente_id` ASC) ,
  INDEX `fk_documentosventas_personal1` (`personal_id` ASC) ,
  INDEX `fk_documentosventas_tiposdocumento1` (`tipodocu_id` ASC) ,
  CONSTRAINT `fk_documentosventas_clientes1`
    FOREIGN KEY (`cliente_id` )
    REFERENCES `dbborgest`.`clientes` (`cliente_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentosventas_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `dbborgest`.`personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentosventas_tiposdocumento1`
    FOREIGN KEY (`tipodocu_id` )
    REFERENCES `dbborgest`.`tiposdocumento` (`tipodocu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`clientes` (
  `cliente_id` INT(11) NOT NULL ,
  `cliente_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_domicilio` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_documentonro` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_documentotipo` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_celular` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_mail` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`cliente_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`personal` (
  `personal_id` INT(11) NOT NULL ,
  `personal_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `personal_domicilio` VARCHAR(45) NULL DEFAULT NULL ,
  `personal_telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `personal_celular` VARCHAR(45) NULL DEFAULT NULL ,
  `personal_mail` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`personal_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentopagos` (
  `documentopago_id` INT(11) NOT NULL ,
  `documentopago_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `documentopago_importe` FLOAT(11) NULL DEFAULT NULL ,
  `tipopago_id` INT(11) NOT NULL ,
  `documentoventa_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentopago_id`) ,
  INDEX `fk_documentopagos_tipospago1` (`tipopago_id` ASC) ,
  INDEX `fk_documentopagos_documentosventas1` (`documentoventa_id` ASC) ,
  CONSTRAINT `fk_documentopagos_tipospago1`
    FOREIGN KEY (`tipopago_id` )
    REFERENCES `dbborgest`.`tipospago` (`tipopago_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentopagos_documentosventas1`
    FOREIGN KEY (`documentoventa_id` )
    REFERENCES `dbborgest`.`documentosventas` (`documentoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipospago` (
  `tipopago_id` INT(11) NOT NULL ,
  `tipopago_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `tipopago_caja` INT(3) NULL DEFAULT NULL ,
  PRIMARY KEY (`tipopago_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`productos` (
  `producto_id` INT(11) NOT NULL ,
  `producto_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `producto_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  `producto_codigo` VARCHAR(45) NULL DEFAULT NULL ,
  `producto_codigobarras` VARCHAR(45) NULL DEFAULT NULL ,
  `producto_preciocosto` FLOAT(11) NULL DEFAULT NULL ,
  `producto_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `producto_precioventa` FLOAT(11) NULL DEFAULT NULL ,
  `tipoiva_id` INT(11) NOT NULL ,
  `rubro_id` INT(11) NOT NULL ,
  PRIMARY KEY (`producto_id`) ,
  INDEX `fk_productos_tipoiva1` (`tipoiva_id` ASC) ,
  INDEX `fk_productos_rubros1` (`rubro_id` ASC) ,
  CONSTRAINT `fk_productos_tipoiva1`
    FOREIGN KEY (`tipoiva_id` )
    REFERENCES `dbborgest`.`tipoiva` (`tipoiva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_rubros1`
    FOREIGN KEY (`rubro_id` )
    REFERENCES `dbborgest`.`rubros` (`rubro_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipoiva` (
  `tipoiva_id` INT(11) NOT NULL ,
  `tipoiva_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `tipoiva_valor` FLOAT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`tipoiva_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`rubros` (
  `rubro_id` INT(11) NOT NULL ,
  `rubro_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`rubro_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoventadetalles` (
  `documentoventadetalle_id` INT(11) NOT NULL ,
  `documentoventadetalle_descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  `documentoventadetalle_cantidad` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_precio` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_total` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_neto21` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_iva21` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_neto105` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_iva105` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_nogravado` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentoventadetalle_observacion` VARCHAR(255) NULL DEFAULT NULL ,
  `producto_id` INT(11) NOT NULL ,
  `documentoventadetalle_idorig` INT(11) NULL DEFAULT NULL ,
  `documentoventadetalle_cantidadpendiente` FLOAT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`documentoventadetalle_id`) ,
  INDEX `fk_documentoventadetalles_productos1` (`producto_id` ASC) ,
  CONSTRAINT `fk_documentoventadetalles_productos1`
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
