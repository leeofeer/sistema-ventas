function cargarGrillaClientes(condicion){
	$.ajax({
		url: "./ajax/clientes.php?action=recuperarClientes",
		method: "post",
		data: {condicion: condicion},
		dataType: "json",
		success: function(data){
			console.log(data);
			var tabla = $("#tabla_clientes");
			tabla.find(" tbody tr").remove();
			for (var i = data.length - 1; i >= 0; i--) {
				var filas = "<tr>";
				filas += '<td>'+data[i]['id']+'</td>';
				filas += '<td>'+data[i]['razonsocial']+'</td>';
				filas += '<td>'+data[i]['documento']+'</td>';
				filas += '<td>'+data[i]['telefono']+'</td>';
				filas += '<td>'+data[i]['direccion']+'</td>';
				filas += '<td>'+data[i]['descripcion']+'</td>';
				filas += '<td>'+'<button class="btn btn-primary btn-xs" onclick="updatec('+data[i]['id']+')">'
				+'Modificar'+'</button>';
				+'</td>';
				filas += '<td>'+'<button class="btn btn-danger btn-xs" onclick="quitarc('+data[i]['id']+')">'
				+'Quitar'+'</button>';
				+'</td>';
				filas += "</tr>";
				tabla.append(filas);
			}
		}
	});
}

function updatec(idcliente){

	$("#modalCUCliente").modal("show","toggle");
	$.ajax({
		url: "./ajax/clientes.php?action=recuperarById&id="+idcliente,
		dataType: "json",
		success: function(data){
		for (var i = data.length - 1; i >= 0; i--) {
			$("#idcliente").val(data[i].id);	
			$("#razonsocial").val(data[i].razonsocial);
			$("#ruc").val(data[i].documento);
			$("#direccion").val(data[i].direccion);
			$("#telefono").val(data[i].telefono);
			cargarSelectCiudad(data[i].idciudad);
			$("#idciudad").val(data[i].idciudad);
			}
			
		}
	});
}

function quitarc(idcliente){
	$.ajax({
		url: "./ajax/clientes.php?action=quitar&id="+idcliente,
		success: function(data){
			cargarGrillaClientes("todos");
		}
	});
}

function cargarSelectCiudad(idciudad){


	$("#idciudad option").remove();
    var sql = "SELECT * FROM CIUDADES";
     $.ajax({
            url: "./ajax/cabecerapedidos.php?action=ciudades",
            method: "post",
            dataType: "json",
            async: false,
            data: {sql: sql},

            success: function (data) {
            	var selected = ""
                $.each(data, function(i, v){

                	if (idciudad==v.id) {
                		selected = " selected ";
                	}
                    var markup = '<option '+selected+' value="'+v.id+'">'+v.descripcion+'</option';
                    $("#idciudad").append(markup);
                });
            }
        });
}

function guardarCambios(condicion){

	datos = capturarValores();
	console.table(datos);
	actualizarBD(datos,condicion);

}

function capturarValores(){
	var datos = {
	idcliente: $("#idcliente").val(),
	 razonsocial : $("#razonsocial").val(),
	 ruc : $("#ruc").val(),
	 direccion : $("#direccion").val(),
	 telefono : $("#telefono").val(),
	 ciudad : $("#idciudad").val(),
	};
	return datos;
}

function actualizarBD(datos,condicion){
	$.ajax({
		url: "./ajax/clientes.php?action=actualizar&condicion="+condicion,
		method: "post",
		data: datos,
		success: function(data){
			console.info(data);
		}
	});
}