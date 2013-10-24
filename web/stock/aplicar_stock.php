<?php 
require_once("Connections/conex.php");
require_once("config.php");
$conex = new ConexionBD();
$producto_id=$_POST["producto_id"];
$producto_nombre=$_POST["producto_nombre"];
$agregar=$_POST["agregar"];
$aplicar=$_POST["aplicar"];
$stockactual=$_POST["stockactual"];
$cantidad=0;
$ajustestock_observaciones="IP:".getenv("REMOTE_ADDR")." - ".$_SERVER['HTTP_USER_AGENT'];

if ($agregar!=0){
	$cantidad=$agregar;	
};
if ($aplicar!=0){
	$cantidad=$aplicar-$stockactual;	
};

if ($cantidad!=0){
	$conex->Update("call actualizarstockproductos($producto_id,$deposito_id,$cantidad)");
	$ajustestock_id=$conex->Codigo("ajustestock","ajustestock_id");
	
	
					
	$conex->Update("insert into ajustestock set ajustestock_observaciones='$ajustestock_observaciones', 
				    personal_id=$personal_id, 
					deposito_id=$deposito_id, 
					ajustestock_estado='EJECUTADO', 
					ajustestock_hora=CURTIME(), 
					ajustestock_fecha=CURDATE(), 
					ajustestock_id=$ajustestock_id");
	
	
	$ajustestockdetalle_id=$conex->Codigo("ajustestockdetalles","ajustestockdetalle_id");
	$conex->Update("insert into ajustestockdetalles set 
                    producto_id=$producto_id, 
                    ajustestock_id=$ajustestock_id, 
                    ajustestockdetalle_cantidad=$cantidad, 
                    ajustestockdetalle_id=$ajustestockdetalle_id") ;
		
	};

header("location: lista_productos.php?producto_id=$producto_id&producto_nombre=$producto_nombre");

?>