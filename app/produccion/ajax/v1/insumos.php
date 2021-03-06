<?php

include '../../../config/dbhandler.php';
include '../../../config/dbutils.php';



$request_method = $_SERVER["REQUEST_METHOD"];

if ($request_method=="GET") {
	if(!empty($_GET["id"]))
	{
		$id=intval($_GET["id"]);
		getInsumos($id);
	}else{
	getInsumos();
	}
}

if ($request_method=="POST") {
	addRecord();
}

if ($request_method=="DELETE") {
	$id=intval($_GET["id"]);
	delRecord($id);
}

if ($request_method=="PUT") {
	$id=intval($_GET["id"]);
	updRecord($id);
}


function getInsumos($id=0){
	$sql = "SELECT * FROM vsinsumos";

	if ($id>0) {
		$sql = "SELECT * FROM vsinsumos where id=".$id;
	}

	$db=new Database();
	$result = $db->query($sql);
    $insumos = $result->fetchAll(PDO::FETCH_ASSOC);
    	if ($insumos>0) {
    		header('Content-Type: application/json');
    		echo json_encode($insumos);
    	}else{
    		
    	}
}

function addRecord(){
	$db = new Database();
	$utils = new DButil();
	
	$id = $utils->autonum("id","insumos");
	$input = $_POST;
	$sql = "INSERT INTO insumos(id,descripcion,idimpuesto,idmarca,idproveedor)
";
	$sql .= " VALUES ($id,'".$input['descripcion']."',".$input['idimpuesto'].",".$input['idmarca'].",".$input['idproveedor'].") ";
	$result = $db->query($sql);

	if ($result) {

		$response=array(
				'status' => 1,
				'status_message' =>'Insumo Added Successfully.'
			);
		}

		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>'Insumo Addition Failed.'
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);

}

function delRecord($id){
	$sql = "DELETE FROM insumos where id=".$id;

	$db = new Database();
	$result = $db->query($sql);
	if($result)
	{
		$response=array(
			'status' => 1,
			'status_message' =>'Insumo Deleted Successfully.'
		);
	}
	else
	{
		$response=array(
			'status' => 0,
			'status_message' =>'Insumo Deletion Failed.'
		);
	}
	header('Content-Type: application/json');
	echo json_encode($response);
}

function updRecord($id){
	$db = new Database();

	$input = $_PUT;
	$sql = "UPDATE insumos SET ";
	$sql .= " descripcion=".$input['descripcion']."',idimpuesto=".$input['idimpuesto'].",idmarca=".$input['idmarca'].",idproveedor=".$input['idproveedor']." WHERE id=".$input['idinsumo'];
	$result = $db->query($sql);

	if ($result) {

		$response=array(
				'status' => 1,
				'status_message' =>'Insumo Added Successfully.'
			);
		}

		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>'Insumo Addition Failed.'
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);

}