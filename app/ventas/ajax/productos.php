<?php
include "../../config/dbhandler.php";
$db = new Database();
session_start();


if ($_GET['action']=="recuperarProductos") {

	if ($_POST['condicion']=="todos") {

		$sql = "SELECT * FROM vsproductos";
		$result = $db->query($sql);
    	$data = $result->fetchAll(PDO::FETCH_ASSOC);

    	echo json_encode($data);
	}
	

}

if ($_GET['action']=="filtrar") {


		$sql = "SELECT * FROM vsproductos where descripcion like '%".$_GET['q']."%'";
		$result = $db->query($sql);
    	$data = $result->fetchAll(PDO::FETCH_ASSOC);

    	echo json_encode($data);
	

}


?>