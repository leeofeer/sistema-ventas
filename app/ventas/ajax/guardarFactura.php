<?php
include "../../config/dbhandler.php";
$db = new Database();
session_start();


if ($_GET['action']=="autonumerico") {
	$result = $db->query($_POST['sql']);
    $id = $result->fetchAll(PDO::FETCH_ASSOC);

    foreach ($id as $i) {
        echo $i['id'];
    }
}

if ($_GET['action']=="insertarClienteNuevo") {
    $result = $db->query($_POST['sql']);
    if ($result) {
        echo "DONE";
    }
}

if ($_GET['action']=="recuperarTimbrado") {
    $result = $db->query('SELECT id, nrotimbrado, fechaemision, fechavencimiento FROM timbrado WHERE fechavencimiento > CURRENT_DATE');
    $data = $result->fetchAll(PDO::FETCH_ASSOC);
		
		if (count($data)>0) {
			foreach ($data as $r) {
				$_SESSION['idtimbrado'] = $r['id'];
				echo json_encode($data);
			}
		}else{
			$mensaje = array();
			$_SESSION['idtimbrado'] = "";
			$mensaje[0] = "VENCIDO";
			echo json_encode($mensaje);
		}
		
}
if ($_GET['action']=="recuperarCliente") {
    $result = $db->query("SELECT id, razonsocial, documento, direccion FROM vsclientes WHERE id=".$_POST['idcliente']);
    $data = $result->fetchAll(PDO::FETCH_ASSOC);
		
		if (count($data)>0) {
			foreach ($data as $r) {
				echo json_encode($data);
			}
		}else{
			$mensaje = array();
			$mensaje[0] = "NO EXISTE";
			echo json_encode($mensaje);
		}
		
}

if ($_GET['action']=="recuperarPedido") {
	$sql = "SELECT idpedido, nropedido, codigoproducto, descripcion, cantidad, precio, subtotal, iva10 FROM vsdetallepedidobyid WHERE idpedido =".$_POST['idpedido'];
    $result = $db->query($sql);
    //echo $sql;
    $data = $result->fetchAll(PDO::FETCH_ASSOC);
		
		if (count($data)>0) {
			echo json_encode($data);
		}
		
}

if ($_GET['action']=="insertarFacturaNuevo") {

	$sql_cabecera = "INSERT INTO facturaventa(id,fechaemision,nrofactura,
             hora,estado, cuota, idtipodocumento, idtipofactura, idtimbrado,
             idaperturacierre,idcaja,idempleados,idcliente,idsucursal) ";

    $sql_cabecera .= " VALUES (".$_POST['idfactura'].",CURRENT_DATE,".$_POST['nrofactura'].",CURRENT_TIME,
        'PENDIENTE',
        '1',
        '1',
        '1','".$_SESSION['idtimbrado']."',
        '".$_SESSION['idapertura']."',
        '".$_SESSION['idcaja']."',
        (SELECT id from empleados where idusuario=".$_SESSION['idusuario']
        ."),".$_POST['idcliente'].",'".$_SESSION['idsucursal']."');";

    $result = $db->query($sql_cabecera);
    if ($result) {
        $sql_detalle = "INSERT INTO detallefacturaventa(idfactura,idpedido,precio,iva10)";
     	$sql_detalle .= "SELECT ".$_POST['idfactura']." AS idfactura,".$_POST['idpedido']." AS idpedido,SUM(((precio*cantidad)-ROUND((precio*cantidad)/11))) AS gravada, ";
     	$sql_detalle .= "SUM(ROUND((precio*cantidad)/11)) AS iva10 FROM pedidodetalle WHERE idpedido=".$_POST['idpedido']."; UPDATE pedidos SET estado = \"FACTURADO\" WHERE id=".$_POST['idpedido'];
     	//echo $sql_detalle;
     	$insert = $db->query($sql_detalle);
     	if ($insert) {
     		echo "DONE";
     	}
    }
}