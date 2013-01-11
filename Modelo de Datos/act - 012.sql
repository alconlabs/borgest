SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`tiposdocumento` ADD COLUMN `tipodocu_debcred` VARCHAR(45) NULL DEFAULT NULL  AFTER `tipodocu_letra` , ADD COLUMN `tipodocufiscal_id` INT(11) NOT NULL  AFTER `tipodocu_fiscal` , ADD COLUMN `tipodocu_preimpresos` INT(11) NULL DEFAULT NULL  AFTER `tipodocufiscal_id` , ADD COLUMN `tipodocu_impresora` VARCHAR(200) NULL DEFAULT NULL  AFTER `tipodocu_preimpresos` , ADD COLUMN `tipodocu_copias` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_impresora` , ADD COLUMN `tipodocu_preview` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_copias` , ADD COLUMN `tipodocu_prompt` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_preview` , CHANGE COLUMN `tipodocu_id` `tipodocu_id` INT(11) NOT NULL  FIRST , 
  ADD CONSTRAINT `fk_tiposdocumento_tipodocumentofiscal1`
  FOREIGN KEY (`tipodocufiscal_id` )
  REFERENCES `dbborgest`.`tipodocumentofiscal` (`tipodocufiscal_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_tiposdocumento_tipodocumentofiscal1` (`tipodocufiscal_id` ASC) ;

ALTER TABLE `dbborgest`.`sucursales` CHANGE COLUMN `sucursal_nombre` `sucursal_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `sucursal_domicilio` `sucursal_domicilio` VARCHAR(150) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`empresas` ADD COLUMN `empresa_tipo` VARCHAR(45) NULL DEFAULT NULL  AFTER `empresa_cuit` , CHANGE COLUMN `empresa_nombre` `empresa_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `empresa_domicilio` `empresa_domicilio` VARCHAR(150) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`documentosventas` ADD COLUMN `documentoventa_condicionventa` INT(3) NULL DEFAULT NULL  AFTER `tipodocu_id` , ADD COLUMN `documentoventa_fechavenc` DATE NULL DEFAULT NULL  AFTER `documentoventa_condicionventa` , ADD COLUMN `documentoventa_listaprecio` INT(3) NULL DEFAULT NULL  AFTER `documentoventa_fechavenc` , CHANGE COLUMN `documentoventa_neto21` `documentoventa_neto21` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_iva21` `documentoventa_iva21` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_neto105` `documentoventa_neto105` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_iva105` `documentoventa_iva105` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_netonogravado` `documentoventa_netonogravado` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_total` `documentoventa_total` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_pagado` `documentoventa_pagado` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventa_saldo` `documentoventa_saldo` FLOAT(20,4) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`clientes` ADD COLUMN `condicioniva_id` INT(11) NOT NULL  AFTER `cliente_mail` , ADD COLUMN `cliente_listaprecio` INT(3) NULL DEFAULT NULL  AFTER `condicioniva_id` , ADD COLUMN `cliente_condicionventa` VARCHAR(45) NULL DEFAULT NULL  AFTER `cliente_listaprecio` , ADD COLUMN `localidad_id` INT(11) NOT NULL  AFTER `cliente_condicionventa` , ADD COLUMN `cliente_observaciones` VARCHAR(255) NULL DEFAULT NULL  AFTER `localidad_id` , CHANGE COLUMN `cliente_nombre` `cliente_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `cliente_domicilio` `cliente_domicilio` VARCHAR(150) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `fk_clientes_condicioniva1`
  FOREIGN KEY (`condicioniva_id` )
  REFERENCES `dbborgest`.`condicioniva` (`condicioniva_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_clientes_localidades1`
  FOREIGN KEY (`localidad_id` )
  REFERENCES `dbborgest`.`localidades` (`localidad_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_clientes_condicioniva1` (`condicioniva_id` ASC) 
, ADD INDEX `fk_clientes_localidades1` (`localidad_id` ASC) ;

ALTER TABLE `dbborgest`.`personal` CHANGE COLUMN `personal_nombre` `personal_nombre` VARCHAR(100) NULL DEFAULT NULL  , CHANGE COLUMN `personal_domicilio` `personal_domicilio` VARCHAR(150) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`documentopagos` CHANGE COLUMN `documentopago_importe` `documentopago_importe` FLOAT(20,4) NULL DEFAULT NULL  ;

ALTER TABLE `dbborgest`.`productos` DROP COLUMN `producto_precioventa` , ADD COLUMN `producto_precioventabase` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_preciocosto` , ADD COLUMN `producto_precioventa1` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_estado` , ADD COLUMN `producto_precioventa2` FLOAT(20,4) NULL DEFAULT NULL  AFTER `rubro_id` , ADD COLUMN `producto_precioventa3` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_precioventa2` , ADD COLUMN `producto_precioventa4` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_precioventa3` , ADD COLUMN `calculoprecio_id` INT(11) NOT NULL  AFTER `producto_precioventa4` , ADD COLUMN `politicaprecio_id` INT(11) NOT NULL  AFTER `calculoprecio_id` , ADD COLUMN `producto_neto1` FLOAT(20,4) NULL DEFAULT NULL  AFTER `politicaprecio_id` , ADD COLUMN `producto_neto2` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_neto1` , ADD COLUMN `producto_neto3` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_neto2` , ADD COLUMN `producto_neto4` FLOAT(20,4) NULL DEFAULT NULL  AFTER `producto_neto3` , ADD COLUMN `proveedor_id` INT(11) NOT NULL  AFTER `producto_neto4` , ADD COLUMN `producto_fechaactualizacionprecio` DATE NULL DEFAULT NULL  AFTER `proveedor_id` , CHANGE COLUMN `producto_nombre` `producto_nombre` VARCHAR(150) NULL DEFAULT NULL  , CHANGE COLUMN `producto_preciocosto` `producto_preciocosto` FLOAT(20,4) NULL DEFAULT NULL  , 
  ADD CONSTRAINT `fk_productos_calculoprecios1`
  FOREIGN KEY (`calculoprecio_id` )
  REFERENCES `dbborgest`.`calculoprecios` (`calculoprecio_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_productos_politicasdeprecios1`
  FOREIGN KEY (`politicaprecio_id` )
  REFERENCES `dbborgest`.`politicasdeprecios` (`politicaprecio_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_productos_proveedores1`
  FOREIGN KEY (`proveedor_id` )
  REFERENCES `dbborgest`.`proveedores` (`proveedor_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_productos_calculoprecios1` (`calculoprecio_id` ASC) 
, ADD INDEX `fk_productos_politicasdeprecios1` (`politicaprecio_id` ASC) 
, ADD INDEX `fk_productos_proveedores1` (`proveedor_id` ASC) 
, ADD INDEX `producto_codigo` (`producto_codigo` ASC) 
, ADD INDEX `producto_codigobarras` (`producto_codigobarras` ASC) ;

ALTER TABLE `dbborgest`.`documentoventadetalles` ADD COLUMN `documentoventa_id` INT(11) NOT NULL  AFTER `documentoventadetalle_cantidadpendiente` , CHANGE COLUMN `documentoventadetalle_descripcion` `documentoventadetalle_descripcion` VARCHAR(150) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_cantidad` `documentoventadetalle_cantidad` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_precio` `documentoventadetalle_precio` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_total` `documentoventadetalle_total` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_neto21` `documentoventadetalle_neto21` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_iva21` `documentoventadetalle_iva21` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_neto105` `documentoventadetalle_neto105` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_iva105` `documentoventadetalle_iva105` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_nogravado` `documentoventadetalle_nogravado` FLOAT(20,4) NULL DEFAULT NULL  , CHANGE COLUMN `documentoventadetalle_cantidadpendiente` `documentoventadetalle_cantidadpendiente` FLOAT(20,4) NULL DEFAULT NULL  , 
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
  `calculopreciodeta_valor` FLOAT(20,4) NULL DEFAULT NULL ,
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
  `politicaprecio_politica1` FLOAT(20,4) NULL DEFAULT NULL ,
  `politicaprecio_politica2` FLOAT(20,4) NULL DEFAULT NULL ,
  `politicaprecio_politica3` FLOAT(20,4) NULL DEFAULT NULL ,
  `politicaprecio_politica4` FLOAT(20,4) NULL DEFAULT NULL ,
  `politicaprecio_obse` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`politicaprecio_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoventadocus` (
  `documentoventadoc_id` INT(11) NOT NULL ,
  `documentoventadoc_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentoventa_pagado` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentoventa_saldo` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentoventa_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentoventa_id` INT(11) NOT NULL ,
  `documentoventa_idpago` INT(11) NOT NULL ,
  PRIMARY KEY (`documentoventadoc_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`pagotarjeta` (
  `pagotarjeta_id` INT(11) NOT NULL ,
  `pagotarjeta_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `pagotarjeta_cuotas` FLOAT(20,4) NULL DEFAULT NULL ,
  `pagotarjeta_cupon` VARCHAR(45) NULL DEFAULT NULL ,
  `pagotarjeta_autoriz` VARCHAR(45) NULL DEFAULT NULL ,
  `documentopago_id` INT(11) NOT NULL ,
  `tarjeta_id` INT(11) NOT NULL ,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`tarjetas` (
  `tarjeta_id` INT(11) NOT NULL ,
  `tarjeta_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tarjeta_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

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
  `config_nombre` VARCHAR(100) NOT NULL ,
  `config_valor` VARCHAR(150) NULL DEFAULT NULL ,
  PRIMARY KEY (`config_nombre`) )
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

CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipodocumentofiscal` (
  `tipodocufiscal_id` INT(11) NOT NULL ,
  `tipodocufiscal_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`tipodocufiscal_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

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

CREATE  TABLE IF NOT EXISTS `dbborgest`.`calculopreciodetaprod` (
  `calculopreciodetaprod_id` INT(11) NOT NULL ,
  `calculopreciodetaprod_descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  `calculopreciodetaprod_orden` INT(3) NULL DEFAULT NULL ,
  `calculopreciodetaprod_tipo` VARCHAR(15) NULL DEFAULT NULL ,
  `calculopreciodetaprod_valor` FLOAT(20,2) NULL DEFAULT NULL ,
  `producto_id` INT(11) NOT NULL ,
  PRIMARY KEY (`calculopreciodetaprod_id`) ,
  INDEX `fk_calculopreciodetaprod_productos1` (`producto_id` ASC) ,
  CONSTRAINT `fk_calculopreciodetaprod_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `dbborgest`.`productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


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
