<?php

	//session_start();
	//if (!isset($_SESSION['idusuario'])) {
        //header("location: login.php");
		//exit;
      //}
	//$usuario_logueado=$_SESSION['usuario'];
	$active_ordenes = "active";
	$active_produccion = "";
	$active_productos = "";
	$active_recetas = "";
	$active_control = "";
	$active_mermas = "";	
	$title="Ordenes | SSoftware";
  
?>
<!DOCTYPE html>
<html lang="en">

  <head>
	<?php include("head.php");?>

  </head>

  <body>
	<?php
	include("navbar.php");
	?>  
    <div class="container">
    	<div class="panel panel-info">

            <div class="panel-heading">
                <h4>Ordenes de Producción</h4>
                <div class="form-group row">

                    <label for="filtroFecha" class="col-md-1 control-label">Filtro Fecha</label>
                    <label class="col-md-1 control-label">Desde</label>
                    <div class="col-md-2">

                        <input type="date" class="form-control" id="desde" min="2018-09-01" value="<?php echo date("Y-m-d");?>">
                    </div>

                    <label class="col-md-1 control-label">Hasta</label>
                    <div class="col-md-2">

                        <input type="date" class="form-control" id="hasta" value="<?php echo date("Y-m-d");?>">
                    </div>

                    <div class="col-md-2">

                        <input type="button" class="btn btn-success" id="buscar" value="Aceptar">
                    </div>

                    <label for="" class="col-md-1 control-label">Pedidos Pendientes</label>
                    <div class="col-md-1">
                        <label id="pedpendientes">0</label>
                    </div>
                    <div class="col-md-1">

                        <input type="button" class="btn btn-warning" id="buscar" value="Ver" onclick="abrirModal()">
                    </div>
                </div>

            </div>

            <div id="panel-body">
            	<div id="contenedor_grilla" style="display: none;">
            		<table class="table" id="grilla_ordenes">
            			<thead>
            				<tr>
            					<th>#</th>
            					<th>Fecha</th>
            					<th>Hora</th>
            					<th>Usuario</th>
            					<th>Estado</th>
            				</tr>
            			</thead>
            			<tbody>
            				
            			</tbody>
            		</table>
            	</div>

            </div>


	</div>

	

	<?php
	include("footer.php");
	?>

	<?php
	include("modals/modalVerPendientes.html");
	include("modals/modalverDetalleOrden.html");
	?>
	<script type="text/javascript" src="js/ordenproduccion.js"></script>

  <script type="text/javascript">
  	$(function(){
  		contarPedidosPendientes();
  	});

  	function abrirModal(){
  		$('#modalverPendientes').modal('show'); 	
  	}

  	$("#buscar").on('click', function(){
  		$("#contenedor_grilla").css("display","inline");
  		cargarOrdenes();
  		
  	});

  </script>
  </body>
</html>