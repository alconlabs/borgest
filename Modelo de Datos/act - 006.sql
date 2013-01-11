SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbborgest`.`productos` 
ADD INDEX `producto_codigo` (`producto_codigo` ASC) 
, ADD INDEX `producto_codigobarras` (`producto_codigobarras` ASC) ;


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
