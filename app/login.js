function login() {
	var datos = $("#acceder").serialize();
	console.log(datos);
	$.ajax({
		url: "login.php",
		method: "POST",
		data: datos,
		success: function(data){
			console.log(data);
			if (data==="denied") {
				console.log("Sesion no Iniciada");
				$("#error").css("display","inline");
			}else if(data==="DESARROLLADOR" || data=="CAJERO" || data=="VENDEDOR"){
				location.href="ventas/index.php";
			} else if(data==="DESARROLLADOR" || data==="JEFE COMPRAS" || data=="ALMACEN"){
				location.href="compras/index.php";
			}

		}
	});
}