<?php 
require_once("Connections/conex.php");
require_once("config.php");
$conex = new ConexionBD();

if (isset($_GET["producto_id"])){
	$producto_id=$_GET["producto_id"];
}
else{
	$producto_id=$_POST["producto_id"];
};

if (isset($_GET["producto_nombre"])){
	$producto_nombre=$_GET["producto_nombre"];
}
else{
	$producto_nombre=$_POST["producto_nombre"];
};

$sql="SELECT *, ROUND(producdepo_stockactual,2) as stockactual from productos inner join productodeposito on productos.producto_id=productodeposito.producto_id where productodeposito.deposito_id=$deposito_id";
if (($producto_id!="-1") and ($producto_id!=""))
	$sql=$sql." and productos.producto_id like '%$producto_id%'";
	
if (($producto_nombre!="-1") and ($producto_nombre!=""))
	$sql=$sql." and productos.producto_nombre like '%$producto_nombre%'";
							
$sql=$sql." order by producto_nombre";


?>

<title>borgest</title><table width="700" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <table width="700" border="1" cellspacing="0" cellpadding="0">
      <tr>
          <td width="5"></td>
          <td width="100"><a href="index.php"><img src="imagenes/volver.jpg" width="88" height="72" /></a></td>
          <td width="5"></td>
          <td width="300"></td>
          <td width="5"></td>
          <td width="50"></td>
          <td width="5"></td>
          <td width="20"></td>
          <td width="20"></td>
          <td width="20"></td>
        </tr>
        <tr>
          <td width="5"></td>
          <td width="100"><strong>Codigo</strong></td>
          <td width="5"></td>
          <td width="300"><strong>Descripcion</strong></td>
          <td width="5"></td>
          <td width="50"><strong>Actual</strong></td>
          <td width="5"></td>
          <td width="20"><strong>Agregar</strong></td>
          <td width="20"><strong>Aplicar</strong></td>
          <td width="20"></td>
        </tr>
        <?php // Obtener valores de tabla  
			if ($productos = $conex->Consulta("$sql")) {
				for($x=0; $x<count($productos); $x++) {
		?>
        
        <form id="form1" name="form1" method="post" action="aplicar_stock.php">
        <tr>
          <td width="5"></td>
          <td width="100" align="right" valign="middle"><?php echo $productos[$x]->producto_id; ?></td>
          <td width="5"><input name="producto_nombre" type="hidden" id="producto_nombre" value="<?php echo $productos[$x]->producto_nombre; ?>" /></td>
          <td width="300"><?php echo $productos[$x]->producto_nombre; ?></td>
          <td width="5"><input name="producto_id" type="hidden" id="producto_id" value="<?php echo $productos[$x]->producto_id; ?>" /></td>
          <td width="50" align="right"><?php echo $productos[$x]->stockactual; ?></td>
          <td width="5"><input name="stockactual" type="hidden" id="stockactual" value="<?php echo $productos[$x]->stockactual; ?>" /></td>
          <td width="20" align="right"><input name="agregar" type="text" size="4" maxlength="4" value="0" id="agregar"/></td>
          <td width="20" align="right"><input name="aplicar" type="text" size="4" maxlength="4" value="0" id="aplicar"/></td>
          <td width="20"><input type="submit" name="btn" id="btn" value="Guardar" /></td>
        </tr>
        </form>
        <?php  } };?>
        
        
        <tr>
          <td width="5"></td>
          <td width="100"><a href="index.php"><img src="imagenes/volver.jpg" width="88" height="72" /></a></td>
          <td width="5"></td>
          <td width="300"></td>
          <td width="5"></td>
          <td width="50"></td>
          <td width="5"></td>
          <td width="20"></td>
          <td width="20"></td>
          <td width="20"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
