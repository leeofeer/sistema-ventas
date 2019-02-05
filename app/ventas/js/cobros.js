//cargar cobros 
function cargarGrillaCobros(cargar,desde,hasta){
	$.ajax({
		url: "./ajax/cobros.php?action=cargarCobros",
		method: "post",
		dataType: "json",
		data: {cargar: cargar,desde:desde,hasta:hasta},
		success: function(data){
			var tabla = $("#tabla_cobros tbody");
			tabla.find("tr").remove();
			$.each(data, function(i,v){
				var filas = '<tr>';
				filas += '<td>'+v.id+'</td>';
				filas += '<td>'+v.fecha+'</td>';
				filas += '<td>'+v.nrocaja+'</td>';
				filas += '<td>'+v.nroapertura+'</td>';
				filas += '<td>'+v.usuario+'</td>';
				filas +="<td>";
                filas +="<button class=\"btn btn-primary\" id=\"ver_detalle_cobro\" onclick=\"verDetalleCobro("+v.id+")\">Detalles</button>";
                filas +="</td>";
				tabla.append(filas);
			});
		}
	});
}


function cargarFecha(){
	var desde = $("#desde").val();
	var hasta = $("#hasta").val();
	cargarGrillaCobros("fecha",desde,hasta);
}


function verDetalleCobro(idcobro){
	$("#modalverDetalleCobro").modal("show");
	$("#modalVerCobroTitle").text("Detalles Cobro "+idcobro);

	cargarDetallesCobro(idcobro);
}

function cargarDetallesCobro(idcobro){
	$.ajax({
		url: "./ajax/cobros.php?action=cargarDetalleCobro",
		method: "post",
		dataType: "json",
		data: {id: idcobro},
		success: function(data){
			//$("#nrofactura").text();
			//$("#montototal").text();
			//$("#montoefectivo").text();
			//$("#montotarjeta").text();
			$.each(data, function(i,v){
				$("#nrofactura").text(v.nrofactura);
				$("#montototal").text(v.total+" Gs.");
				$("#montoefectivo").text(v.montoefectivo+" Gs.");
				$("#montotarjeta").text(v.montotarjeta+" Gs.");
				console.table(v);
			});

		}
	});
}