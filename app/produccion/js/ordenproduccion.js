//--------------funciones para trabajar con pedidos---------------
function contarPedidosPendientes(){
	$.ajax({
		url: "./ajax/v1/pedidos/y",
		dataType: "json",
		success: function(data){
			let nropendientes = Object.keys(data).length;
			$("#pedpendientes").text(nropendientes);
		}
	});
}

function cargarPedidosPendientes(){
	$.ajax({
		url: "./ajax/v1/pedidos/y",
		dataType: "json",
		success: function(data){
			$("#grilla_pendientes tbody tr").remove();
			for (var i = 0; i < data.length; i++) {
				let markup = "<tr>";
				markup += "<td>"+data[i].nropedido+"</td>";
				markup += "<td>"+data[i].fechapedido+"</td>";
				markup += "<td>"+data[i].nombrecli+"</td>";
				markup += "<td>"+data[i].control+"</td>";
				markup += "<td><button class='btn btn-sm btn-warning' onclick='producir("
				+data[i].id+")'>Producir</button></td>";
				markup += "</tr>";

				$("#grilla_pendientes tbody").append(markup);
				//console.log(markup);
			}
		}
	});
}


//----------------funciones que trabajan con orden produccion--------------------

function cargarOrdenes(){
	let desde = $("#desde").val();
	let hasta = $("#hasta").val();

	console.log("desde: "+desde+" hasta: "+hasta);

	$.ajax({
		url: "./ajax/v1/ordenproduccion",
		method: "post",
		data: {desde: desde, hasta: hasta},
		dataType: "json",
		success: function(data){
			$("#grilla_ordenes tbody tr").remove();
			for (var i = 0; i < data.length; i++) {
				let markup = "<tr>";
				markup += "<td>"+data[i].numero+"</td>";
				markup += "<td>"+data[i].fecha+"</td>";
				markup += "<td>"+data[i].hora+"</td>";
				markup += "<td>"+data[i].usuario+"</td>";
				markup += "<td>"+data[i].estado+"</td>";
				markup += "<td><button class='btn btn-sm btn-info' id='verdetalles' "+
				"onclick='verDetalles("+data[i].id+")'>Detalles</button></td>";
				if (data[i].estado!="EN PRODUCCION") {
					markup += "<td><button class='btn btn-sm btn-danger' "+
				"onclick='producirOrden("+data[i].id+")'>PRODUCIR</button></td>";
				}
				markup += "</tr>";
				$("#grilla_ordenes tbody").append(markup);
			}
		}
	});
}

function verDetalles(id){
	$("#modalverDetalleOrden").modal("show");
 
	$.ajax({
		url:"./ajax/v1/ordenproducciondetalle/"+id,
		dataType: "json",
		success: function(data){
			let ordenado = "";
			let nropedido;
			let nroorden;
			$("#modalverDetalleOrden tbody tr").remove();
			for (var i = 0; i < data.length; i++) {
				let markup = "<tr>";
				markup += "<td>"+data[i].idproducto+"</td>";
				markup += "<td>"+data[i].producto+"</td>";
				markup += "<td>"+data[i].cantidad+"</td>";
				markup += "</tr>";
				$("#modalverDetalleOrden tbody").append(markup);
				ordenado = data[i].control;
				nroorden = data[i].numero;
				nropedido = data[i].nropedido;
			}

			$("#nropedido").text("Nº Pedido: "+nropedido);
			$("#nroorden").text("Nº Orden: "+nroorden);
			$("#estado").text("Estado: "+ordenado);
		}
	});
}

function producirOrden(id){

}