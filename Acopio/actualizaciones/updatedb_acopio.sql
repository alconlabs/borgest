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