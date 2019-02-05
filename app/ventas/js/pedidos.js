 $(document).ready(function(){
	comprobarApertura();
    cargar();
    
});

var apertura = false;

function comprobarApertura(){
    $.ajax({
        url:'./ajax/aperturaCierre.php?accion=comprobarApertura',
        dataType: "json",
        success:function(data){

                if (data=="CERRADO") {
                    var mensaje=confirm("CAJA CERRADA. ABRIR?");

                    if (!mensaje) {
                        apertura = false;
                        deshabilitarFacturacion();
                        }else if(mensaje){
                            if($("#user_nivel").text()=="VENDEDOR"){
                                deshabilitarFacturacion();
                            }else{
                                abrirCaja();
                            }
                            
                        }
                }

                if (data!="CERRADO") {
                    $.each(data, function(i,v){
                        apertura = true;
                        $("#idapertura").text(v.id);
                        $("#nrocaja").text(v.nrocaja);
                        $("#idsucursal").text(v.idsucursal);
                    });
                }


            }
        });
}

//verificacion de apertura cierre
function deshabilitarFacturacion(){
    if (apertura==false) {
        $(".addDetalle").prop("disabled", true);
        $(".facturar").prop("disabled", true);
        $("#nuevop").addClass("disabled");
    }
    
}


//inicio cargar pedidos
function cargar(){
	$.ajax({
		url:'./ajax/grillapedidos.php?accion=cargar',

		beforeSend: function(objeto){
		       $('#loader').html('<img src="../img/ajax-loader.gif"> Cargando...');
			 },
		success:function(data){
				$("#grilla-pedido").html(data).fadeIn('slow');
					
			}
		});
}


function cargarFecha() {
	var desde = $("#desde").val();
	var hasta = $("#hasta").val();
    $.ajax({
        url:'./ajax/grillapedidos.php?accion=cargar',
        method: 'post',
        data: {condicion: "FECHA", desde: desde, hasta: hasta},

        beforeSend: function(objeto){
            $('#loader').html('<img src="../img/ajax-loader.gif"> Cargando...');
        },
        success:function(data){
            
            $("#grilla-pedido").html(data).fadeIn('slow');
            deshabilitarFacturacion();

        }
    })
     
}
//fin carga de pedidos (grilla)


//modal ver detalles de pedidos facturados

function verDetalle(id){
    $('#modalVerDetalle').modal("show");
    $("#modalVerDetalleTitle").html("Detalles Pedido ID: "+id);
    $("#grillaVerDetalle tbody tr").remove();
    $("#grillaVerDetalle tfoot .tfoot-body").html("");

    var sql = "SELECT * FROM vsdetallepedido WHERE idpedido="+id;

    $.ajax({
        url: "./ajax/cargarModalDetallePedido.php?action=detallePedido",
        method: "post",
        dataType: "json",
        data: {sql: sql},

        success: function (data) {
            var gravada = 0;
            var iva10 = 0;
            var total = 0;

            $.each(data, function (i, v) {

                var markup = '<tr>';
                markup += '<td>' +v.idproducto +'</td>';
                markup += '<td>' +v.cantidad +'</td>';
                markup += '<td>' +v.descripcion +'</td>';
                markup += '<td>'+'Gs. '+ v.precio +'</td>';
                markup += '</tr>';
                console.log(markup);
                $("#grillaVerDetalle tbody").append(markup);

                iva10 = iva10+ Math.round(v.precio/11);
                gravada = gravada+ (parseInt(v.precio)-Math.round(v.precio/11));
                total = iva10+gravada;

               // console.log("iva10: "+iva10+" gravada: "+gravada);


            });
            $("#grillaVerDetalle .sbt").append("Gs. "+gravada);
            $("#grillaVerDetalle .total-iva").append("Gs. "+iva10);
            $("#grillaVerDetalle .total").append("Gs. "+total);
            console.log("iva10: "+iva10+" gravada: "+gravada+" total: "+total);

        }
    });

}


//modal agregar detalles


