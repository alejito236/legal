<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=$nombreRuta .xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table id="tabla_master" class="display" cellspacing="0" width="100%"style="font-size: 9;">
        <thead>            
            <tr class="filas_master">
                <th style="background-color: #94D573; color: white;"> FECHA ENVIO </th>
                <th style="background-color: #ADACAC; color: white"> HORA INICIAL </th>
                <th style="background-color: #ADACAC; color: white"> TIPO DE VENTA </th>
                <th style="background-color: #ADACAC; color: white"> NOMBRE DEL CLIENTE </th>
                <th style="background-color: #ADACAC; color: white"> DIRECCION ENTREGA </th>
                <th style="background-color: #ADACAC; color: white"> INDICACIONES </th>
                <th style="background-color: #ADACAC; color: white"> TELEFONOS </th>
                <th style="background-color: #ADACAC; color: white"> CELULAR </th>
                <th style="background-color: #ADACAC; color: white"> FORMA PAGO </th>
                <th style="background-color: #ADACAC; color: white"> VALOR SOAT </th>
                <th style="background-color: #ADACAC; color: white"> PLACA </th>
                <th style="background-color: #ADACAC; color: white"> CEDULA </th>
                <th style="background-color: #ADACAC; color: white"> FECHA </th>
                <th style="background-color: #ADACAC; color: white"> SECTOR </th>
                <th style="background-color: #ADACAC; color: white"> ZONA </th>
                <th style="background-color: #ADACAC; color: white"> BARRIO </th>
                <th style="background-color: #ADACAC; color: white"> NOMBRE TITULAR SOAT </th>
                <th style="background-color: #ADACAC; color: white"> CEDULA TITULAR SOAT </th>
                <th style="background-color: #ADACAC; color: white"> DIRECCION TITULAR SOAT </th>
                <th style="background-color: #ADACAC; color: white"> TELEFONO TITULAR SOAT </th>
                <th style="background-color: #ADACAC; color: white"> ASISTENCIA SOAT </th>
                <th style="background-color: #ADACAC; color: white"> GOPASS </th>
                <th style="background-color: #ADACAC; color: white"> ASESOR </th>
                <th style="background-color: #85B6FE; color: white"> ESTADO PRESUPUESTO </th>
                <th style="background-color: #85B6FE; color: white"> SUBCRITERIO PRESUPUESTO </th>
                <th style="background-color: #85B6FE; color: white"> OBSERVACIONES PRESUPUESTO </th>
                <th style="background-color: #85B6FE; color: white"> PRODUCTO </th>
                <th style="background-color: #85B6FE; color: white"> ANALISTA PRESUPUESTO </th>
                <th style="background-color: black; color: white"> MOTO </th>
                <th style="background-color: black; color: white"> CEDULA MOTO </th>
                <th style="background-color: #85B6FE; color: white"> ESTADO EXPEDICION </th>
                <th style="background-color: #85B6FE; color: white"> OBSERVACIONES EXPEDICION </th>
                <th style="background-color: #85B6FE; color: white"> ASEGURADORA </th>
                <th style="background-color: #85B6FE; color: white"> POLIZA </th>
                <th style="background-color: #85B6FE; color: white"> ANALISTA EXPEDICION </th>
                <th style="background-color: #94D573; color: white;"> ESTADO BACKOFFICE </th>
                <th style="background-color: #94D573; color: white;"> SUB-CRITERIO </th>
                <th style="background-color: #94D573; color: white;"> SUB-CRITERIO 2 </th>
                <th style="background-color: #94D573; color: white;"> OBSERVACIONES BACKOFFICE </th>
                <th style="background-color: #94D573; color: white;"> GESTION BACKOFFICE </th>
                <th style="background-color: #94D573; color: white;"> ANALISTA BACKOFFICE </th>
                <th style="background-color: #94D573; color: white;"> MEDIO DE PAGO FINAL </th>
                <th style="background-color: #94D573; color: white;"> CIUDAD </th>
                <th style="background-color: #94D573; color: white;"> CANAL DISTRIBUCION </th>
            </tr>
        </thead> 
        <tbody>
            {% for item in data %}
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
                    <td>{{item['fechaEntrega']}}</td>
                    <td>{{item['sfranjaentregaTdc']}}</td>
                    {% if item['producto'] == 2 %} 
                    <td>TODORIESGO</td>
                    {% elseif item['producto'] == 3 %}
                    <td>TARJETA NOVUS</td>
                    {% elseif item['producto'] == 1 %}
                    <td>SOAT</td>
                    {% endif %}
                    <td>{{item['snombreCliente']}}</td>
                    <td>{{item['direccionCliente']}} </td>
                    <td>{{item['indicacionCliente']}}</td>
                    <td>{{item['telefonoCliente']}}</td>
                    <td>{{item['celularCliente']}}</td>
                    <td>{{item['formaPago']}}</td>
                    <td>{{item['valorProducto']}}</td>
                    <td>{{item['placa']}}</td>
                    <td>{{item['cedulaCliente']}}</td>
                    <td>{{item['fechaEntrega']}}</td>
                    <td></td>
                    <td>{{item['Localidad']}}</td>
                    <td>{{item['Barrio']}}</td>
                    <td>{{item['nombreTitular']}}</td>
                    <td>{{item['cedulaTitular']}}</td>
                    <td>{{item['direccionTitular']}}</td>
                    <td>{{item['telefonoTitular']}}</td>
                    <td>{{item['asistencia']}}</td>
                    <td>{{item['gopass']}}</td>
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
                    <td>{{item['ciudad']}}</td>
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

