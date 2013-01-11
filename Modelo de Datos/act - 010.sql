SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

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


DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
