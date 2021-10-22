<style>    
	table{
		text-transform: uppercase;
	}
	input{
		text-transform: uppercase;
	}
</style>

<div class="col-md-12">
        <h1>Cargar base <i class="fas fa-database"></i></h1>
        <hr>
</div>

<div class="dashboard-header col-md-6">
    <button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
    <a href="../Plantillas_Excel/PlantillaGopass.xlsx" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
    
    <br>
</div>

<div class="dashboard-header col-md-6">
    <form enctype="multipart/form-data" method="POST" action="{{url('GOPASScoordinador/cargarBase')}}"  name="cargarBase" id="cargarBase">
        <input type="file" name="archivoExcel" id="archivoExcel" class="form-control inputfile inputfile-4" onchange="checkfile(this);" data-multiple-caption="{count} files selected" multiple required accept=".csv" />
        <br>
        <select style="height: 40px;" name="verificar" required id="" class="form-control">
            <option value="">Seleccione...</option>
            <option value="1" selected>SOLO CARGAR</option>
            <!--<option value="2">CARGAR Y ACTUALIZAR</option>
            <option value="3">SOLO ACTUALIZAR</option>-->
        </select>
        <br>
        <button class="btn btn-primary form-control"><i class="fas fa-upload"></i> Subir</button>
    </form>
    <br>
</div>

{% if data is defined %}

<div class="row  border-bottom  dashboard-header">
    <div class="col-md-5 col-md-offset-3">
        <br><br>
        <div class="ibox-title">
            <h5>Datos del proceso</h5>
        </div>
        <div class="ibox-content">
            <ul class="list-group clear-list m-t">
            {% if data.errorLinea is defined %}
                <li class="list-group-item fist-item">
                      <span class="label label-danger"><i class="fas fa-bug"></i></span> Se detecto error en la linea
                    <span class="float-right bg-gray datoErrores">
                        {{data.errorLinea}}
                    </span>
                </li>
            {% endif %}
                <li class="list-group-item fist-item">
                    
                    <span class="label label-success"><i class="far fa-clock"></i></span> Total de datos
                    <span class="float-right datoInicio">
                        {{data.total}}
                    </span>
                </li>
                <li class="list-group-item">
                    
                    <span class="label label-info"><i class="fas fa-chart-area"></i></span> Insertados
                    <span class="float-right datoPromedio">
                        {{data.insertados}}
                    </span>
                </li>
                <li class="list-group-item">
                    
                    <span class="label label-primary "><i class="fas fa-stopwatch"></i></span> Actualizados
                    <span class="float-right datoTrabajo">
                        {{data.actualizados}}
                    </span>
                </li>
                <li class="list-group-item">
                    
                    <span class="label label-warning "><i class="fas fa-check"></i></span> Existen
                    <span class="float-right datoTrabajo">
                        {{data.existen}}
                    </span>
                </li>
                <li class="list-group-item">
                    
                    <span class="label label-danger"><i class="fas fa-bug"></i></span> Errores
                    <span class="float-right bg-gray datoErrores">
                        {{data.errores}}
                    </span>
                </li>
            </ul>
        </div>
    </div>
</div>
{% endif %}

<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Indicaciones para subir base</h4>
            </div>
            <div class="modal-body">
                
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Primer paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Descargue la planilla.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Segundo paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Cargue todos los datos solicitados en la planilla, los datos no deben tener caracteres especiales.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Tercer paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>El campo Convenio es númerico.</p>
                                <ul>
                                    {% for item in convenios %}
                                    <li>{{ item.convenioId }} = {{ item.nombre }}</li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Cuarto paso:</label>
                                <p>El barrio debe ser númerico</p>
                                Lista de barrios activos <button class="btn btn-small btn-primary form-control" onclick="exportTableToExcel('tableId')">Descargar</button>
                            </div>
                            <div id="datos barrio" style="display:none">
                                <table id="tableId" name="tableId">
                                    <thead>
                                        <th>BarrioID</th>
                                        <th>Nombre Barrio</th>
                                        <th>LocalidadID</th>
                                        <th>Nombre Localidad</th>
                                        <th>CiuadadId</th>
                                        <th>Nombre Ciuad</th>
                                        <th>DepartamentoID</th>
                                        <th>Nombre Departameto</th>
                                    </thead>
                                    <tbody>
                                        {% for item in datoBarrios %} 
                                            <tr>                                   
                                                <td>{{item.barrioId}}</td>
                                                <td>{{item.nombreBarrio}}</td>
                                                <td>{{item.localidadId}}</td>
                                                <td>{{item.nombreLocalidad}}</td>
                                                <td>{{item.ciudadId}}</td>
                                                <td>{{item.nombreCiudad}}</td>
                                                <td>{{item.departamentoId}}</td>
                                                <td>{{item.nombreDepartamento}}</td>
                                            </tr>
                                        {% endfor %}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <br><br>
                            <div class="col-md-6">
                                <label for="">Quinto paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>El campo tipoIdentificacion debe es númerico.
                                    En caso de cargar un valor invalido se le asiganará (1) por defecto.</p>
                                <ul>
                                    {% for item in tipoIdentificacion %}
                                    <li>{{ item.tipoId }} = {{ item.nombre }}</li>
                                    {% endfor %}
                                </ul>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <label for="">Recuerde que debe subir el archivo en formato csv</label>
                        </div>
                    </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
            </div>
            </form>
        </div>
    </div>
</div>

<script>
$('#archivoExcel').val('');

$("#cargarBase").on('submit', function(evt){
	var file = $('#archivoExcel');
    if (file = ''){
        alert('No ha cargado ningún arcgivo');
        sender.value = '';
        evt.preventDefault();  
        return false; 
    }else{
            return true; 
    }
    evt.preventDefault();  
});


function checkfile(sender) { 
    var validExts = new Array(".csv"); 
    var fileExt = sender.value; 
    fileExt = fileExt.substring(fileExt.lastIndexOf('.')); 
    if (validExts.indexOf(fileExt) < 0){
         alert('Solo puede seleccionar archivos en formato csv');
        sender.value = '';
        return false; 
    }else{
            return true; 
    }
}

function exportTableToExcel(tableID, filename = ''){        
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.getElementById(tableID);
        var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');        
        
        // Specify file name
        filename = filename?filename+'.xls':'barriosActivos' + '.xls';
        
        // Create download link element
        downloadLink = document.createElement("a");
        
        document.body.appendChild(downloadLink);
        
        if(navigator.msSaveOrOpenBlob){
            var blob = new Blob(['ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob( blob, filename);
        }else{
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
        
            // Setting the file name
            downloadLink.download = filename;
            
            //triggering the function
            downloadLink.click();
        }        
        
    }
</script>