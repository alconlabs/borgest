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