function addDetalle(id){

    cargarSelectAddDetalle();
    $('#modalAddDetalle').modal("show");
    $("#modalAddDetalleTitle").html("Detalles Pedido ID: "+id);
    $("#addDetalleIDP").val(id);
    $("#grillaAddDetalle tbody tr").remove();
    $("#grillaAddDetalle tfoot .tfoot-body").html("");


    var sql = "SELECT * FROM vsdetallepedido WHERE idpedido="+id;

    $.ajax(
    {
        url: "./ajax/cargarModalDetallePedido.php?action=detallePedido",
        method: "post",
        dataType: "json",
        data: {sql: sql},

        success: function (data) {
            var gravada = 0;
            var iva10 = 0;
            var total = 0;

            $.each(data, function (i, v) {

                var markup = '<tr>';
                markup += '<td class="id">' +v.idproducto +'</td>';
                markup += '<td>' +v.cantidad +'</td>';
                markup += '<td>' +v.descripcion +'</td>';
                markup += '<td>'+'Gs. '+ v.precio +' <button class="btn btn-xs btn-danger btne" onclick="eliminarDetallesModal('+v.idproducto+')">Q</button></td>';
                markup += '</tr>';
                console.log(markup);
                $("#grillaAddDetalle tbody").append(markup);

                iva10 = iva10+ Math.round( (v.precio*v.cantidad) /11);
                gravada = gravada+ parseInt(v.precio*v.cantidad) -Math.round((v.precio*v.cantidad)/11);
                total = iva10+gravada;

               // console.log("iva10: "+iva10+" gravada: "+gravada);


            }
            );
            $("#grillaAddDetalle .sbt").append("Gs. "+gravada);
            $("#grillaAddDetalle .total-iva").append("Gs. "+iva10);
            $("#grillaAddDetalle .total").append("Gs. "+total);
            console.log("iva10: "+iva10+" gravada: "+gravada+" total: "+total);
             }
         }
    );
}



function cargarSelectAddDetalle(){
    $("#addDetalleProductos option").remove();
    $.ajax({
        url: "./ajax/cabecerapedidos.php?action=productos",
        method: "post",
        dataType: "json",
        data: {sql: "SELECT id, descripcion FROM vsproductos"},

        success: function (data) {
            $.each(data, function(i, v){
                var markup = '<option value="'+v.id+'">';
                markup += v.descripcion;
                markup += '</option>';

                $("#addDetalleProductos").append(markup);
            });
            

        }
    });
}

function addDetalleInsert(){
   var cantidad = $("#addDetalleCantidad").val();
   var idproducto = $("#addDetalleProductos").val();
   var idpedido = $("#addDetalleIDP").val();

   
   if (cantidad <= 0 || cantidad=="") {
        alert("CANTIDAD NO VALIDA!!");

   }else{
     var sql = "INSERT INTO pedidodetalle ";
     sql += " (idpedido,idproducto,cantidad,precio) ";
     sql += " VALUES ("+idpedido+","+idproducto+","+cantidad+",(SELECT precio FROM productos WHERE id="+idproducto+"));";
        
     $.ajax({
        url: "./ajax/guardarpedidos.php?accion=guardarDetalleModal",
        method: "post",
        data: {sql: sql},

        success: function (data) {
            if(data=="repetido"){
                alert("YA EXISTE EL PRODUCTO!!");

            }else{
                addDetalle(idpedido);
            }

        }
    });

   }
}

function eliminarDetallesModal(idproducto){
    var mensaje = confirm("DESEA ELIMINAR");

    if (mensaje) {

        var idpedido = $("#addDetalleIDP").val();

        console.log("ID pedido: "+idpedido+" idproducto: "+idproducto);
        var sql ="DELETE FROM pedidodetalle WHERE idpedido ="+idpedido +" AND idproducto ="+idproducto;

        $.ajax({
            url: "./ajax/guardarpedidos.php?accion=eliminarDetalleModal",
            method: "post",
            data: {sql: sql},

            success: function (data) {
                if(data=="eliminado"){
                    addDetalle(idpedido);

                 }
            }
        });
    }

}




function autonum(tabla,idinput){
    $.ajax({
            url: "./ajax/guardarFactura.php?action=autonumerico",
            method: "post",
            data: {sql: "SELECT COALESCE(MAX(id),0)+1 AS id FROM "+tabla},

            success: function (data) {
               $("#"+idinput).val(data);
            }
        });
    }



