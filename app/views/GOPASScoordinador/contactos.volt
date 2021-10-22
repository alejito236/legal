<style>
    select{
        height: 34px!important;
    }    
    table{
		text-transform: uppercase;
	}
	input{
		text-transform: uppercase;
	}
</style>
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<div class="col-md-12">
    <h1>Convenios <i class="fas fa-handshake"></i></h1>
    <hr>
</div>
{% if ventaKO is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-success alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se registró exitosamente.
        </div>
    </div>
{% endif %}
{% if actualizar is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se actualizó exitosamente.
        </div>
    </div>
{% endif %}
{% if eliminar is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se eliminó exitosamente.
        </div>
    </div>
{% endif %}
{% if anular is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Venta actualizada con exito.
        </div>
    </div>
{% endif %}

{% if otraCiudad is defined %}
<br>
<div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    <i class="fas fa-ban"></i> La placa existe en la ciudad de <b>{{otraCiudad}}</b>.
</div>
{% endif %}
<div class="col-md-12">
    
    <br>
    <div class="col-md-12">
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-striped table-bordered no-margins">
                <thead>
                	<th>Id</th>
                	<th>Documento cliente</th>
                    <th>Nombre cliente</th>
                    <th>Telefono cliente</th>
                    <th>Celular cliente</th>
                    <th>Convenio</th>
                    <th>Placa</th>
                    <th>Numero Tags</th>
                    <th>Tipificacion</th>
                    <th>Fecha gestión</th>
                    <th>Asesor</th>
                </thead>
                <tbody>
                    {% for item in contactos %}
                    <tr>
                        <td>{{ item.gestionId }}</td>
                        <td>{{ item.cedulaPersona }}</td>
                        <td>{{ item.nombrePersona }}</td>
                        <td>{{ item.telefono }}</td>
                        {% if item.celularLlamadas is not  null and item.celularLlamadas is not 0 %}
                            <td>{{item.celularLlamadas}}</td>
                        {% elseif item.celularWhatsapp is not null or item.celularWhatsapp is not 0 %}
                            <td>{{item.celularWhatsapp}}</td>
                        {% else %}
                            <td>No tiene celular</td>
                        {% endif %}                                       
                        <td>{{ item.nombreConvenio }}</td>
                        <td>{{ item.placa }}</td>
                        <td>{{ item.numTags }}</td>
                        <td>{{ item.nombreTipi }}</td>
                        <td>{{ item.fechaGestion }}</td>
                        <td>{{ item.nombreAsesor }}</td>
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
    
    {# <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-ban"></i> Aun no hay convenios registrados.
        </div>
    </div> #}
    
    <div class="col-lg-6 h-100 p-lg">
            
        </div>
</div>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        $('.demo3').click(function () {
            swal({
                title: "¿Seguro de cambiar a venta efectiva?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                closeOnConfirm: false
            }, function () {
                $('#anular').submit();
            });
        });

        $('#formCrear').hide();
    });

    $('#botonCrear').click(function (){
        $('#formCrear').toggle('slow');
    });

    // $('.nombreConvenio').change( function(){
    //     alert($('.nombreConvenio').val());
    // });
</script>