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
  `empresa_tipo` VARCHAR(45) NULL ,
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
  `puntoventa_controladorfiscalmodelo` INT(3) NULL DEFAULT -1 ,
  `puntoventa_controladorfiscalpuerto` INT(3) NULL DEFAULT -1 ,
  PRIMARY KEY (`puntoventa_id`) ,
  INDEX `fk_puntodeventa_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_puntodeventa_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`tipodocumentofiscal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipodocumentofiscal` (
  `tipodocufiscal_id` INT NOT NULL ,
  `tipodocufiscal_nombre` VARCHAR(100) NULL ,
  PRIMARY KEY (`tipodocufiscal_id`) )
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
  `tipodocu_debcred` VARCHAR(45) NULL ,
  `tipodocufiscal_id` INT NOT NULL ,
  `tipodocu_preimpresos` INT NULL ,
  `tipodocu_impresora` VARCHAR(200) NULL ,
  `tipodocu_copias` INT NULL ,
  `tipodocu_preview` INT NULL ,
  `tipodocu_prompt` INT NULL ,
  `tipodocu_ctacte` INT(3) NULL DEFAULT -1 ,
  `tipodocu_archivoimpresion` VARCHAR(100) NULL ,
  PRIMARY KEY (`tipodocu_id`) ,
  INDEX `fk_tiposdocumento_puntodeventa` (`puntoventa_id` ASC) ,
  INDEX `fk_tiposdocumento_tipodocumentofiscal1` (`tipodocufiscal_id` ASC) ,
  CONSTRAINT `fk_tiposdocumento_puntodeventa`
    FOREIGN KEY (`puntoventa_id` )
    REFERENCES `dbborgest`.`puntodeventa` (`puntoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tiposdocumento_tipodocumentofiscal1`
    FOREIGN KEY (`tipodocufiscal_id` )
    REFERENCES `dbborgest`.`tipodocumentofiscal` (`tipodocufiscal_id` )
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
-- Table `dbborgest`.`provincias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`provincias` (
  `provincia_id` INT NOT NULL ,
  `provincia_nombre` VARCHAR(50) NULL ,
  PRIMARY KEY (`provincia_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`localidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`localidades` (
  `localidad_id` INT NOT NULL ,
  `localidad_nombre` VARCHAR(100) NULL ,
  `localidad_codigopostal` VARCHAR(45) NULL ,
  `provincia_id` INT NOT NULL ,
  PRIMARY KEY (`localidad_id`) ,
  INDEX `fk_localidades_provincias1` (`provincia_id` ASC) ,
  CONSTRAINT `fk_localidades_provincias1`
    FOREIGN KEY (`provincia_id` )
    REFERENCES `dbborgest`.`provincias` (`provincia_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `localidad_id` INT NOT NULL ,
  `cliente_observaciones` VARCHAR(255) NULL ,
  PRIMARY KEY (`cliente_id`) ,
  INDEX `fk_clientes_condicioniva1` (`condicioniva_id` ASC) ,
  INDEX `fk_clientes_localidades1` (`localidad_id` ASC) ,
  CONSTRAINT `fk_clientes_condicioniva1`
    FOREIGN KEY (`condicioniva_id` )
    REFERENCES `dbborgest`.`condicioniva` (`condicioniva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_localidades1`
    FOREIGN KEY (`localidad_id` )
    REFERENCES `dbborgest`.`localidades` (`localidad_id` )
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
  `documentoventa_neto21` FLOAT(20,4) NULL ,
  `documentoventa_iva21` FLOAT(20,4) NULL ,
  `documentoventa_neto105` FLOAT(20,4) NULL ,
  `documentoventa_iva105` FLOAT(20,4) NULL ,
  `documentoventa_netonogravado` FLOAT(20,4) NULL ,
  `documentoventa_total` FLOAT(20,4) NULL ,
  `documentoventa_estado` VARCHAR(45) NULL ,
  `documentoventa_pagado` FLOAT(20,4) NULL ,
  `documentoventa_saldo` FLOAT(20,4) NULL ,
  `documentoventa_observacion` VARCHAR(255) NULL ,
  `cliente_id` INT NOT NULL ,
  `personal_id` INT NOT NULL ,
  `tipodocu_id` INT NOT NULL ,
  `documentoventa_condicionventa` INT(3) NULL ,
  `documentoventa_fechavenc` DATE NULL ,
  `documentoventa_listaprecio` INT(3) NULL ,
  `documentoventa_equipo1` VARCHAR(45) NULL ,
  `documentoventa_equipo2` VARCHAR(45) NULL ,
  `documentoventa_formapago` VARCHAR(255) NULL ,
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
  `documentopago_importe` FLOAT(20,4) NULL ,
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
  `politicaprecio_politica1` FLOAT(20,4) NULL ,
  `politicaprecio_politica2` FLOAT(20,4) NULL ,
  `politicaprecio_politica3` FLOAT(20,4) NULL ,
  `politicaprecio_politica4` FLOAT(20,4) NULL ,
  `politicaprecio_obse` VARCHAR(255) NULL ,
  PRIMARY KEY (`politicaprecio_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`proveedores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`proveedores` (
  `proveedor_id` INT NOT NULL ,
  `proveedor_nombre` VARCHAR(100) NULL ,
  `proveedor_domicilio` VARCHAR(150) NULL ,
  `proveedor_documentonro` VARCHAR(45) NULL ,
  `proveedor_documentotipo` VARCHAR(45) NULL ,
  `proveedor_telefono` VARCHAR(45) NULL ,
  `proveedor_celular` VARCHAR(45) NULL ,
  `proveedor_mail` VARCHAR(45) NULL ,
  `condicioniva_id` INT NOT NULL ,
  `proveedor_condicionventa` VARCHAR(45) NULL ,
  `proveedor_tipo` VARCHAR(45) NULL ,
  `localidad_id` INT NOT NULL ,
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
  `producto_preciocosto` FLOAT(20,4) NULL ,
  `producto_precioventabase` FLOAT(20,4) NULL ,
  `producto_estado` VARCHAR(45) NULL ,
  `producto_precioventa1` FLOAT(20,4) NULL ,
  `tipoiva_id` INT NOT NULL ,
  `rubro_id` INT NOT NULL ,
  `producto_precioventa2` FLOAT(20,4) NULL ,
  `producto_precioventa3` FLOAT(20,4) NULL ,
  `producto_precioventa4` FLOAT(20,4) NULL ,
  `calculoprecio_id` INT NOT NULL ,
  `politicaprecio_id` INT NOT NULL ,
  `producto_neto1` FLOAT(20,4) NULL ,
  `producto_neto2` FLOAT(20,4) NULL ,
  `producto_neto3` FLOAT(20,4) NULL ,
  `producto_neto4` FLOAT(20,4) NULL ,
  `proveedor_id` INT NOT NULL ,
  `producto_fechaactualizacionprecio` DATE NULL ,
  `producto_codigoreferencia` VARCHAR(45) NULL ,
  PRIMARY KEY (`producto_id`) ,
  INDEX `fk_productos_tipoiva1` (`tipoiva_id` ASC) ,
  INDEX `fk_productos_rubros1` (`rubro_id` ASC) ,
  INDEX `fk_productos_calculoprecios1` (`calculoprecio_id` ASC) ,
  INDEX `fk_productos_politicasdeprecios1` (`politicaprecio_id` ASC) ,
  INDEX `fk_productos_proveedores1` (`proveedor_id` ASC) ,
  INDEX `producto_codigo` (`producto_codigo` ASC) ,
  INDEX `producto_codigobarras` (`producto_codigobarras` ASC) ,
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_proveedores1`
    FOREIGN KEY (`proveedor_id` )
    REFERENCES `dbborgest`.`proveedores` (`proveedor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`documentoventadetalles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoventadetalles` (
  `documentoventadetalle_id` INT NOT NULL ,
  `documentoventadetalle_descripcion` VARCHAR(150) NULL ,
  `documentoventadetalle_cantidad` FLOAT(20,4) NULL ,
  `documentoventadetalle_precio` FLOAT(20,4) NULL ,
  `documentoventadetalle_total` FLOAT(20,4) NULL ,
  `documentoventadetalle_neto21` FLOAT(20,4) NULL ,
  `documentoventadetalle_iva21` FLOAT(20,4) NULL ,
  `documentoventadetalle_neto105` FLOAT(20,4) NULL ,
  `documentoventadetalle_iva105` FLOAT(20,4) NULL ,
  `documentoventadetalle_nogravado` FLOAT(20,4) NULL ,
  `documentoventadetalle_estado` VARCHAR(45) NULL ,
  `documentoventadetalle_observacion` VARCHAR(255) NULL ,
  `producto_id` INT NOT NULL ,
  `documentoventadetalle_idorig` INT NULL ,
  `documentoventadetalle_cantidadpendiente` FLOAT(20,4) NULL ,
  `documentoventa_id` INT NOT NULL ,
  `documentoventadetalle_importe1` FLOAT(20,4) NULL DEFAULT 0 ,
  `documentoventadetalle_importe2` FLOAT(20,4) NULL DEFAULT 0 ,
  `documentoventadetalle_importe3` FLOAT(20,4) NULL DEFAULT 0 ,
  `documentoventadetalle_importe4` FLOAT(20,4) NULL DEFAULT 0 ,
  `documentoventadetalle_importe5` FLOAT(20,4) NULL DEFAULT 0 ,
  `documentoventadetalle_importe6` FLOAT(20,4) NULL DEFAULT 0 ,
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
  `calculopreciodeta_valor` FLOAT(20,4) NULL ,
  `calculoprecio_id` INT NOT NULL ,
  PRIMARY KEY (`calculopreciodeta_id`) ,
  INDEX `fk_calculopreciodeta_calculoprecios1` (`calculoprecio_id` ASC) ,
  CONSTRAINT `fk_calculopreciodeta_calculoprecios1`
    FOREIGN KEY (`calculoprecio_id` )
    REFERENCES `dbborgest`.`calculoprecios` (`calculoprecio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`documentoventadocus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoventadocus` (
  `documentoventadoc_id` INT NOT NULL ,
  `documentoventadoc_importe` FLOAT(20,4) NULL ,
  `documentoventa_pagado` FLOAT(20,4) NULL ,
  `documentoventa_saldo` FLOAT(20,4) NULL ,
  `documentoventa_estado` VARCHAR(45) NULL ,
  `documentoventa_id` INT NOT NULL ,
  `documentoventa_idpago` INT NOT NULL ,
  PRIMARY KEY (`documentoventadoc_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`tarjetas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`tarjetas` (
  `tarjeta_id` INT NOT NULL ,
  `tarjeta_nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`tarjeta_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`pagotarjeta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`pagotarjeta` (
  `pagotarjeta_id` INT NOT NULL ,
  `pagotarjeta_importe` FLOAT(20,4) NULL ,
  `pagotarjeta_cuotas` FLOAT(20,4) NULL ,
  `pagotarjeta_cupon` VARCHAR(45) NULL ,
  `pagotarjeta_autoriz` VARCHAR(45) NULL ,
  `documentopago_id` INT NOT NULL ,
  `tarjeta_id` INT NOT NULL ,
  PRIMARY KEY (`pagotarjeta_id`) ,
  INDEX `fk_pagotarjeta_documentopagos1` (`documentopago_id` ASC) ,
  INDEX `fk_pagotarjeta_tarjetas1` (`tarjeta_id` ASC) ,
  CONSTRAINT `fk_pagotarjeta_documentopagos1`
    FOREIGN KEY (`documentopago_id` )
    REFERENCES `dbborgest`.`documentopagos` (`documentopago_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagotarjeta_tarjetas1`
    FOREIGN KEY (`tarjeta_id` )
    REFERENCES `dbborgest`.`tarjetas` (`tarjeta_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`depositos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`depositos` (
  `deposito_id` INT NOT NULL ,
  `deposito_nombre` VARCHAR(100) NULL ,
  `deposito_domicilio` VARCHAR(150) NULL ,
  `sucursal_id` INT NOT NULL ,
  PRIMARY KEY (`deposito_id`) ,
  INDEX `fk_depositos_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_depositos_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`productodeposito`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`productodeposito` (
  `producdepo_id` INT NOT NULL AUTO_INCREMENT ,
  `producdepo_stockactual` FLOAT(20,4) NULL ,
  `producto_id` INT NOT NULL ,
  `deposito_id` INT NOT NULL ,
  `producdepo_stockminimo` FLOAT(20,4) NULL ,
  `producdepo_puntorepos` FLOAT(20,4) NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`config`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`config` (
  `config_nombre` VARCHAR(100) NOT NULL ,
  `config_valor` VARCHAR(150) NULL ,
  PRIMARY KEY (`config_nombre`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`temp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`temp` (
  `i` INT NULL ,
  `t` VARCHAR(255) NULL ,
  `m` VARCHAR(400) NULL ,
  `d` FLOAT NULL ,
  `f` DATE NULL )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`conceptos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`conceptos` (
  `concepto_id` INT NOT NULL ,
  `concepto_descripcion` VARCHAR(150) NULL ,
  PRIMARY KEY (`concepto_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`cajaasientos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`cajaasientos` (
  `cajaasiento_id` INT NOT NULL ,
  `cajaasiento_descripcion` VARCHAR(150) NULL ,
  `cajaasiento_tipo` VARCHAR(45) NULL ,
  `cajaasiento_fecha` DATE NULL ,
  `cajaasiento_importe` FLOAT(20,2) NULL ,
  `concepto_id` INT NOT NULL ,
  PRIMARY KEY (`cajaasiento_id`) ,
  INDEX `fk_cajaasientos_conceptos1` (`concepto_id` ASC) ,
  CONSTRAINT `fk_cajaasientos_conceptos1`
    FOREIGN KEY (`concepto_id` )
    REFERENCES `dbborgest`.`conceptos` (`concepto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`calculopreciodetaprod`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`calculopreciodetaprod` (
  `calculopreciodetaprod_id` INT NOT NULL ,
  `calculopreciodetaprod_descripcion` VARCHAR(45) NULL ,
  `calculopreciodetaprod_orden` INT(3) NULL ,
  `calculopreciodetaprod_tipo` VARCHAR(15) NULL ,
  `calculopreciodetaprod_valor` FLOAT(20,2) NULL ,
  `producto_id` INT NOT NULL ,
  PRIMARY KEY (`calculopreciodetaprod_id`) ,
  INDEX `fk_calculopreciodetaprod_productos1` (`producto_id` ASC) ,
  CONSTRAINT `fk_calculopreciodetaprod_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `dbborgest`.`productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`menu`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`menu` (
  `menu_id` INT NOT NULL ,
  `menu_path` VARCHAR(255) NULL ,
  `menu_tipo` INT(3) NULL ,
  `menu_nomb` VARCHAR(255) NULL ,
  `menu_form` VARCHAR(255) NULL ,
  `menu_enabled` INT(3) NULL ,
  `menu_visible` INT(3) NULL ,
  PRIMARY KEY (`menu_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`equipos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`equipos` (
  `equipo_id` INT NOT NULL ,
  `equipo_tipo` VARCHAR(45) NULL ,
  `equipo_numero` VARCHAR(45) NULL ,
  `equipo_observaciones` VARCHAR(255) NULL ,
  `sucursal_id` INT NOT NULL ,
  PRIMARY KEY (`equipo_id`) ,
  INDEX `fk_equipos_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_equipos_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `dbborgest`.`sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`perfiles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`perfiles` (
  `perfil_id` INT NOT NULL ,
  `perfil_nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`perfil_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbborgest`.`menuperfil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `dbborgest`.`menuperfil` (
  `menuperfil_id` INT NOT NULL ,
  `menuperfil_habilitado` INT(3) NULL ,
  `menuperfil_agregar` INT(3) NULL ,
  `menuperfil_eliminar` INT(3) NULL ,
  `menuperfil_modificar` INT(3) NULL ,
  `menuperfil_anular` INT(3) NULL ,
  `menuperfil_imprimir` INT(3) NULL ,
  `menuperfil_ver` INT(3) NULL ,
  `menu_id` INT NOT NULL ,
  `perfil_id` INT NOT NULL ,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- procedure actualizarsaldoventa
-- -----------------------------------------------------

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
-- -----------------------------------------------------
-- procedure actualizarstockproductos
-- -----------------------------------------------------

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
