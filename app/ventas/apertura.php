<?php
	session_start();
	if (!isset($_SESSION['idusuario'])) {
        exit;
        header("location: login.php");
		
      }

    $usuario_logueado=$_SESSION['usuario'];
    
	$active_pedidos="";
	$active_facturas="";
    $active_productos="";
    $active_apercierre = "active";
	$active_clientes="";
	$active_usuarios="";	
	$title="Control de Cajas | SSoftware";
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
		<div class="panel panel-info" id="panel_grilla-apertura">

            <div class="panel-heading">
                <h4>Cajas Abiertas por <?php echo $_SESSION['usuario'];?></h4>
                <button class="btn btn-success" id="btn_abrir_caja" onclick="abrirCaja()">Abrir Caja</button>
                
            </div>

			<div class="panel-body">
				<div  >
                    <table class="table table-hover" id="grilla-apertura"> 
                        <thead>
                        <th>
                            Nro. Caja
                        </th>
                        <th>
                            Fecha Apertura
                        </th>
                        <th>
                            Hora Apertura
                        </th>
                        <th>
                            Monto Apertura
                        </th>
                        <th>
                            Accion
                        </th>
                        </thead>

                        <tbody>
                        
                        </tbody>
                    </table>
				</div>

			</div>
		</div>	



        <div class="panel panel-info" id="apercierre_historico" style="display: none;">
           
            <div class="panel-heading">
                <h4>Historico</h4>
                <div class="form-group row">
                    <label class="col-md-1 control-label">Seleccione Caja</label>
                    <div class="col-md-2">
                        <select class="form-control" id="caja" > 
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="button" class="btn btn-success" id="buscar" value="Aceptar" onclick="cargarGrillaHistorico()">
                    </div>
                </div>
             </div>

            <div class="panel-body">

                <div id="div_historico_grilla-apercierre" >
                    <table class="table table-hover" id="historico_grilla-apercierre"> 
                        <thead>
                            <th>Nro. Caja</th>
                            <th>
                            Fecha Apertura
                            </th>
                            <th>
                            Hora Apertura
                            </th>
                            <th>
                            Monto Apertura
                            </th>
                            <th>
                            Fecha Cierre
                            </th>
                            <th>
                            Hora Cierre
                            </th>
                            <th>
                            Monto Cierre
                            </th>
                            <th>Usuario</th>
                        <thead>

                        <tbody>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>	



	</div>


	<hr>
    <?php
    //inclusion de modals
    include("modals/modalAbrirCaja.html");
    
    ?>

	<?php
	include("footer.php");
	?>

	
	<script src="js/jqueryui.js"></script>
    <script type="text/javascript" src="js/apertura.js"></script>
    <script type="text/javascript" src="js/cajasPedido.js"></script>
  <script type="text/javascript">
  	$( function() {
  		$( document ).tooltip();
  	});
  </script>

  <script type="text/javascript">
      function comprobarApertura(){
        cargarGrillaAperturas();
      }
  </script>

  </body>
</html>
