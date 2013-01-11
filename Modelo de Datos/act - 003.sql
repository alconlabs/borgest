SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE  TABLE IF NOT EXISTS `dbborgest`.`documentoventadocus` (
  `documentoventadoc_id` INT(11) NOT NULL ,
  `documentoventadoc_importe` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_pagado` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_saldo` FLOAT(11) NULL DEFAULT NULL ,
  `documentoventa_estado` VARCHAR(45) NULL DEFAULT NULL ,
  `documentoventa_id` INT(11) NOT NULL ,
  `documentoventa_idpago` INT(11) NOT NULL ,
  PRIMARY KEY (`documentoventadoc_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
