<?php
include "../../config/dbhandler.php";
$db = new Database();
session_start();


if ($_GET['action']=="recuperarPedidoDetalle") {
	$sql = "SELECT * FROM vsdetallepedido WHERE idpedido = 
	(SELECT idpedido FROM vsdetalleventa WHERE idfactura =".$_POST['id'].")";
	$result = $db->query($sql);
    $data = $result->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($data);

}

if($_GET['action']=="anularFactura"){
	$sql = "UPDATE facturaventa SET estado = 'ANULADO' WHERE id =".$_POST['id'];

	$result = $db->query($sql);
	if ($result) {
		echo "ANULADO";
	}
}


?>