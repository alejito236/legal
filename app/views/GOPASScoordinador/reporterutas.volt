<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte de rutas de los tags .xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table id="tabla_master" class="display" cellspacing="0" width="100%"style="font-size: 9;">
        <thead>
            
            <tr class="filas_master">  
                <th> # </th>
                <th> FECHA ENVIO </th>
                <th> MD </td>
                <th> TIPO VENTA </td>   
                <th> NOMBRE CLIENTE </th>
                <th> APELLIDO CLIENTE </th>
                <th> TELEFONO CLIENTE </th>
                <th> CORREO CLIENTE </th>
                <th> PLACA </td>
                <th> TAG </td>
                <th> ESTABLECIMIENTO </td>
                <th> DIRECCIÓN ENTREGA </td>
                <th> INDICACIONES ENTREGA</td>
                <th> ASESOR </th>
            </tr>
        </thead> 
        <tbody>
            {% for item in data %}
                <tr style="background-color: #DBFBC1">
                    <td>{{item['num']}}</td>
                    <td>{{item['fechaEntrega']}}</td>
                    <td>PM</td>
                    <td>TAG</td>
                    <td>{{item['nombre_clie']}}</td>
                    <td>{{item['apellido_clie']}}</td>
                    <td>{{item['celular_clie']}} </td>
                    <td>{{item['correo_clie']}}</td>
                    <td>{{item['placa']}}</td>
                    <td>{{item['tag']}}</td>
                    <td>{{item['establecimiento']}}</td>
                    <td>{{item['direccionEntrega']}}</td>
                    <td>{{item['indicacionesEntrega']}}</td>
                    <td>{{item['asesor']}}</td>
                </tr>
            {% endfor %}
        </tbody>

        {% if data2 is defined %}

            <thead>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>RUTA ANTIGUA</th>
                </tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr class="filas_master">
                        
                    <th> # </th>
                    <th> FECHA ENVIO </th>
                    <th> MD </td>
                    <th> TIPO VENTA </td>   
                    <th> HORA FINAL </th>
                    <th> TELEFONO CLIENTE </th>
                    <th> NOMBRE CLIENTE </th>
                    <th> DIRECCIÓN ENTREGA </td>
                    <th> INDICACIONES </td>
                    <th> TELEFONO </th>
                    <th> CELULAR </td>
                    <th> FORMA PAGO </th>
                    <th> VALOR SOAT </td> 
                    <th> PLACA </td> 
                    <th> CEDULA </td>  
                    <th> ZONA </td>  
                    <th> BARRIO </td>  
                    <th> NOMBRE TITULAR SOAT </th>
                    <th> CEDULA TITULAR SOAT </th>
                    <th> DIRECCIÓN TITULAR SOAT </th>
                    <th> TELEFONO TITULAR SOAT </th>
                    <th> ASESOR </th>

                    
                    <th> ESTADO CIVIL </th>
                    <th> PERSONAS A CARGO </th>
                    <th> NIVEL ESTUDIO </th>
                    <th> PROFESION </th>
                    <th> TELEFONO RESIDENCIA </th>
                    <th> EMAIL </th>
                    <th> ACTIVOS </th>
                    <th> PASIVOS </th>
                    <th> ACTIVIDAD </th>
                    <th> VALOR SOAT NOVUS </th>
                    <th> ESTADO PRESUPUESTO </th>
                    <th> SUBCRITERIO PRESUPUESTO </th>
                    <th> OBSERVACIONES PRESUPUESTO </th>
                    <th> MOTO </th>
                    <th> CEDULA MOTO </th>
                    <th> ESTADO EXPEDICIÓN </th>
                    <th> OBSERVACIONES EXPEDICIÓN </th>
                    <th> ASEGURADORA </th>
                    <th> POLIZA </th>
                    <th> ANALISTA EXPEDICIÓN </th>
                    <th> ESTADO BACKOFFICE </th>
                    <th> SUB-CRITERIO </th>
                    <th> SUB-CRITERIO2 </th>
                    <th> OBSERVACIONES MOTORIZADO </th>
                    <th> GESTION BACK </th>
                    <th> ANALISTA BACKOFFICE </th>
                    <th> MEDIO DE PAGO FINAL </th>
                    <th> CIUDAD </th>
                </tr>
            </thead> 
            <tbody>
                    {% for item in data2 %}
                    {% if item['ciudad'] == 'BOGOTÁ' %} 
                    <tr style="background-color:  #fff"> 
                    {% elseif item['ciudad'] == 'MEDELLÍN' %} 
                    <tr style="background-color: #DBFBC1">
                    {% elseif item['ciudad'] == 'CALI' %} 
                    <tr style="background-color:  #FAEDD9">
                    {% elseif item['ciudad'] == 'BUCARAMANGA' %} 
                    <tr style="background-color: #A9F5F2">
                    {% elseif item['ciudad'] == 'BARRANQUILLA' %} 
                    <tr style="background-color: #D8D8D8">
                    {% else %}
                    <tr>
                    {% endif %}
                        <td>{{item['num2']}}</td>
                        <td>{{item['fechaEntrega']}}</td>
                        <td>{{item['momentoDia']}}</td>
                        <td>SOAT</td>
                        <td></td>
                        <td>{{item['telefonoCliente']}}</td>
                        <td>{{item['nombreCliente']}}</td>
                        <td>{{item['direccionEntrega']}} </td>
                        <td>{{item['indicacionesEntrega']}}</td>
                        <td>{{item['telefonoCliente']}}</td>
                        <td>{{item['celularCliente']}}</td>
                        <td>{{item['formaPago']}}</td>
                        <td>{{item['valorSoat']}}</td>
                        <td>{{item['placa']}}</td>
                        <td>{{item['cedulaCliente']}}</td>
                        <td>{{item['localidad']}}</td>
                        <td>{{item['barrio']}}</td>
                        <td>{{item['nombreTitular']}}</td>
                        <td>{{item['cedulaTitular']}}</td>
                        <td>{{item['direccionTitular']}}</td>
                        <td>{{item['telefonoTitular']}}</td>
                        <td>{{item['asesor']}}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>{{item['ciudad']}}</td>
                    </tr>
                {% endfor %}
            </tbody>
        {% endif %}
    </table>

