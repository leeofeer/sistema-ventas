<?php

	session_start();
	if (!isset($_SESSION['idusuario'])) {
        header("location: login.php");
		exit;
      }
	$usuario_logueado=$_SESSION['usuario'];
	$active_pedidos="";
	$active_facturas="active";
	$active_productos="";
	$active_clientes="";
    $active_usuarios="";
    $active_apercierre = "";	
	$title="Facturas | SSoftware";
  
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
                <h4>Lista de Facturas</h4>
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

				<div id="grilla-facturas">


				</div>
				<div id="resultados"></div><!-- Carga los datos ajax -->
				<div class='outer_div'></div><!-- Carga los datos ajax -->
			</div>
		</div>	
		
	</div>
	<hr>
    <?php
      include("modals/modalVerDetalle.html");
      include("modals/modalCobrar.html");
    ?>

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/facturas.js"></script>

  <script type="text/javascript">
  	
  </script>
  </body>
</html>