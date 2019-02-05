<?php

	session_start();
	if (!isset($_SESSION['idusuario'])) {
        header("location: login.php");
		exit;
      }else if ($_SESSION['nivel']!="CAJERO") {
        echo "ACCESO NO PERMITIDO";
        exit;
      }
	$usuario_logueado=$_SESSION['usuario'];
	$active_pedidos="";
	$active_facturas="";
  $active_cobros="active";
	$active_productos="";
	$active_clientes="";
    $active_usuarios="";
    $active_apercierre = "";	
	$title="Cobros | SSoftware";
  
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
                <h4>Cobros</h4>
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

				<div id="grilla-cobros">
          <table class="table" id="tabla_cobros">

            <thead>
              <tr>
              <th>Nro. Cobro</th>
              <th>Fecha</th>
              <th>Nro. Caja</th>
              <th>Nro. Apertura</th>
              <th>Nro. Usuario</th>
              <th>Acciones</th>
            </tr>
            </thead>

            <tbody>
              
            </tbody>

          </table>
				</div>
			</div>
		</div>	
		
	</div>
	<hr>
    <?php
      include("modals/modalDetalleCobro.html");
      //include("modals/modalCobrar.html");
    ?>

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/cobros.js"></script>

  <script type="text/javascript">
  	
  </script>
  </body>
</html>

<script type="text/javascript">
  $(document).ready(function(){
    cargarGrillaCobros("todos",0,0);
  });
</script>>