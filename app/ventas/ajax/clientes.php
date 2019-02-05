<?php
include "../../config/dbhandler.php";
$db = new Database();
session_start();


if ($_GET['action']=="recuperarClientes") {
	$sql = "";
	if ($_POST['condicion']=="todos") {
		$sql = "SELECT * FROM vsclientes";
	}
	$result = $db->query($sql);
    $data = $result->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($data);

}

if ($_GET['action']=="recuperarById") {
	$sql = "";

	if ( isset($_GET['id']) ) {
		$sql = "SELECT * FROM vsclientes WHERE id=".$_GET['id'];
	}

	$result = $db->query($sql);
    $data = $result->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($data);

}

if ($_GET['action']=="quitar") {
	$sql = "";

	if ( isset($_GET['id']) ) {
		$sql = "DELETE FROM clientes WHERE id=".$_GET['id'];
	}

	$result = $db->query($sql);
	if ($result) {
		echo "BORRADO";
	}else{
		echo "NO SE PUEDE BORRAR";
	}

    

}

if ($_GET['action']=="actualizar") {
	$sql = "";

	if ($_GET['condicion']=="update" ) {
		$sql = "UPDATE clientes ";
  		$sql.=" SET razonsocial = '".$_POST['razonsocial']."',";
  		$sql.=" documento = '".$_POST['ruc']."',";
  		$sql.=" direccion = '".$_POST['direccion']."',";
  		$sql.=" telefono = '".$_POST['telefono']."',";
  		$sql.=" idciudad = '".$_POST['ciudad']."'";
		$sql.=" WHERE id = '".$_POST['idcliente']."'";

		$result = $db->query($sql);
		if ($result) {
			echo "ACTUALIZADO";
		}else{
			echo "NO SE PUEDE ACTUALIZAR";
		}
	}else{
		$sql = "INSERT INTO clientes ";
        $sql .= " (id, ";
        $sql .= " razonsocial, ";
        $sql .= " documento, ";
        $sql .= " direccion, ";
        $sql .= " telefono, ";
        $sql .= " idciudad) ";
		$sql .= " VALUES ( ".$idcliente." , ";
        $sql .= " '".$_POST['razonsocial']."' , ";
        $sql .= " '".$_POST['ruc']."' , ";
        $sql .= " '".$_POST['direccion']."' , ";
        $sql .= " '".$_POST['telefono']."' , ";
        $sql .= " '".$_POST['ciudad']."' ) ";
		$result = $db->query($sql);
		if ($result) {
			echo "INSERTADO";
		}else{
			echo "NO SE PUEDE INSERTADO";
		}
	}

}
