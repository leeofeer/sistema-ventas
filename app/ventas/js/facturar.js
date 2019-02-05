//modal addRazonSocial --inicio de facturacion--

//hacer el detalle y el cobro

function facturar(idpedido){
    $('#modalAddRazonSocial').modal("show");
    $('#idpedidoFacturar').val(idpedido); //establece el idpedido en una variable para ser encontrado desde la funcion de cargarDetalleFactura
}


function buscarModalRazonSocial(){
    
    $("#resultado tbody tr").remove();
    var ruc = $("#busqueda").val();
    if (ruc=="") {
        alert("INTRODUZCA RUC");
    }else{


    $("#div_table").css("display","inline");
    var sql = "SELECT id, razonsocial, documento FROM vsclientes WHERE documento ="+ruc;
    $.ajax({
            url: "./ajax/cabecerapedidos.php?action=clientes",
            method: "post",
            dataType: "json",
            data: {sql: sql},

            success: function (data) {
                if (data=="") {
                    var markup = '<tr>';
                    markup += '<td>0</td>';
                    markup += '<td>NO EXISTE EL CLIENTE</td>';
                    markup += '<td>0</td>';
                    markup += '<td>'+'<button class="btn btn-xs btn-warning" onclick="addCliente()">CREAR</button>'+'</td>';
                    markup += '</tr>';
                    $("#resultado").append(markup);
                }
                    $.each(data, function(i, v){
                    var markup = '<tr>';
                    markup += '<td>'+v.id +'</td>';
                    markup += '<td>'+v.razonsocial +'</td>';
                    markup += '<td>'+v.documento +'</td>';
                    markup += '<td>'+'<button class="btn btn-xs btn-success" onclick="agregarClienteFactura('+v.id+')">Agregar</button>'+'</td>';
                    markup += '</tr>';
                    $("#resultado").append(markup);
                });
                }
                      
    });

    }


}

function addCliente(){

    $("#busqueda").prop("disabled", true);

    $("#search").prop("disabled", true);
    $("#div_form").css("display","inline");
    $("#div_table").css("display","none");
    
    cargarSelectCiudad();
    autonum("clientes", "idcliente");
}

function cargarSelectCiudad(){
    $("#idciudad option").remove();
    var sql = "SELECT * FROM CIUDADES";
     $.ajax({
            url: "./ajax/cabecerapedidos.php?action=ciudades",
            method: "post",
            dataType: "json",
            data: {sql: sql},

            success: function (data) {
                $.each(data, function(i, v){
                    var markup = '<option value="'+v.id+'">'+v.descripcion+'</option';
                    $("#idciudad").append(markup);
                });
            }
        });
}

function guardarClienteModal(){


if ($("#razonsocial").val() =="" || $("#ruc").val() =="" || $("#direccion").val() =="" 
    || $("#prefijo").val() =="" || $("#telefono").val() =="" || $("#idciudad").val() ==""){
    alert("Rellene TODOS los Campos!!");
} else{
    var razonsocial = $("#razonsocial").val();
    var ruc = $("#ruc").val();
    var direccion = $("#direccion").val();
    var telefono = $("#prefijo").val();
    telefono+= $("#telefono").val();
    var idciudad = $("#idciudad").val();
    var id =  $("#idcliente").val();
    


    var sql = "INSERT INTO clientes (id,razonsocial,documento,direccion,telefono,idciudad) ";
    sql += " VALUES ("+id+",'"+razonsocial+"','"+ruc+"','"+direccion+"','"+telefono+"','"+idciudad+"');";

    insertarClienteAJAX(sql);
    //console.log("razonsocial: "+razonsocial+" ruc: "+ruc+" direccion: "+direccion+" telefono: "+telefono+" idciudad: "+idciudad);

    }
}

function insertarClienteAJAX(sql){
    $.ajax({
            url: "./ajax/guardarFactura.php?action=insertarClienteNuevo",
            method: "post",
            data: {sql: sql},

            success: function (data) {
               if (data=="DONE") {
                    cancelarModal();
               }
            }
        });
    }

//fin modal client

//inicio facturacion -- modal factura
function agregarClienteFactura(idcliente){
    $('#modalAddRazonSocial').modal("toggle");
    $('#modalFacturar').modal("show");
    cargarDetalleFactura(idcliente);
}

function cargarDetalleFactura(idcliente){
    var idpedido = $('#idpedidoFacturar').val();
    var nrofact = calcularNroFactura();
    var timbrado = obtenerTimbrado();
    obtenerCliente(idcliente);
    obtenerPedido(idpedido);
    
    $("#facturanro").html(nrofact);

    console.log(nrofact);

}

