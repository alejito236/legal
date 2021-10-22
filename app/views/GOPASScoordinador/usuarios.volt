<style>
    select{
        height: 33px!important;
    }        
	.page-item.active .page-link {
        background-color: #fff!important;        
        border-color: #ddd!important;
        color: #777!important;
    }
    table{
		text-transform: uppercase;
	}    
</style>

{% if ok is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> {{ok}}
        </div>
    </div>
{% endif %}

{% if error is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> {{error}}.
        </div>
    </div>
{% endif %}

{% if userCreate is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Usuario creado con exito.
        </div>
    </div>
{% endif %}

{% if userError is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-ban"></i> El usuario {{userError}} ya se encuentra registrado en la Base de Datos.
        </div>
    </div>
{% endif %}
<br><br><br><br>
<div class="row col-md-12">
    <form action="{{url('GOPASScoordinador/usuarios')}}" method="POST">
        <div class="col-md-5">
            <input type="text" id="buscarUsuario" placeholder="Buscar Usuarios" name="buscarUsuario" class="form-control">
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary form-control" id="btnBuscar" name="btnBuscar">Buscar</button>
            <br>
        </div>
    </form>
    <div class="col-md-2">
        <button class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal5">  <i class="fas fa-plus-square"></i> Agregar</button>
        <br>
    </div>
</div>
<br><br><br><br>
{% if usuarios is defined %}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Usuarios</h5>
                
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">

                <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover dataTables-example" >
            <thead>
            <tr>
                <th>#</th>
                <th>Nombre Completo</th>
                <th>Cedula</th>
                <th>Nombre de usuario</th>                
                <th>Rol</th>
                <th>Editar</th>
            </tr>
            </thead>
            <tbody>
            {% if usuarios is empty %}
                No hay datos
            {% else %}
                {% for item in usuarios %}
                    
                    <tr class="gradeX">
                        <td>{{ item.usuarioId }}</td>
                        <td>{{ item.nombreAsesor }}</td>
                        <td>{{ item.cedula }}</td>
                        <td>{{ item.login }}</td>                        
                        <td>GOPASS</td>
                        <td>{{ item.nombreRol }}</td>
                        <td class="text-center">
                            <form action="{{url('GOPASScoordinador/usuarios')}}" method="POST">
                                <input type="hidden" name="edit" value="edit">
                                <input type="hidden" name="nombre" value="{{item.nombreAsesor}} ">
                                <input type="hidden" name="apellidos" value="{{item.apellidoAsesor}}">
                                <input type="hidden" name="campana" value="GOPASS">
                                <input type="hidden" name="id" value="{{item.usuarioId}}">
                                <input type="hidden" name="usuario" value="{{item.login}}">
                                <input type="hidden" name="estado" value="{{item.estado}}">
                                <input type="hidden" name="rol" value="{{item.rolId}}">
                                <input type="hidden" name="cedula" value="{{item.cedula}}">
                                <button type="submit" id = "botonEditar" class="botonEditar btn btn-warning" onlick({{item.cedula}});><i class="fa fa-user-edit"></i></button>
                            </form>
                        </td>
                    </tr>
                {% endfor %}
            {% endif %}
            
            </tbody>
            </table>
                </div>

            </div>
        </div>
    </div>
    </div>
    {% endif %}
</div>
<div class="modal modal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                {% if dato is defined %} 
                    <h4 class="modal-title">Actualizar Usuario</h4>
                {% else %} 
                    <h4 class="modal-title">Agregar nuevo Usuario</h4>
                {% endif %}
            </div>
            <div class="modal-body">
                <form method="post" {% if dato is defined %} action="{{url('GOPASScoordinador/editUsuario')}}" {% else %} action="{{url('GOPASScoordinador/nuevoUsuario')}}" {% endif %}>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="col-md-3">
                                <label for="">Nombres:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="hidden" name="id" value="{% if dato is defined %}{{dato['id']}}{% endif %}">
                                <input type="text" value="{% if dato is defined %}{{dato['nombre']}}{% endif %}" required placeholder="Nombres" name="nombres" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-3">
                                <label for="">Apellidos:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="text" placeholder="Apellidos" value="{% if dato is defined %}{{dato['apellidos']}}{% endif %}" required name="apellidos" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="col-md-3">
                                <label for="">Cedula:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="number" placeholder="Cedula" value="{% if dato is defined %}{{dato['cedula']}}{% endif %}" name="cedula" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <br>
                            <div class="col-md-3">
                                <label for="">Campaña:</label>
                            </div>
                            <div class="col-md-12">
                                <select required name="campana" id="campana" class="form-control m-b">
                                    <option value="16" {% if dato is defined %}{% if dato['campana'] == 16 %}selected{% endif %}{% endif %}>GOPASS</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <br>
                            <div class="col-md-3">
                                <label for="">Rol:</label>
                            </div>
                            
                            <div class="col-md-12">
                                <select required name="rol" id="rol1" class="form-control m-b">
                                    <option value="">Seleccione..</option>                                    
                                    {% for item in roles %}
                                        <option value="{{item.rolId}}" 
                                            {% if dato['rol'] is defined and dato['rol'] is item.rolId %} selected {% endif %}>{{item.nombre}}
                                        </option>
                                    {% endfor %}
                                </select>
                            </div>
                        </div>
                       
                        <div class="col-md-6">
                            <br>
                            <div class="col-md-3">
                                <label for="">Usuario:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="text" value="{% if dato is defined %}{{dato['usuario']}}{% endif %}" placeholder="Nombre de usuario" required name="usuario" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <br>
                            <div class="col-md-3">
                                <label for="">Estado:</label>
                            </div>
                            <div class="col-md-12">
                                <select required name="estado" class="form-control m-b" id="">
                                    <option value="">Seleccione..</option>
                                    <option value="1" {% if dato is defined %}{% if dato['estado'] == 1 %}selected{% endif %}{% endif %}>ACTIVO</option>
                                    <option value="0" {% if dato is defined %}{% if dato['estado'] == 0 %}selected{% endif %}{% endif %}>INACTIVO</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <br>
                            <div class="col-md-3">
                                <label for="">Contraseña:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="password" placeholder="Contraseña" id="contraseña" required name="password" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <br>
                            <div class="col-md-6">
                                <label for="">Confirmar contraseña:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="password" placeholder="Confirmar contraseña" id="contraseña" required name="password" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-12" id="message">

                            </div>
                        </div>
                    </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar datos</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div id="modal2">
    
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

{% if dato is defined %}
    <script>
        var edit = "{{dato['edit']}}";
        
        if(edit == 'edit'){

            $('#myModal5').modal('show');

            $('.btn-white').click(function(){
                 window.location='{{url("GOPASScoordinador/usuarios")}}';
            });

        }
    </script>
{% endif %}

<script>
   $("#rol").hide();
   $("#rolReno").hide();

    if(campana == 4){
        $("#rolReno").show('slow');
        $('#rol1').removeAttr('required');
        $("#rol").hide();
    }else{
        $("#rol").show('slow');
        $('#rol2').removeAttr('required');
        $("#rolReno").hide();
    }

    $("#campana").on('change', function(){
		var campana = $(this).val();

		if(campana == 4){
			$("#rolReno").show('slow');
            $('#rol1').removeAttr('required');
            $("#rol").hide();
		}else{
            $("#rol").show('slow');
            $('#rol2').removeAttr('required');
            $("#rolReno").hide();
		}

	});

    $(document).ready(function(){

        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'excel', title: 'Usuarios'},
                {extend: 'pdf', title: 'Usuarios'},

                {extend: 'print',
                 customize: function (win){
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                }
                }
            ],
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },

        });

    });

    $('.botonEditar').click(function (){
        $('#myModal5').show('hide');
    });

</script>