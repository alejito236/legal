<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte de informacion de membresias .xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table  id="tabla_master" class="display" cellspacing="0" width="100%" style="font-size: 9; ">
        <thead>
            <tr class="filas_master">
                <th> PLACA </td>
                <th> FECHA GESTIÓN </td>
                <th> NOMBRE ASESOR </td>
                <th> CEDULA CLIENTE </td>
                <th> NOMBRE CLIENTE </td>
                <th> CAMPANAÑA </td>
                <th> TIPIFICACIÓN </td>
                <th> CONOCE MEMBRESÍAS </td>
            </tr>
        </thead> 
        <tbody>
            {% for item in data %}
                <tr>
                    <td>{{item.placa}}</td>
                    <td>{{item.fechaGestion}}</td>
                    <td>{{item.nombreAsesor}}</td>
                    <td>{{item.cedulaPersona}}</td>
                    <td>{{item.nombrePersona}}</td>
                    <td>{{item.campanaNombre}}</td>
                    <td>{{item.nombreTpificacion}}</td>
                    <td>
                        {% if item.conoceMembresias is 1 %}
                            Si
                        {% else %}
                            No
                        {% endif %}
                        
                    </td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
 