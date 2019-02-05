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
	$active_productos="active";
	$active_clientes="";
  $active_apercierre = "";	
	$title="Productos | SSoftware";
  
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
        <h4>Productos</h4>
        <div class="form-group row">
          <div class="col-sm-4">
            <input type="text" name="search" id="search" class="form-control" placeholder="Busqueda...">
          
          </div>
          <div class="col-sm-4">
            <i class="btn btn-primary" onclick="busqueda()">B</i>
          </div>
        </div>
      </div>

    </div>

		<div class="panel-body">
				<div id="grilla-productos">
          <table class="table" id="tabla_productos">
            <thead>
              <tr>
                <th>Codigo</th>
                <th>Descripcion</th>
                <th>Tipo</th>
                <th>Categoria</th>
                <th>Precio</th>
                <th>Estado</th>
               <!-- <th>Acciones</th>-->
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
      include("modals/modalCUProducto.html");
      //include("modals/modalCobrar.html");
    ?>

	<?php
	include("footer.php");
	?>
	<script type="text/javascript" src="js/productos.js"></script>
  </body>


<script type="text/javascript">
  $(document).ready(function(){
    cargarGrillaProductos("todos");
  });
</script>

<script type="text/javascript">
  function busqueda(){
    var q =$("#search").val();

    if (q!="") {

       $.ajax({
        url: "./ajax/productos.php?action=filtrar&q="+q,
        dataType:"json",
        success: function(data){
          var tabla = $("#tabla_productos tbody");
          tabla.find("tr").remove();
      
          $.each(data, function(i,v){
            var filas = "<tr>";
            filas += '<td>'+v.id+'</td>';
            filas += '<td>'+v.descripcion+'</td>';
            filas += '<td>'+v.tipo+'</td>';
            filas += '<td>'+v.categoria+'</td>';
            filas += '<td>'+v.precio+' Gs.</td>';
            filas += '<td>'+v.estado+'</td>';
            //filas += '<td>'+'<button class="btn btn-primary btn-xs" onclick="update('+v.id+')">'
            //+'Modificar'+'</button>';
            //+'</td>';
            //filas += '<td>'+'<button class="btn btn-danger btn-xs" onclick="quitar('+v.id+')">'
            //+'Quitar'+'</button>';
            //+'</td>';
            filas += "</tr>";
            tabla.append(filas);
          });

        }
    });
    
   
  }
}
</script>

</html>