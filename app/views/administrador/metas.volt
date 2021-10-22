<style>
    select{
        height: 33px!important;
    }
</style>

{% if hecho is defined %}
	<br>
	<div class="col-md-12">
		<div class="alert alert-info alert-dismissable">
	        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
	        <i class="fas fa-check"></i> La meta de {{hecho}} fue actualizado con éxito.
	    </div>
    </div>
{% endif %}

{% if ok is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Datos actualizados con exito.
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
<!-- <div class="text-right">
    <br>
    <div class="col-md-12">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal5">
            <i class="fas fa-plus-square"></i> Agregar
        </button>
        <br>
    </div>
    <br>
</div> -->
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Metas por campaña</h5>
                
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
                <th>Campaña</th>
                <th>Meta</th>
                <th>Editar</th>
            </tr>
            </thead>
            <tbody>
            {% if data is empty %}
                No hay datos
            {% else %}
                {% for item in data %}
                <tr>
                    <form action="{{url('administrador/editMetas')}}" method="POST">
                        <td>
                            {{item.num}}
                        </td>
                        <td>
                            <input type="hidden" name="id" value="{{item.id}}">
                            {{item.campana}}
                        </td>
                        <td>
                            <input type="number" name="meta" value="{{item.meta}}" class="form-control">
                        </td>
                        <td class="text-center">
                            <button type="submit" class="btn btn-warning">Actualizar</button>
                        </td>
                    </form>
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
    
<div class="row">
    <form action="{{url('administrador/metas')}}"  method="POST">
        <div class="col-md-6">
            <div class="col-md-10">
                <input type="text" id="nombre" placeholder="Buscar Usuarios" name="nombre" class="form-control">
            </div>
            <div class="col-md-2">
                <button id="mensaje" class="btn btn-primary form-control">Buscar</button>
            </div>
        </div>
    </form>
</div>

</div>
{% if dato is defined %}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Asesores para pasar a Renovaciones</h5>
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
                    <th>Usuario</th>
                    <th>Cedula</th>
                    <th>Campaña</th>
                    <th>Editar</th>
            </tr>
            </thead>
            <tbody>
            {% if dato is empty %}
                No hay datos
            {% else %}
                {% for item1 in dato %}
                <tr>
                    <form action="{{url('administrador/EditarRenovaciones')}}" method="POST">
                        <td>
                            <input type="hidden" name="id" value={{item1.id}}>
                            {{item1.usuario}}
                        </td>
                        <td>
                            {{item1.cedula}}
                        </td>
                        <td>

                        <select name="campana" class="browser-default custom-select form-control">
                            <!-- <option selected="true" disabled="disabled">{{item1.campana}}</option> -->
                        {% for items in campanaRenovaciones %}
                            <option value={{items.idcampana}}>{{items.campana}}</option>
                        {% endfor %}
                        </select>
                
                        </td>
                        <td class="text-center">
                            <button type="submit" class="btn btn-warning">Actualizar</button>
                        </td>
                    </form>
                </tr>
                {% endfor %}
            {% endif %}
            
            </tbody>
            <tfoot>
                <tr>
                    <th>#</th>
                    <th>Usuario</th>
                    <th>Campaña</th>
                    <th>Editar</th>
                </tr>
                </tfoot>
            </table>
                </div>

            </div>
        </div>
    </div>
    </div>
    {% endif %}
</div>


<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Asesores campaña Renovaciones</h5>
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
                    <th>Usuario</th>
                    <th>Campaña</th>
                    <th>Editar</th>
            </tr>
            </thead>
            <tbody>
            {% if renovaciones is empty %}
                No hay datos
            {% else %}
                {% for item in renovaciones %}
                <tr>
                    <form action="{{url('administrador/EditarRenovaciones')}}" method="POST">
                        <td>
                            {{item.num}}
                        </td>
                        <td>
                            <input type="hidden" name="id" value={{item.iduser}}>
                            {{item.nombresUsuario}}
                        </td>
                    
                        <td>

                        <select name="campana" class="browser-default custom-select form-control">
                            <option selected="true" disabled="disabled">{{item.campana}}</option>
                                {% for items in campanaRenovaciones %}
                            <option value={{items.idcampana}}>{{items.campana}}</option>
                        {% endfor %}
                        </select>
                
                        </td>
                        <td class="text-center">
                            <button type="submit" class="btn btn-warning">Actualizar</button>
                        </td>
                    </form>
                </tr>
                {% endfor %}
            {% endif %}
            
            </tbody>
            <tfoot>
                <tr>
                    <th>#</th>
                    <th>Usuario</th>
                    <th>Campaña</th>
                    <th>Editar</th>
                </tr>
                </tfoot>
            </table>
                </div>

            </div>
        </div>
    </div>
    </div>
</div>

<!-- <div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12" style="margin: 2% 0;">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Metas por asesor</h5>
                
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
                <th>Asesor</th>
                <th>Meta</th>
                <th>Editar</th>
            </tr>
            </thead>
            <tbody>
            {% if data1 is empty %}
                No hay datos
            {% else %}
                {% for item in data1 %}
                    
                    <tr class="gradeX">
                        <td>{{item.num}}</td>
                        <td>{{item.asesor}}</td>
                        <td>{{item.meta}}</td>
                        <td class="text-center">
                            <form action="{{url('AVVILLAScoordinador/usuarios')}}" method="POST">
                                <input type="hidden" name="edit" value="edit">
                                <input type="hidden" name="id" value="{{item.id}}">
                                <input type="hidden" name="nombres" value="{{item.nombres}}">
                                <input type="hidden" name="apellidos" value="{{item.apellidos}}">
                                <input type="hidden" name="cedula" value="{{item.cedula}}">
                                <input type="hidden" name="usuario" value="{{item.usuario}}">
                                <input type="hidden" name="estado" value="{{item.estado}}">
                                <input type="hidden" name="rol" value="{{item.rol}}">
                                <button type="submit" class="btn btn-warning"><i class="fa fa-user-edit"></i></button>
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
</div> -->

<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
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
                <form method="post" {% if dato is defined %} action="{{url('AVVILLAScoordinador/editUsuario')}}" {% else %} action="{{url('TODORIESGOcoordinador/nuevoUsuario')}}" {% endif %}>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Nombres:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="hidden" name="id" value="{% if dato is defined %}{{dato['id']}}{% endif %}">
                                <input type="text" value="{% if dato is defined %}{{dato['nombres']}}{% endif %}" required placeholder="Nombres" name="nombres" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Apellidos:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="text" placeholder="Apellidos" value="{% if dato is defined %}{{dato['apellidos']}}{% endif %}" required name="apellidos" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Cedula:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="number" placeholder="Cedula" value="{% if dato is defined %}{{dato['cedula']}}{% endif %}" name="cedula" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Rol:</label>
                            </div>
                            <div class="col-md-12">
                                <select required name="rol" id="" class="form-control m-b">
                                    <option value="">Seleccione..</option>
                                    <option value="3" {% if dato is defined %}{% if dato['rol'] == 3 %}selected{% endif %}{% endif %}>Coordinador</option>
                                    <option value="5" {% if dato is defined %}{% if dato['rol'] == 5 %}selected{% endif %}{% endif %}>Asesor</option>
                                    <option value="10" {% if dato is defined %}{% if dato['rol'] == 10 %}selected{% endif %}{% endif %}>Cotejador</option>
                                    <option value="11" {% if dato is defined %}{% if dato['rol'] == 11 %}selected{% endif %}{% endif %}>Radicador</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Usuario:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="text" value="{% if dato is defined %}{{dato['usuario']}}{% endif %}" placeholder="Nombre de usuario" required name="usuario" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Estado:</label>
                            </div>
                            <div class="col-md-12">
                                <select required name="estado" class="form-control m-b" id="">
                                    <option value="">Seleccione..</option>
                                    <option value="1" {% if dato is defined %}{% if dato['estado'] == 1 %}selected{% endif %}{% endif %}>Activo</option>
                                    <option value="0" {% if dato is defined %}{% if dato['estado'] == 0 %}selected{% endif %}{% endif %}>Inactivo</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-3">
                                <label for="">Contraseña:</label>
                            </div>
                            <div class="col-md-12">
                                <input type="password" placeholder="Contraseña" id="contraseña" required name="password" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
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
                <button type="submit" class="btn btn-success">Guardar datos</button>
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
                 window.location='{{url("AVVILLAScoordinador/usuarios")}}';
            });

        }
    </script>

{% endif %}

{% if renovaciones is defined %}
	<script>
		var clase = '{{dato.claseVehiculo}}';

		$('#claseVehiculo').val(clase);
		$('#cilindraje').val(cilindro);
		$('#ciudad').val(ciudad);
		$('#placa').val(placa);
		$('#formaPago').val(formaPago);
		$('#localidad').val(localidades);
		$('#barrio').val(barrios);
		$('#momentoDia').val(momentoDia);
		$('#indicaciones').val(indicaciones);
	</script>
{% endif %}


<script>
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

</script>