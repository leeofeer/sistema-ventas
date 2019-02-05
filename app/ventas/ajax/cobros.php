<?php
include "../../config/dbhandler.php";

session_start();


function autonumerico (){
	$db = new Database();
	$result = $db->query("SELECT COALESCE(MAX(id),0)+1 AS id FROM cobros");
    $id = $result->fetchAll(PDO::FETCH_ASSOC);

    foreach ($id as $i) {
        return $i['id'];
    }

}

function recuperarIdFactura($nropedido){
	$db = new Database();
	$result = $db->query("SELECT idfactura FROM vsdetalleventa WHERE nropedido =".$nropedido);
	$idfactura = $result->fetchAll(PDO::FETCH_ASSOC);
	foreach ($idfactura as $i) {
		return $i['idfactura'];
	}
}

if ($_GET['action']=="guardarCobro") {
	//crear sql de la cabecera
	$db = new Database();
	$idcobro = autonumerico();
	$sql_cabecera = "INSERT INTO cobros(id,fecha,idcaja,idaperturacierre)";
	$sql_cabecera .= "VALUES ($idcobro,CURRENT_DATE,".$_SESSION['idcaja'].",".$_SESSION['idapertura'].");";

	$statement = $db->query($sql_cabecera);

	//echo $sql_cabecera;



	if ($statement) {

		//crear sql del detalle

		$idfactura = recuperarIdFactura($_POST['nropedido']);
		$monto =  $_POST['montoefectivo'];
		$iva10 =  round($monto/11);
		$montototal = $monto-$iva10;

		$sql_detalle = "INSERT INTO cobro_detalle (idfactura,idcobro,idtipocobro,montoefectivo,montotarjeta,iva10,montototal) ";
		$sql_detalle .= "VALUES ($idfactura,$idcobro,".$_POST['idtipocobro'].",".$_POST['montoefectivo'].",";
		$sql_detalle .= $_POST['montotarjeta'].",$iva10,". $montototal.");";
		$statement_detalle = $db->query($sql_detalle);
		
		if ($statement_detalle) {

			//crear sql del update
			$sql_update = "UPDATE facturaventa SET estado = 'COBRADO' WHERE id = ".$idfactura;
			//echo $sql_update;
			$statement_update = $db->query($sql_update);

			echo "DONE";

		}
		
	}
}

if ($_GET['action']=="cargarCobros") {
	$sql = "";
	if ($_POST['cargar']=="todos") {
		$sql="SELECT * FROM vscobros order by fecha desc";
	}else{
		$sql="SELECT * FROM vscobros WHERE fecha BETWEEN '".$_POST['desde']."' AND '".$_POST['hasta']."' order by fecha desc";
	}

	$db = new Database();
	$statement = $db->query($sql);

	if ($statement) {
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

}

if ($_GET['action']=="cargarDetalleCobro") {
	
	$sql="SELECT * FROM vscobrodetalle where idcobro=".$_POST['id'];

	$db = new Database();
	$statement = $db->query($sql);

	if ($statement) {
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($result);
	}

}


?>