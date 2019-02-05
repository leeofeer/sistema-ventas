<?php
if (isset($_GET['accion']) && $_GET['accion']="cargar") { ?>
	<table class="table table-hover">
		<thead>
			<th>Nro. Factura</th>
			<th>Fecha</th>
			<th>Hora</th>
			<th>Estado</th>
			<th>Razon Social</th>
			<th>Usuario</th>
            <th>Acciones</th>
		</thead>				
	<tbody>

<?php 
	session_start();
	include '../../config/dbhandler.php';
	$db = new Database();
	$sql = "";

	//comprobacion de fechas
	if (isset($_POST['condicion']) && $_POST['condicion']=='FECHA'){
		//SI HAY FECHA
	    $desde = $_POST['desde'];
	    $hasta = $_POST['hasta'];
	    $sql = "SELECT * FROM vsventa WHERE fechaemision BETWEEN '$desde' AND '$hasta'  order by nrofactura desc";
    }else{
    	//SINO
	    $sql = "SELECT * FROM vsventa order by nrofactura desc";
    }

	$result = $db->query($sql);

	foreach ($result as $r) {
		echo '<tr>';

		echo '<td>';
		echo $r['nrofactura'];
		echo '</td>';

		echo '<td>';
		echo $r['fechaemision'];
		echo '</td>';

		echo '<td>';
		echo $r['hora'];
		echo '</td>';

		echo '<td>';
		echo $r['estado'];
		echo '</td>';

		echo '<td>';
		echo $r['razonsocial'];
		echo '</td>';

		echo '<td>';
		echo $r['usuario'];
		echo '</td>';

		echo "<td>";
		echo '<button class="btn btn-success" onclick="verDetalle('.$r['id'].')">Ver Detalle</button>';
		echo "</td>";

		if ($_SESSION['nivel']!="CAJERO") {
			
		}else{

		//fila cobrar
		echo '<td>';
		if ($r['estado']=="PENDIENTE") {
			echo '<button class="btn btn-primary cobrar" onclick="cobrarFactura('.$r['id'].')">Cobrar</button>';
		}else if ($r['estado']=="ANULADO") {
			echo '<button class="btn btn-danger" disabled="">Factura Anulada</button>';
		}else if($r['estado']=="COBRADO"){
			echo '<button class="btn btn-primary" disabled="">Cobrado</button>';
		}
		echo '</td>';

		//fila anular
        if ($r['estado']=="PENDIENTE") {
            echo '<td>';
            echo '<button class="btn btn-danger anular" onclick="anularFactura('.$r['id'].')">Anular</button>';
            echo '</td>';

        }else if($r['estado']=="COBRADO"){
        	echo '<td>';
			echo '<button class="btn btn-danger" disabled="">Anular</button>';
			echo '</td>';
		}else if ($r['estado']=="ANULADO") {
			echo '<td>';
			echo '<button class="btn btn-danger" disabled="">Factura Anulada</button>';
			echo '</td>';
		}
	}

		echo '</tr>';
		}
	}
	echo '</tbody>';
	echo '</table>'; 
?>