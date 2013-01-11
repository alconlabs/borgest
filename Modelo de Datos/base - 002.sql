SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `dbborgest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `dbborgest` ;

-- -----------------------------------------------------
-- Table `dbborgest`.`empresas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`empresas` (
  `empresa_id` INT NOT NULL ,
  `empresa_nombre` VARCHAR(100) NULL ,
  `empresa_domicilio` VARCHAR(150) NULL ,
  `empresa_telefono` VARCHAR(45) NULL ,
  `empresa_cuit` VARCHAR(45) NULL ,
  PRIMARY KEY (`empresa_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`sucursales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`sucursales` (
  `sucursal_id` INT NOT NULL ,
  `sucursal_nombre` VARCHAR(100) NULL ,
  `sucursal_domicilio` VARCHAR(150) NULL ,
  `sucursal_telefono` VARCHAR(45) NULL ,
  `empresa_id` INT NOT NULL ,
  PRIMARY KEY (`sucursal_id`) ,
  INDEX `fk_sucursales_empresas1` (`empresa_id` ASC) ,
  CONSTRAINT `fk_sucursales_empresas1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `dbborgest`.`empresas` (`empresa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`puntodeventa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`puntodeventa` (
  `puntoventa_id` INT NOT NULL ,
  `puntoventa_numero` INT NULL ,
  `puntoventa_descripcion` VARCHAR(45) NULL ,
  `sucursal_id` INT NOT NULL ,
  PRIMARY KEY (`puntoventa_id`) ,
  INDEX `fk_puntodeventa_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_puntodeventa_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`tiposdocumento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`tiposdocumento` (
  `tipodocu_id` INT NOT NULL ,
  `tipodocu_nombre` VARCHAR(45) NULL ,
  `tipodocu_tipo` VARCHAR(45) NULL ,
  `tipodocu_caja` INT(3) NULL ,
  `tipodocu_stock` INT(3) NULL ,
  `tipodocu_iva` INT(3) NULL ,
  `tipodocu_fiscal` INT(3) NULL ,
  `tipodocu_ultimonumero` INT NULL ,
  `puntoventa_id` INT NOT NULL ,
  `tipodocu_letra` VARCHAR(45) NULL ,
  PRIMARY KEY (`tipodocu_id`) ,
  INDEX `fk_tiposdocumento_puntodeventa` (`puntoventa_id` ASC) ,
  CONSTRAINT `fk_tiposdocumento_puntodeventa`
    FOREIGN KEY (`puntoventa_id` )
    REFERENCES `dbborgest`.`puntodeventa` (`puntoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`condicioniva`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`condicioniva` (
  `condicioniva_id` INT NOT NULL ,
  `condicioniva_nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`condicioniva_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`clientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`clientes` (
  `cliente_id` INT NOT NULL ,
  `cliente_nombre` VARCHAR(100) NULL ,
  `cliente_domicilio` VARCHAR(150) NULL ,
  `cliente_documentonro` VARCHAR(45) NULL ,
  `cliente_documentotipo` VARCHAR(45) NULL ,
  `cliente_telefono` VARCHAR(45) NULL ,
  `cliente_celular` VARCHAR(45) NULL ,
  `cliente_mail` VARCHAR(45) NULL ,
  `condicioniva_id` INT NOT NULL ,
  `cliente_listaprecio` INT(3) NULL ,
  `cliente_condicionventa` VARCHAR(45) NULL ,
  PRIMARY KEY (`cliente_id`) ,
  INDEX `fk_clientes_condicioniva1` (`condicioniva_id` ASC) ,
  CONSTRAINT `fk_clientes_condicioniva1`
    FOREIGN KEY (`condicioniva_id` )
    REFERENCES `dbborgest`.`condicioniva` (`condicioniva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`personal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`personal` (
  `personal_id` INT NOT NULL ,
  `personal_nombre` VARCHAR(100) NULL ,
  `personal_domicilio` VARCHAR(150) NULL ,
  `personal_telefono` VARCHAR(45) NULL ,
  `personal_celular` VARCHAR(45) NULL ,
  `personal_mail` VARCHAR(45) NULL ,
  PRIMARY KEY (`personal_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`documentosventas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentosventas` (
  `documentoventa_id` INT NOT NULL ,
  `documentoventa_numero` INT NULL ,
  `documentoventa_fecha` DATE NULL ,
  `documentoventa_hora` TIME NULL ,
  `documentoventa_neto21` FLOAT NULL ,
  `documentoventa_iva21` FLOAT NULL ,
  `documentoventa_neto105` FLOAT NULL ,
  `documentoventa_iva105` FLOAT NULL ,
  `documentoventa_netonogravado` FLOAT NULL ,
  `documentoventa_total` FLOAT NULL ,
  `documentoventa_estado` VARCHAR(45) NULL ,
  `documentoventa_pagado` FLOAT NULL ,
  `documentoventa_saldo` FLOAT NULL ,
  `documentoventa_observacion` VARCHAR(255) NULL ,
  `cliente_id` INT NOT NULL ,
  `personal_id` INT NOT NULL ,
  `tipodocu_id` INT NOT NULL ,
  `documentoventa_condicionventa` INT(3) NULL ,
  `documentoventa_fechavenc` DATE NULL ,
  `documentoventa_listaprecio` INT(3) NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`tipospago`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipospago` (
  `tipopago_id` INT NOT NULL ,
  `tipopago_nombre` VARCHAR(45) NULL ,
  `tipopago_caja` INT(3) NULL ,
  PRIMARY KEY (`tipopago_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`documentopagos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentopagos` (
  `documentopago_id` INT NOT NULL ,
  `documentopago_nombre` VARCHAR(45) NULL ,
  `documentopago_importe` FLOAT NULL ,
  `tipopago_id` INT NOT NULL ,
  `documentoventa_id` INT NOT NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`tipoiva`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipoiva` (
  `tipoiva_id` INT NOT NULL ,
  `tipoiva_nombre` VARCHAR(45) NULL ,
  `tipoiva_valor` FLOAT NULL ,
  PRIMARY KEY (`tipoiva_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`rubros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`rubros` (
  `rubro_id` INT NOT NULL ,
  `rubro_nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`rubro_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`calculoprecios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`calculoprecios` (
  `calculoprecio_id` INT NOT NULL ,
  `calculoprecio_nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`calculoprecio_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`politicasdeprecios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`politicasdeprecios` (
  `politicaprecio_id` INT NOT NULL ,
  `politicaprecio_nombre` VARCHAR(45) NULL ,
  `politicaprecio_politica1` FLOAT NULL ,
  `politicaprecio_politica2` FLOAT NULL ,
  `politicaprecio_politica3` FLOAT NULL ,
  `politicaprecio_politica4` FLOAT NULL ,
  `politicaprecio_obse` VARCHAR(255) NULL ,
  PRIMARY KEY (`politicaprecio_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`productos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`productos` (
  `producto_id` INT NOT NULL ,
  `producto_nombre` VARCHAR(150) NULL ,
  `producto_observaciones` VARCHAR(255) NULL ,
  `producto_codigo` VARCHAR(45) NULL ,
  `producto_codigobarras` VARCHAR(45) NULL ,
  `producto_preciocosto` FLOAT NULL ,
  `producto_precioventabase` FLOAT NULL ,
  `producto_estado` VARCHAR(45) NULL ,
  `producto_precioventa1` FLOAT NULL ,
  `tipoiva_id` INT NOT NULL ,
  `rubro_id` INT NOT NULL ,
  `producto_precioventa2` FLOAT NULL ,
  `producto_precioventa3` FLOAT NULL ,
  `producto_precioventa4` FLOAT NULL ,
  `calculoprecio_id` INT NOT NULL ,
  `politicaprecio_id` INT NOT NULL ,
  PRIMARY KEY (`producto_id`) ,
  INDEX `fk_productos_tipoiva1` (`tipoiva_id` ASC) ,
  INDEX `fk_productos_rubros1` (`rubro_id` ASC) ,
  INDEX `fk_productos_calculoprecios1` (`calculoprecio_id` ASC) ,
  INDEX `fk_productos_politicasdeprecios1` (`politicaprecio_id` ASC) ,
  CONSTRAINT `fk_productos_tipoiva1`
    FOREIGN KEY (`tipoiva_id` )
    REFERENCES `dbborgest`.`tipoiva` (`tipoiva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_rubros1`
    FOREIGN KEY (`rubro_id` )
    REFERENCES `dbborgest`.`rubros` (`rubro_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_calculoprecios1`
    FOREIGN KEY (`calculoprecio_id` )
    REFERENCES `dbborgest`.`calculoprecios` (`calculoprecio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_politicasdeprecios1`
    FOREIGN KEY (`politicaprecio_id` )
    REFERENCES `dbborgest`.`politicasdeprecios` (`politicaprecio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`documentoventadetalles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoventadetalles` (
  `documentoventadetalle_id` INT NOT NULL ,
  `documentoventadetalle_descripcion` VARCHAR(150) NULL ,
  `documentoventadetalle_cantidad` FLOAT NULL ,
  `documentoventadetalle_precio` FLOAT NULL ,
  `documentoventadetalle_total` FLOAT NULL ,
  `documentoventadetalle_neto21` FLOAT NULL ,
  `documentoventadetalle_iva21` FLOAT NULL ,
  `documentoventadetalle_neto105` FLOAT NULL ,
  `documentoventadetalle_iva105` FLOAT NULL ,
  `documentoventadetalle_nogravado` FLOAT NULL ,
  `documentoventadetalle_estado` VARCHAR(45) NULL ,
  `documentoventadetalle_observacion` VARCHAR(255) NULL ,
  `producto_id` INT NOT NULL ,
  `documentoventadetalle_idorig` INT NULL ,
  `documentoventadetalle_cantidadpendiente` FLOAT NULL ,
  `documentoventa_id` INT NOT NULL ,
  PRIMARY KEY (`documentoventadetalle_id`) ,
  INDEX `fk_documentoventadetalles_productos1` (`producto_id` ASC) ,
  INDEX `fk_documentoventadetalles_documentosventas1` (`documentoventa_id` ASC) ,
  CONSTRAINT `fk_documentoventadetalles_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `dbborgest`.`productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentoventadetalles_documentosventas1`
    FOREIGN KEY (`documentoventa_id` )
    REFERENCES `dbborgest`.`documentosventas` (`documentoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`calculopreciodeta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`calculopreciodeta` (
  `calculopreciodeta_id` INT NOT NULL ,
  `calculopreciodeta_descr` VARCHAR(45) NULL ,
  `calculopreciodeta_orden` INT(3) NULL ,
  `calculopreciodeta_tipo` VARCHAR(15) NULL ,
  `calculopreciodeta_valor` FLOAT NULL ,
  `calculoprecio_id` INT NOT NULL ,
  PRIMARY KEY (`calculopreciodeta_id`) ,
  INDEX `fk_calculopreciodeta_calculoprecios1` (`calculoprecio_id` ASC) ,
  CONSTRAINT `fk_calculopreciodeta_calculoprecios1`
    FOREIGN KEY (`calculoprecio_id` )
    REFERENCES `dbborgest`.`calculoprecios` (`calculoprecio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
