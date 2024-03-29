04;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_preimpresos` INT(11) NULL DEFAULT NULL  AFTER `tipodocufiscal_id` , ADD COLUMN `tipodocu_impresora` VARCHAR(200) NULL DEFAULT NULL  AFTER `tipodocu_preimpresos` , ADD COLUMN `tipodocu_copias` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_impresora` , ADD COLUMN `tipodocu_preview` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_copias` , ADD COLUMN `tipodocu_prompt` INT(11) NULL DEFAULT NULL  AFTER `tipodocu_preview` , CHANGE COLUMN `tipodocu_fiscal` `tipodocu_fiscal` INT(3) NULL DEFAULT NULL  AFTER `tipodocu_iva` ;
5;
CREATE  TABLE IF NOT EXISTS `cajaasientos` (
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
    REFERENCES `conceptos` (`concepto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
6;
CREATE  TABLE IF NOT EXISTS `conceptos` (
  `concepto_id` INT(11) NOT NULL ,
  `concepto_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  PRIMARY KEY (`concepto_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
7;
CREATE  TABLE IF NOT EXISTS `calculopreciodetaprod` (
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
    REFERENCES `productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
8;
ALTER TABLE `clientes` ADD COLUMN `cliente_observaciones` VARCHAR(255) NULL DEFAULT NULL  AFTER `localidad_id` ;
9;
ALTER TABLE `productos` ADD COLUMN `producto_codigoreferencia` VARCHAR(45) NULL DEFAULT NULL  AFTER `producto_fechaactualizacionprecio`;
10;
ALTER TABLE `productos` CHANGE COLUMN `producto_codigoreferencia` `producto_codigoreferencia` varchar(45) NULL DEFAULT '';
11;
CREATE  TABLE IF NOT EXISTS `menu` (
  `menu_id` INT(11) NOT NULL ,
  `menu_path` VARCHAR(255) NULL DEFAULT NULL ,
  `menu_tipo` INT(3) NULL DEFAULT NULL ,
  `menu_nomb` VARCHAR(255) NULL DEFAULT NULL ,
  `menu_form` VARCHAR(255) NULL DEFAULT NULL ,
  `menu_enabled` INT(3) NULL DEFAULT NULL ,
  `menu_visible` INT(3) NULL DEFAULT NULL ,
  PRIMARY KEY (`menu_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
12;
DELETE FROM menu;
13;
INSERT INTO menu VALUES (39,'>Archivo',NULL,'AdvPageArchivo',NULL,-1,-1);
14;
INSERT INTO menu VALUES (2,'>Archivo>General',NULL,'AdvToolBarGeneral',NULL,-1,-1);
15;
INSERT INTO menu VALUES (3,'>Archivo>General>Vendedores',NULL,'btnpersonal',NULL,-1,-1);
16;
INSERT INTO menu VALUES (4,'>Archivo>General>Servicios',NULL,'btnservicios',NULL,-1,-1);
17;
INSERT INTO menu VALUES (5,'>Archivo>General>Productos',NULL,'btnproductos',NULL,-1,-1);
18;
INSERT INTO menu VALUES (6,'>Archivo>General>Calculo Precios',NULL,'btncalculoprecios',NULL,-1,-1);
19;
INSERT INTO menu VALUES (7,'>Archivo>General>Politicas de Precios',NULL,'btnpoliticaprecio',NULL,-1,-1);
20;
INSERT INTO menu VALUES (8,'>Archivo>General>Clientes',NULL,'btnclientes',NULL,-1,-1);
21;
INSERT INTO menu VALUES (9,'>Archivo>Proveedores',NULL,'AdvToolBarProveedores',NULL,-1,-1);
22;
INSERT INTO menu VALUES (10,'>Archivo>Proveedores>Proveedores',NULL,'btnproveedores',NULL,-1,-1);
23;
INSERT INTO menu VALUES (11,'>Archivo>Localidades',NULL,'AdvToolBarLocalidades',NULL,-1,-1);
24;
INSERT INTO menu VALUES (12,'>Archivo>Localidades>Localidades',NULL,'btnlocalidades',NULL,-1,-1);
25;
INSERT INTO menu VALUES (13,'>Archivo>Empresa',NULL,'AdvToolBarEmpresa',NULL,-1,-1);
26;
INSERT INTO menu VALUES (14,'>Archivo>Empresa>Empresa',NULL,'btnempresa',NULL,-1,-1);
27;
INSERT INTO menu VALUES (15,'>Compras',NULL,'AdvPageCompras',NULL,-1,-1);
28;
INSERT INTO menu VALUES (16,'>Compras>Documentos',NULL,'AdvToolBarDocCompras',NULL,-1,-1);
29;
INSERT INTO menu VALUES (17,'>Compras>Documentos>Facturas de Compra',NULL,'btnfacturascompras',NULL,-1,-1);
30;
INSERT INTO menu VALUES (18,'>Compras>Documentos>Ordenes de Pago',NULL,'btnordenespago',NULL,-1,-1);
31;
INSERT INTO menu VALUES (19,'>Compras>Documentos>Estado de Ctas.',NULL,'EstadoCtasCompras',NULL,-1,-1);
32;
INSERT INTO menu VALUES (20,'>Compras>Documentos>Informes',NULL,'btninformescompras',NULL,-1,-1);
33;
INSERT INTO menu VALUES (21,'>Ventas',NULL,'AdvPageVentas',NULL,-1,-1);
34;
INSERT INTO menu VALUES (22,'>Ventas>Documentos',NULL,'AdvToolBarDocVentas',NULL,-1,-1);
35;
INSERT INTO menu VALUES (23,'>Ventas>Documentos>Cotratacion',NULL,'btncontratacion',NULL,-1,-1);
36;
INSERT INTO menu VALUES (24,'>Ventas>Documentos>Facturas de Ventas',NULL,'btnfacturasventas',NULL,-1,-1);
37;
INSERT INTO menu VALUES (25,'>Ventas>Documentos>Venta Rapida',NULL,'btnventasrapidas',NULL,-1,-1);
38;
INSERT INTO menu VALUES (26,'>Ventas>Documentos>Recibos de Venta',NULL,'btnrecibodeventa',NULL,-1,-1);
39;
INSERT INTO menu VALUES (27,'>Ventas>Documentos>Notas de Credito',NULL,'btnnotasdecredito',NULL,-1,-1);
40;
INSERT INTO menu VALUES (28,'>Ventas>Documentos>Impresora Fiscal',NULL,'btnimpresorafiscal',NULL,-1,-1);
41;
INSERT INTO menu VALUES (29,'>Ventas>Cuenta Corriente',NULL,'AdvToolBarCtasCtesVentas',NULL,-1,-1);
42;
INSERT INTO menu VALUES (30,'>Ventas>Cuenta Corriente>Estado de Ctas.',NULL,'tbnestadoctasventas',NULL,-1,-1);
43;
INSERT INTO menu VALUES (31,'>Ventas>Cuenta Corriente>Detalle de Ctas.',NULL,'btndetallectasventas',NULL,-1,-1);
44;
INSERT INTO menu VALUES (32,'>Ventas>Caja',NULL,'AdvToolBarCaja',NULL,-1,-1);
45;
INSERT INTO menu VALUES (33,'>Ventas>Caja>Estado Caja',NULL,'btnestadocaja',NULL,-1,-1);
46;
INSERT INTO menu VALUES (34,'>Ventas>Caja>Caja',NULL,'btncaja',NULL,-1,-1);
47;
INSERT INTO menu VALUES (35,'>Herramientas',NULL,'AdvPageHerramientas',NULL,-1,-1);
48;
INSERT INTO menu VALUES (36,'>Herramientas>Herramientas',NULL,'AdvToolBarHerramientas',NULL,-1,-1);
49;
INSERT INTO menu VALUES (37,'>Herramientas>Herramientas>Configuracion',NULL,'btnconfiguracion',NULL,-1,-1);
50;
INSERT INTO menu VALUES (38,'>Herramientas>Herramientas>Actualizar Productos',NULL,'btnimportacion',NULL,-1,-1);
51;
ALTER TABLE `documentosventas` 
ADD COLUMN `documentoventa_equipo1` VARCHAR(45) NULL DEFAULT ""  AFTER `documentoventa_listaprecio` , 
ADD COLUMN `documentoventa_equipo2` VARCHAR(45) NULL DEFAULT ""  AFTER `documentoventa_equipo1` , 
ADD COLUMN `documentoventa_formapago` VARCHAR(255) NULL DEFAULT ""  AFTER `documentoventa_equipo2` ;
52;
ALTER TABLE `documentoventadetalles` 
ADD COLUMN `documentoventadetalle_importe1` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventa_id` , 
ADD COLUMN `documentoventadetalle_importe2` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe1` , 
ADD COLUMN `documentoventadetalle_importe3` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe2` , 
ADD COLUMN `documentoventadetalle_importe4` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe3` , 
ADD COLUMN `documentoventadetalle_importe5` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe4` , 
ADD COLUMN `documentoventadetalle_importe6` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe5`;
53;
INSERT INTO menu VALUES (40,'>Ventas>Documentos>Nota de Pedido',NULL,'btnnotapedido',NULL,0,0);
54;
INSERT INTO menu VALUES (41,'>Ventas>Documentos>Equipos',NULL,'btnconsultaequipos',NULL,0,0);
55;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_ctacte` INT(3) NULL DEFAULT -1 AFTER `tipodocu_prompt`;
56;
Insert into menu values (42, '>Archivo>Empresa>Sucursales', NULL, 'btnsucursales', NULL, 0, 0);
57;
Insert into menu values (43, '>Archivo>Empresa>Puntos de Venta', NULL, 'btnpuntosdeventa', NULL, 0, 0);
58;
Replace config set config_valor='http://www.borgest.com.ar/updates/', config_nombre='LINKARCHIVOS';
59;
ALTER TABLE `puntodeventa` 
ADD COLUMN `puntoventa_controladorfiscalmodelo` INT(3) NULL DEFAULT -1  AFTER `sucursal_id` , 
ADD COLUMN `puntoventa_controladorfiscalpuerto` INT(3) NULL DEFAULT -1  AFTER `puntoventa_controladorfiscalmodelo` ;
60;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_archivoimpresion` VARCHAR(100) NULL DEFAULT NULL  AFTER `tipodocu_ctacte` ;
61;
Insert into menu values (44, '>Archivo>Empresa>Tipos de Documentos', NULL, 'btntiposdocumentos', NULL, 0, 0);
62;
Replace config set config_valor='Precio1', config_nombre='NOMBREPRECIO1';
63;
Replace config set config_valor='Precio2', config_nombre='NOMBREPRECIO2';
64;
Replace config set config_valor='Precio3', config_nombre='NOMBREPRECIO3';
65;
Replace config set config_valor='Precio4', config_nombre='NOMBREPRECIO4';
66;
CREATE  TABLE IF NOT EXISTS `equipos` (
  `equipo_id` INT(11) NOT NULL ,
  `equipo_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `equipo_numero` VARCHAR(45) NULL DEFAULT NULL ,
  `equipo_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`equipo_id`) ,
  INDEX `fk_equipos_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_equipos_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
67;
CREATE  TABLE IF NOT EXISTS `perfiles` (
  `perfil_id` INT(11) NOT NULL ,
  `perfil_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`perfil_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
68;
CREATE  TABLE IF NOT EXISTS `menuperfil` (
  `menuperfil_id` INT(11) NOT NULL AUTO_INCREMENT ,
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
    REFERENCES `menu` (`menu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_menuperfil_perfiles1`
    FOREIGN KEY (`perfil_id` )
    REFERENCES `perfiles` (`perfil_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
69;
insert into perfiles (perfil_id, perfil_nombre) values ('1','ADMINISTRADOR');
70;
insert into menuperfil select 0, -1, -1, -1, -1, -1, -1, -1, menu_id, 1 from menu;
71;
UPDATE menu SET menu_form='personal' WHERE menu_id=3;
72;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_leyenda` VARCHAR(200) NULL DEFAULT NULL  AFTER `tipodocu_archivoimpresion`;
73;
ALTER TABLE `documentosventas` ADD COLUMN `documentoventa_nrodetallepago` VARCHAR(45) NULL DEFAULT NULL  AFTER `documentoventa_formapago`;
74;
CREATE  TABLE IF NOT EXISTS `documentoscompras` (
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
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentoscompras_proveedores1`
    FOREIGN KEY (`proveedor_id` )
    REFERENCES `proveedores` (`proveedor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentoscompras_tiposdocumento1`
    FOREIGN KEY (`tipodocu_id` )
    REFERENCES `tiposdocumento` (`tipodocu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
75;
CREATE  TABLE IF NOT EXISTS `documentocompradetalles` (
  `documentocompradetalle_id` INT(11) NOT NULL ,
  `documentocompradetalle_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  `documentocompradetalle_cantidad` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompradetalle_precio` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompradetalle_total` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompradetalle_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentocompradetalle_observacion` VARCHAR(255) NULL DEFAULT NULL ,
  `documentocompradetalle_idorig` INT(11) NULL DEFAULT NULL ,
  `documentocompradetalle_cantidadpendiente` FLOAT(20,4) NULL DEFAULT NULL ,
  PRIMARY KEY (`documentocompradetalle_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
76;
ALTER TABLE `documentocompradetalles` ADD COLUMN `producto_id` INT(11) NOT NULL  AFTER `documentocompradetalle_cantidadpendiente` , 
  ADD CONSTRAINT `fk_documentocompradetalles_productos1`
  FOREIGN KEY (`producto_id` )
  REFERENCES `productos` (`producto_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_documentocompradetalles_productos1` (`producto_id` ASC) ;
77;
ALTER TABLE `documentocompradetalles` ADD COLUMN `documentocompra_id` INT(11) NOT NULL  AFTER `producto_id` , 
  ADD CONSTRAINT `fk_documentocompradetalles_documentoscompras1`
  FOREIGN KEY (`documentocompra_id` )
  REFERENCES `documentoscompras` (`documentocompra_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_documentocompradetalles_documentoscompras1` (`documentocompra_id` ASC) ;
78;
ALTER TABLE `documentoscompras` ADD COLUMN `documentocompra_neto21` FLOAT(20,4) NULL DEFAULT NULL  AFTER `tipodocu_id` , 
ADD COLUMN `documentocompra_iva21` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompra_neto21` , 
ADD COLUMN `documentocompra_neto105` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompra_iva21` , 
ADD COLUMN `documentocompra_iva105` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompra_neto105` , 
ADD COLUMN `documentocompra_otrosimpuestos` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompra_iva105` ;
79;
CREATE  TABLE IF NOT EXISTS `clientevehiculo` (
  `clientevehiculo_id` INT(11) NOT NULL ,
  `clientevehiculo_fechaventa` DATE NULL DEFAULT NULL ,
  `clientevehiculo_modelo` VARCHAR(45) NULL DEFAULT NULL ,
  `clientevehiculo_marca` VARCHAR(45) NULL DEFAULT NULL ,
  `clientevehiculo_nrochasis` VARCHAR(45) NULL DEFAULT NULL ,
  `clientevehiculo_nromotor` VARCHAR(45) NULL DEFAULT NULL ,
  `cliente_id` INT(11) NOT NULL ,
  `clientevehiculo_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`clientevehiculo_id`) ,
  INDEX `fk_clientevehiculo_clientes1` (`cliente_id` ASC) ,
  CONSTRAINT `fk_clientevehiculo_clientes1`
    FOREIGN KEY (`cliente_id` )
    REFERENCES `clientes` (`cliente_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
80;
ALTER TABLE `documentosventas` 
ADD COLUMN `documentoventa_solicitudcliente` VARCHAR(255) NULL DEFAULT ''  AFTER `documentoventa_nrodetallepago` , 
ADD COLUMN `documentoventa_trabajorealizado` VARCHAR(255) NULL DEFAULT ''  AFTER `documentoventa_solicitudcliente`;
81;
ALTER TABLE `condicioniva` ADD COLUMN `condicioniva_idfiscal` INT(11) NULL DEFAULT 0  AFTER `condicioniva_nombre` ;
82;
UPDATE `condicioniva` SET `condicioniva_idfiscal`=77 WHERE `condicioniva_id`=1;
83;
UPDATE `condicioniva` SET `condicioniva_idfiscal`=73 WHERE `condicioniva_id`=2;
84;
UPDATE `condicioniva` SET `condicioniva_idfiscal`=67 WHERE `condicioniva_id`=3;
85;
INSERT INTO `condicioniva` SET `condicioniva_id`=4,`condicioniva_nombre`='Exento',`condicioniva_idfiscal`=69;
86;
Replace `config` set `config_valor`='0', `config_nombre`='LOGDB';
87;
ALTER TABLE `productos` ADD COLUMN `producto_imprimir` INT(3) NULL DEFAULT 0  AFTER `producto_codigoreferencia`;
88;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('45', '>Archivo>Listados', '0', 'AdvToolBarListados', '', '0', '0');
89;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,45,perfil_id from perfiles;
90;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('46', '>Archivo>Listados>Lista de Precios', '0', 'btnlistaprecios', '', '0', '0');
91;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,46,perfil_id from perfiles;
92;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('47', '>Ventas>Documentos>Orden de Servicio', '0', 'btnordenservicio', '', '0', '0');
93;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,47,perfil_id from perfiles;
94;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('48', '>Ventas>Informes', '0', 'AdvToolBarInformes', '', '0', '0');
95;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,48,perfil_id from perfiles;
96;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('49', '>Ventas>Informes>Informes', '0', 'btninformesventas', '', '0', '0');
97;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,49,perfil_id from perfiles;
98;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('50', '>Herramientas>Seguridad', '0', 'AdvToolBarSeguridad', '', '0', '0');
99;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,50,perfil_id from perfiles;
100;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('51', '>Herramientas>Seguridad>Perfiles de Seguridad', '0', 'btnperfiles', '', '0', '0');
101;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,51,perfil_id from perfiles;
102;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('52', '>Ventas>Cuenta Corriente>Saldos', '0', 'btnsaldos', '', '0', '0');
103;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,52,perfil_id from perfiles;
104;
ALTER TABLE `documentoscompras` ADD COLUMN `documentocompra_puntoventa` INT(3) NULL DEFAULT NULL  AFTER `documentocompra_otrosimpuestos` ;
105;
ALTER TABLE `documentocompradetalles` 
ADD COLUMN `documentocompradetalle_neto21` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompra_id` , 
ADD COLUMN `documentocompradetalle_neto105` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompradetalle_neto21` , 
ADD COLUMN `documentocompradetalle_iva21` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompradetalle_neto105` , 
ADD COLUMN `documentocompradetalle_iva105` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documentocompradetalle_iva21`;
106;
ALTER TABLE `empresas` ADD COLUMN `empresa_where` VARCHAR(45) NULL DEFAULT NULL  AFTER `empresa_tipo` ;
107;
UPDATE `empresas` SET `empresa_where`='1000';
108;
Replace config set config_valor='producto_id', config_nombre='CODIGOPRODUCTOBUSQUEDA1';
109;
Replace config set config_valor='producto_codigo', config_nombre='CODIGOPRODUCTOBUSQUEDA2';
110;
Replace config set config_valor='', config_nombre='CODIGOPRODUCTOBUSQUEDA3';
111;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('53', '>Ventas>Informes>Detalle de Pagos', '0', '', 'btndetallepagos', '0', '0');
112;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,53,perfil_id from perfiles;
113;
ALTER TABLE `documentoventadetalles` 
ADD COLUMN `documentoventadetalle_listaprecio` INT(3) NULL DEFAULT -1  AFTER `documentoventadetalle_importe6`;
114;
ALTER TABLE `clientes` ADD COLUMN `personal_id` INT(11) NOT NULL DEFAULT 1  AFTER `cliente_observaciones` , 
  ADD CONSTRAINT `fk_clientes_personal1`
  FOREIGN KEY (`personal_id` )
  REFERENCES `personal` (`personal_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_clientes_personal1` (`personal_id` ASC) ;
115;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('54', '>Ventas>Informes>Libro IVA Ventas', '0', 'btnlibroivaventas', '', '0', '0');
116;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,54,perfil_id from perfiles;
117;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_nombreabrev` VARCHAR(5) NULL DEFAULT NULL  AFTER `tipodocu_leyenda`;
118;
UPDATE `tiposdocumento` SET `tipodocu_nombreabrev`='FA' WHERE `tipodocu_nombre`='Factura de Venta';
119;
UPDATE `tiposdocumento` SET `tipodocu_nombreabrev`='NC' WHERE `tipodocu_nombre`='Nota de Credito de Venta';
120;
UPDATE `tiposdocumento` SET `tipodocu_nombreabrev`='ND' WHERE `tipodocu_nombre`='Nota de Debito de Venta';
121;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('55', '>Ventas>Caja>Caja Bar', '0', 'btncajabar', '', '0', '0');
122;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,55,perfil_id from perfiles;
123;
CREATE  TABLE IF NOT EXISTS `cajas` (
  `caja_id` INT(11) NOT NULL ,
  `caja_fecha` DATE NULL DEFAULT NULL ,
  `caja_hora` TIME NULL DEFAULT NULL ,
  `caja_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `caja_saldoinicial` FLOAT(20,2) NULL DEFAULT NULL ,
  `caja_saldofinal` FLOAT(20,2) NULL DEFAULT NULL ,
  `personal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`caja_id`) ,
  INDEX `fk_cajas_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_cajas_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
124;
ALTER TABLE `cajaasientos` ADD COLUMN `caja_id` INT(11) NOT NULL  AFTER `concepto_id` , 
  ADD CONSTRAINT `fk_cajaasientos_cajas1`
  FOREIGN KEY (`caja_id` )
  REFERENCES `cajas` (`caja_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_cajaasientos_cajas1` (`caja_id` ASC) ;
125;
ALTER TABLE `documentosventas` ADD COLUMN `caja_id` INT(11) NULL DEFAULT 0  AFTER `documentoventa_trabajorealizado`;
126;
ALTER TABLE `personal` 
ADD COLUMN `personal_usuario` VARCHAR(45) NULL DEFAULT NULL  AFTER `personal_mail` , 
ADD COLUMN `personal_pass` VARCHAR(45) NULL DEFAULT NULL  AFTER `personal_usuario` ;
127;
UPDATE `personal` SET `personal_usuario`=`personal_id`,`personal_pass`='z3y2x1w';
128;
ALTER TABLE `productodeposito` ADD COLUMN `producdepo_stockinicial` FLOAT(20,4) NULL DEFAULT 0  AFTER `producdepo_puntorepos`;
129;
ALTER TABLE `documentoscompras` 
ADD COLUMN `documentocompra_neto27` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_puntoventa` , 
ADD COLUMN `documentocompra_iva27` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_neto27` , 
ADD COLUMN `documentocompra_nogravado` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_iva27` , 
ADD COLUMN `documentocompra_tishhperc` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_nogravado` , 
ADD COLUMN `documentocompra_ivaret` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_tishhperc` , 
ADD COLUMN `documentocompra_ivaperc` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_ivaret` , 
ADD COLUMN `documentocompra_dgrret` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_ivaperc` , 
ADD COLUMN `documentocompra_dgrperc` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentocompra_dgrret` ;
130;
UPDATE `menu` SET `menu_path`='>Compras>Informes>Informes' WHERE `menu_id`=20;
131;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('56', '>Compras>Informes', '0', 'AdvToolBarInformesCompras', '', '0', '0');
132;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,56,perfil_id from perfiles;
133;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('57', '>Compras>Informes>Libro IVA Compras', '0', 'btninformescompras', '', '0', '0');
134;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,57,perfil_id from perfiles;
135;
UPDATE `tiposdocumento` SET `tipodocu_nombreabrev`='FA' WHERE `tipodocu_nombre`='Factura de Compra';
136;
UPDATE `tiposdocumento` SET `tipodocu_nombreabrev`='NC' WHERE `tipodocu_nombre`='Nota de Credito de Compra';
137;
UPDATE `tiposdocumento` SET `tipodocu_nombreabrev`='ND' WHERE `tipodocu_nombre`='Nota de Debito de Compra';
138;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_manual` INT(3) NULL DEFAULT NULL  AFTER `tipodocu_nombreabrev` ;
139;
update tiposdocumento set tipodocu_manual=if(tipodocu_preimpresos=0 and tipodocu_fiscal=0,-1,0);
140;
ALTER TABLE `clientes` ADD COLUMN `cliente_diasvenc` INT(3) NULL DEFAULT 15  AFTER `personal_id`;
141;
ALTER TABLE `personal` ADD COLUMN `perfil_id` INT(11) NOT NULL DEFAULT 1 AFTER `personal_pass` , 
  ADD CONSTRAINT `fk_personal_perfiles1`
  FOREIGN KEY (`perfil_id` )
  REFERENCES `perfiles` (`perfil_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_personal_perfiles1` (`perfil_id` ASC) ;
142;
CREATE  TABLE IF NOT EXISTS `paises` (
  `pais_id` INT(11) NOT NULL ,
  `pais_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`pais_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
143;
INSERT INTO `paises` (`pais_id`, `pais_nombre`) VALUES (1, 'ARGENTINA');
144;
ALTER TABLE `provincias` ADD COLUMN `pais_id` INT(11) NOT NULL DEFAULT 1  AFTER `provincia_nombre` , 
  ADD CONSTRAINT `fk_provincias_paises1`
  FOREIGN KEY (`pais_id` )
  REFERENCES `paises` (`pais_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_provincias_paises1` (`pais_id` ASC) ;
145;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('58', '>Comisiones', '0', 'AdvPageComisiones', '', '0', '0');
146;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,58,perfil_id from perfiles;
147;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('59', '>Comisiones>Vendedores', '0', 'AdvToolBarComisionesVendedores', '', '0', '0');
148;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,59,perfil_id from perfiles;
149;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('60', '>Comisiones>Vendedores>Comisiones de Vendedores', '0', 'btncomisionesvendedores', '', '0', '0');
150;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,60,perfil_id from perfiles;
151;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('61', '>Comisiones>Vendedores>Vendedores Deb-Cred', '0', 'btnvendedoresdebcred', '', '0', '0');
152;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,61,perfil_id from perfiles;
153;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('62', '>Comisiones>Vendedores>Liquidaciones a Vendedores', '0', 'btnliquidacionesvendedores', '', '0', '0');
154;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,62,perfil_id from perfiles;
155;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('63', '>Comisiones>Sucursales', '0', 'AdvToolBarComisionesSucursales', '', '0', '0');
156;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,63,perfil_id from perfiles;
157;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('64', '>Comisiones>Sucursales>Comisiones de Sucursales', '0', 'btncomisionessucursales', '', '0', '0');
158;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,64,perfil_id from perfiles;
159;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('65', '>Comisiones>Sucursales>Sucursales Deb-Cred', '0', 'btndebcredsucursales', '', '0', '0');
160;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,65,perfil_id from perfiles;
161;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('66', '>Comisiones>Sucursales>Liquidaciones a Sucursales', '0', 'btnliquidacionessucu', '', '0', '0');
162;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,66,perfil_id from perfiles;
163;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('67', '>Comisiones>Notas de Pedido', '0', 'AdvToolBarNotasdepedido', '', '0', '0');
164;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,67,perfil_id from perfiles;
165;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('68', '>Comisiones>Notas de Pedido>Notas de Pedido', '0', 'btnlistanotasdepedido', '', '0', '0');
166;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,68,perfil_id from perfiles;
167;
ALTER TABLE `sucursales` 
ADD COLUMN `sucursal_tipoliquidvendedor` VARCHAR(45) NULL DEFAULT NULL  AFTER `empresa_id` , 
ADD COLUMN `sucursal_tipoliquidsucursal` VARCHAR(45) NULL DEFAULT NULL  AFTER `sucursal_tipoliquidvendedor`;
168;
CREATE  TABLE IF NOT EXISTS `comisionesvendedor` (
  `comisionvendedor_id` INT(11) NOT NULL ,
  `comisionvendedor_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `comisionvendedor_valor` FLOAT(10,4) NULL DEFAULT NULL ,
  `personal_id` INT(11) NULL DEFAULT NULL ,
  `producto_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`comisionvendedor_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
169;
ALTER TABLE `personal` CHANGE COLUMN `perfil_id` `perfil_id` int(11) NOT NULL DEFAULT 1;
170;
CREATE  TABLE IF NOT EXISTS `comisionessucursal` (
  `comisionsucursal_id` INT(11) NOT NULL ,
  `comisionsucursal_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `comisionsucursal_valor` FLOAT(10,4) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NULL DEFAULT NULL ,
  `producto_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`comisionsucursal_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
171;
CREATE  TABLE IF NOT EXISTS `vendedoresdebcred` (
  `vendedordebcred_id` INT(11) NOT NULL ,
  `vendedordebcred_fecha` DATE NULL DEFAULT NULL ,
  `vendedordebcred_descripcion` VARCHAR(255) NULL DEFAULT NULL ,
  `vendedordebcred_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `vendedordebcred_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `vendedordebcred_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `liquidacionvendedor_id` INT(11) NULL DEFAULT NULL ,
  `personal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`vendedordebcred_id`) ,
  INDEX `fk_vendedoresdebcred_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_vendedoresdebcred_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
172;
CREATE  TABLE IF NOT EXISTS `sucursalesdebcred` (
  `sucursaldebcred_id` INT(11) NOT NULL ,
  `sucursaldebcred_fecha` DATE NULL DEFAULT NULL ,
  `sucursaldebcred_descripcion` VARCHAR(255) NULL DEFAULT NULL ,
  `sucursaldebcred_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `sucursaldebcred_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `sucursaldebcred_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `liquidacionsucursal_id` INT(11) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`sucursaldebcred_id`) ,
  INDEX `fk_sucursalesdebcred_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_sucursalesdebcred_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
173;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('69', '>Ventas>Documentos>Notas de Debito', '0', 'btnnotasdedebito', '', '0', '0');
174;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,69,perfil_id from perfiles;
175;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('70', '>Ventas>Documentos>Remitos', '0', 'btnremitos', '', '0', '0');
176;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,70,perfil_id from perfiles;
177;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('71', '>Ventas>Documentos>Presupuestos', '0', 'btnpresupuestos', '', '0', '0');
178;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,71,perfil_id from perfiles;
179;
CREATE  TABLE IF NOT EXISTS `liquidacionesvendedores` (
  `liquidacionvendedor_id` INT(11) NOT NULL ,
  `liquidacionvendedor_fecha` DATE NULL DEFAULT NULL ,
  `liquidacionvendedor_desdefecha` DATE NULL DEFAULT NULL ,
  `liquidacionvendedor_hastafecha` DATE NULL DEFAULT NULL ,
  `liquidacionvendedor_total` FLOAT(20,4) NULL DEFAULT NULL ,
  `personal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquidacionvendedor_id`) ,
  INDEX `fk_liquidacionesvendedores_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_liquidacionesvendedores_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
180;
CREATE  TABLE IF NOT EXISTS `liquivendedeta` (
  `liquivendedeta_id` INT(11) NOT NULL ,
  `comisionvendedor_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `comisionvendedor_valor` FLOAT(10,4) NULL DEFAULT NULL ,
  `liquivendedeta_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `liquivendedeta_tipodetalle` VARCHAR(45) NULL DEFAULT NULL ,
  `liquidacionvendedor_id` INT(11) NOT NULL ,
  `documentoventadetalle_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquivendedeta_id`) ,
  INDEX `fk_liquivendedeta_liquidacionesvendedores1` (`liquidacionvendedor_id` ASC) ,
  INDEX `fk_liquivendedeta_documentoventadetalles1` (`documentoventadetalle_id` ASC) ,
  CONSTRAINT `fk_liquivendedeta_liquidacionesvendedores1`
    FOREIGN KEY (`liquidacionvendedor_id` )
    REFERENCES `liquidacionesvendedores` (`liquidacionvendedor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_liquivendedeta_documentoventadetalles1`
    FOREIGN KEY (`documentoventadetalle_id` )
    REFERENCES `documentoventadetalles` (`documentoventadetalle_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
181;
CREATE  TABLE IF NOT EXISTS `documentoventapersonal` (
  `documentoventapersonal_id` INT(11) NOT NULL ,
  `documentoventa_id` INT(11) NOT NULL ,
  `personal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentoventapersonal_id`) ,
  INDEX `fk_documentoventapersonal_documentosventas1` (`documentoventa_id` ASC) ,
  INDEX `fk_documentoventapersonal_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_documentoventapersonal_documentosventas1`
    FOREIGN KEY (`documentoventa_id` )
    REFERENCES `documentosventas` (`documentoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentoventapersonal_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
182;
CREATE  TABLE IF NOT EXISTS `liquivendedoressucursales` (
  `liquivendedoressucursales_id` INT(11) NOT NULL ,
  `liquidacionvendedor_id` INT(11) NOT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquivendedoressucursales_id`) ,
  INDEX `fk_liquivendedoressucursales_liquidacionesvendedores1` (`liquidacionvendedor_id` ASC) ,
  INDEX `fk_liquivendedoressucursales_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_liquivendedoressucursales_liquidacionesvendedores1`
    FOREIGN KEY (`liquidacionvendedor_id` )
    REFERENCES `liquidacionesvendedores` (`liquidacionvendedor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_liquivendedoressucursales_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
183;
ALTER TABLE `empresas` 
ADD COLUMN `empresa_idweb` VARCHAR(45) NULL DEFAULT NULL  AFTER `empresa_where` , 
ADD COLUMN `empresa_razonsocial` VARCHAR(45) NULL DEFAULT NULL  AFTER `empresa_idweb`;
184;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAD1RbnrSpG95A1n+BQ3A9jI=\r\n' WHERE `empresa_id`=1;
185;
CREATE  TABLE IF NOT EXISTS `liquidacionessucursales` (
  `liquidacionsucursal_id` INT(11) NOT NULL ,
  `liquidacionsucursal_fecha` DATE NULL DEFAULT NULL ,
  `liquidacionsucursal_desdefecha` DATE NULL DEFAULT NULL ,
  `liquidacionsucursal_hastafecha` DATE NULL DEFAULT NULL ,
  `liquidacionsucursal_total` FLOAT(20,4) NULL DEFAULT NULL ,
  `sucursaltipliqsuc_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `sucursaltipliqsuc_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquidacionsucursal_id`) ,
  INDEX `fk_liquidacionessucursales_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_liquidacionessucursales_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
186;
CREATE  TABLE IF NOT EXISTS `liquisucudeta` (
  `liquisucudeta_id` INT(11) NOT NULL ,
  `comisionsucursal_tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `comisionsucursal_valor` FLOAT(10,4) NULL DEFAULT NULL ,
  `liquisucudeta_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `liquisucudeta_porcentajeliquid` FLOAT(10,4) NULL DEFAULT NULL ,
  `liquidacionsucursal_id` INT(11) NOT NULL ,
  `documentoventadetalle_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquisucudeta_id`) ,
  INDEX `fk_liquisucudeta_liquidacionessucursales1` (`liquidacionsucursal_id` ASC) ,
  INDEX `fk_liquisucudeta_documentoventadetalles1` (`documentoventadetalle_id` ASC) ,
  CONSTRAINT `fk_liquisucudeta_liquidacionessucursales1`
    FOREIGN KEY (`liquidacionsucursal_id` )
    REFERENCES `liquidacionessucursales` (`liquidacionsucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_liquisucudeta_documentoventadetalles1`
    FOREIGN KEY (`documentoventadetalle_id` )
    REFERENCES `documentoventadetalles` (`documentoventadetalle_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
187;
INSERT INTO `config` SET `config_nombre`='CONEXIONREPORTES',`config_valor`='CONEXION_DBBORGEST';
188;
ALTER TABLE `liquidacionessucursales` ADD COLUMN `documentoventa_id` INT(11) NULL DEFAULT 0  AFTER `sucursal_id` ;
189;
ALTER TABLE `liquidacionessucursales` 
DROP COLUMN `sucursaltipliqsuc_estado` , 
ADD COLUMN `liquidacionsucursal_estado` VARCHAR(45) NULL DEFAULT 'PENDIENTE'  AFTER `sucursaltipliqsuc_tipo` ;
190;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('72', '>Archivo>Localidades>Provincias', '0', 'btnprovincias', '', '0', '0');
191;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,72,perfil_id from perfiles;
192;
ALTER TABLE `sucursales` ADD COLUMN `cliente_id` INT(11) NULL DEFAULT 0  AFTER `sucursal_tipoliquidsucursal` ;
193;
ALTER TABLE `productos` ADD COLUMN `producto_tipo` VARCHAR(45) NULL DEFAULT 'PRODUCTO'  AFTER `producto_imprimir`;
194;
ALTER TABLE `documentoventadetalles` ADD COLUMN `producto_tipo` VARCHAR(45) NULL DEFAULT 'PRODUCTO'  AFTER `documentoventadetalle_listaprecio`;
195;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('73', '>Archivo>General>Conceptos Deb-Cred', '0', 'btnconceptosdebcred', '', '0', '0');
196;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,73,perfil_id from perfiles;
197;
Replace config set config_valor='0', config_nombre='VENTASNCNDCONCEPTOS';
198;
ALTER TABLE `documentoventadocus` ADD COLUMN `documentoventadoc_tiporelacion` VARCHAR(45) NULL DEFAULT 'IMPUTACION'  AFTER `documentoventa_idpago` ;
199;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible) values ('74', '>Ventas>Documentos>Aplicar Recibos Pendientes', '0', 'btnRecibosPendientes', '', '0', '0');
200;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,74,perfil_id from perfiles;
201;
Replace config set config_valor='0', config_nombre='VENTASVENDEDORCLIENTEADOCUMENTOS';
202;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAANk7Ou14izMXC84G5wej9iw=\r\n' WHERE `empresa_id`=1;
203;
ALTER TABLE `proveedores` CHANGE COLUMN `proveedor_mail` `proveedor_mail` VARCHAR(150) NULL DEFAULT NULL  ;
204;
Replace config set config_valor='0', config_nombre='VENTANADETALLEVENTATIPO';
205;
ALTER TABLE `sucursales` ADD COLUMN `sucursal_tipodocumentoliquidar` INT(3) NULL DEFAULT 0  AFTER `cliente_id` ;
206;
CREATE  TABLE IF NOT EXISTS `liquisucudetarecibos` (
  `liquisucudetarecibo_id` INT(11) NOT NULL ,
  `comisionsucursal_valor` FLOAT(10,4) NULL DEFAULT NULL ,
  `liquisucudetarecibo_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `liquidacionsucursal_id` INT(11) NOT NULL ,
  `documentoventa_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquisucudetarecibo_id`) ,
  INDEX `fk_liquisucudetarecibos_liquidacionessucursales1` (`liquidacionsucursal_id` ASC) ,
  INDEX `fk_liquisucudetarecibos_documentosventas1` (`documentoventa_id` ASC) ,
  CONSTRAINT `fk_liquisucudetarecibos_liquidacionessucursales1`
    FOREIGN KEY (`liquidacionsucursal_id` )
    REFERENCES `liquidacionessucursales` (`liquidacionsucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_liquisucudetarecibos_documentosventas1`
    FOREIGN KEY (`documentoventa_id` )
    REFERENCES `documentosventas` (`documentoventa_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
207;
CREATE  TABLE IF NOT EXISTS `docuvendetcomisionesvendedores` (
  `docuvendetcomisionvendedor_id` INT(11) NOT NULL ,
  `docuvendetcomisionvendedor_importeunit` FLOAT(20,4) NULL DEFAULT NULL ,
  `docuvendetcomisionvendedor_total` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentoventadetalle_id` INT(11) NOT NULL ,
  `personal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`docuvendetcomisionvendedor_id`) ,
  INDEX `fk_docuvendetcomisionesvendedores_documentoventadetalles1` (`documentoventadetalle_id` ASC) ,
  INDEX `fk_docuvendetcomisionesvendedores_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_docuvendetcomisionesvendedores_documentoventadetalles1`
    FOREIGN KEY (`documentoventadetalle_id` )
    REFERENCES `documentoventadetalles` (`documentoventadetalle_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_docuvendetcomisionesvendedores_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
208;
CREATE  TABLE IF NOT EXISTS `permisosespecialesperfil` (
  `permisoespecialperfil_nombre` VARCHAR(100) NOT NULL ,
  `permisoespecialperfil_valor` VARCHAR(50) NULL DEFAULT NULL ,
  `perfil_id` INT(11) NOT NULL ,
  PRIMARY KEY (`permisoespecialperfil_nombre`) ,
  INDEX `fk_permisosespecialesperfil_perfiles1` (`perfil_id` ASC) ,
  CONSTRAINT `fk_permisosespecialesperfil_perfiles1`
    FOREIGN KEY (`perfil_id` )
    REFERENCES `perfiles` (`perfil_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
209;
ALTER TABLE `menuperfil` ADD COLUMN `menuperfil_clonar` INT(3) NULL DEFAULT NULL  AFTER `perfil_id` ;
210;
UPDATE `menuperfil` SET `menuperfil_clonar`=0;
211;
ALTER TABLE `menu` ADD COLUMN `menu_lista` VARCHAR(255) NULL DEFAULT NULL  AFTER `menu_visible` ;
212;
update menu set menu_lista='ListaCalculosPrecios1' where menu_nomb='btncalculoprecios';
213;
update menu set menu_lista='listaclientes1' where menu_nomb='btnclientes';
214;
update menu set menu_lista='ComisionesSucursales' where menu_nomb='btncomisionessucursales';
215;
update menu set menu_lista='ComisionesVendedores' where menu_nomb='btncomisionesvendedores';
216;
update menu set menu_lista='listaconceptosdebcred' where menu_nomb='btnconceptosdebcred';
217;
update menu set menu_lista='sucursalesdebcred' where menu_nomb='btndebcredsucursales';
218;
update menu set menu_lista='LIstaFacturasDeCompras' where menu_nomb='btnfacturascompras';
219;
update menu set menu_lista='ListaFacturasDeVenta' where menu_nomb='btnfacturasventas';
220;
update menu set menu_lista='listacomisionessucursales' where menu_nomb='btnliquidacionessucu';
221;
update menu set menu_lista='listacomisionesvendedores' where menu_nomb='btnliquidacionesvendedores';
222;
update menu set menu_lista='ListaNotasPedidoComisiones' where menu_nomb='btnlistanotasdepedido';
223;
update menu set menu_lista='ListaLocalidades' where menu_nomb='btnlocalidades';
224;
update menu set menu_lista='ListaNotasPedido' where menu_nomb='btnnotapedido';
225;
update menu set menu_lista='listanotacreditoventa' where menu_nomb='btnnotasdecredito';
226;
update menu set menu_lista='listanotadebitoventa' where menu_nomb='btnnotasdedebito';
227;
update menu set menu_lista='ListaOrdenesServicios' where menu_nomb='btnordenservicio';
228;
update menu set menu_lista='listaperfiles' where menu_nomb='btnperfiles';
229;
update menu set menu_lista='personal' where menu_nomb='btnpersonal';
230;
update menu set menu_lista='ListaPoliticasdePrecios' where menu_nomb='btnpoliticaprecio';
231;
update menu set menu_lista='ListaPresupuestos' where menu_nomb='btnpresupuestos';
232;
update menu set menu_lista='ListaProductos1' where menu_nomb='btnproductos';
233;
update menu set menu_lista='ListaProveedores1' where menu_nomb='btnproveedores';
234;
update menu set menu_lista='ListaProvincias' where menu_nomb='btnprovincias';
235;
update menu set menu_lista='listapuntosdeventa' where menu_nomb='btnpuntosdeventa';
236;
update menu set menu_lista='ListaRecibosdeVenta' where menu_nomb='btnrecibodeventa';
237;
update menu set menu_lista='listaremitosventa' where menu_nomb='btnremitos';
238;
update menu set menu_lista='listaservices' where menu_nomb='btnservice';
239;
update menu set menu_lista='listasucursales' where menu_nomb='btnsucursales';
240;
update menu set menu_lista='listatiposdocumentos' where menu_nomb='btntiposdocumentos';
241;
update menu set menu_lista='vendedoresdebcred' where menu_nomb='btnvendedoresdebcred';
242;
update menu set menu_lista='vendedoresdebcred' where menu_nomb='btnvendedoresdebcred';
243;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAGurwDjo8ZGINFvEy3IsllQ=\r\n' WHERE `empresa_id`=1;
244;
UPDATE `menu` SET `menu_lista`='ListaNotasCreditodeVentas' WHERE `menu_lista` = 'listanotacreditoventa';
245;
update menu set menu_lista='TListaCalculosPrecios1' where menu_nomb='btncalculoprecios';
246;
update menu set menu_lista='Tlistaclientes1' where menu_nomb='btnclientes';
247;
update menu set menu_lista='TComisionesSucursales' where menu_nomb='btncomisionessucursales';
248;
update menu set menu_lista='TComisionesVendedores' where menu_nomb='btncomisionesvendedores';
249;
update menu set menu_lista='Tlistaconceptosdebcred' where menu_nomb='btnconceptosdebcred';
250;
update menu set menu_lista='Tsucursalesdebcred' where menu_nomb='btndebcredsucursales';
251;
update menu set menu_lista='TLIstaFacturasDeCompras' where menu_nomb='btnfacturascompras';
252;
update menu set menu_lista='TListaFacturasDeVenta' where menu_nomb='btnfacturasventas';
253;
update menu set menu_lista='Tlistacomisionessucursales' where menu_nomb='btnliquidacionessucu';
254;
update menu set menu_lista='Tlistacomisionesvendedores' where menu_nomb='btnliquidacionesvendedores';
255;
update menu set menu_lista='TListaNotasPedidoComisiones' where menu_nomb='btnlistanotasdepedido';
256;
update menu set menu_lista='TListaLocalidades' where menu_nomb='btnlocalidades';
257;
update menu set menu_lista='TListaNotasPedido' where menu_nomb='btnnotapedido';
258;
update menu set menu_lista='Tlistanotacreditoventa' where menu_nomb='btnnotasdecredito';
259;
update menu set menu_lista='Tlistanotadebitoventa' where menu_nomb='btnnotasdedebito';
260;
update menu set menu_lista='TListaOrdenesServicios' where menu_nomb='btnordenservicio';
261;
update menu set menu_lista='Tlistaperfiles' where menu_nomb='btnperfiles';
262;
update menu set menu_lista='Tpersonal' where menu_nomb='btnpersonal';
263;
update menu set menu_lista='TListaPoliticasdePrecios' where menu_nomb='btnpoliticaprecio';
264;
update menu set menu_lista='TListaPresupuestos' where menu_nomb='btnpresupuestos';
265;
update menu set menu_lista='TListaProductos1' where menu_nomb='btnproductos';
266;
update menu set menu_lista='TListaProveedores1' where menu_nomb='btnproveedores';
267;
update menu set menu_lista='TListaProvincias' where menu_nomb='btnprovincias';
268;
update menu set menu_lista='Tlistapuntosdeventa' where menu_nomb='btnpuntosdeventa';
269;
update menu set menu_lista='TListaRecibosdeVenta' where menu_nomb='btnrecibodeventa';
270;
update menu set menu_lista='Tlistaremitosventa' where menu_nomb='btnremitos';
271;
update menu set menu_lista='Tlistaservices' where menu_nomb='btnservice';
272;
update menu set menu_lista='Tlistasucursales' where menu_nomb='btnsucursales';
273;
update menu set menu_lista='Tlistatiposdocumentos' where menu_nomb='btntiposdocumentos';
274;
update menu set menu_lista='Tvendedoresdebcred' where menu_nomb='btnvendedoresdebcred';
275;
update menu set menu_lista='Tvendedoresdebcred' where menu_nomb='btnvendedoresdebcred';
276;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAGurwDjo8ZGINFvEy3IsllQ=\r\n' WHERE `empresa_id`=1;
277;
UPDATE `menu` SET `menu_lista`='TListaNotasCreditodeVentas' WHERE `menu_lista` = 'ListaNotasCreditodeVentas';
278;
UPDATE `menu` SET `menu_lista`='TListaNotasCreditodeVentas' WHERE `menu_nomb` = 'btnnotasdecredito';
279;
CREATE  TABLE IF NOT EXISTS `temporales` (
  `temporal_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `temporal_idproceso` INT(11) NULL DEFAULT NULL ,
  `temporal_string1` VARCHAR(150) NULL DEFAULT NULL ,
  `temporal_string2` VARCHAR(150) NULL DEFAULT NULL ,
  `temporal_string3` VARCHAR(150) NULL DEFAULT NULL ,
  `temporal_string4` VARCHAR(150) NULL DEFAULT NULL ,
  `temporal_string5` VARCHAR(150) NULL DEFAULT NULL ,
  `temporal_float1` FLOAT(20,4) NULL DEFAULT NULL ,
  `temporal_float2` FLOAT(20,4) NULL DEFAULT NULL ,
  `temporal_float3` FLOAT(20,4) NULL DEFAULT NULL ,
  `temporal_float4` FLOAT(20,4) NULL DEFAULT NULL ,
  `temporal_float5` FLOAT(20,4) NULL DEFAULT NULL ,
  `temporal_int1` INT(11) NULL DEFAULT NULL ,
  `temporal_int2` INT(11) NULL DEFAULT NULL ,
  `temporal_int3` INT(11) NULL DEFAULT NULL ,
  `temporal_int4` INT(11) NULL DEFAULT NULL ,
  `temporal_int5` INT(11) NULL DEFAULT NULL ,
  `temporal_fecha1` DATE NULL DEFAULT NULL ,
  `temporal_fecha2` DATE NULL DEFAULT NULL ,
  `temporal_fecha3` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`temporal_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
280;
update personal set personal_usuario=concat('usuario',personal_id), personal_pass='AwAAAGixz0QkQCbR+0Wz6OOgjuw=\r\n\0';
281;
INSERT INTO `config` SET `config_nombre`='MOSTRARPRODUCTOSOCULTOS',`config_valor`='-1';
282;
INSERT INTO `config` SET `config_nombre`='VENTAIMPRIMIRCODIGOPROD',`config_valor`='0';
283;
ALTER TABLE `documentosventas` ADD COLUMN `documentoventa_recargo` FLOAT(20,4) NULL DEFAULT 0  AFTER `caja_id` ;
284;
ALTER TABLE `tarjetas` 
ADD COLUMN `tarjeta_observaciones` VARCHAR(255) NULL DEFAULT NULL  AFTER `tarjeta_nombre` , 
CHANGE COLUMN `tarjeta_nombre` `tarjeta_nombre` VARCHAR(50) NULL DEFAULT NULL  ;
285;
CREATE  TABLE IF NOT EXISTS `tarjetacuotas` (
  `tarjetacuota_id` INT(11) NOT NULL ,
  `tarjetacuota_desde` INT(11) NULL DEFAULT NULL ,
  `tarjetacuota_hasta` INT(11) NULL DEFAULT NULL ,
  `tarjetacuota_recargo` FLOAT(5,2) NULL DEFAULT NULL ,
  `tarjeta_id` INT(11) NOT NULL ,
  PRIMARY KEY (`tarjetacuota_id`) ,
  INDEX `fk_tarjetacuotas_tarjetas1` (`tarjeta_id` ASC) ,
  CONSTRAINT `fk_tarjetacuotas_tarjetas1`
    FOREIGN KEY (`tarjeta_id` )
    REFERENCES `tarjetas` (`tarjeta_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
286;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('75', '>Archivo>General>Tarjetas de Credito', '0', 'btntarjetas', '', '0', '0', 'TListaTarjetasdeCredito');
287;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,75,perfil_id,-1 from perfiles;
288;
ALTER TABLE `pagotarjeta` 
ADD COLUMN `pagotarjeta_titular` VARCHAR(50) NULL DEFAULT NULL  AFTER `tarjeta_id` , 
ADD COLUMN `pagotarjeta_dni` VARCHAR(20) NULL DEFAULT NULL  AFTER `pagotarjeta_titular` , 
ADD COLUMN `pagotarjeta_telefono` VARCHAR(20) NULL DEFAULT NULL  AFTER `pagotarjeta_dni` ;
289;
ALTER TABLE `pagotarjeta` ADD COLUMN `pagotarjeta_recargo` FLOAT(20,4) NULL DEFAULT NULL  AFTER `pagotarjeta_telefono` ;
290;
ALTER TABLE `temporales` 
ADD COLUMN `temporal_string6` VARCHAR(150) NULL DEFAULT NULL  AFTER `temporal_fecha3` , 
ADD COLUMN `temporal_string7` VARCHAR(150) NULL DEFAULT NULL  AFTER `temporal_string6` , 
ADD COLUMN `temporal_string8` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string7` , 
ADD COLUMN `temporal_string9` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string8` , 
ADD COLUMN `temporal_string10` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string9` ;
291;
CREATE  TABLE IF NOT EXISTS `configcolumnas` (
  `configcolumna_id` INT(11) NOT NULL ,
  `configcolumna_grilla` VARCHAR(150) NULL DEFAULT NULL ,
  `configcolumna_nombre` VARCHAR(50) NULL DEFAULT NULL ,
  `configcolumna_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`configcolumna_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
292;
CREATE  TABLE IF NOT EXISTS `configcolumnadetalles` (
  `configcolumnadeta_id` INT(11) NOT NULL ,
  `configcolumnadeta_campo` VARCHAR(100) NULL DEFAULT NULL ,
  `configcolumnadeta_visible` INT(3) NULL DEFAULT NULL ,
  `configcolumnadeta_titulo` VARCHAR(45) NULL DEFAULT NULL ,
  `configcolumna_id` INT(11) NOT NULL ,
  PRIMARY KEY (`configcolumnadeta_id`) ,
  INDEX `fk_configcolumnadetalles_configcolumnas1` (`configcolumna_id` ASC) ,
  CONSTRAINT `fk_configcolumnadetalles_configcolumnas1`
    FOREIGN KEY (`configcolumna_id` )
    REFERENCES `configcolumnas` (`configcolumna_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
293;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('76', '>Herramientas>Herramientas>Configurar Listas', '0', 'BtnConfigurarListas', '', '0', '0', 'TListaConfigListas');
294;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,76,perfil_id,-1 from perfiles;
295;
INSERT INTO `configcolumnas` SET `configcolumna_id`=1,`configcolumna_grilla`='TListaProductos1.DBGrid1',`configcolumna_nombre`='Lista de Productos';
296;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=1,`configcolumnadeta_campo`='producto_id',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Codigo',`configcolumna_id`=1;
297;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=2,`configcolumnadeta_campo`='producto_nombre',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Nombre',`configcolumna_id`=1;
298;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=3,`configcolumnadeta_campo`='producto_preciocosto',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='P. Compra',`configcolumna_id`=1;
299;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=4,`configcolumnadeta_campo`='producto_precioventa1',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='P. Venta',`configcolumna_id`=1;
300;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=5,`configcolumnadeta_campo`='producto_precioventa2',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='P. Venta2',`configcolumna_id`=1;
301;
ALTER TABLE `configcolumnas` ADD COLUMN `configcolumna_anchoventana` INT(11) NULL DEFAULT 0  AFTER `configcolumna_observaciones` ;
302;
UPDATE `configcolumnas` SET `configcolumna_anchoventana`=1050 WHERE `configcolumna_id`=1;
303;
INSERT INTO `configcolumnadetalles` VALUES (6,'rubro_nombre',-1,'Rubro',1);
304;
INSERT INTO `configcolumnadetalles` VALUES (7,'proveedor_nombre',-1,'Proveedor',1);
305;
INSERT INTO `configcolumnadetalles` VALUES (8,'producto_precioventa3',0,'P. Venta3',1);
306;
INSERT INTO `configcolumnadetalles` VALUES (9,'producto_precioventa4',0,'P. Venta4',1);
307;
INSERT INTO `configcolumnadetalles` VALUES (10,'producdepo_stockactual',-1,'Stock',1);
308;
UPDATE `menu` SET `menu_lista`='TListaOrdenesdePago' WHERE `menu_path` = '>Compras>Documentos>Ordenes de Pago';
309;
CREATE  TABLE IF NOT EXISTS `documentocompradocus` (
  `documentocompradoc_id` INT(11) NOT NULL ,
  `documentocompradoc_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_pagado` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_saldo` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentocompra_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentocompra_id` INT(11) NOT NULL ,
  `documentocompra_idpago` INT(11) NOT NULL ,
  `documentocompradoc_tiporelacion` VARCHAR(45) NULL DEFAULT 'IMPUTACION' ,
  PRIMARY KEY (`documentocompradoc_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
310;
CREATE  TABLE IF NOT EXISTS `documentocomprapagos` (
  `documentocomprapago_id` INT(11) NOT NULL ,
  `documentocomprapago_nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `documentocomprapago_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `tipopago_id` INT(11) NOT NULL ,
  `documentocompra_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentocomprapago_id`) ,
  INDEX `fk_documentopagos_tipospago1` (`tipopago_id` ASC) ,
  INDEX `fk_documentocomprapagos_documentoscompras1` (`documentocompra_id` ASC) ,
  CONSTRAINT `fk_documentopagos_tipospago10`
    FOREIGN KEY (`tipopago_id` )
    REFERENCES `tipospago` (`tipopago_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentocomprapagos_documentoscompras1`
    FOREIGN KEY (`documentocompra_id` )
    REFERENCES `documentoscompras` (`documentocompra_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
311;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('77', '>Compras>Documentos>Notas de Credito', '0', 'btnnotasdecreditocompra', '', '0', '0', 'TLIstaNotasDeCreditoDeCompras');
312;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,77,perfil_id,-1 from perfiles;
313;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('78', '>Compras>Documentos>Notas de Debito', '0', 'btnnotasdedebitocompra', '', '0', '0', 'TLIstaNotasDeDebitoDeCompras');
314;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,78,perfil_id,-1 from perfiles;
315;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('79', '>Compras>Cuenta Corriente', '0', 'AdvToolBarCtasCtesCompras', '', '0', '0', '');
316;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,79,perfil_id,-1 from perfiles;
317;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('80', '>Compras>Cuenta Corriente>Saldos', '0', 'BtnSaldosCompras', '', '0', '0', '');
318;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,80,perfil_id,-1 from perfiles;
319;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('81', '>Compras>Cuenta Corriente>Estado de Ctas.', '0', 'BtnEstadoCompras', '', '0', '0', '');
320;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,81,perfil_id,-1 from perfiles;
321;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('82', '>Compras>Cuenta Corriente>Detalle de Ctas.', '0', 'BtnDetalleCompras', '', '0', '0', '');
322;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,82,perfil_id,-1 from perfiles;
323;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAMa8LOdG3MnWldmtvJ6DXKY=\r\n' WHERE `empresa_id`=1;
324;
ALTER TABLE `liquidacionessucursales` 
ADD COLUMN `liquidacionsucursal_neto21` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventa_id` , 
ADD COLUMN `liquidacionsucursal_iva21` FLOAT(20,4) NULL DEFAULT 0  AFTER `liquidacionsucursal_neto21`;
325;
Replace config set config_valor='1', config_nombre='TIPOBUSQUEDA';
326;
ALTER TABLE `documentoscompras` CHANGE COLUMN `documentocompra_total` `documentocompra_total` FLOAT(20,2) NULL DEFAULT NULL;
327;
ALTER TABLE `documentosventas` ADD COLUMN `documentoventa_descuento` FLOAT(20,2) NULL DEFAULT 0  AFTER `documentoventa_recargo`;
328;
ALTER TABLE `personal` ADD COLUMN `personal_auxint1` INT(11) NULL DEFAULT 0  AFTER `perfil_id` ;
329;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('83', '>Compras>Informes>Movimientos de Stock', '0', 'BtnMovimientosdeStock', '', '0', '0', '');
330;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,83,perfil_id,-1 from perfiles;
331;
ALTER TABLE `documentosventas` 
CHANGE COLUMN `documentoventa_total` `documentoventa_total` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentoventa_pagado` `documentoventa_pagado` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentoventa_saldo` `documentoventa_saldo` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentoventa_recargo` `documentoventa_recargo` FLOAT(20,2) NULL DEFAULT 0  , 
CHANGE COLUMN `documentoventa_descuento` `documentoventa_descuento` FLOAT(20,2) NULL DEFAULT 0  ;
332;
ALTER TABLE `documentoventadocus` 
CHANGE COLUMN `documentoventadoc_importe` `documentoventadoc_importe` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentoventa_pagado` `documentoventa_pagado` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentoventa_saldo` `documentoventa_saldo` FLOAT(20,2) NULL DEFAULT NULL  ;
333;
ALTER TABLE `documentoscompras` 
CHANGE COLUMN `documentocompra_pagado` `documentocompra_pagado` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentocompra_saldo` `documentocompra_saldo` FLOAT(20,2) NULL DEFAULT NULL  ;
334;
CREATE  TABLE IF NOT EXISTS `ajustestock` (
  `ajustestock_id` INT(11) NOT NULL ,
  `ajustestock_fecha` DATE NULL DEFAULT NULL ,
  `ajustestock_hora` TIME NULL DEFAULT NULL ,
  `ajustestock_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `deposito_id` INT(11) NOT NULL ,
  `personal_id` INT(11) NOT NULL ,
  `ajustestock_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`ajustestock_id`) ,
  INDEX `fk_ajustestock_depositos1` (`deposito_id` ASC) ,
  INDEX `fk_ajustestock_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_ajustestock_depositos1`
    FOREIGN KEY (`deposito_id` )
    REFERENCES `depositos` (`deposito_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ajustestock_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
335;
CREATE  TABLE IF NOT EXISTS `ajustestockdetalles` (
  `ajustestockdetalle_id` INT(11) NOT NULL ,
  `ajustestockdetalle_cantidad` FLOAT(5,2) NULL DEFAULT NULL ,
  `ajustestock_id` INT(11) NOT NULL ,
  `producto_id` INT(11) NOT NULL ,
  PRIMARY KEY (`ajustestockdetalle_id`) ,
  INDEX `fk_ajustestockdetalles_ajustestock1` (`ajustestock_id` ASC) ,
  INDEX `fk_ajustestockdetalles_productos1` (`producto_id` ASC) ,
  CONSTRAINT `fk_ajustestockdetalles_ajustestock1`
    FOREIGN KEY (`ajustestock_id` )
    REFERENCES `ajustestock` (`ajustestock_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ajustestockdetalles_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
336;
ALTER TABLE `documentocompradocus` 
CHANGE COLUMN `documentocompradoc_importe` `documentocompradoc_importe` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentocompra_pagado` `documentocompra_pagado` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `documentocompra_saldo` `documentocompra_saldo` FLOAT(20,2) NULL DEFAULT NULL  ;
337;
UPDATE `menu` SET `menu_path`='>Compras>Stock>Movimientos de Stock' WHERE `menu_id`=83;
338;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('84', '>Compras>Stock', '0', 'AdvToolBarStock', '', '0', '0', '');
339;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,84,perfil_id,-1 from perfiles;
340;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('85', '>Compras>Stock>Consultas de Stock', '0', 'BtnConsultasStock', '', '0', '0', '');
341;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,85,perfil_id,-1 from perfiles;
342;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('86', '>Compras>Stock>Ajustes de Stock', '0', 'BtnAjustesdeStock', '', '0', '0', 'TListaAjustedeStock');
343;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,86,perfil_id,-1 from perfiles;
344;
ALTER TABLE `docuvendetcomisionesvendedores` 
ADD COLUMN `docuvendetcomisionvendedor_saldo` FLOAT(20,2) NULL DEFAULT 0  AFTER `personal_id` , 
ADD COLUMN `docuvendetcomisionvendedor_pagado` FLOAT(20,2) NULL DEFAULT 0  AFTER `docuvendetcomisionvendedor_saldo` , 
ADD COLUMN `docuvendetcomisionvendedor_estado` VARCHAR(45) NULL DEFAULT 'PENDIENTE'  AFTER `docuvendetcomisionvendedor_pagado` , 
CHANGE COLUMN `docuvendetcomisionvendedor_importeunit` `docuvendetcomisionvendedor_importeunit` FLOAT(20,2) NULL DEFAULT NULL  , 
CHANGE COLUMN `docuvendetcomisionvendedor_total` `docuvendetcomisionvendedor_total` FLOAT(20,2) NULL DEFAULT NULL  ;
345;
UPDATE docuvendetcomisionesvendedores SET docuvendetcomisionvendedor_saldo=docuvendetcomisionvendedor_total;
346;
UPDATE `menu` SET `menu_path`='>Comisiones>Borradores' WHERE `menu_id`=67;
347;
UPDATE `menu` SET `menu_path`='>Comisiones>Borradores>Borradores' WHERE `menu_id`=68;
348;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('87', '>Comisiones>Borradores>Liquidaciones Borradores', '0', 'BtnLiquidacionesBorradores', '', '0', '0', '');
349;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,87,perfil_id,-1 from perfiles;
350;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('88', '>Comisiones>Borradores>Saldos', '0', 'BtnSaldoBorradores', '', '0', '0', '');
351;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,88,perfil_id,-1 from perfiles;
352;
CREATE  TABLE IF NOT EXISTS `liquidacionesborradores` (
  `liquidacionborrador_id` INT(11) NOT NULL ,
  `liquidacionborrador_fecha` DATE NULL DEFAULT NULL ,
  `liquidacionborrador_total` FLOAT(20,2) NULL DEFAULT NULL ,
  `liquidacionborrador_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  `personal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquidacionborrador_id`) ,
  INDEX `fk_liquidacionesborradores_personal1` (`personal_id` ASC) ,
  CONSTRAINT `fk_liquidacionesborradores_personal1`
    FOREIGN KEY (`personal_id` )
    REFERENCES `personal` (`personal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
353;
CREATE  TABLE IF NOT EXISTS `liquidacionborradordetalles` (
  `liquidacionborradordetalle_id` INT(11) NOT NULL ,
  `liquidacionborradordetalle_importe` FLOAT(20,2) NULL DEFAULT NULL ,
  `liquidacionborradordetalle_pagado` FLOAT(20,2) NULL DEFAULT NULL ,
  `liquidacionborradordetalle_saldo` FLOAT(20,2) NULL DEFAULT NULL ,
  `liquidacionborradordetalle_estado` FLOAT(20,2) NULL DEFAULT NULL ,
  `liquidacionborrador_id` INT(11) NOT NULL ,
  `docuvendetcomisionvendedor_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquidacionborradordetalle_id`) ,
  INDEX `fk_liquidacionborradordetalles_liquidacionesborradores1` (`liquidacionborrador_id` ASC) ,
  INDEX `fk_liquidacionborradordetalles_docuvendetcomisionesvendedores1` (`docuvendetcomisionvendedor_id` ASC) ,
  CONSTRAINT `fk_liquidacionborradordetalles_liquidacionesborradores1`
    FOREIGN KEY (`liquidacionborrador_id` )
    REFERENCES `liquidacionesborradores` (`liquidacionborrador_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_liquidacionborradordetalles_docuvendetcomisionesvendedores1`
    FOREIGN KEY (`docuvendetcomisionvendedor_id` )
    REFERENCES `docuvendetcomisionesvendedores` (`docuvendetcomisionvendedor_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
354;
UPDATE `menu` SET `menu_lista`='TListaLiquidacionesBorradores' WHERE `menu_id`=87;
355;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=11,`configcolumnadeta_campo`='producto_codigo',`configcolumnadeta_visible`=0,`configcolumnadeta_titulo`='Codigo2',`configcolumna_id`=1;
356;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=12,`configcolumnadeta_campo`='producto_fechaactualizacionprecio',`configcolumnadeta_visible`=0,`configcolumnadeta_titulo`='Fecha Act.',`configcolumna_id`=1;
357;
ALTER TABLE `liquidacionesborradores` ADD COLUMN `liquidacionborrador_equipo` VARCHAR(45) NULL DEFAULT NULL  AFTER `personal_id` ;
358;
ALTER TABLE `liquidacionborradordetalles` CHANGE COLUMN `liquidacionborradordetalle_estado` `liquidacionborradordetalle_estado` VARCHAR(45) NULL DEFAULT NULL;
359;
UPDATE `docuvendetcomisionesvendedores` SET `docuvendetcomisionvendedor_estado`='PAGADA' WHERE `docuvendetcomisionvendedor_saldo` = 0;
360;
UPDATE `menu` SET `menu_path`='>Comisiones>Borradores>Detalle de Cuentas' WHERE `menu_id`=88;
361;
UPDATE `menu` SET `menu_nomb`='BtnDetalleCuentasBorradores' WHERE `menu_id`=88;
362;
CREATE  TABLE IF NOT EXISTS `imprimiretiquetas` (
  `imprimiretiqueta_id` INT(11) NOT NULL ,
  `imprimiretiqueta_codigo` VARCHAR(45) NULL DEFAULT NULL ,
  `imprimiretiqueta_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  `imprimiretiqueta_cantidad` INT(11) NULL DEFAULT NULL ,
  `imprimiretiqueta_precio` FLOAT(20,2) NULL DEFAULT NULL ,
  PRIMARY KEY (`imprimiretiqueta_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
363;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('89', '>Herramientas>Herramientas>Imprimir Etiquetas', '0', 'btnimprimiretiquetas', '', '0', '0', '');
364;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,89,perfil_id,-1 from perfiles;
365;
CREATE  TABLE IF NOT EXISTS `liquidacionborradordebcred` (
  `liquidacionborradordebcred_id` INT(11) NOT NULL ,
  `liquidacionborradordebcred_descripcion` VARCHAR(150) NULL DEFAULT NULL ,
  `liquidacionborradordebcred_importe` FLOAT(20,2) NULL DEFAULT NULL ,
  `liquidacionborrador_id` INT(11) NOT NULL ,
  PRIMARY KEY (`liquidacionborradordebcred_id`) ,
  INDEX `fk_liquidacionborradordebcred_liquidacionesborradores1` (`liquidacionborrador_id` ASC) ,
  CONSTRAINT `fk_liquidacionborradordebcred_liquidacionesborradores1`
    FOREIGN KEY (`liquidacionborrador_id` )
    REFERENCES `liquidacionesborradores` (`liquidacionborrador_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
366;
Replace config set config_valor='0', config_nombre='MOSTRAREQUIPO';
367;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('90', '>Comisiones>Borradores>Estado de Cuentas', '0', 'btnestadoctasborradores', '', '0', '0', '');
368;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,90,perfil_id,-1 from perfiles;
369;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAGRch/8fvnr/yNM0+myR3Bg=\r\n' WHERE `empresa_id`=1;
370;
ALTER TABLE `tiposdocumento` ADD COLUMN `tipodocu_importemax` FLOAT(20,2) NULL DEFAULT NULL  AFTER `tipodocu_manual` ;
371;
CREATE  TABLE IF NOT EXISTS `cuponestarjetas` (
  `cupontarjeta_id` INT(11) NOT NULL ,
  `cupontarjeta_fecha` DATE NULL DEFAULT NULL ,
  `cupontarjeta_importe` FLOAT(20,2) NULL DEFAULT NULL ,
  `cupontarjeta_cuotas` INT(11) NULL DEFAULT NULL ,
  `cupontarjeta_autoriz` VARCHAR(45) NULL DEFAULT NULL ,
  `cupontarjeta_titular` VARCHAR(50) NULL DEFAULT NULL ,
  `cupontarjeta_dni` VARCHAR(20) NULL DEFAULT NULL ,
  `cupontarjeta_telefono` VARCHAR(20) NULL DEFAULT NULL ,
  `cupontarjeta_recargo` FLOAT(20,2) NULL DEFAULT NULL ,
  `tarjeta_id` INT(11) NOT NULL ,
  PRIMARY KEY (`cupontarjeta_id`) ,
  INDEX `fk_cuponestarjetas_tarjetas1` (`tarjeta_id` ASC) ,
  CONSTRAINT `fk_cuponestarjetas_tarjetas1`
    FOREIGN KEY (`tarjeta_id` )
    REFERENCES `tarjetas` (`tarjeta_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
372;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('91', '>Ventas>Caja>Cupones Tarjetas', '0', 'BtnCuponesTarjetas', '', '0', '0', 'TListaCuponesTarjetasCredito');
373;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,91,perfil_id,-1 from perfiles;
374;
update personal set perfil_id=1
where personal_id=(select config_valor from config where config_nombre='USUARIOPORDEFECTO');
375;
Replace config set config_valor='0', config_nombre='USUARIOPROTECTOR';
376;
CREATE  TABLE IF NOT EXISTS `protegidospass` (
  `protegido_id` INT(11) NOT NULL ,
  `protegido_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`protegido_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
377;
INSERT INTO `protegidospass` SET `protegido_id`=1,`protegido_nombre`='';
378;
ALTER TABLE `cuponestarjetas` ADD COLUMN `cupontarjeta_numero` INT(11) NULL DEFAULT NULL  AFTER `tarjeta_id` ;
379;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('92', '>Herramientas>Herramientas>Exportar DB', '0', 'btnexportardb', '', '0', '0', '');
380;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,92,perfil_id,-1 from perfiles;
381;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('93', '>Herramientas>Herramientas>Importar DB', '0', 'btnimportardb', '', '0', '0', '');
382;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,93,perfil_id,-1 from perfiles;
383;
CREATE  TABLE IF NOT EXISTS `tablassincronizar` (
  `tablasinc_id` INT(11) NOT NULL ,
  `tablasinc_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  `tablasinc_tipooperacion` VARCHAR(45) NULL DEFAULT NULL ,
  `tablasinc_ultimasinc` DATE NULL DEFAULT NULL ,
  `tablasinc_sincronizar` INT(3) NULL DEFAULT NULL ,
  PRIMARY KEY (`tablasinc_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
384;
ALTER TABLE `tiposdocumento` CHANGE COLUMN `tipodocu_importemax` `tipodocu_importemax` FLOAT(20,2) NULL DEFAULT 0  ;
385;
UPDATE `tiposdocumento` SET `tipodocu_importemax`=0;
386;
UPDATE `menu` SET `menu_tipo`=0;
387;
ALTER TABLE `imprimiretiquetas` CHANGE COLUMN `imprimiretiqueta_precio` `imprimiretiqueta_precio` FLOAT(20,2) NULL DEFAULT 0  ;
388;
UPDATE imprimiretiquetas SET imprimiretiqueta_precio=0;
389;
ALTER TABLE `documentoscompras` 
CHANGE COLUMN `documentocompra_pagado` `documentocompra_pagado` FLOAT(20,2) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_saldo` `documentocompra_saldo` FLOAT(20,2) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_neto21` `documentocompra_neto21` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_iva21` `documentocompra_iva21` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_neto105` `documentocompra_neto105` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_iva105` `documentocompra_iva105` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_otrosimpuestos` `documentocompra_otrosimpuestos` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_neto27` `documentocompra_neto27` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_iva27` `documentocompra_iva27` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_nogravado` `documentocompra_nogravado` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_tishhperc` `documentocompra_tishhperc` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_ivaret` `documentocompra_ivaret` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_ivaperc` `documentocompra_ivaperc` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_dgrret` `documentocompra_dgrret` FLOAT(20,4) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompra_dgrperc` `documentocompra_dgrperc` FLOAT(20,4) NULL DEFAULT 0  ;
390;
ALTER TABLE `documentocompradetalles` 
CHANGE COLUMN `documentocompradetalle_idorig` `documentocompradetalle_idorig` INT(11) NULL DEFAULT 0  , 
CHANGE COLUMN `documentocompradetalle_cantidadpendiente` `documentocompradetalle_cantidadpendiente` FLOAT(20,4) NULL DEFAULT 0;
391;
UPDATE `documentocompradetalles` SET `documentocompradetalle_idorig`=0;
392;
UPDATE `documentocompradetalles` SET `documentocompradetalle_cantidadpendiente`=0;
393;
ALTER TABLE `cuponestarjetas` CHANGE COLUMN `cupontarjeta_numero` `cupontarjeta_numero` VARCHAR(45) NULL DEFAULT NULL  ;
394;
INSERT INTO `tablassincronizar` VALUES (1,'ajustestock','EXPORTAR','2014-01-16',-1);
395;
INSERT INTO `tablassincronizar` VALUES (2,'ajustestockdetalles','EXPORTAR','2014-01-16',-1);
396;
INSERT INTO `tablassincronizar` VALUES (3,'cajaasientos','EXPORTAR','2014-01-16',-1);
397;
INSERT INTO `tablassincronizar` VALUES (4,'cajas','EXPORTAR','2014-01-16',-1);
398;
INSERT INTO `tablassincronizar` VALUES (5,'calculopreciodeta','EXPORTAR','2014-01-16',-1);
399;
INSERT INTO `tablassincronizar` VALUES (6,'calculopreciodetaprod','EXPORTAR','2014-01-16',-1);
400;
INSERT INTO `tablassincronizar` VALUES (7,'calculoprecios','EXPORTAR','2014-01-16',-1);
401;
INSERT INTO `tablassincronizar` VALUES (8,'clientes','EXPORTAR','2014-01-16',-1);
402;
INSERT INTO `tablassincronizar` VALUES (9,'clientevehiculo','EXPORTAR','2014-01-16',-1);
403;
INSERT INTO `tablassincronizar` VALUES (10,'comisionessucursal','EXPORTAR','2014-01-16',-1);
404;
INSERT INTO `tablassincronizar` VALUES (11,'comisionesvendedor','EXPORTAR','2014-01-16',-1);
405;
INSERT INTO `tablassincronizar` VALUES (12,'conceptos','EXPORTAR','2014-01-16',-1);
406;
INSERT INTO `tablassincronizar` VALUES (13,'condicioniva','EXPORTAR','2014-01-16',-1);
407;
INSERT INTO `tablassincronizar` VALUES (17,'cuponestarjetas','EXPORTAR','2014-01-16',-1);
408;
INSERT INTO `tablassincronizar` VALUES (18,'depositos','EXPORTAR','2014-01-16',-1);
409;
INSERT INTO `tablassincronizar` VALUES (19,'documentocompradetalles','EXPORTAR','2014-01-16',-1);
410;
INSERT INTO `tablassincronizar` VALUES (20,'documentocompradocus','EXPORTAR','2014-01-16',-1);
411;
INSERT INTO `tablassincronizar` VALUES (21,'documentocomprapagos','EXPORTAR','2014-01-16',-1);
412;
INSERT INTO `tablassincronizar` VALUES (22,'documentopagos','EXPORTAR','2014-01-16',-1);
413;
INSERT INTO `tablassincronizar` VALUES (23,'documentoscompras','EXPORTAR','2014-01-16',-1);
414;
INSERT INTO `tablassincronizar` VALUES (24,'documentosventas','EXPORTAR','2014-01-16',-1);
415;
INSERT INTO `tablassincronizar` VALUES (25,'documentoventadetalles','EXPORTAR','2014-01-16',-1);
416;
INSERT INTO `tablassincronizar` VALUES (26,'documentoventadocus','EXPORTAR','2014-01-16',-1);
417;
INSERT INTO `tablassincronizar` VALUES (27,'documentoventapersonal','EXPORTAR','2014-01-16',-1);
418;
INSERT INTO `tablassincronizar` VALUES (28,'docuvendetcomisionesvendedores','EXPORTAR','2014-01-16',-1);
419;
INSERT INTO `tablassincronizar` VALUES (29,'empresas','EXPORTAR','2014-01-16',-1);
420;
INSERT INTO `tablassincronizar` VALUES (30,'equipos','EXPORTAR','2014-01-16',-1);
421;
INSERT INTO `tablassincronizar` VALUES (32,'liquidacionborradordebcred','EXPORTAR','2014-01-16',-1);
422;
INSERT INTO `tablassincronizar` VALUES (33,'liquidacionborradordetalles','EXPORTAR','2014-01-16',-1);
423;
INSERT INTO `tablassincronizar` VALUES (34,'liquidacionesborradores','EXPORTAR','2014-01-16',-1);
424;
INSERT INTO `tablassincronizar` VALUES (35,'liquidacionessucursales','EXPORTAR','2014-01-16',-1);
425;
INSERT INTO `tablassincronizar` VALUES (36,'liquidacionesvendedores','EXPORTAR','2014-01-16',-1);
426;
INSERT INTO `tablassincronizar` VALUES (37,'liquisucudeta','EXPORTAR','2014-01-16',-1);
427;
INSERT INTO `tablassincronizar` VALUES (38,'liquisucudetarecibos','EXPORTAR','2014-01-16',-1);
428;
INSERT INTO `tablassincronizar` VALUES (39,'liquivendedeta','EXPORTAR','2014-01-16',-1);
429;
INSERT INTO `tablassincronizar` VALUES (40,'liquivendedoressucursales','EXPORTAR','2014-01-16',-1);
430;
INSERT INTO `tablassincronizar` VALUES (41,'localidades','EXPORTAR','2014-01-16',-1);
431;
INSERT INTO `tablassincronizar` VALUES (42,'menu','EXPORTAR','2014-01-16',-1);
432;
INSERT INTO `tablassincronizar` VALUES (43,'menuperfil','EXPORTAR','2014-01-16',-1);
433;
INSERT INTO `tablassincronizar` VALUES (44,'pagotarjeta','EXPORTAR','2014-01-16',-1);
434;
INSERT INTO `tablassincronizar` VALUES (45,'paises','EXPORTAR','2014-01-16',-1);
435;
INSERT INTO `tablassincronizar` VALUES (46,'perfiles','EXPORTAR','2014-01-16',-1);
436;
INSERT INTO `tablassincronizar` VALUES (47,'permisosespecialesperfil','EXPORTAR','2014-01-16',-1);
437;
INSERT INTO `tablassincronizar` VALUES (48,'personal','EXPORTAR','2014-01-16',-1);
438;
INSERT INTO `tablassincronizar` VALUES (49,'politicasdeprecios','EXPORTAR','2014-01-16',-1);
439;
INSERT INTO `tablassincronizar` VALUES (50,'productodeposito','EXPORTAR','2014-01-16',-1);
440;
INSERT INTO `tablassincronizar` VALUES (51,'productos','EXPORTAR','2014-01-16',-1);
441;
INSERT INTO `tablassincronizar` VALUES (52,'protegidospass','EXPORTAR','2014-01-16',-1);
442;
INSERT INTO `tablassincronizar` VALUES (53,'proveedores','EXPORTAR','2014-01-16',-1);
443;
INSERT INTO `tablassincronizar` VALUES (54,'provincias','EXPORTAR','2014-01-16',-1);
444;
INSERT INTO `tablassincronizar` VALUES (55,'puntodeventa','EXPORTAR','2014-01-16',-1);
445;
INSERT INTO `tablassincronizar` VALUES (56,'rubros','EXPORTAR','2014-01-16',-1);
446;
INSERT INTO `tablassincronizar` VALUES (57,'sucursales','EXPORTAR','2014-01-16',-1);
447;
INSERT INTO `tablassincronizar` VALUES (58,'sucursalesdebcred','EXPORTAR','2014-01-16',-1);
448;
INSERT INTO `tablassincronizar` VALUES (60,'tarjetacuotas','EXPORTAR','2014-01-16',-1);
449;
INSERT INTO `tablassincronizar` VALUES (61,'tarjetas','EXPORTAR','2014-01-16',-1);
450;
INSERT INTO `tablassincronizar` VALUES (64,'tipodocumentofiscal','EXPORTAR','2014-01-16',-1);
451;
INSERT INTO `tablassincronizar` VALUES (65,'tipoiva','EXPORTAR','2014-01-16',-1);
452;
INSERT INTO `tablassincronizar` VALUES (66,'tiposdocumento','EXPORTAR','2014-01-16',-1);
453;
INSERT INTO `tablassincronizar` VALUES (67,'tipospago','EXPORTAR','2014-01-16',-1);
454;
INSERT INTO `tablassincronizar` VALUES (68,'vendedoresdebcred','EXPORTAR','2014-01-16',-1);
455;
INSERT INTO `tablassincronizar` VALUES (69,'ajustestock','IMPORTAR',NULL,0);
456;
INSERT INTO `tablassincronizar` VALUES (70,'ajustestockdetalles','IMPORTAR',NULL,0);
457;
INSERT INTO `tablassincronizar` VALUES (71,'cajaasientos','IMPORTAR',NULL,0);
458;
INSERT INTO `tablassincronizar` VALUES (72,'cajas','IMPORTAR',NULL,0);
459;
INSERT INTO `tablassincronizar` VALUES (73,'calculopreciodeta','IMPORTAR',NULL,0);
460;
INSERT INTO `tablassincronizar` VALUES (74,'calculopreciodetaprod','IMPORTAR',NULL,0);
461;
INSERT INTO `tablassincronizar` VALUES (75,'calculoprecios','IMPORTAR',NULL,0);
462;
INSERT INTO `tablassincronizar` VALUES (76,'clientes','IMPORTAR',NULL,0);
463;
INSERT INTO `tablassincronizar` VALUES (77,'clientevehiculo','IMPORTAR',NULL,0);
464;
INSERT INTO `tablassincronizar` VALUES (78,'comisionessucursal','IMPORTAR',NULL,0);
465;
INSERT INTO `tablassincronizar` VALUES (79,'comisionesvendedor','IMPORTAR',NULL,0);
466;
INSERT INTO `tablassincronizar` VALUES (80,'conceptos','IMPORTAR',NULL,0);
467;
INSERT INTO `tablassincronizar` VALUES (81,'condicioniva','IMPORTAR',NULL,0);
468;
INSERT INTO `tablassincronizar` VALUES (82,'cuponestarjetas','IMPORTAR',NULL,0);
469;
INSERT INTO `tablassincronizar` VALUES (83,'depositos','IMPORTAR',NULL,0);
470;
INSERT INTO `tablassincronizar` VALUES (84,'documentocompradetalles','IMPORTAR',NULL,0);
471;
INSERT INTO `tablassincronizar` VALUES (85,'documentocompradocus','IMPORTAR',NULL,0);
472;
INSERT INTO `tablassincronizar` VALUES (86,'documentocomprapagos','IMPORTAR',NULL,0);
473;
INSERT INTO `tablassincronizar` VALUES (87,'documentopagos','IMPORTAR',NULL,0);
474;
INSERT INTO `tablassincronizar` VALUES (88,'documentoscompras','IMPORTAR',NULL,0);
475;
INSERT INTO `tablassincronizar` VALUES (89,'documentosventas','IMPORTAR',NULL,0);
476;
INSERT INTO `tablassincronizar` VALUES (90,'documentoventadetalles','IMPORTAR',NULL,0);
477;
INSERT INTO `tablassincronizar` VALUES (91,'documentoventadocus','IMPORTAR',NULL,0);
478;
INSERT INTO `tablassincronizar` VALUES (92,'documentoventapersonal','IMPORTAR',NULL,0);
479;
INSERT INTO `tablassincronizar` VALUES (93,'docuvendetcomisionesvendedores','IMPORTAR',NULL,0);
480;
INSERT INTO `tablassincronizar` VALUES (94,'empresas','IMPORTAR',NULL,0);
481;
INSERT INTO `tablassincronizar` VALUES (95,'equipos','IMPORTAR',NULL,0);
482;
INSERT INTO `tablassincronizar` VALUES (97,'liquidacionborradordebcred','IMPORTAR',NULL,0);
483;
INSERT INTO `tablassincronizar` VALUES (98,'liquidacionborradordetalles','IMPORTAR',NULL,0);
484;
INSERT INTO `tablassincronizar` VALUES (99,'liquidacionesborradores','IMPORTAR',NULL,0);
485;
INSERT INTO `tablassincronizar` VALUES (100,'liquidacionessucursales','IMPORTAR',NULL,0);
486;
INSERT INTO `tablassincronizar` VALUES (101,'liquidacionesvendedores','IMPORTAR',NULL,0);
487;
INSERT INTO `tablassincronizar` VALUES (102,'liquisucudeta','IMPORTAR',NULL,0);
488;
INSERT INTO `tablassincronizar` VALUES (103,'liquisucudetarecibos','IMPORTAR',NULL,0);
489;
INSERT INTO `tablassincronizar` VALUES (104,'liquivendedeta','IMPORTAR',NULL,0);
490;
INSERT INTO `tablassincronizar` VALUES (105,'liquivendedoressucursales','IMPORTAR',NULL,0);
491;
INSERT INTO `tablassincronizar` VALUES (106,'localidades','IMPORTAR',NULL,0);
492;
INSERT INTO `tablassincronizar` VALUES (107,'menu','IMPORTAR',NULL,0);
493;
INSERT INTO `tablassincronizar` VALUES (108,'menuperfil','IMPORTAR',NULL,0);
494;
INSERT INTO `tablassincronizar` VALUES (109,'pagotarjeta','IMPORTAR',NULL,0);
495;
INSERT INTO `tablassincronizar` VALUES (110,'paises','IMPORTAR',NULL,0);
496;
INSERT INTO `tablassincronizar` VALUES (111,'perfiles','IMPORTAR',NULL,0);
497;
INSERT INTO `tablassincronizar` VALUES (112,'permisosespecialesperfil','IMPORTAR',NULL,0);
498;
INSERT INTO `tablassincronizar` VALUES (113,'personal','IMPORTAR',NULL,0);
499;
INSERT INTO `tablassincronizar` VALUES (114,'politicasdeprecios','IMPORTAR',NULL,0);
500;
INSERT INTO `tablassincronizar` VALUES (115,'productodeposito','IMPORTAR',NULL,0);
501;
INSERT INTO `tablassincronizar` VALUES (116,'productos','IMPORTAR',NULL,0);
502;
INSERT INTO `tablassincronizar` VALUES (117,'protegidospass','IMPORTAR',NULL,0);
503;
INSERT INTO `tablassincronizar` VALUES (118,'proveedores','IMPORTAR',NULL,0);
504;
INSERT INTO `tablassincronizar` VALUES (119,'provincias','IMPORTAR',NULL,0);
505;
INSERT INTO `tablassincronizar` VALUES (120,'puntodeventa','IMPORTAR',NULL,0);
506;
INSERT INTO `tablassincronizar` VALUES (121,'rubros','IMPORTAR',NULL,0);
507;
INSERT INTO `tablassincronizar` VALUES (122,'sucursales','IMPORTAR',NULL,0);
508;
INSERT INTO `tablassincronizar` VALUES (123,'sucursalesdebcred','IMPORTAR',NULL,0);
509;
INSERT INTO `tablassincronizar` VALUES (124,'tarjetacuotas','IMPORTAR',NULL,0);
510;
INSERT INTO `tablassincronizar` VALUES (125,'tarjetas','IMPORTAR',NULL,0);
511;
INSERT INTO `tablassincronizar` VALUES (126,'tipodocumentofiscal','IMPORTAR',NULL,0);
512;
INSERT INTO `tablassincronizar` VALUES (127,'tipoiva','IMPORTAR',NULL,0);
513;
INSERT INTO `tablassincronizar` VALUES (128,'tiposdocumento','IMPORTAR',NULL,0);
514;
INSERT INTO `tablassincronizar` VALUES (129,'tipospago','IMPORTAR',NULL,0);
515;
INSERT INTO `tablassincronizar` VALUES (130,'vendedoresdebcred','IMPORTAR',NULL,0);
516;
INSERT INTO `config` SET `config_nombre`='ULTIMAEXPORTACION';
517;
INSERT INTO `config` SET `config_nombre`='PROXIMAEXPORTACION';
518;
INSERT INTO `config` SET `config_nombre`='ULTIMAIMPORTACION';
520;
INSERT INTO `config` SET `config_nombre`='PROXIMAIMPORTACION';
521;
UPDATE `config` SET `config_valor`='01/01/2014' WHERE `config_nombre`='ULTIMAEXPORTACION';
522;
UPDATE `config` SET `config_valor`='01/01/2014' WHERE `config_nombre`='ULTIMAIMPORTACION';
523;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('94', '>Contabilidad', '0', 'AdvPageContabilidad', '', '0', '0', '');
524;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,94,perfil_id,-1 from perfiles;
525;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('95', '>Contabilidad>Libros IVAs', '0', 'AdvToolBarLibrosIvas', '', '0', '0', '');
526;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,95,perfil_id,-1 from perfiles;
527;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('96', '>Contabilidad>Libros IVAs>Estado IVA', '0', 'btnestadoiva', '', '0', '0', '');
528;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,96,perfil_id,-1 from perfiles;
529;
CREATE  TABLE IF NOT EXISTS `logs` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `log_fecha` DATE NULL DEFAULT NULL ,
  `log_hora` TIME NULL DEFAULT NULL ,
  `personal_id` INT(11) NULL DEFAULT NULL ,
  `log_accion` VARCHAR(150) NULL DEFAULT NULL ,
  `log_pcname` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`log_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
530;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAKdAvm0+7DyPteQY85UbD2k=\r\n' WHERE `empresa_id`=1;
531;
INSERT INTO `configcolumnas` SET `configcolumna_id`=2,`configcolumna_grilla`='Tbusquedaproductos.DBGrid1',`configcolumna_nombre`='Busqueda de Productos',`configcolumna_anchoventana`=1130;
532;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=13,`configcolumnadeta_campo`='producto_id',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Codigo',`configcolumna_id`=2;
533;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=14,`configcolumnadeta_campo`='producto_codigo',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Codigo2',`configcolumna_id`=2;
534;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=15,`configcolumnadeta_campo`='producto_nombre',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Nombre',`configcolumna_id`=2;
534;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=16,`configcolumnadeta_campo`='producto_preciocosto',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='P.Compra',`configcolumna_id`=2;
536;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=17,`configcolumnadeta_campo`='producto_precioventa1',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='P.Venta1',`configcolumna_id`=2;
537;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=18,`configcolumnadeta_campo`='producto_precioventa2',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='P.Venta2',`configcolumna_id`=2;
538;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=19,`configcolumnadeta_campo`='producdepo_stockactual',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Stock',`configcolumna_id`=2;
539;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=20,`configcolumnadeta_campo`='rubro_nombre',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Rubro',`configcolumna_id`=2;
540;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=21,`configcolumnadeta_campo`='proveedor_nombre',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Proveedor',`configcolumna_id`=2;
541;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=22,`configcolumnadeta_campo`='producto_fechaactualizacionprecio',`configcolumnadeta_visible`=-1,`configcolumnadeta_titulo`='Actualizado',`configcolumna_id`=2;
542;
INSERT INTO `config` SET `config_nombre`='FACTURAVENTATIPO', `config_valor`='0';
543;
INSERT INTO `config` SET `config_nombre`='VENTANAPRODUCTOTIPO', `config_valor`='0';
544;
INSERT INTO `tipospago` SET `tipopago_id`=5,`tipopago_nombre`='RETENCION',`tipopago_caja`=0;
545;
Replace config set config_valor='0', config_nombre='SOLICITARPASSVENDEDORVENTAS';
546;
ALTER TABLE `personal` ADD COLUMN `personal_auxstring1` VARCHAR(45) NULL DEFAULT NULL  AFTER `personal_auxint1` ;
547;
CREATE  TABLE IF NOT EXISTS `marcas` (
  `marca_id` INT(11) NOT NULL ,
  `marca_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`marca_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
548;
CREATE  TABLE IF NOT EXISTS `secciones` (
  `seccion_id` INT(11) NOT NULL ,
  `seccion_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`seccion_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
549;
CREATE  TABLE IF NOT EXISTS `curvas` (
  `curva_id` INT(11) NOT NULL ,
  `curva_descripcion` VARCHAR(100) NULL DEFAULT NULL ,
  `seccion_id` INT(11) NOT NULL ,
  `marca_id` INT(11) NOT NULL ,
  PRIMARY KEY (`curva_id`) ,
  INDEX `fk_curvas_secciones1` (`seccion_id` ASC) ,
  INDEX `fk_curvas_marcas1` (`marca_id` ASC) ,
  CONSTRAINT `fk_curvas_secciones1`
    FOREIGN KEY (`seccion_id` )
    REFERENCES `secciones` (`seccion_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curvas_marcas1`
    FOREIGN KEY (`marca_id` )
    REFERENCES `marcas` (`marca_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
550;
CREATE  TABLE IF NOT EXISTS `curvadetalles` (
  `curvadetalle_id` INT(11) NOT NULL ,
  `curvadetalle_talle` VARCHAR(10) NULL DEFAULT NULL ,
  `curva_id` INT(11) NOT NULL ,
  PRIMARY KEY (`curvadetalle_id`) ,
  INDEX `fk_curvadetalles_curvas1` (`curva_id` ASC) ,
  CONSTRAINT `fk_curvadetalles_curvas1`
    FOREIGN KEY (`curva_id` )
    REFERENCES `curvas` (`curva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
551;
ALTER TABLE `curvas` ADD COLUMN `rubro_id` INT(11) NOT NULL  AFTER `marca_id` , 
  ADD CONSTRAINT `fk_curvas_rubros1`
  FOREIGN KEY (`rubro_id` )
  REFERENCES `rubros` (`rubro_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_curvas_rubros1` (`rubro_id` ASC) ;
552;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('97', '>Archivo>General>Curvas', '0', 'btncurvas', '', '0', '0', 'Tlistacurvas');
553;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,97,perfil_id,-1 from perfiles;
554;
ALTER TABLE `marcas` ADD COLUMN `marca_longitudcodigo` INT(3) NULL DEFAULT NULL  AFTER `marca_nombre` ;
555;
CREATE  TABLE IF NOT EXISTS `movimientosdepositos` (
  `movimientodeposito_id` INT(11) NOT NULL ,
  `movimientodeposito_fecha` DATE NULL DEFAULT NULL ,
  `movimientodeposito_hora` TIME NULL DEFAULT NULL ,
  `movimientodeposito_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `movimientodeposito_estadosinc` VARCHAR(45) NULL DEFAULT NULL ,
  `movimientodeposito_observaciones` VARCHAR(255) NULL DEFAULT NULL ,
  `deposito_idorigen` INT(11) NULL DEFAULT NULL ,
  `deposito_iddestino` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`movimientodeposito_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
556;
CREATE  TABLE IF NOT EXISTS `movimdepodetalles` (
  `movimdepodetalle_id` INT(11) NOT NULL ,
  `movimdepodetalle_cantidadenviar` FLOAT(10,2) NULL DEFAULT NULL ,
  `movimdepodetalle_cantidadrecibir` FLOAT(10,2) NULL DEFAULT NULL ,
  `movimdepodetalle_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `producto_id` INT(11) NOT NULL ,
  `movimientodeposito_id` INT(11) NOT NULL ,
  PRIMARY KEY (`movimdepodetalle_id`) ,
  INDEX `fk_movimdepodetalles_productos1` (`producto_id` ASC) ,
  INDEX `fk_movimdepodetalles_movimientosdepositos1` (`movimientodeposito_id` ASC) ,
  CONSTRAINT `fk_movimdepodetalles_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimdepodetalles_movimientosdepositos1`
    FOREIGN KEY (`movimientodeposito_id` )
    REFERENCES `movimientosdepositos` (`movimientodeposito_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
557;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('98', '>Compras>Stock>Movimientos entre Depositos', '0', 'BtnMovimientosDepositos', '', '0', '0', 'TListaMovimientosDepositos');
558;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,98,perfil_id,-1 from perfiles;
560;
CREATE  TABLE IF NOT EXISTS `curvascodigos` (
  `curvacodigo_id` INT(11) NOT NULL ,
  `curvacodigo_codigo` VARCHAR(45) NULL DEFAULT NULL ,
  `marca_id` INT(11) NOT NULL ,
  `seccion_id` INT(11) NOT NULL ,
  `rubro_id` INT(11) NOT NULL ,
  PRIMARY KEY (`curvacodigo_id`) ,
  INDEX `fk_curvascodigos_marcas1` (`marca_id` ASC) ,
  INDEX `fk_curvascodigos_secciones1` (`seccion_id` ASC) ,
  INDEX `fk_curvascodigos_rubros1` (`rubro_id` ASC) ,
  CONSTRAINT `fk_curvascodigos_marcas1`
    FOREIGN KEY (`marca_id` )
    REFERENCES `marcas` (`marca_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curvascodigos_secciones1`
    FOREIGN KEY (`seccion_id` )
    REFERENCES `secciones` (`seccion_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curvascodigos_rubros1`
    FOREIGN KEY (`rubro_id` )
    REFERENCES `rubros` (`rubro_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
561;
CREATE  TABLE IF NOT EXISTS `curvatallescodigos` (
  `curvatallecodigo_id` INT(11) NOT NULL ,
  `curvatallecodigo_codigo` VARCHAR(45) NULL DEFAULT NULL ,
  `curvadetalle_id` INT(11) NOT NULL ,
  `curvacodigo_id` INT(11) NOT NULL ,
  PRIMARY KEY (`curvatallecodigo_id`) ,
  INDEX `fk_curvatallescodigos_curvadetalles1` (`curvadetalle_id` ASC) ,
  INDEX `fk_curvatallescodigos_curvascodigos1` (`curvacodigo_id` ASC) ,
  CONSTRAINT `fk_curvatallescodigos_curvadetalles1`
    FOREIGN KEY (`curvadetalle_id` )
    REFERENCES `curvadetalles` (`curvadetalle_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curvatallescodigos_curvascodigos1`
    FOREIGN KEY (`curvacodigo_id` )
    REFERENCES `curvascodigos` (`curvacodigo_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
562;
INSERT INTO `config` SET `config_nombre`='RECONECTARDB',`config_valor`='20';
563;
INSERT INTO `config` SET `config_nombre`='PREFIJOTABLAWEB', `config_valor`='';
564;
ALTER TABLE `movimientosdepositos` 
CHANGE COLUMN `deposito_idorigen` `deposito_idorigen` INT(11) NOT NULL  , 
CHANGE COLUMN `deposito_iddestino` `deposito_iddestino` INT(11) NOT NULL  
, DROP PRIMARY KEY 
, ADD PRIMARY KEY (`movimientodeposito_id`, `deposito_idorigen`, `deposito_iddestino`) ;
565;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAK/b181aa8tVkrfZYsvormA=\r\n' WHERE `empresa_id`=1;
566;
ALTER TABLE `productodeposito` 
ADD COLUMN `producdepo_estadosinc` VARCHAR(45) NULL DEFAULT 'PENDIENTE'  AFTER `producdepo_stockinicial`;
568;
ALTER TABLE `productodeposito`
  ADD PRIMARY KEY (`producdepo_id`,`producto_id`,`deposito_id`),
  DROP PRIMARY KEY;
569;
ALTER TABLE `marcas` ADD COLUMN `marca_separadorcodigo` VARCHAR(5) NULL DEFAULT NULL  AFTER `marca_longitudcodigo` ;
570;
ALTER TABLE `productos` 
ADD COLUMN `marca_id` INT(11) NULL DEFAULT 0  AFTER `producto_tipo` , 
ADD COLUMN `seccion_id` INT(11) NULL DEFAULT 0  AFTER `marca_id`;
571;
ALTER TABLE `productos` 
ADD COLUMN `producto_talle` VARCHAR(45) NULL DEFAULT NULL  AFTER `seccion_id`;
572;
INSERT INTO `config` SET `config_nombre`='DEPOSITODEFECTO',`config_valor`='1';
573;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=131,`tablasinc_nombre`='movimientosdepositos',`tablasinc_tipooperacion`='EXPORTAR',`tablasinc_sincronizar`=0;
574;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=132,`tablasinc_nombre`='movimdepodetalles',`tablasinc_tipooperacion`='EXPORTAR',`tablasinc_sincronizar`=0;
575;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=133,`tablasinc_nombre`='movimientosdepositos',`tablasinc_tipooperacion`='IMPORTAR',`tablasinc_sincronizar`=0;
576;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=134,`tablasinc_nombre`='movimdepodetalles',`tablasinc_tipooperacion`='IMPORTAR',`tablasinc_sincronizar`=0;
577;
INSERT INTO `config` SET `config_nombre`='SINCRONIZARSTOCKTIMER',`config_valor`='0';
578;
ALTER TABLE `productos` ADD COLUMN `producto_estadosinc` VARCHAR(45) NULL DEFAULT 'PENDIENTE'  AFTER `producto_talle`;
579;
ALTER TABLE `tablassincronizar` ADD COLUMN `tablasinc_condicion` VARCHAR(150) NULL DEFAULT '1=1'  AFTER `tablasinc_sincronizar`;
580;
Replace config set config_valor='0', config_nombre='EXPORTACIONSINCMINUTOS';
581;
Replace config set config_valor='0', config_nombre='IMPORTACIONSINCMINUTOS';
582;
Replace config set config_valor='0', config_nombre='EXPORTACIONSINCSTOCK';
583;
Replace config set config_valor='0', config_nombre='IMPORTACIONSINCSTOCK';
584;
ALTER TABLE `productos` ADD COLUMN `producto_longitudcodigo` INT(3) NULL DEFAULT 0  AFTER `producto_estadosinc`;
585;
ALTER TABLE `temporales` 
ADD COLUMN `temporal_int6` INT(11) NULL DEFAULT NULL  AFTER `temporal_string10` , 
ADD COLUMN `temporal_int7` INT(11) NULL DEFAULT NULL  AFTER `temporal_int6` , 
ADD COLUMN `temporal_int8` INT(11) NULL DEFAULT NULL  AFTER `temporal_int7` , 
ADD COLUMN `temporal_int9` INT(11) NULL DEFAULT NULL  AFTER `temporal_int8` , 
ADD COLUMN `temporal_int10` INT(11) NULL DEFAULT NULL  AFTER `temporal_int9` , 
ADD COLUMN `temporal_int11` INT(11) NULL DEFAULT NULL  AFTER `temporal_int10` , 
ADD COLUMN `temporal_int12` INT(11) NULL DEFAULT NULL  AFTER `temporal_int11` , 
ADD COLUMN `temporal_int13` INT(11) NULL DEFAULT NULL  AFTER `temporal_int12` , 
ADD COLUMN `temporal_int14` INT(11) NULL DEFAULT NULL  AFTER `temporal_int13` , 
ADD COLUMN `temporal_int15` INT(11) NULL DEFAULT NULL  AFTER `temporal_int14` , 
ADD COLUMN `temporal_string11` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_int15` , 
ADD COLUMN `temporal_string12` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string11` , 
ADD COLUMN `temporal_string13` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string12` , 
ADD COLUMN `temporal_string14` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string13` , 
ADD COLUMN `temporal_string15` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string14` ;
586;
ALTER TABLE `temporales` 
ADD COLUMN `temporal_int16` INT(11) NULL DEFAULT NULL  AFTER `temporal_string15` , 
ADD COLUMN `temporal_int17` INT(11) NULL DEFAULT NULL  AFTER `temporal_int16` , 
ADD COLUMN `temporal_int18` INT(11) NULL DEFAULT NULL  AFTER `temporal_int17` , 
ADD COLUMN `temporal_int19` INT(11) NULL DEFAULT NULL  AFTER `temporal_int18` , 
ADD COLUMN `temporal_int20` INT(11) NULL DEFAULT NULL  AFTER `temporal_int19` , 
ADD COLUMN `temporal_string16` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_int20` , 
ADD COLUMN `temporal_string17` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string16` , 
ADD COLUMN `temporal_string18` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string17` , 
ADD COLUMN `temporal_string19` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string18` , 
ADD COLUMN `temporal_string20` VARCHAR(255) NULL DEFAULT NULL  AFTER `temporal_string19` ;
587;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('99', '>Ventas>Documentos>Carga Stock - Curvas', '0', 'BtnCargaStockCurvas', '', '0', '0', '');
588;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,99,perfil_id,-1 from perfiles;
589;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('100', '>Ventas>Documentos>Consultas Stock - Curvas', '0', 'BtnConsultaStockCurvas', '', '0', '0', '');
590;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,100,perfil_id,-1 from perfiles;
591;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('101', '>Ventas>Documentos>Factura de Venta - Directo', '0', 'BtnFacturaVentaDirecto', '', '0', '0', '');
592;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,101,perfil_id,-1 from perfiles;
593;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('102', '>Ventas>Documentos>Carga Stock - Lector', '0', 'BtnCargaStockLector', '', '0', '0', '');
594;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,102,perfil_id,-1 from perfiles;
595;
ALTER TABLE `ajustestockdetalles` ADD COLUMN `producto_codigobarras` VARCHAR(45) NULL DEFAULT NULL  AFTER `producto_id` ;
596;
ALTER TABLE `tipospago` ADD COLUMN `tipopago_codigo` VARCHAR(10) NULL DEFAULT NULL  AFTER `tipopago_caja` ;
597;
UPDATE `tablassincronizar` SET `tablasinc_condicion`='where 1=1';
598;
CREATE  TABLE IF NOT EXISTS `productosinc` (
  `productosinc_estado` VARCHAR(45) NULL DEFAULT 'PENDIENTE' ,
  `producto_id` INT(11) NOT NULL ,
  `sucursal_id` INT(11) NOT NULL ,
  PRIMARY KEY (`producto_id`, `sucursal_id`) ,
  INDEX `fk_productosinc_productos1` (`producto_id` ASC) ,
  INDEX `fk_productosinc_sucursales1` (`sucursal_id` ASC) ,
  CONSTRAINT `fk_productosinc_productos1`
    FOREIGN KEY (`producto_id` )
    REFERENCES `productos` (`producto_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productosinc_sucursales1`
    FOREIGN KEY (`sucursal_id` )
    REFERENCES `sucursales` (`sucursal_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
599;
CREATE TRIGGER `triginssinc` AFTER INSERT ON `productos`
  FOR EACH ROW replace INTO `productosinc` select 'PENDIENTE', NEW.producto_id, sucursal_id from sucursales;
600;
CREATE TRIGGER `trigupdatesinc` AFTER UPDATE ON `productos`
  FOR EACH ROW replace INTO `productosinc` select 'PENDIENTE', NEW.producto_id, sucursal_id from sucursales;
601;
CREATE TRIGGER `trigdelsinc` before DELETE ON `productos`
  FOR EACH ROW delete from `productosinc` where producto_id=OLD.producto_id;
602;
ALTER TABLE `tablassincronizar` 
ADD COLUMN `tablasinc_aftersinc` VARCHAR(255) NULL DEFAULT NULL  AFTER `tablasinc_condicion` , 
ADD COLUMN `tablasinc_campoid` VARCHAR(100) NULL DEFAULT NULL  AFTER `tablasinc_aftersinc`;
603;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=135,`tablasinc_nombre`='secciones',`tablasinc_tipooperacion`='EXPORTAR',`tablasinc_sincronizar`=0,`tablasinc_condicion`='where 1=1';
604;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=136,`tablasinc_nombre`='secciones',`tablasinc_tipooperacion`='IMPORTAR',`tablasinc_sincronizar`=0,`tablasinc_condicion`='where 1=1';
605;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=137,`tablasinc_nombre`='marcas',`tablasinc_tipooperacion`='EXPORTAR',`tablasinc_sincronizar`=0,`tablasinc_condicion`='where 1=1';
606;
INSERT INTO `tablassincronizar` SET `tablasinc_id`=138,`tablasinc_nombre`='marcas',`tablasinc_tipooperacion`='IMPORTAR',`tablasinc_sincronizar`=0,`tablasinc_condicion`='where 1=1';
607;
ALTER TABLE `productodeposito`
  CHANGE COLUMN `producdepo_id` `producdepo_id` int(11) NOT NULL,
  ADD PRIMARY KEY (`producto_id`,`deposito_id`),
  DROP PRIMARY KEY;
608;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAKiaczETyVhxtb4Bo0t8O0o=\r\n' WHERE `empresa_id`=1;
609;
INSERT INTO `config` SET `config_nombre`='SINCSUBIRSTOCK',`config_valor`='-1';
610;
INSERT INTO `config` SET `config_nombre`='SINCDESCARGARSTOCK',`config_valor`='-1';
611;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPOCONFIRMAUTO',`config_valor`='-1';
612;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPOPROCESAR',`config_valor`='-1';
613;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPOSUBIR',`config_valor`='-1';
614;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPOSUBIRCONFIRMACION',`config_valor`='-1';
615;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPODESCARGAR',`config_valor`='-1';
616;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPODESCARGARCONFIRM',`config_valor`='-1';
617;
INSERT INTO `config` SET `config_nombre`='COMPRADETALLESINIVA',`config_valor`='0';
618;
ALTER TABLE `movimdepodetalles` 
ADD COLUMN `deposito_idorigen` INT(11) NULL DEFAULT NULL  AFTER `movimientodeposito_id` , 
ADD COLUMN `deposito_iddestino` INT(11) NULL DEFAULT NULL  AFTER `deposito_idorigen`;
619;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPOESTADOSINCALCREAR',`config_valor`='PENDIENTE';
620;
INSERT INTO `config` SET `config_nombre`='MOVIMDEPOESTADOSINCALSUBIR',`config_valor`='DESCARGAR';
621;
ALTER TABLE `movimdepodetalles` 
CHANGE COLUMN `movimdepodetalle_id` `movimdepodetalle_id` INT(11) NOT NULL AUTO_INCREMENT;
622;
INSERT INTO `config` SET `config_nombre`='PRESUPUESTOMOSTRAR2DOPRECIO',`config_valor`='0';
623;
INSERT INTO `config` SET `config_nombre`='IDENTIFICARUSUARIO',`config_valor`='0';
624;
CREATE  TABLE IF NOT EXISTS `bancos` (
  `banco_id` INT(11) NOT NULL ,
  `banco_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`banco_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
625;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('103', '>Archivo>General>Bancos', '0', 'BtnBancos', '', '0', '0', 'TListaBancos');
626;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,103,perfil_id,-1 from perfiles;
627;
CREATE  TABLE IF NOT EXISTS `cheques` (
  `cheque_id` INT(11) NOT NULL ,
  `cheque_numero` VARCHAR(45) NULL DEFAULT NULL ,
  `cheque_fechavenc` DATE NULL DEFAULT NULL ,
  `cheque_importe` FLOAT(20,2) NULL DEFAULT NULL ,
  `documentopago_id` INT(11) NOT NULL ,
  PRIMARY KEY (`cheque_id`) ,
  INDEX `fk_cheques_documentopagos1` (`documentopago_id` ASC) ,
  CONSTRAINT `fk_cheques_documentopagos1`
    FOREIGN KEY (`documentopago_id` )
    REFERENCES `documentopagos` (`documentopago_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
628;
ALTER TABLE `cheques` ADD COLUMN `banco_id` INT(11) NOT NULL  AFTER `documentopago_id` , 
  ADD CONSTRAINT `fk_cheques_bancos1`
  FOREIGN KEY (`banco_id` )
  REFERENCES `bancos` (`banco_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_cheques_bancos1` (`banco_id` ASC) ;
629;
INSERT INTO `config` select 'MOSTRARPRODUCTOSOCULTOSLISTA', config_valor from config where config_nombre='MOSTRARPRODUCTOSOCULTOS';
630;
Insert into menu (menu_id, menu_path, menu_tipo, menu_nomb, menu_form, menu_enabled, menu_visible, menu_lista) values ('104', '>Ventas>Caja>Cheques', '0', 'BtnCheques', '', '0', '0', '');
631;
INSERT INTO menuperfil select 0, -1,-1,-1,-1,-1,-1,-1,104,perfil_id,-1 from perfiles;
632;
ALTER TABLE `marcas` ADD COLUMN `marca_usatalles` INT(3) NULL DEFAULT -1  AFTER `marca_separadorcodigo` ;
633;
INSERT INTO `config` SET `config_nombre`='TIPOREDONDEOIMPORTE',`config_valor`='0';
634;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAE2DqtmnilVLXLFGQPUpRus=\r\n' WHERE `empresa_id`=1;
635;
ALTER TABLE `documentosventas` 
ADD COLUMN `documentoventa_perciva` FLOAT(20,2) NULL DEFAULT 0  AFTER `documentoventa_descuento`;
636;
ALTER TABLE `sucursales` ADD COLUMN `sucursal_percivaporc` FLOAT(5,2) NULL DEFAULT 0  AFTER `sucursal_tipodocumentoliquidar`;
637;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAABHKYTPIGunY69PQdH7jCro=\r\n' WHERE `empresa_id`=1;
638;
ALTER TABLE `documentoscompras` ADD COLUMN `documentocompra_fechaiva` DATE NULL DEFAULT NULL  AFTER `documentocompra_dgrperc`;
639;
update documentoscompras set documentocompra_fechaiva=documentocompra_fecha;
640;
ALTER TABLE `personal` ADD COLUMN `personal_ivaliquidaciones` FLOAT(5,2) NULL DEFAULT 0  AFTER `personal_auxstring1` ;
641;
INSERT INTO `config` SET `config_nombre`='LIQUIDACIONVENDEDOR',`config_valor`='0';
642;
INSERT INTO `config` SET `config_nombre`='MOSTRARSTOCKSEGUNDODEPOSITO',`config_valor`='0';
643;
INSERT INTO `config` SET `config_nombre`='SEGUNDODEPOSITODEFECTO',`config_valor`='2';
644;
INSERT INTO `configcolumnadetalles` SET `configcolumnadeta_id`=23,`configcolumnadeta_campo`='producdepo_stockactual_1',`configcolumnadeta_visible`=0,`configcolumnadeta_titulo`='Stock2',`configcolumna_id`=2;
645;
UPDATE `empresas` SET `empresa_razonsocial`='CgAAAJc4b4yH1RZCjq6Ed7eqGms=\r\n' WHERE `empresa_id`=1;
646;
INSERT INTO `config` SET `config_nombre`='CARGARSTOCKENPRODUCTOS',`config_valor`='0';