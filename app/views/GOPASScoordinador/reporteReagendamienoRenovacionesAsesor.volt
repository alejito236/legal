<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte de Reagendamiento de Renovaciones .xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table  id="tabla_master" class="display" cellspacing="0" width="100%" style="font-size: 9; ">
        <thead>
            <tr class="filas_master">
                    
                <th> # </th>
                <th> NOMBRE CLIENTE </td>
                <th> CEDULA CLIENTE </td>   
                <th> TELEFONO CLIENTE </th>
                <th> CELULAR CLIENTE </th>
                <th> CIUDAD </td> 
                <th> ASESOR </td> 
                <th> FECHA GESTIÓN </th>
            </tr>
        </thead> 
        <tbody>
            {% for item in data %}
                <tr> 
                    <td>{{item.num}}</td>
                    <td>{{item.nombreCliente}}</td>
                    <td>{{item.cedulaCliente}} </td>
                    <td>{{item.telefonoCliente}}</td>
                    <td>{{item.celularCliente}}</td>
                    <td>{{item.ciudad}}</td>
                    <td>{{item.usuarioGestion}}</td>
                    <td>{{item.fechaGestion}}</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>
 