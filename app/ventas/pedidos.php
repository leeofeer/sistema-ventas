<?php

	session_start();
	if (!isset($_SESSION['idusuario'])) {
        header("location: login.php");
		exit;
      }
	$usuario_logueado=$_SESSION['usuario'];
	$active_pedidos="active";
	$active_facturas="";
	$active_productos="";
	$active_clientes="";
    $active_usuarios="";
    $active_apercierre = "";	
	$title="Pedidos | SSoftware";
  
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
                <div class="btn-group pull-right">
                    <a  href="nuevopedido.php" id="nuevop" target="_blanck" class="btn btn-info " ><span class="glyphicon glyphicon-plus" ></span> Nuevo Pedido</a>
                </div>

                <h4>Lista de Pedidos</h4>
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

                        <input type="button" class="btn btn-success" id="buscar" value="Aceptar" onclick="cargarFecha();">
                    </div>
                </div>

            </div>

			<div class="panel-body">

				<div id="grilla-pedido">


				</div>
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->
			</div>
		</div>	
		
	</div>
	<hr>
    <?php
    //inclusion de modals
    include("modals/modalVerDetalle.html");
    include("modals/modalAddDetalle.html");
    include("modals/modalAddRazonSocial.html");
    
    include("modals/modalAbrirCaja.html");
    
    include("modals/modalFactura.html");
    ?>

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/pedidos.js"></script>
	<script src="js/jqueryui.js"></script>
  <script type="text/javascript" src="js/facturar.js"></script>
  <script type="text/javascript" src="js/cajasPedido.js"></script>

  <script type="text/javascript">
  	$( function() {
  		$( document ).tooltip();
  	});
  </script>
  </body>
</html>