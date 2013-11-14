<?php 
require_once("Connections/conex.php");
require_once("config.php");
$conex = new ConexionBD();
$producto_id=$_POST["producto_id"];
$producto_nombre=$_POST["producto_nombre"];
$etiquetas=$_POST["etiquetas"];

$ajustestock_observaciones="IP:".getenv("REMOTE_ADDR")." - ".$_SERVER['HTTP_USER_AGENT'];

if ($etiquetas!=0){
	if ($productos = $conex->Consulta("SELECT * from productos where producto_id=$producto_id")) {
		$imprimiretiqueta_id=$conex->Codigo("imprimiretiquetas","imprimiretiqueta_id");
		if ($imprimiretiqueta_id=="")
			$imprimiretiqueta_id=1;
			
		$imprimiretiqueta_codigo=$productos[0]->producto_codigo;
		$imprimiretiqueta_descripcion=$productos[0]->producto_nombre;
		
		$conex->Update("insert into imprimiretiquetas set
					   imprimiretiqueta_id=$imprimiretiqueta_id,
					   imprimiretiqueta_codigo=$imprimiretiqueta_codigo,
					   imprimiretiqueta_descripcion='$imprimiretiqueta_descripcion',
					   imprimiretiqueta_cantidad=$etiquetas");
		
		
	};
		
};

header("location: lista_productos.php?producto_id=$producto_id&producto_nombre=$producto_nombre");

?>