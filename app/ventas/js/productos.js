function cargarGrillaProductos(condicion){
	$.ajax({
		url: "./ajax/productos.php?action=recuperarProductos",
		method: "post",
		dataType:"json",
		data: {condicion:condicion},
		success: function (data){
			//console.table(data);
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
 
 function update(id) {
 	// body...
 }

 function quitar(id) {
 	// body...
 }