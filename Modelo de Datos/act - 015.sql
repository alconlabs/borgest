SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `documentoventadetalles` 
ADD COLUMN `documentoventadetalle_importe1` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventa_id` , 
ADD COLUMN `documentoventadetalle_importe2` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe1` , 
ADD COLUMN `documentoventadetalle_importe3` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe2` , 
ADD COLUMN `documentoventadetalle_importe4` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe3` , 
ADD COLUMN `documentoventadetalle_importe5` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe4` , 
ADD COLUMN `documentoventadetalle_importe6` FLOAT(20,4) NULL DEFAULT 0  AFTER `documentoventadetalle_importe5`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
