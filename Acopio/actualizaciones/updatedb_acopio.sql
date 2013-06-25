1;
ALTER TABLE `documentos` 
ADD COLUMN `entidaddadorcarga_id` INT(11) NULL DEFAULT NULL  AFTER `documento_tara` , 
ADD COLUMN `documento_chofer` VARCHAR(100) NULL DEFAULT NULL  AFTER `entidaddadorcarga_id` , 
ADD COLUMN `documento_chofercuit` VARCHAR(45) NULL DEFAULT NULL  AFTER `documento_chofer` , 
ADD COLUMN `documento_transpchasis` VARCHAR(45) NULL DEFAULT NULL  AFTER `documento_chofercuit` , 
ADD COLUMN `documento_transpacoplado` VARCHAR(45) NULL DEFAULT NULL  AFTER `documento_transpchasis` , 
ADD COLUMN `documento_transptarifaflete` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documento_transpacoplado` , 
ADD COLUMN `documento_transpanticipo` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documento_transptarifaflete` , 
ADD COLUMN `documento_cartaportetarifaflete` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documento_transpanticipo`;
2;
replace config SET config_valor='http://www.borgest.com.ar/updates/acopio', config_nombre='LINKARCHIVOS';
3;
replace config SET config_valor='http://www.borgest.com.ar/updates/acopio/updatedb_acopio.sql', config_nombre='LINKSCRIPTDB';
4;
ALTER TABLE `documentosdocu` ADD COLUMN `documentodocu_tiporelacion` VARCHAR(45) NULL DEFAULT 'IMPUTACION'  AFTER `documento_idpago`;
5;
DROP TABLE IF EXISTS `documentopagos`;
6;
CREATE  TABLE IF NOT EXISTS `documentopagos` (
  `documentopago_id` INT(11) NOT NULL ,
  `documentopago_importe` FLOAT(20,4) NULL DEFAULT NULL ,
  `documentopago_nombre` VARCHAR(150) NULL DEFAULT NULL ,
  `tipopago_id` INT(11) NOT NULL ,
  `documento_id` INT(11) NOT NULL ,
  PRIMARY KEY (`documentopago_id`) ,
  INDEX `fk_documentopagos_tipospago1` (`tipopago_id` ASC) ,
  INDEX `fk_documentopagos_documentos1` (`documento_id` ASC) ,
  CONSTRAINT `fk_documentopagos_tipospago1`
    FOREIGN KEY (`tipopago_id` )
    REFERENCES `tipospago` (`tipopago_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentopagos_documentos1`
    FOREIGN KEY (`documento_id` )
    REFERENCES `documentos` (`documento_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;
7;
INSERT INTO `tipospago` VALUES (1,'EFECTIVO',-1);
8;
INSERT INTO `tipospago` VALUES (2,'TARJETA',-1);
9;
INSERT INTO `tipospago` VALUES (3,'CHEQUE',-1);
10;
INSERT INTO `tipospago` VALUES (4,'DEPOSITO',0);
11;
ALTER TABLE `documentos` ADD COLUMN `documento_nogravado` FLOAT(20,4) NULL DEFAULT NULL  AFTER `documento_cartaportetarifaflete`;
12;
Replace config set config_valor='0', config_nombre='LOGDB';
