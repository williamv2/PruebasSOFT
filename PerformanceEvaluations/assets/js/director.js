function errorSesion() {
    var accion = document.getElementById("sesion_alert");
    accion.innerHTML = '<div class="alert alert-danger" style="color: #000000bf "role="alert">\n' +
        '                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>\n' +
        '                    Usuario o contraseña invalidos\n' +
        '                </div>';
    console.log(accion.innerHTML);
}

var accion = document.querySelector("#sesion_alert");
if(accion!=null){

    $.ajax({
        url:"include.php",
        data:{solicitud:'login'},
        type:"post",
        dataType:"json",
        success:function(data){
            document.getElementById("name").innerText = data.persona.nombres + " " + data.persona.apellidos;
        }
    });
}

var accion2 = document.querySelector("#close_sesion");
if(accion2!=null){
    $.ajax({
        url:"../../include.php",
        data:{solicitud:'homeDir'},
        type:"post",
        dataType:"json",
        success:function(data){
            document.getElementById("name").innerText = data.persona.nombres + " " + data.persona.apellidos;
        }
    });
}

var accion3 = document.querySelector("#view_profile");
if(accion3!=null){
    $.ajax({
        url:"../../include.php",
        data:{solicitud:'viewProfileDir'},
        type:"post",
        dataType:"json",
        success:function(data){
            document.getElementById("codigo").innerText = data.persona.codigo;
            document.getElementById("nombres").innerText = data.persona.nombres;
            document.getElementById("apellidos").innerText = data.persona.apellidos;
            document.getElementById("cedula").innerText = data.persona.dni;
            document.getElementById("celular").innerText = data.persona.celular;
            document.getElementById("direccion").innerText = data.persona.direccion;
            document.getElementById("correo").innerText = data.persona.correo;
        }
    });
}

var accion4 = document.querySelector("#edit_profile");
if(accion4!=null){
    $.ajax({
        url:"../../include.php",
        data:{solicitud:'viewProfileDir'},
        type:"post",
        dataType:"json",
        success:function(data){
            document.querySelector("#cel").value = data.persona.celular;
            document.querySelector("#dir").value = data.persona.direccion;
        }
    });
}

var accion5 = document.querySelector("#teacher_list");
if(accion5!=null) {
    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listDocentes'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";
            var respuesta3 = "";

            if (json.length != 0) {
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                for (var i = 0; i < json.length; i++) {
                    var Nombre = json[i].nombres + " " + json[i].apellidos;
                    var Codigo = json[i].codigo;
                    var Departamento = 'Ingenieria de Sistemas';

                    respuesta2 += '<button type="reset" class="btn btn-danger" style="margin-right: 20px" data-toggle="tooltip" data-placement="top" title="Pulsa el botón para editar la informacion del docente"><i class="zmdi zmdi-edit" onclick="accion"></i>';
                    respuesta2 += '&nbsp Editar';
                    respuesta2 += '</button>';
                    respuesta2 += '<button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Pulsa el botón para guardar la informacion del docente"><i class="zmdi zmdi-save" onclick="accion"></i>';
                    respuesta2 += '&nbsp Guardar';
                    respuesta2 += '</button>';

                    respuesta3 += '<button class="btn btn-sm btn-default">';
                    respuesta3 += 'ON';
                    respuesta3 += '</button>';
                    respuesta3 += '<button class="btn btn-sm btn-danger active">';
                    respuesta3 += 'OFF';
                    respuesta3 += '</button>';

                    t.row.add([Nombre, Codigo, Departamento, respuesta2, respuesta3]).draw(false);
                    respuesta2 = "";
                    respuesta3 = "";
                    respuesta = "";
                }
            }else{
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                alert("Ha ocurrido un error al listar los docentes");
            }
        }
    });
}

var accion6 = document.querySelector("#subject_list");
if(accion6!=null) {
    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listMateria'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";
            var respuesta3 = "";

            if (json.length != 0) {
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                for (var i = 0; i < json.length; i++) {
                    var Nombre = json[i].nombre;
                    var Codigo = json[i].codigo;

                    respuesta2 += '<button type="reset" class="btn btn-danger" style="margin-right: 20px" data-toggle="tooltip" data-placement="top" title="Pulsa el botón para editar la informacion del docente"><i class="zmdi zmdi-edit" onclick="accion"></i>';
                    respuesta2 += '&nbsp Editar';
                    respuesta2 += '</button>';
                    respuesta2 += '<button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Pulsa el botón para guardar la informacion del docente"><i class="zmdi zmdi-save" onclick="accion"></i>';
                    respuesta2 += '&nbsp Guardar';
                    respuesta2 += '</button>';

                    respuesta3 += '<button class="btn btn-sm btn-default">';
                    respuesta3 += 'ON';
                    respuesta3 += '</button>';
                    respuesta3 += '<button class="btn btn-sm btn-danger active">';
                    respuesta3 += 'OFF';
                    respuesta3 += '</button>';

                    t.row.add([Nombre, Codigo, respuesta2, respuesta3]).draw(false);
                    respuesta2 = "";
                    respuesta3 = "";
                    respuesta = "";
                }
            }else{
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                alert("Ha ocurrido un error al listar las asignaturas");
            }
        }
    });
}

