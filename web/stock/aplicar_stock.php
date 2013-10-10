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

if ($agregar!=0){
	$cantidad=$agregar;	
};
if ($aplicar!=0){
	$cantidad=$aplicar-$stockactual;	
};

if ($cantidad!=0){
	$conex->Update("call actualizarstockproductos($producto_id,$deposito_id,$cantidad)");		
};

header("location: lista_productos.php?producto_id=$producto_id&producto_nombre=$producto_nombre");

?>