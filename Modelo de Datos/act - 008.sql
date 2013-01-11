SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`tiposdocumento` ADD COLUMN `tipodocufiscal_id` INT(11) NOT NULL  AFTER `tipodocu_fiscal` , CHANGE COLUMN `tipodocu_id` `tipodocu_id` INT(11) NOT NULL  FIRST , 
  ADD CONSTRAINT `fk_tiposdocumento_tipodocumentofiscal1`
  FOREIGN KEY (`tipodocufiscal_id` )
  REFERENCES `dbborgest`.`tipodocumentofiscal` (`tipodocufiscal_id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_tiposdocumento_tipodocumentofiscal1` (`tipodocufiscal_id` ASC) ;

ALTER TABLE `dbborgest`.`empresas` ADD COLUMN `empresa_tipo` VARCHAR(45) NULL DEFAULT NULL  AFTER `empresa_cuit` ;

CREATE  TABLE IF NOT EXISTS `dbborgest`.`tipodocumentofiscal` (
  `tipodocufiscal_id` INT(11) NOT NULL ,
  `tipodocufiscal_nombre` VARCHAR(100) NULL DEFAULT NULL ,
  PRIMARY KEY (`tipodocufiscal_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (48,'Factura A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (49,'Factura B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (50,'Ticket Nota de Debito A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (51,'Ticket Nota de Debito B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (52,'Ticket Nota de Credito A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (53,'Ticket Nota de Credito B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (65,'Ticket Factura A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (66,'Ticket Factura B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (68,'Nota de Debito A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (69,'Nota de Debito B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (82,'Nota de Credito A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (83,'Nota de Credito B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (84,'Ticket C');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (97,'Recibo A');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (98,'Recibo B');
INSERT INTO `tipodocumentofiscal` (`tipodocufiscal_id`,`tipodocufiscal_nombre`) VALUES (114,'Remito');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
