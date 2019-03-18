function recuperarInsumos(id=0){
	if (id>0) {
		$.ajax({
			url: "./ajax/v1/insumos/"+id,
			dataType: "json",
			success: function(data){
				console.table(data);
			}
		});
	}else{
		$.ajax({
		url: "./ajax/v1/insumos/",
		dataType: "json",
		success: function(data){
			let col = data[0];

			console.log(col);
		}
	});
	}
	

}


function addInsumo(){
	var descripcion = $("#descripcion").val();
	var idimpuesto = $("#idimpuesto").val();
	var idmarca = $("#idmarca").val();
	var idproveedor = $("#idproveedor").val();
	$.ajax({
		url: "http://localhost:8080/insumos",
		method: "post",
		data: {descripcion:descripcion, idimpuesto:idimpuesto, idmarca:idmarca, idproveedor:idproveedor},
		success: function(data){
			console.log(data);
		}
	});
}

function delInsumo(id){
	$.ajax({
		url: "./ajax/v1/insumos/"+id,
		method: "delete",
		dataType: "json",
		success: function(data){
			console.log(data);
		}
	});
}

function updInsumo(idinsumo){
	var descripcion = $("#descripcion").val();
	var idimpuesto = $("#idimpuesto").val();
	var idmarca = $("#idmarca").val();
	var idproveedor = $("#idproveedor").val();
	$.ajax({
		url: "./ajax/v1/insumos/"+idinsumo,
		method: "put",
		dataType: "json",
		data: {idinsumo: idinsumo, descripcion:descripcion, idimpuesto:idimpuesto, idmarca:idmarca, idproveedor:idproveedor},
		success: function(data){
			console.log(data);
		}
	});
}