var accion7 = document.querySelector("#period_list");
if(accion7!=null) {
    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listPeriodo'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";
            var respuesta3 = "";

            if (json.length != 0) {
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                for (var i = 0; i < json.length; i++) {
                    var Descripcion = json[i].descripcion;
                    var FechaI = json[i].fechaI;
                    var FechaF = json[i].fechaF;

                    respuesta2 += '<button type="reset" class="btn btn-danger" style="margin-right: 20px" data-toggle="tooltip" data-placement="top" title="Pulsa el botón para editar la informacion del docente"><i class="zmdi zmdi-edit" onclick="accion"></i>';
                    respuesta2 += '&nbsp Editar';
                    respuesta2 += '</button>';
                    respuesta2 += '<button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Pulsa el botón para guardar la informacion del docente"><i class="zmdi zmdi-save" onclick="accion"></i>';
                    respuesta2 += '&nbsp Guardar';
                    respuesta2 += '</button>';

                    respuesta3 += '<button class="btn btn-sm btn-default">';
                    respuesta3 += 'ON';
                    respuesta3 += '</button>';
                    respuesta3 += '<button class="btn btn-sm btn-danger active">';
                    respuesta3 += 'OFF';
                    respuesta3 += '</button>';

                    t.row.add([Descripcion, FechaI, FechaF, respuesta2, respuesta3]).draw(false);
                    respuesta2 = "";
                    respuesta3 = "";
                    respuesta = "";
                }
            }else{
                alert("Ha ocurrido un error al listar los periodos");
            }
        }
    });
}

var accion8 = document.querySelector("#info");
if(accion8!=null) {
    var date = new Date();
    var mes = date.getMonth()+1;
    var newDate = date.getDate() +" - "+ mes +" - "+ date.getFullYear();

    var t = $('#dataTables-example1').DataTable({select: true, lengthChange: false, searching: false, bInfo: false, bPaginate: false});
    t.clear().draw();
    t.row.add([newDate]).draw(false);
}

var accion9 = document.querySelector("#list_teacher");
if(accion9!=null) {
    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listDocentes'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";

            if (json.length != 0) {
                var t = $('#dataTables-example').DataTable({select: true});
                t.clear().draw();
                for (var i = 0; i < json.length; i++) {
                    var Nombre = json[i].nombres + " " + json[i].apellidos;
                    var Codigo = json[i].codigo;

                    respuesta2 += '<a href="teacherEvaluation.php?id='+Codigo+'" class="btn btn-danger"><i class="zmdi zmdi-check"></i>';
                    respuesta2 += '&nbsp Realizar Evaluacion';
                    respuesta2 += '</a>';


                    t.row.add([Nombre, respuesta2]).draw(false);
                    respuesta2 = "";
                    respuesta = "";
                }
            }else{
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                alert("Ha ocurrido un error al listar los docentes");
            }
        }
    });
}

var accion10 = document.querySelector("#list_pair");
if(accion10!=null) {
    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listDocentes'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";

            if (json.length != 0) {
                var t = $('#dataTables-example').DataTable({select: true});
                t.clear().draw();
                for (var i = 0; i < json.length; i++) {
                    var Nombre = json[i].nombres + " " + json[i].apellidos;
                    var Codigo = json[i].codigo;

                    respuesta2 += '<a href="pairEvaluation.php?id='+Codigo+'" class="btn btn-danger"><i class="zmdi zmdi-check"></i>';
                    respuesta2 += '&nbsp Realizar Evaluacion';
                    respuesta2 += '</a>';


                    t.row.add([Nombre, respuesta2]).draw(false);
                    respuesta2 = "";
                    respuesta = "";
                }
            }else{
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                alert("Ha ocurrido un error al listar los docentes");
            }
        }
    });
}

var accion11 = document.querySelector("#docente_director");
var accion12 = document.querySelector("#pair");
if(accion11!=null || accion11!=null){
    var loc = document.location.href;
    var getString = loc.split('?')[1];
    var codigo = getString.split('=');
    var id = codigo[1];

    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listDocentes'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";
            if (json.length != 0) {
                for (var i = 0; i < json.length; i++) {
                    var Nombre = json[i].nombres + " " + json[i].apellidos;
                    var Codigo = json[i].codigo;

                    if (Codigo === id) {
                        document.getElementById("nameDoc").innerText = Nombre;
                        document.getElementById("codigo").value = Codigo;
                    }
                }
            }
        }
    });
}

var accion13 = document.querySelector("#progress");
if(accion13!=null) {
    $.ajax({
        url: "../../include.php",
        data: {solicitud: 'listDocentes'},
        type: "post",
        //dataType: "Array",
        success: function (response) {
            var json = JSON.parse(response);
            var respuesta = "";
            var respuesta2 = "";

            if (json.length != 0) {
                var t = $('#dataTables-example').DataTable({select: true});
                t.clear().draw();
                for (var i = 0; i < json.length; i++) {
                    var Nombre = json[i].nombres + " " + json[i].apellidos;
                    var Codigo = json[i].codigo;

                    t.row.add([Nombre, Codigo, 'Incompleto']).draw(false);
                }
            }else{
                var t = $('#dataTables-example').DataTable();
                t.clear().draw();
                alert("Ha ocurrido un error al listar los docentes");
            }
        }
    });
}