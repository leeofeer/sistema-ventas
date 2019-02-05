<?php
include "../../config/dbhandler.php";
$db = new Database();


if ($_GET['accion']=="guardarPedido") {
	$insert = $db->query($_POST['sql']);
	if($insert){
		echo $_POST['id'];
	}
}

if ($_GET['accion']=="guardarDetalle") {

    $insertDetalle = $db->query($_POST['sql']);
    if($insertDetalle){
        echo 'GUARDADO';
    }
}

if ($_GET['accion']=="guardarDetalleModal") {

    $insertDetalle = $db->query($_POST['sql']);
    //echo $_POST['sql'];
    if($insertDetalle){
        echo 'GUARDADO';
    }else{
    	echo 'repetido';
    }
}

if ($_GET['accion']=="eliminarDetalleModal") {

    $deleteDetalle = $db->query($_POST['sql']);
    if($deleteDetalle){
        echo 'eliminado';
    }
}

