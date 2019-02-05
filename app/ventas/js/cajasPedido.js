
//modal abrrir nueva caja
function abrirCaja()
{
    $('#modalAbrirCaja').modal({backdrop: 'static', keyboard: false});
    $('#modalAbrirCaja').modal("show");

    cargarSelectCaja();
    cargarSelectSucursal();
    autonum("aperturacierre","idapertura");

}

function cargarSelectCaja(){
    $.ajax({
        url:'./ajax/aperturaCierre.php?accion=cargarCajas',
        dataType:"json",

        success:function(data){
            var select = $("#AbrirCajaIdCaja");
            $("#AbrirCajaIdCaja option").remove();
               if (data=="CERRADO") {
                    select.append('<option value="0">NO HAY CAJAS HABILITADAS</option>');
                    $("#abrirCajaAbrir").prop("disabled",true);
               }else {
                    $.each(data, function(i,v){
                        select.append('<option value="'+v.id+'">'+v.nrocaja+'</option>');
                    });
               }
            }
        });
}

function cargarSelectSucursal(){
    $.ajax({
        url:'./ajax/aperturaCierre.php?accion=cargarSuc',
        dataType:"json",

        success:function(data){
            var select = $("#AbrirCajaIdSuc");
            $("#AbrirCajaIdSuc option").remove();
               if (data=="CERRADO") {
                    select.append('<option value="0">NO HAY SUCURSALES HABILITADAS</option>');
                    $("#abrirCajaAbrir").prop("disabled",true);
               }else {
                    $.each(data, function(i,v){
                        select.append('<option value="'+v.id+'">'+v.descripcion+'</option>');
                    });
               }
            }
        });
}




function insertarCajaAbierta(){

    var idcaja = $("#AbrirCajaIdCaja").val();
    var montoApertura = $("#AbrirCajaMontoApertura").val();
    var idapertura = $("#idapertura").val();
    var idsucursal = $("#AbrirCajaIdSuc").val();

    $.ajax({
        url:'./ajax/aperturaCierre.php?accion=insertarApertura',
        method: "post",
        data: {id: idapertura, idcaja: idcaja, montoapertura: montoApertura, idsucursal:idsucursal} ,

        success:function(data){
            apertura = true;
            $('#modalAbrirCaja').modal("toggle");
            comprobarApertura();
        }
    });

}

//fin modal abrir nueva caja
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

//fin comprobacion de apertura