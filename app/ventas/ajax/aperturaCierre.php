<?php

include '../../config/dbhandler.php';

$db=new Database();
session_start();

	if ($_GET['accion']=="comprobarApertura") {
		$sql = "SELECT id, fechaapertura, fechacierre,idcaja,nrocaja,idsucursal FROM vsapercierre WHERE fechacierre IS NULL AND fechaapertura = CURRENT_DATE";
		$result = $db->query($sql);
		//echo $sql;	
		$data = $result->fetchAll(PDO::FETCH_ASSOC);
		
		if (count($data)>0) {
			foreach ($data as $r) {
				$_SESSION['idapertura'] = $r['id'];
				$_SESSION['idcaja'] = $r['idcaja'];
				$_SESSION['idsucursal'] =$r['idsucursal'];
				echo json_encode($data);
			}
		}else{
			$mensaje = array();
			$_SESSION['idapertura'] = "";
			$_SESSION['nrocaja'] ="";
			$_SESSION['idcaja'] ="";
			$_SESSION['idsucursal'] ="";
			$mensaje[0] = "CERRADO";
			echo json_encode($mensaje);
		}
		
	}

if ($_GET['accion']=="cargarCajas") {
		$sql = "SELECT * FROM caja WHERE estado = \"HABILITADO\" ";
		$result = $db->query($sql);
		//echo $sql;	
		$data = $result->fetchAll(PDO::FETCH_ASSOC);
		
		if (count($data)>0) {
			echo json_encode($data);
		}else{
			echo json_encode("CERRADO");
		}
		
}

if ($_GET['accion']=="cargarSuc") {
		$sql = "SELECT * FROM sucursal WHERE estado = \"HABILITADO\" ";
		$result = $db->query($sql);
		//echo $sql;	
		$data = $result->fetchAll(PDO::FETCH_ASSOC);
		
		if (count($data)>0) {
			echo json_encode($data);
		}else{
			echo json_encode("CERRADO");
		}
		
}

if ($_GET['accion']=="insertarApertura"){
	$sql = "INSERT INTO aperturacierre(id,fechaapertura,horaapertura,montoapertura,idcaja,idusuario,idsucursal) VALUES" ." (".$_POST['id'].", current_date, current_time, ".$_POST['montoapertura']." , ".$_POST['idcaja'].",".$_SESSION['idusuario'].",".$_POST['idsucursal'] .")";
	$result = $db->query($sql);
	if ($result) {
		echo 'INSERTADO';
	}
	//$result = $db->query($sql);
}

//carga de aperturas de caja por usuario
if ($_GET['accion']=="cargarAperturas") {
	$sql = "SELECT * FROM vsapertura WHERE idusuario=".$_SESSION['idusuario'];
	$result = $db->query($sql);
	//echo $sql;	
	$data = $result->fetchAll(PDO::FETCH_ASSOC);
	
	if (count($data)>0) {
		echo json_encode($data);
	}else{
		echo json_encode("NULL");
	}
	
}

function recuperarTotalCobros($idapertura){
	$db=new Database();
	$sql="SELECT SUM(total) as total FROM vscobrosbyapertura WHERE idaperturacierre =".$idapertura;
	$result = $db->query($sql);
	$data = $result->fetchAll(PDO::FETCH_ASSOC);
	
	if (count($data)>0) {
		return $data[0]['total'];
		//foreach ($data as $d) {
		//	return $d['total'];
		//}
	}

}

if ($_GET['accion']=="insertarCierre") {
	$montocierre = recuperarTotalCobros($_POST['id']);
	if ($montocierre=="") {
		$montocierre="0";
		echo $montocierre;
	}
	$sql_cierre="UPDATE aperturacierre SET fechacierre=CURRENT_DATE,  ";
	$sql_cierre.="horacierra=CURRENT_TIME,montocierre=$montocierre +montoapertura WHERE id=".$_POST['id'];
	echo $sql_cierre;
	$statement=$db->query($sql_cierre);
	if ($statement) {
		echo "CERRADO";
	}
}

if ($_GET['accion']=="cargarHistorico") {
	$sql = "SELECT * FROM vsapercierre WHERE idcaja=".$_POST['idcaja']." order by fechaapertura desc";
	$result = $db->query($sql);
	//echo $sql;	
	$data = $result->fetchAll(PDO::FETCH_ASSOC);
	
	if (count($data)>0) {
		echo json_encode($data);
	}else{
		echo json_encode("NULL");
	}
	
}