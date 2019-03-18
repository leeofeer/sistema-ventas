<!DOCTYPE html>
<html>
<head>
	<title>Lomisoft-Insumos</title>
</head>

<body>

	<label for="descripcion">Descripcion</label>
	<input type="text" name="descripcion" id="descripcion">

	<label for="idimpuesto">Impuesto</label>
	<select id="idimpuesto">
		<option value="1">I.V.A 10%</option>
		<option value="2">I.V.A 5%</option>
	</select>

	<label for="idmarca">Marca</label>
	<select id="idmarca">
		<option value="2">Ersa</option>
		<option value="3">Natural</option>
	</select>

	<label for="idproveedor">Proveedor</label>
	<select id="idproveedor">
		<option value="1">Coca Cola</option>
		<option value="2">Natural</option>
	</select>

	<input type="button" name="save" id="guardar" value="Guardar" onclick="addInsumo()">

	<table id="insumos_table">
		<thead></thead>
		<tbody></tbody>
	</table>

</body>

<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/insumos.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		recuperarInsumos();
	});
</script>

</html>