function calcularNroFactura(){
    var idpedido = $('#idpedidoFacturar').val();
    var idapertura = $('#idapertura').text();
    var idsucursal = $('#idsucursal').text();
    var nrocaja = $('#nrocaja').text();

    var nrofactura = "FACTURA Nº: ";

    if (parseInt(nrocaja)<10) {
        nrofactura += "00"+nrocaja+"-";

    }else if (parseInt(nrocaja)<100&&parseInt(nrocaja)>10) {
        nrofactura += "0"+nrocaja+"-";
    }else{
        nrofactura += nrocaja+"-";
    }


    //sucursal inventada

    if (parseInt(idsucursal)<10) {
        nrofactura += "00"+idsucursal+"-";

    }else if (parseInt(idsucursal)<100&&parseInt(idsucursal)>10) {
        nrofactura += "0"+idsucursal+"-";
    }else{
        nrofactura += idsucursal+"-";
    }
    //var factura = 0;

    $.ajax({
        url: "./ajax/guardarFactura.php?action=autonumerico",
        type: "post",
        async: false,
        data: {sql: "SELECT COALESCE(MAX(nrofactura),0)+1 AS id FROM facturaventa"},
       
        success: function(data){
            if (parseInt(data)<10) {
                nrofactura += "000000"+data;
                console.log(data);
            }else if (parseInt(data)<100&&parseInt(data)>10) {
                nrofactura += "00000"+data;
                console.log(data);
            }else if (parseInt(data)<1000&&parseInt(data)>100){
                nrofactura += "0000"+data;
            }else if (parseInt(data)<10000&&parseInt(data)>1000){
                nrofactura += "000"+data;
            }else if (parseInt(data)<100000&&parseInt(data)>10000){
                nrofactura += "00"+data;
            }else if (parseInt(data)<1000000&&parseInt(data)>100000){
                nrofactura += "0"+data;
            }else{
                nrofactura += data;
            }

        }
    });
return nrofactura;
    
    
}

function obtenerTimbrado(){
    $.ajax({
        url: "./ajax/guardarFactura.php?action=recuperarTimbrado",
        dataType:"json",
        success: function(data){
            if (data=="VENCIDO") {
                $("#nrotimbrado").html("TIMBRADO VENCIDO. COMUNICAR A JEFE.");
            }else{
                $.each(data, function(i,v){
                $("#nrotimbrado").html("TIMBRADO NRO. "+v.nrotimbrado);
                });
            }
        }
    });
}

function obtenerCliente(idcliente){
    console.log(idcliente);
    $.ajax({
        url: "./ajax/guardarFactura.php?action=recuperarCliente",
        type: 'post',
        dataType:"json",
        data: {idcliente: idcliente},
        success: function(data){

            $.each(data, function(i,v){
            $("#id_cliente").val(v.id);
            $("#razon_social").html(v.razonsocial);
            $("#nro_documento").html(v.documento);
            $("#direccion_cliente").html(v.direccion);
            });
        }
    });
}

function obtenerPedido(idpedido){
    console.log(idpedido);

    $.ajax({
        url: "./ajax/guardarFactura.php?action=recuperarPedido",
        type: 'post',
        dataType:"json",
        data: {idpedido: idpedido},
        success: function(data){
            $("#modalFacturarGrilla tbody").html("");
            var total = 0;
            
            $.each(data, function(i,v){
                console.log(data);
                total = parseInt(total)+parseInt(v.subtotal);
                $("#id_pedido").val(v.idpedido);
                $("#nro_pedido").html(v.nropedido);
                var markup = '<tr>';
                markup += '<td>'+v.codigoproducto+'</td>';
                markup += '<td>'+v.cantidad+'</td>';
                markup += '<td>'+v.descripcion+'</td>';
                markup += '<td> Gs. '+v.precio+'</td>';
                markup += '<td> Gs. '+v.subtotal+'</td>';
                markup += '</tr>';

                $("#modalFacturarGrilla tbody").append(markup);
            });
            var iva10 = Math.round(total/11);
            console.log(total);
            console.log(iva10);
            $("#modalFacturarGrilla tfoot").find(".total-iva").html("Gs. "+iva10);
            $("#modalFacturarGrilla tfoot").find(".total").html("Gs. "+total);
        }
    });

    generarIdFactura();
}

function generarIdFactura(){
    $.ajax({
        url: "./ajax/guardarFactura.php?action=autonumerico",
        method: "post",
        data: {sql: "SELECT COALESCE(MAX(id),0)+1 AS id FROM facturaventa"},
        success: function(data){
            $("#id_factura").val(data);
        }
    });

}
 //ya guarda  lpm
function guardarFacturaVenta(){
    var idpedido = $("#id_pedido").val();
    var idcliente = $("#id_cliente").val();
    var idfactura = $("#id_factura").val();
    var nrofactura_completo = $("#facturanro").text();
    var nrofactura_separado = nrofactura_completo.split("-");
    var nrofactura = nrofactura_separado[2];
    $.ajax({
        url: "./ajax/guardarFactura.php?action=insertarFacturaNuevo",
        method: "post",
        data: {idpedido: idpedido,idcliente: idcliente, idfactura: idfactura, nrofactura: nrofactura},
        success: function(data){
            if (data==="DONE") {
                $("#modalFacturar").modal("toggle");
                cargar();
            }
        }
    });
}