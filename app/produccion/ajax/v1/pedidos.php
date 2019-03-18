<?php

include '../../../config/dbhandler.php';
include '../../../config/dbutils.php';



$request_method = $_SERVER["REQUEST_METHOD"];

//de acuerdo al verbo se invoca los metodos 
if ($request_method=="GET") {
	$tabla = "pedidos";
	//filtro por id
	if(isset($_GET['var'])){
		getData($tabla,$_GET['var']);
	}else if(isset($_GET['var'])){
		getData($tabla,$_GET['var']);
	}

	else{
	//listar todos
		getData($tabla,0);
	}
	
}

if ($request_method=="POST") {
	$tabla = $_GET['t'];
	addRecord($tabla);
}

if ($request_method=="DELETE") {
	$tabla = $_GET['t'];
	$id=intval($_GET["id"]);
	delRecord($tabla,$id);
}

if ($request_method=="PUT") {
	$tabla = $_GET['t'];
	$id=intval($_GET["id"]);
	updRecord($tabla,$id);
}


function getData($tabla,$var){
	$sql = "";
	if($var==="y"){
		$sql = "SELECT * FROM $tabla where control='PENDIENTE' order by fechapedido desc";
	}

	if ($var===0) {
		$sql = "SELECT * FROM $tabla";
	}
	if($var>0){
		$sql = "SELECT * FROM $tabla where id=".$var;
	 
	 }
	
	$db=new Database();
	$result = $db->query($sql);
	if ($result) {

		$data = $result->fetchAll(PDO::FETCH_ASSOC);
    	if ($data>0) {
    		header('Content-Type: application/json');
    		
    		echo json_encode($data);
    	}else{
    		$response=array(
				'status' => 1,
				'status_message' =>'No Hay Datos'
			);
		header('Content-Type: application/json');
		echo json_encode($response);
    	}
	}else{
		$response=array(
				'status' => 0,
				'status_message' =>'Search Failed.'
			);
		header('Content-Type: application/json');
		echo json_encode($response);
	}
    
}


function addRecord($table){
	$db = new Database();
	$utils = new DButil();
	
	$id = $utils->autonum("id",$table);
	$sql = "INSERT INTO $table";	
	$sql .= " VALUES ($id,'".$_POST['descripcion']."') ";
	$result = $db->query($sql);

	if ($result) {

		$response=array(
				'status' => 1,
				'status_message' =>$table.' Added Successfully.',
				'post' => var_dump($_POST)
			);
		}

		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>$table.' Addition Failed.',
				'post' => var_dump($_POST)
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);

}


function delRecord($table,$id){
	$sql = "DELETE FROM $table where id=".$id;

	$db = new Database();
	$result = $db->query($sql);
	if($result)
	{
		$response=array(
			'status' => 1,
			'status_message' =>$table.' Deleted Successfully.'
		);
	}
	else
	{
		$response=array(
			'status' => 0,
			'status_message' =>$table.' Deletion Failed.'
		);
	}
	header('Content-Type: application/json');
	echo json_encode($response);
}

function updRecord($table,$id){
	$db = new Database();

	$input = $_PUT;
	$sql = "UPDATE $table SET ";
	$sql .= " descripcion=".$input['descripcion']." WHERE id=".$id;
	$result = $db->query($sql);

	if ($result) {

		$response=array(
				'status' => 1,
				'status_message' =>$table.' Added Successfully.'
			);
		}

		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>$table.' Addition Failed.'
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);

}