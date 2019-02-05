$(document).ready(function(){
    //console.info($("#user_nivel").text());
    if ($("#user_nivel").text()==="CAJERO"){
        cargarGrillaAperturas();
        cargarHistorico();
        $("#apercierre_historico").css("display", "inherit");
    }else{
        $("#panel_grilla-apertura").css("display", "none");
        $("#apercierre_historico").css("display", "inherit");
        cargarHistorico();
    
    }
    
});



function cargarGrillaAperturas(){
    var tabla = $("#grilla-apertura");
    $.ajax({
        url: './ajax/aperturaCierre.php?accion=cargarAperturas',
        dataType: 'json',
        success: function(data){

            $.each(data, function(i,v){
                $("#btn_abrir_caja").prop("disabled",true);
                var markup = '<tr>';
                markup += '<td>'+v.nrocaja+'</td>';
                markup += '<td>'+v.fechaapertura+'</td>';
                markup += '<td>'+v.horaapertura+'</td>';
                markup += '<td>'+v.montoapertura+'</td>';
                markup += '<td>'+'<button class="btn btn-danger" onclick="cerrarCaja('+v.id+')">'+'Cerrar'+'</button>'
                tabla.find("tbody").append(markup);
            });
        }
    });
}

function cerrarCaja(idapertura){
$.ajax({
        url: './ajax/aperturaCierre.php?accion=insertarCierre',
        method: "post",
        data: {id: idapertura},
        success: function(data){
            console.info(data);
            location.reload();
        }
    });

}


//inicio historico cajas
function cargarHistorico(){
    if(cargarSelectCajas()){
    cargarGrillaHistorico();
    }
}

function cargarSelectCajas(){
    $.ajax({
        url: "./ajax/aperturaCierre.php?accion=cargarCajas",
        dataType: "json",
        async: false,
        success: function(data){
            var combo = $("#caja");
            var idcaja_activo = $("#nrocaja").text().trim();

            //console.info(idcaja_activo);
            //console.table(data);

            var seleccionado = "";

            $.each(data, function(i,v){

                if (v.id==parseInt(idcaja_activo)) {
                    seleccionado = " selected ";
                }else{
                    seleccionado = "";
                }
                var opciones = '<option value="'+v.id+'" '+seleccionado+'>';
                opciones += v.nrocaja;
                opciones += '</option>';
                combo.append(opciones);

            });
        }
    });
    return true;
}

function cargarGrillaHistorico(){
    var idcaja = $("#caja").val();
    $("#historico_grilla-apercierre tbody tr").remove();
    $.ajax({
        url: "./ajax/aperturaCierre.php?accion=cargarHistorico",
        dataType: "json",
        method: "post",
        data: {idcaja: idcaja},
        success: function(data){

           // console.table(data);
            $.each(data, function(i,v){
                var filas = '<tr>';
                filas +="<td>"+v.nrocaja+"</td>";
                filas +="<td>"+v.fechaapertura+"</td>";
                filas +="<td>"+v.horaapertura+" Hs.</td>";
                filas +="<td>"+v.montoapertura+" Gs.</td>";
                filas +="<td>"+v.fechacierre+"</td>";
                filas +="<td>"+v.horacierra+" Hs.</td>";
                filas +="<td>"+v.montocierre+" Gs.</td>";
                filas +="</tr>";

                $("#historico_grilla-apercierre tbody").append(filas);
            });
        }
    });
}
