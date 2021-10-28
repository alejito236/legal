<style>
    .background-gray{
        background-color: #C1C1C1;
        border-radius:15px;
    }
    .background-white{
        background-color: #FFFFFF;
        margin:15px;
        border-radius:15px;
        padding-top:25px;
        padding-bottom:25px;
    }
    .tblEncabezado{
        background-color: #32659A;    
        color: #FFFFFF!important;        
    }

    .tblCuerpo{
        color: #32659A;           
    }

    .text-white{
        color: #FFFFFF;
    }

    .input-group{
        display: inline-flex;
    }

    th, td {
        text-align:center
    }

    select{
        height: 40px!important;		    
    }

    .version{
        background-color: #32659A;    
        color: #FFFFFF!important;
        border-radius:10px;
        padding-top:5px;
        padding-bottom:5px;
        padding-right:8px;
        padding-left:8px;    
    }

    .nav{
        padding-top:10px;
        padding-bottom:20px;
    }

    .btn{
        padding-top:5px!important;
        padding-bottom:5px!important;
        padding-right:15px!important;
        padding-left:15px!important;
        margin-right:10px!important;
        margin-left:12px!important;
    }

    .cliente{
        background-color: #C1C1C1;
        color: #FFFFFF!important;
    }

    .logistica{
        background-color: #288006;
        color: #FFFFFF!important;
    }

    .guardar{
        background-color: #32659A;
        color: #FFFFFF!important;
    }

    .limpiar{
        background-color: #706F6E;
        color: #FFFFFF!important;
    }

    hr {
    height: 1px;
    width:90%;
    background-color: #32659A;
    }

    .add{
        background-color: Transparent;
        padding:0px!important;
        margin:0px!important;
        border:0px!important;
    }

    .folio{
        border:2px solid;
        border-radius:2%;
        padding:3px 10px;
        margin-top:0px;
        margin-bottom:20px;
    }


