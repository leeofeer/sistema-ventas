<?php

	session_start();
	if (!isset($_SESSION['idusuario'])) {
        header("location: login.php");
		exit;
      }
	$usuario_logueado=$_SESSION['usuario'];
	$active_pedidos="";
	$active_facturas="";
  $active_cobros="";
	$active_productos="";
	$active_clientes="active";
  $active_apercierre = "";	
	$title="Clientes | SSoftware";
  
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
        <h4>Clientes</h4>
        <div class="form-group row">
        </div>
      </div>

    </div>

		<div class="panel-body">
				<div id="grilla-productos">
          <table class="table" id="tabla_clientes">
            <thead>
              
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Documento</th>
                <th>Telefono</th>
                <th>Direccion</th>
                <th>Ciudad</th>
               <th>Acciones</th>
              
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
      include("modals/modalCUCliente.html");
      //include("modals/modalCobrar.html");
    ?>

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/clientes.js"></script>
  </body>


<script type="text/javascript">
  $(document).ready(function(){
    cargarGrillaClientes("todos");
  });
</script>

</html>