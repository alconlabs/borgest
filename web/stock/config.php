<?php 
require_once("Connections/conex.php");
$conex = new ConexionBD();
$deposito_id = "1";
$sql="SELECT config_valor from config where config_nombre='USUARIOPORDEFECTO'";
if ($configuracion = $conex->Consulta("$sql")) {
	$personal_id = $configuracion[0]->config_valor;
};
?>