</style>
<br><br>
<div class="container background-gray" >
    <div class="row">  
    {# INFORMACIÓN ENTIDAD DE DESTINO #}
        <div class="col-lg-12 input-group">
            <img src="{{url('public/img/Logo%20Novus%20Legal-11.png')}}" height="40px" width="30"/>
            <h4 class="h4" style="padding-left: 15px; margin-top: 0px;" >INFORMACIÓN ENTIDAD DE DESTINO</h4><br>
        </div>
        <div class="row background-white" id="infoEntidadDestino" name="infoEntidadDestino">
            <div class="col-lg-1"></div>
            <div class="col-md-2">
                <label for="">N° Requerimiento</label>            
            </div>
            <div class="col-md-3">
                <input 
                    class="form-control"
                    id="numProceso"
                    name="numProceso"
                    disabled
                >
            </div>
            <div class="col-md-2">
                <label for="entidadDestino">Entidad de destino</label>
            </div>
            <div class="col-md-3">
                <input 
                    class="form-control"
                    id="entidadDestinoInfo"
                    name="entidadDestinoInfo"
                    disabled
                >
            </div>
        </div>
    {# FIN #}

    {# INFORMACIÓN ESTADO DE TÍTULOS #}    
        <div class="col-lg-12 input-group">
            <img src="{{url('public/img/Logo%20Novus%20Legal-11.png')}}" height="40px" width="30"/>
            <h4 class="h4" style="padding-left: 15px; margin-top: 0px;" >INFORMACIÓN ESTADO DE TÍTULOS</h4><br>
        </div>        
        <div class="row background-white" id="infoEstadoTitulos" name="infoEstadoTitulos">
            <div class="col-lg-1"></div>
            <div class ="col-lg-10" name ="divTableGestion" id ="divTableGestion">
                <table class="table table-striped" id="tblGestion" name="tblGestion">
                    <thead class ="tblEncabezado " >
                        <th>N° Matrícula</th>
                        <th>Ciudad</th>
                        <th>Adjunto</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </thead>
                    <tbody class="tblCuerpo">
                        <form action="{{url('gestionar/index')}}"  method="POST" id="enviarForm" name="enviarForm">
                            <tr>
                                <input type="hidden" id="matricula" name="matricula" value="52265324">
                                <td>52265324</td>
                                <td>Bogotá</td>
                                <td>Link de archivo.PDF</td>
                                <td>Pendiente de pago</td>
                                <td>
                                    <button
                                        class="btn guardar"
                                        id="btnGestionar"
                                        name="btnGestionar"
                                        type="submit"
                                    >
                                        Gestionar
                                    </button>
                                </td>
                            </tr>
                        </form>
                    </tbody>
                </table>
            </div>
        </div>
    {# FIN #}

    {# ESTUDIO MATRÍCULA #}
        <div class="col-lg-12 input-group">
            <img src="{{url('public/img/Logo%20Novus%20Legal-11.png')}}" height="40px" width="30"/>              
            <h4 class="h4" style="padding-left: 15px; margin-top: 0px;" >ESTUDIO MATRÍCULA #</h4><br>
        </div>
        <div class="row background-white" id="infoEstadoTitulos" name="infoEstadoTitulos">
            {% for item in preguntas %}
                <hr>
                <form action="{{ url('gestionar/index') }}" method="POST">
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-md-2">
                            <label for="">{{item.preguntasId}}. {{item.nombre}}</label>
                            <input type="hidden" id="preguntaId" name="preguntaId" values="{{item.preguntasId}}">
                        </div>
                        {% if item.preguntasId == 28 or item.preguntasId == 27 or item.preguntasId == 26 or item.preguntasId == 25 %}
                            <div class="col-md-2">
                                <input
                                    class="form-control"
                                    id="respuesta"
                                    name="respuesta"
                                    required
                                >
                            </div>
                        {% else %}
                            <div class="col-md-2">
                                <select 
                                    class="form-control col-lg-6 col-sm-12" 
                                    name="respuesta" 
                                    id = "respuesta"						
                                    required 
                                >
                                    <option value="">Seleccione...</option>                        
                                    <option value="1">Si</option>                        
                                    <option value="0">No</option>
                                </select>
                            </div>
                        {% endif %}
                        <div class="col-md-1">
                            {% if item.preguntasId == 2 or item.preguntasId == 9 or item.preguntasId == 20 %}
                                <button class="btn add"><i class="fas fa-plus-circle" style="color:#32659A; font-size: 30px;"></i></button>
                            {% endif %}
                        </div>
                        <div class="col-md-5">
                            {% if item.preguntasId == 2 or item.preguntasId == 9 %}
                                <select 
                                class="form-control col-lg-6 col-sm-12" 
                                name="otroId" 
                                id = "otroId"
                                style="margin-bottom: 20px!important;"
                                required 
                                >
                                    <option value="">Seleccione...</option>                        
                                    <option value="0">Si</option>                        
                                    <option value="1">No</option>
                                </select>
                            {% elseif item.preguntasId == 20 %}    
                                <div class="folio">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="">Entidad de destino</label>
                                        </div>
                                        <div class="col-md-6">
                                            <input
                                                class="form-control"
                                                id="newEntidadDestino"
                                                name="newEntidadDestino"
                                                required
                                            >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="">N° Matrícula</label>
                                        </div>
                                        <div class="col-md-6">
                                            <input
                                                class="form-control"
                                                id="newNumMatricula"
                                                name="newNumMatricula"
                                                required
                                            >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="">Distrito</label>
                                        </div>
                                        <div class="col-md-6">
                                            <input
                                                class="form-control"
                                                id="newDistrito"
                                                name="newDistrito"
                                                required
                                            >
                                        </div>
                                    </div>
                                    
                                   
                                    
                                </div>
                            {% endif %}
                            <div id="grupoTablas">
                                {# INICIA FOR #}
                                <div id="pestanas{{item.preguntasId}}"  class="pestanas">
                                    <nav class="nav">
                                        <a id="pestana1" class="version" onclick='cambiarPestanna(pestanas{{item.preguntasId}},this);'>V1</a>
                                        <a id="pestana2" class="version" onclick='cambiarPestanna(pestanas{{item.preguntasId}},this);'>V2</a>
                                        <a id="pestana3" class="version" onclick='cambiarPestanna(pestanas{{item.preguntasId}},this);'>V3</a>
                                        <a id="pestana4" class="version" onclick='cambiarPestanna(pestanas{{item.preguntasId}},this);'>V4</a>                                        
                                        <a id="nuevaObservacion" class="btn btn-sm add version" onclick='cambiarPestanna(pestanas{{item.preguntasId}},this);'><i class="fas fa-plus-circle" style="color:#32659A; font-size: 27px; padding-bottom:5px"></i></a>
                                    </nav>
                                </div>
                                {# FIN FOR #}
                                <div id="contenidopestanas{{item.preguntasId}}" >
                                    {# INICIA FOR #}
                                    <div id="cpestana1" style="display:none">
                                        <textarea
                                            class="form-control"
                                            id="observacion"
                                            name="observacion"
                                            type="button"
                                            disabled
                                        >1</textarea>
                                    </div>
                                    <div id="cpestana2" style="display:none">
                                        <textarea
                                            class="form-control"
                                            id="observacion"
                                            name="observacion"
                                            type="button"
                                            disabled
                                        >2</textarea>
                                    </div>
                                    <div id="cpestana3" style="display:none">
                                        <textarea
                                            class="form-control"
                                            id="observacion"
                                            name="observacion"
                                            type="button"
                                            disabled
                                        >3</textarea>
                                    </div>
                                    <div id="cpestana4" style="display:none">
                                        <textarea
                                            class="form-control"
                                            id="observacion"
                                            name="observacion"
                                            type="button"
                                            disabled
                                        >4</textarea>
                                    </div>
                                    {# TERMINA FOR #}
                                    <div id="nuevaObservacion">
                                        <textarea
                                            class="form-control"
                                            id="observacion"
                                            name="observacion"                        
                                        >Nueva</textarea>
                                    </div>
                                </div>
                            </div>
                            
                            <div>
                                <nav class="nav">
                                    <button 
                                        class="btn cliente"
                                        type="button" 
                                        data-toggle="modal" 
                                        data-target="#clienteModal"
                                    >
                                        Cliente
                                    </button>
                                    <button 
                                        class="btn logistica"  
                                        type="button" 
                                        data-toggle="modal" 
                                        data-target="#logisticaModal"
                                    >
                                        Logística
                                    </button>
                                    <button 
                                        class="btn guardar"
                                        type="submit"
                                        id="btnGuardarPregunta"
                                        name="btnGuardarPregunta"
                                    >
                                        Guardar
                                    </button>
                                    <button class="btn limpiar">Limpiar</button>
                                
                                </nav>
                            </div>
                        </div>                    
                    </div>
                </form>
            {% endfor %}
            <hr>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-md-2">
                    <label for="">Agregar Pregunta</label>
                    <button 
                        class="btn add"
                        data-toggle="modal" 
                        data-target="#newPreguntaModal"
                    >
                        <i class="fas fa-plus-circle" style="color:#32659A!important; font-size: 30px;"></i>
                    </button>
                </div>
            </div>
                  
            
            

        </div>
    {# FIN #}

    {# INFORMACIÓN DEL CONCEPTO #}
        <div class="col-lg-12 input-group">
            <img src="{{url('public/img/Logo%20Novus%20Legal-11.png')}}" height="40px" width="30"/>
            <h4 class="h4" style="padding-left: 15px; margin-top: 0px;" >INFORMACIÓN DEL CONCEPTO</h4><br>
        </div>
        <div class="row background-white" id="infoEstadoTitulos" name="infoEstadoTitulos">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-md-2">
                    <label for="">Observaciones generales</label>            
                </div>
                <div class="col-md-3">
                    <textarea 
                        class="form-control"
                        id="observaciones"
                        name="observaciones"
                        style="width:100%; height:150px; overflow-y:scroll; resize: none;"
                    ></textarea>
                </div>
                
                <div class="col-md-2">
                    <label for="">Concepto Sistema</label>            
                </div>
                <div class="col-md-3">
                    <input
                        class="form-control"
                        id="conceptoSistema"
                        name="conceptoSistema"
                        disabled                
                    >
                </div><br><br><br><br><br>
                        
                <div class="col-md-2">
                    <label for="">Concepto Abogado</label>            
                </div>        
                <div class="col-md-3">
                    <select
                        class="form-control"
                        id="conceptoAbogado"
                        name="conceptoAbogado"                    
                    >
                        <option value="">Seleccione...</option>
                        <option value="1">Favorable</option>
                        <option value="2">No Favorable</option>
                    </select>
                </div>            
            </div><br><br>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-2">
                    <label for="">Estado</label>            
                </div>        
                <div class="col-md-3">
                    <select
                        class="form-control"
                        id="estadoGestion"
                        name="estadoGestion"                    
                    >
                        <option value="">Seleccione...</option>
                        <option value="1">Favorable</option>
                        <option value="2">No Favorable</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-large guardar" id="btnGenerar" name="btnGenerar">Generar</button>
                </div>
            </div>
        </div>
    {# FIN #}

    {# ESTUDIO TÍTULOS #}
        <div class="col-lg-12 input-group">
            <img src="{{url('public/img/Logo%20Novus%20Legal-11.png')}}" height="40px" width="30"/>
            <h4 class="h4" style="padding-left: 15px; margin-top: 0px;" >ESTUDIO TÍTULOS</h4><br>
        </div>
        <div class="row background-white" id="infoEstadoTitulos" name="infoEstadoTitulos">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-md-1">
                    <label for="">Matrícula:</label>            
                </div>
                <div class="col-md-9">
                    <input 
                        class="form-control"
                        id="matricula"
                        name="matricula"
                        disabled
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-md-1">
                    <label for="">Dirección inmueble:</label>            
                </div>
                <div class="col-md-9">
                    <input 
                        class="form-control"
                        id="direccion"
                        name="direccion"
                        disabled
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-md-1">
                    <label for="">Nombre:</label>            
                </div>
                <div class="col-md-9">
                    <input 
                        class="form-control"
                        id="nombreCliente"
                        name="nombreCliente"
                        disabled
                    >
                </div>
            </div><hr>
            {% for item in resumen1 %}
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-md-2">
                        <label for="">{{item.preguntasId}}. {{item.nombre}}:</label>            
                    </div>
                    <div class="col-md-1">
                        <input 
                            class="form-control"
                            id="respuesta"
                            name="respuesta"
                            value="No"
                            disabled
                        >
                    </div>
                    <div class="col-md-1">
                        <label for="">Porqué</label>            
                    </div>
                    <div class="col-md-6">
                        <input 
                            class="form-control"
                            id="observacion"
                            name="observacion"
                            disabled
                        >
                    </div>
                </div>            
            {% endfor %}
            <hr>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-md-9">
                    <label for="">RESUMEN</label>            
                </div>
            </div>
            
            {% for item in resumen2 %}
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-md-9">
                        <label for="">{{item.preguntasId}}. {{item.nombre}}:</label>            
                    </div>
                    <div class="col-md-1">
                        <input 
                            class="form-control"
                            id="respuesta"
                            name="respuesta"
                            value="No"
                            disabled
                        >
                    </div>                
                </div>            
            {% endfor %}
            <div class="row">
                <div class="col-md-9"></div>            
                <div class="col-md-3" style="padding-left:60px;">
                    <button class="btn guardar" id="btnDescargar">
                        <i class="fas fa-arrow-down"></i>
                        Descargar
                    </button>
                </div>
            </div>        
        </div>
    {# FIN #}

    {# PIE DE PAGINA #}
        <footer>
            <div class="row">            
                <div class="col-md-6">
                    <img src="../legal/public/img/Logo-grupo-blnc-horizontal.png" height="30px" style="margin-top: 20px;">        
                    <br>
                    <label class="text-white" style="padding-left:20px; padding-bottom:20px; padding-top:5px">Copyright 2021 Grupo Novus</label>
                </div>
            </div>
        </footer>
    {# FIN #}

    {# MODAL LOGISTICA #}
    <div class="modal fade" style="" id="logisticaModal" name="logisticaModal" tabindex="-1" role="dialog" aria-labelledby="logisticaModal" aria-hidden="true">
        <div class="modal-dialog modal-lg " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>                    
                    <img src="{{url('public/img/Novus logistica-32.png')}}" height="30px" style="margin-top: 20px;">
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 input-group">
                            <img src="{{url('public/img/favicon-logi.png')}}" height="30px" width="30"/>           
                            <h5 class="h4" style="padding-left: 15px; margin-top: 5px;" >SOLICITUD LOGÍSTICA</h5><br>
                        </div>
                        {#1#}   
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Fecha</label>            
                        </div>
                        <div class="col-md-4">
                            <input 
                                type="date"
                                id="fechaModal"
                                name="fechaModal"
                                class="form-control"
                                required
                            >
                        </div>
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Prioridad</label>            
                        </div>
                        <div class="col-md-4">
                            <input 
                                type="date"
                                id="prioridadModal"
                                name="prioridadModal"
                                class="form-control"
                                required
                            >
                        </div><br><br><br><br>
                        
                        {#2#}
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Tipo Documento</label>            
                        </div>
                        <div class="col-md-4">
                            <select                                
                                id="tipoDocumentoModal"
                                name="tipoDocumentoModal"
                                class="form-control"
                                required
                            >
                                <option value="">Seleccione...</option>
                                <option value="1">CC</option>
                                <option value="2">CE</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label style="padding-top:6px;">N° Documento</label>            
                        </div>
                        <div class="col-md-4">
                            <input 
                                type="number"
                                id="numDocumentoModal"
                                name="numDocumentoModal"
                                class="form-control"
                                required
                            >
                        </div><br><br><br>
                        {#3#} 
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Ubicación</label>            
                        </div>
                        <div class="col-md-4">
                            <input 
                                type="text"
                                id="ubicacionModal"
                                name="ubicacionModal"
                                class="form-control"
                                required
                            >
                        </div>
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Indicación</label>            
                        </div>
                        <div class="col-md-4">
                            <textarea                                
                                id="indicacionesModal"
                                name="indicacionesModal"
                                class="form-control"
                                style="height:35px;"
                                required
                            ></textarea>
                        </div><br><br><br>
                        {#4#} 
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Dirección</label>            
                        </div>
                        <div class="col-md-4">
                            <input 
                                type="text"
                                id="direccionModal"
                                name="direccionModal"
                                class="form-control"
                                required
                            >
                        </div>
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Barrio</label>            
                        </div>
                        <div class="col-md-4">
                            <input 
                                type="text"
                                id="barrioTextModal"
                                name="barrioTextModal"
                                class="form-control"
                            >
                        </div><br><br><br>
                        {# 5 #}
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Ciudad</label>            
                        </div>
                        <div class="col-md-4">
                            <select                                 
                                id="ciudadModal"
                                name="ciudadModal"
                                class="form-control"
                                required
                            >
                                <option value="">Seleccione...</option>
                                <option value="1">Bogotá</option>
                                <option value="2">Cali</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label style="padding-top:6px;">Barrio</label>
                        </div>
                        <div class="col-md-4">
                            <select                                 
                                id="barrioModal"
                                name="barrioModal"
                                class="form-control"
                                required
                            >
                                <option value="">--</option>
                                <option value="1">Bogotá</option>
                                <option value="2">Cali</option>
                            </select>
                        </div><br><br><br>                   
                        {# 6 #}                
                        <div class="col-md-1" style="width:50px">
                        </div>
                        <div class="col-md-1" style="width:90px;">
                            <span class="help-block"><b>Dg(*)</b></span>
                            <select                                 
                                id="Nomenclatura1Modal"
                                name="Nomenclatura1Modal"
                                class="form-control"
                                style="padding:4px;"
                                required
                            >
                                <option value="">--</option>
                                <option value="Cra">Cra</option>
                                <option value="Cll">Cll</option>
                                <option value="Dg">Dg</option>
                            </select>                            
                        </div>
                        <div class="col-md-1" style="width:90px">
                        <span class="help-block"><b>84(*)</b></span>
                            <input 
                                type="number"
                                id="Nomenclatura2Modal"
                                name="Nomenclatura2Modal"
                                class="form-control"
                                required
                            >
                        </div>                        
                        <div class="col-md-1" style="width:90px">
                        <span class="help-block"><b>B</b></span>
                            <select                                 
                                id="Nomenclatura3Modal"
                                name="Nomenclatura3Modal"
                                class="form-control"
                                style="padding:4px;"
                            >
                                <option value="">--</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>                            
                        </div>      
                        <div class="col-md-1" style="width:10px">
                        <span class="help-block"><b>Bis</b></span>
                            <input                                 
                                id="Nomenclatura4Modal"
                                name="Nomenclatura4Modal"
                                type="checkbox"
                                value="Bis"
                            >                            
                        </div>
                        <div class="col-md-2" style="width:90px">
                            <span class="help-block"><b>Sur</b></span>
                            <div class="input-group">
                                <label>S&nbsp;</label> 
                                <input
                                    type="checkbox"
                                    id="Nomenclatura5Modal"
                                    name="Nomenclatura5Modal"
                                    value="Sur"
                                >
                            </div>
                                <div class="input-group">
                                <label>E&nbsp;</label> 
                                <input
                                    type="checkbox"
                                    id="Nomenclatura6Modal"
                                    name="Nomenclatura6Modal"
                                    value="Este"
                                >
                            </div>
                        </div>                  
                        <div class="col-md-1" style="width:90px">
                        <span class="help-block"><b>No.8(*)</b></span>
                            <input 
                                type="number"
                                id="Nomenclatura7Modal"
                                name="Nomenclatura7Modal"
                                class="form-control"
                                required
                            >
                        </div>
                        <div class="col-md-1" style="width:90px">
                        <span class="help-block"><b>B</b></span>
                            <select 
                                type="text"
                                id="Nomenclatura8Modal"
                                name="Nomenclatura8Modal"
                                class="form-control"
                                style="padding:4px;"
                            >
                                <option value="">--</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>                            
                        </div>  
                        <div class="col-md-2" style="width:90px">    
                        <span class="help-block"><b>62</b></span>
                            <input 
                                type="number"
                                id="Nomenclatura9Modal"
                                name="Nomenclatura9Modal"
                                class="form-control"
                            >
                        </div>
                        <div class="col-md-2" style="width:90px">
                            <span class="help-block"><b>Este</b></span>
                            <div class="input-group">
                                <label>S&nbsp;</label> 
                                <input
                                    type="checkbox"
                                    id="Nomenclatura10Modal"
                                    name="Nomenclatura10Modal"
                                    value="Sur"
                                >
                            </div>
                                <div class="input-group">
                                <label>E&nbsp;</label> 
                                <input
                                    type="checkbox"
                                    id="Nomenclatura11Modal"
                                    name="Nomenclatura11Modal"
                                    value="Este"
                                >
                            </div>
                        </div><br><br><br><br><br>
                        {#7#}
                        <div class="col-md-1" style="width:50px;">
                        </div>
                        <div class="col-md-2" style="padding:0px;">
                            <label>Dirección Generada</label>
                        </div>
                        <div class="col-md-9">                     
                            <input
                                class="form-control"
                                id="dirGeneradaModal"
                                name="dirGeneradaModal"
                                disabled
                            >
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn logistica" id="btnGuardarModal" name="btnGuardarModal" onclick="guardarModal();">Guardar</button>
                    <button type="button" class="btn limpiar" data-dismiss="modal" id="btnCancelarModal" name="btnCancelarModal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
    {# FIN #}

    {# MODAL NUEVA PREGUNTA #}
        <div class="modal fade" id="newPreguntaModal" name="newPreguntaModal" tabindex="-1" role="dialog" aria-labelledby="newPreguntaModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agregar Pregunta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="{{url('gestionar/index')}}"  method="POST" id="enviarForm" name="enviarForm">
                            <div class="row">                            
                                <div class="col-md-3" style="padding-top:7px;">
                                    <label>Nueva Pregunta</label>
                                </div>
                                <div class="col-md-2" style="padding-top:7px; " >
                                    Si <input                                    
                                        type="checkbox"
                                        id="nuevaPreguntaCheckbox"
                                        name="nuevaPreguntaCheckbox"
                                    >
                                </div>
                                <div class="col-md-7">
                                    <select
                                        class="form-control"
                                        id="preguntasIdModal"
                                        name="preguntasIdModal"
                                    >
                                        <option value="">Seleccione...</option>
                                        <option value="1">Pruebas1</option>
                                        <option value="2">Pruebas2</option>
                                        <option value="3">Pruebas3</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row" id="divNuevaPregunta" name="divNuevaPregunta">
                                <div class="col-md-3">
                                    <label>Pregunta</label>
                                </div>
                                <div class="col-md-9">
                                    <input
                                        class="form-control"
                                        id="newPreguntaModal"
                                        name="newPreguntaModal"
                                    >
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn guardar" id="btnguardarNuevaPregunta" name="btnguardarNuevaPregunta">Guardar</button>
                        <button type="button" class="btn limpiar" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    {# FIN #}

    {# MODAL CLIENTE #}
        <div class="modal fade" id="clienteModal" name="clienteModal" tabindex="-1" role="dialog" aria-labelledby="clienteModal" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title h4" id="exampleModalLabel">Solicitud Cliente</h4>                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="{{url('gestionar/index')}}"  method="POST" id="enviarForm" name="enviarForm">
                            <div class="row">                            
                                <div class="col-md-2" style="padding-top:7px;">
                                    <label>Fecha</label>
                                </div>
                                <div class="col-md-4" style="padding-top:7px; " >
                                    <input                                    
                                        type="date"
                                        id="fechaModalCliente"
                                        name="fechaModalCliente"
                                        class="form-control"
                                    >
                                </div>
                                <div class="col-md-2" style="padding-top:7px;">
                                    <label>Tipo Documento</label>
                                </div>
                                <div class="col-md-4" style="padding-top:7px; " >
                                    <select                                        
                                        id="tipoDocumentoModalCliente"
                                        name="tipoDocumentoModalCliente"
                                        class="form-control"
                                    >
                                        <option value="">Seleccione...</option>
                                        <option value="1">Pruebas1</option>
                                        <option value="2">Pruebas2</option>
                                        <option value="3">Pruebas3</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>N° Documento</label>
                                </div>
                                <div class="col-md-4">
                                    <input                                    
                                        type="number"
                                        id="numDocumentoModalCliente"
                                        name="numDocumentoModalCliente"
                                        class="form-control"
                                    >
                                </div>
                                <div class="col-md-2" style="padding-top:7px;">
                                    <label>Fecha Expedición</label>
                                </div>
                                <div class="col-md-4" style="padding-top:7px; " >
                                    <input                                    
                                        type="date"
                                        id="fechaExpModalCliente"
                                        name="fechaExpModalCliente"
                                        class="form-control"
                                    >
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>N° Anotación</label>
                                </div>
                                <div class="col-md-4">
                                    <input                                    
                                        type="number"
                                        id="numAnotacionModalCliente"
                                        name="numAnotacionModalCliente"
                                        class="form-control"
                                    >
                                </div>
                                <div class="col-md-2" style="padding-top:7px;">
                                    <label>Proviene de Pregunta</label>
                                </div>
                                <div class="col-md-4" style="padding-top:7px; " >
                                    <input                                    
                                        type="text"
                                        id="preguntaModalCliente"
                                        name="preguntaModalCliente"
                                        class="form-control"
                                        disabled
                                    >
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn guardar" id="btnGuardarModalCliente" name="btnGuardarModalCliente">Guardar</button>
                        <button type="button" class="btn limpiar" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    {# FIN #}
    

    <div>
    
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
    let dirGenerada = [];
    let dirGeneradaText = '';    
    /**GENERA LA DIRECCIÓN DEL MODAL PARA LOGISTICA**/
        $("#Nomenclatura1Modal").change(function(){
            let Nomenclatura1Modal = $("#Nomenclatura1Modal").val();        
            if(dirGenerada.length == 0){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura1Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[0] = Nomenclatura1Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //2
        $("#Nomenclatura2Modal").change(function(){
            let Nomenclatura2Modal = $("#Nomenclatura2Modal").val();        
            if(dirGenerada.length == 1){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura2Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[1] = Nomenclatura2Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //3
        $("#Nomenclatura3Modal").change(function(){
            console.log("Entro 3");
            let Nomenclatura3Modal = $("#Nomenclatura3Modal").val();        
            if(dirGenerada.length == 2){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura3Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[2] = Nomenclatura3Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //4
        $("#Nomenclatura4Modal").change(function(){
            let Nomenclatura4Modal = $("#Nomenclatura4Modal").val();
            if(!$("#Nomenclatura4Modal").prop('checked')){
                console.log("Entro checked");
                Nomenclatura4Modal = '';                
            }
            if(dirGenerada.length == 3){            
                dirGenerada.push(Nomenclatura4Modal);
            }else{
                dirGenerada[3] = Nomenclatura4Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';            
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //5
        $("#Nomenclatura5Modal").change(function(){
            let Nomenclatura5Modal = $("#Nomenclatura5Modal").val();        
            if($("#Nomenclatura5Modal").prop('checked')){
                $("#Nomenclatura6Modal").prop('checked',false);
                dirGenerada[5] = '';
            }else{
                Nomenclatura5Modal = '';
            }
            if(dirGenerada.length == 4){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura5Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[4] = Nomenclatura5Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //6
        $("#Nomenclatura6Modal").change(function(){
            let Nomenclatura6Modal = $("#Nomenclatura6Modal").val();        
            if($("#Nomenclatura6Modal").prop('checked')){
                $("#Nomenclatura5Modal").prop('checked',false);
                dirGenerada[4] = '';
            }else{
                Nomenclatura6Modal = '';
            }
            if(dirGenerada.length == 5){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura6Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[5] = Nomenclatura6Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //7
        $("#Nomenclatura7Modal").change(function(){
            let Nomenclatura7Modal = $("#Nomenclatura7Modal").val();        
            if(dirGenerada.length == 6){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura7Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[6] = '#'+ Nomenclatura7Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //8
        $("#Nomenclatura8Modal").change(function(){
            let Nomenclatura8Modal = $("#Nomenclatura8Modal").val();        
            if(dirGenerada.length == 7){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura8Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[7] = Nomenclatura8Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //9
        $("#Nomenclatura9Modal").change(function(){
            let Nomenclatura9Modal = $("#Nomenclatura9Modal").val();        
            if(dirGenerada.length == 8){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura9Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[8] = '- '+Nomenclatura9Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //10
        $("#Nomenclatura10Modal").change(function(){
            let Nomenclatura10Modal = $("#Nomenclatura10Modal").val();        
            if($("#Nomenclatura10Modal").prop('checked')){
                $("#Nomenclatura11Modal").prop('checked',false);
                dirGenerada[10] = '';
            }else{
                Nomenclatura10Modal = '';
            }
            if(dirGenerada.length == 9){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura10Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[9] = Nomenclatura10Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
        //11
        $("#Nomenclatura11Modal").change(function(){
            let Nomenclatura11Modal = $("#Nomenclatura11Modal").val();        
            if($("#Nomenclatura11Modal").prop('checked')){
                $("#Nomenclatura10Modal").prop('checked',false);
                dirGenerada[9] = '';
            }else{
                Nomenclatura11Modal = '';

            }
            if(dirGenerada.length == 10){
                console.log(dirGenerada.length);
                dirGenerada.push(Nomenclatura11Modal);
                console.log(dirGenerada.length);
            }else{
                dirGenerada[10] = Nomenclatura11Modal;
            }
            let i = 0;
            dirGenerada.map((element) => {
                dirGeneradaText = dirGeneradaText + element + ' ';
                console.log(element);
            });
            $('#dirGeneradaModal').val(dirGeneradaText);
            dirGeneradaText = '';
                    
        });
    /**FIN**/

    /**LIMPIA TODOS LOS CAMPOS DEL MODAL PARA LOGISTICA**/
    function limpiarModal(){
        $('#fechaModal').val('');
        $('#prioridadModal').val('');
        $('#tipoDocumentoModal').val('');
        $('#numDocumentoModal').val('');
        $('#ubicacionModal').val('');
        $('#indicacionesModal').val('');
        $('#direccionModal').val('');
        $('#barrioTextModal').val('');
        $('#ciudadModal').val('');
        $('#barrioModal').val('');
        $('#dirGeneradaModal').val('');
        $('#Nomenclatura1Modal').val('');
        $('#Nomenclatura2Modal').val('');
        $('#Nomenclatura3Modal').val('');
        $('#Nomenclatura4Modal').prop('checked',false)
        $('#Nomenclatura5Modal').prop('checked',false)
        $('#Nomenclatura6Modal').prop('checked',false)
        $('#Nomenclatura7Modal').val('');
        $('#Nomenclatura8Modal').val('');
        $('#Nomenclatura9Modal').val('');
        $('#Nomenclatura10Modal').prop('checked',false)
        $('#Nomenclatura11Modal').prop('checked',false)
    }
    /**FIN*/

    $('#btnCancelarModal').on('click', function(){
       limpiarModal(); 
    });

    /**HABILITA LA OPCIÖN DE AÑADIR NUEVA PREGUNTA**/
        $('#divNuevaPregunta').hide();
        $("#nuevaPreguntaCheckbox").change(function(){
            let nuevaPreguntaCheckbox = $("#nuevaPreguntaCheckbox")
            $('#preguntasIdModal').val('');
            if(nuevaPreguntaCheckbox.prop('checked')){
                $('#preguntasIdModal').attr('disabled', true);
                $('#divNuevaPregunta').show();
            }else{
                $('#preguntasIdModal').attr('disabled', false);
                $('#divNuevaPregunta').hide();
                
            }
                    
        });
    /****/

    $( function() {
        $( "#grupoTablas" ).tabs();
    });

});

function cambiarPestanna(pestannas,pestanna) {
        //console.log('Div que tiene todas las pestañas',pestannas)
        let contenido = document.getElementById('contenido'+pestannas.id);
        // console.log('pestannas',pestannas);
        // console.log('pestanna',pestanna);        
        // console.log("Contenido", contenido);        
        // console.log(contenido.getElementsByTagName('div')[0]);
        let i = 0;
        while (typeof contenido.getElementsByTagName('div')[i] != 'undefined'){
            console.log('pestannas',pestanna);
            console.log('contenido',contenido.getElementsByTagName('div')[i]);
            if(contenido.getElementsByTagName('div')[i].id == ('c'+pestanna.id)){
                $(contenido.getElementsByTagName('div')[i]).css('display','');                
                
            }else if(contenido.getElementsByTagName('div')[i].id == pestanna.id){
                $(contenido.getElementsByTagName('div')[i]).css('display','');
                console.log("Entro");
            }else{
                $(contenido.getElementsByTagName('div')[i]).css('display','none');                
            }
            i++;
        }
    }


</script>

