<?php
//nclude 'dbhandler.php';

class DButil extends Database
{

	function autonum($column, $table){
		$db = new Database();
		$result = $db->query("SELECT COALESCE(MAX($column),0)+1 AS id FROM $table");
		$id = $result->fetchAll(PDO::FETCH_ASSOC);

    	foreach ($id as $i) {
        	return $i['id'];
    	}
	}


}