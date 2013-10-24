<?php 

// Clase para conexion a Base de Datos (mysql)

class ConexionBD {

	private $hostname_conex = "localhost";
	private $database_conex = "borgestc_dbprueba";//"motomun_motomundo"; // motomundo
	private $username_conex = "borgestc_uprueba";//"motomun_novati";// root
	private $password_conex = "5.JQMtV^Kyy$";//"novati07"; // ""
    private $conex;

	public function Conectar() {

			$this->conex = mysql_connect($this->hostname_conex, $this->username_conex, $this->password_conex) or trigger_error(mysql_error(),E_USER_ERROR);
						}

	public function Seleccionar_DB($DB) {

		if ($this->conex != null) {
			if (!mysql_select_db($DB, $this->conex)) echo "No se pudo seleccionar la Bd. Asegurese de que la BD $DB existe.";
								   }
		else echo "No se pudo seleccionar la BD $DB. No existe conexion a BD establecida.";

	}

	public function Get_DB_Nombre() {
		return $this->database_conex;
	}
	
	public function ConexionBD() {
		$this->Conectar();
		$this->Seleccionar_DB($this->database_conex);
	}
	
	public function Consulta($Sql_consulta){ // devuelve falso si la cons tiene 0 filas
		
		// Realizar consulta Mysql
		$result = mysql_query($Sql_consulta, $this->conex);
		if (!$result) { die('Consulta erronea: ' . mysql_error());}
		else {
		if (mysql_num_rows($result)>0){
		// Pasar datos a objetos
		$x = 0;
		while ($row = mysql_fetch_object($result)) {
    		$Resultado[$x] = $row;
			$x++;}
		return $Resultado;	
		} else return false;
		
		mysql_free_result($result);
		
		}		
	}
	
	public function Codigo($tabla,$campo){ // devuelve falso si la cons tiene 0 filas
		
		// Realizar consulta Mysql
		$Sql_consulta = "select max($campo)+1 as id from $tabla";
		
		$result = mysql_query($Sql_consulta, $this->conex);
		if (!$result) { die('Consulta erronea: ' . mysql_error());}
		else {
		if (mysql_num_rows($result)>0){
		// Pasar datos a objetos
		$x = 0;
		while ($row = mysql_fetch_object($result)) {
    		$Resultado[$x] = $row;
			$x++;}

		return $Resultado[0]->id;	
		}
		mysql_free_result($result);
		
		}		
	}
	
	public function Consulta_SinRetorno($Sql_consulta){ 
		
		// Realizar consulta Mysql
		$result = mysql_query($Sql_consulta, $this->conex);
		if (!$result) { die('Consulta erronea: ' . mysql_error());};
			}		
	
	public function Consulta_XML($Sql_consulta, $campos){ // devuelve falso si la cons tiene 0 filas
		
		// Realizar consulta Mysql
		$result = mysql_query($Sql_consulta, $this->conex);
		if (!$result) { die('Consulta erronea: ' . mysql_error());}
		else {
		if (mysql_num_rows($result)>0){
		// Pasar datos a objetos
		for ($f=0; $f < mysql_num_rows($result);$f++) {
    		$row = mysql_fetch_array($result, MYSQL_NUM);
			$Resultado[$f] = $row;
			};
		// Generar XML
		$xml = '<?xml version="1.0" encoding="utf-8"?>';	
		$Ncampos = count($Resultado[0]);
		if (count($campos) == $Ncampos) {
		for ($z=0; $z< mysql_num_rows($result);$z++) {
		    $xml .= '<item>';
			for ($y=0; $y<$Ncampos; $y++){
		    	$xml .= '<'.$campos[$y].'>';
		    	$xml .= $Resultado[$z][$y];
		    	$xml .= '</'.$campos[$y].'>';
		    }
			
			$xml .= '</item>';	
		} 
		
		return $xml;
		} else return false;
		
		} else return false;
		
		mysql_free_result($result);
		
		}		
	}
	
	public function Update($Sql_consulta) {
		
		$result = mysql_query($Sql_consulta, $this->conex);
		if (!$result) { die('Update erroneo: ' . mysql_error());};
		
	}

	public function insert_id() {
		
		return mysql_insert_id($this->conex);
		
	}






}
?>