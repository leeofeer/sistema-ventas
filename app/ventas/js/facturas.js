$(document).ready(function(){
	comprobarApertura();
	cargarGrillaFacturas();
});

//hacer detalle y cobro



var apertura = false;

function comprobarApertura(){
    $.ajax({
        url:'./ajax/aperturaCierre.php?accion=comprobarApertura',
        dataType: "json",
        success:function(data){
			if (data=="CERRADO") {
                 deshabilitarFacturacion();
                }else{
                	apertura = true;
                }
            }
        });
}

//verificacion de apertura cierre
function deshabilitarFacturacion(){
    if (apertura==false) {
        $(".anular").prop("disabled", true);
        $(".cobrar").prop("disabled", true);
        $("#nuevop").addClass("disabled");
    }
    
}


//inicio cargar pedidos
function cargarGrillaFacturas(){
	$.ajax({
		url:'./ajax/grillafacturas.php?accion=cargar',

		beforeSend: function(objeto){
		       $('#loader').html('<img src="../img/ajax-loader.gif"> Cargando...');
			 },
		success:function(data){
				$("#grilla-facturas").html(data).fadeIn('slow');
					
			}
		});
}


function cargarFecha() {
	var desde = $("#desde").val();
	var hasta = $("#hasta").val();
    $.ajax({
        url:'./ajax/grillafacturas.php?accion=cargar',
        method: 'post',
        data: {condicion: "FECHA", desde: desde, hasta: hasta},

        beforeSend: function(objeto){
            $('#loader').html('<img src="../img/ajax-loader.gif"> Cargando...');
        },
        success:function(data){
            
            $("#grilla-facturas").html(data).fadeIn('slow');
            deshabilitarFacturacion();

        }
    })
     
}

function verDetalle(id){
    $('#modalVerDetalle').modal("show");
    
    $("#grillaVerDetalle tbody tr").remove();
    $("#grillaVerDetalle tfoot .tfoot-body").html("");
    $.ajax({
        url: './ajax/facturas.php?action=recuperarPedidoDetalle',
        method: "post",
        dataType: "json",
        data: {id:id},
        success: function(data){
            var gravada = 0;
            var iva10 = 0;
            var total = 0;

            $.each(data, function (i, v) {
                $("#modalVerDetalleTitle").html("Detalles Pedido: "+v.nropedido);

                var markup = '<tr>';
                markup += '<td>' +v.idproducto +'</td>';
                markup += '<td>' +v.cantidad +'</td>';
                markup += '<td>' +v.descripcion +'</td>';
                markup += '<td>'+'Gs. '+ v.precio +'</td>';
                markup += '</tr>';
                console.log(markup);
                $("#grillaVerDetalle tbody").append(markup);

                iva10 = iva10+ Math.round((v.precio*v.cantidad)/11);
                gravada = gravada+ (parseInt((v.precio*v.cantidad))-Math.round((v.precio*v.cantidad)/11));
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

//hacer el cobro COMO SEA lpm

//inicio cobros

//primera funcion recupera detalles del pedido mediante los parametros pasados
function cobrarFactura(id){
    recuperarPedidoDetalle(id, "grillaVerDetalleCobro", "modalCobrar", "modalCobrarTitle");
}




function recuperarPedidoDetalle(id, grilla, modal, titulo){
    $('#'+modal).modal("show");
    
    $("#"+grilla+" tbody tr").remove();
    $("#"+grilla+" tfoot .tfoot-body").html("");
    $.ajax({
        url: './ajax/facturas.php?action=recuperarPedidoDetalle',
        method: "post",
        dataType: "json",
        data: {id:id},
        success: function(data){
            var gravada = 0;
            var iva10 = 0;
            var total = 0;

            $.each(data, function (i, v) {
                $("#"+titulo).html("Pedido: "+v.nropedido);

                var markup = '<tr>';
                markup += '<td>' +v.idproducto +'</td>';
                markup += '<td>' +v.cantidad +'</td>';
                markup += '<td>' +v.descripcion +'</td>';
                markup += '<td>'+'Gs. '+ v.precio +'</td>';
                markup += '</tr>';
                //console.log(markup);
                $("#"+grilla+" tbody").append(markup);

                iva10 = iva10+ Math.round((v.precio*v.cantidad)/11);
                gravada = gravada+ (parseInt((v.precio*v.cantidad))-Math.round((v.precio*v.cantidad)/11));
                total = iva10+gravada;

               // console.log("iva10: "+iva10+" gravada: "+gravada);


            });

            $("#"+grilla+" .sbt").append("Gs. "+gravada);
            $("#"+grilla+" .total-iva").append("Gs. "+iva10);
            $("#"+grilla+" .total").append("Gs. "+total);
            //console.log("iva10: "+iva10+" gravada: "+gravada+" total: "+total);

        }
    });

}


//inserta el nuevo cobro en la base de datos
function guardarCobro(){
    //obtener total
    var total_unido = $("#grillaVerDetalleCobro").find(".total").text();
    var separar_total = total_unido.split(" ");
    var total = separar_total[1];
    //obtener nropedido
    var title = $("#modalCobrarTitle").text();
    var separar = title.split(" ");
    var nropedido = separar[1];

    $.ajax({
        url: "./ajax/cobros.php?action=guardarCobro",
        method: "post",
        data: {nropedido: nropedido, idtipocobro: 1, montoefectivo: total, montotarjeta: 0},
        success: function(data){
            $("#modalCobrar").modal("toggle");
            cargarGrillaFacturas();
        }
    });
}

//fin cobros

//inicio anular factura

function anularFactura(id){
    $.ajax({
        url: "./ajax/facturas.php?action=anularFactura",
        method: "post",
        data: {id: id},
        success: function(data){
            cargarGrillaFacturas();
        }
    });
}