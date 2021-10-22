<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte-ventas-por-asesor.xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table id="tabla_master" class="display" cellspacing="0" width="100%" style="font-size: 9; ">
    <thead>
        <tr class="filas_master">  
            <th> # </th>
            <th> FECHA GESTION </th>
            <th> MOMENTO DIA </td>
            <th> NOMBRE CLIENTE </th>
            <th> DIRECCION CLIENTE </th>
            <th> TELEFONO CLIENTE </th>
            <th> CELULAR CLIENTE </th>
            <th> PLACA </td>
            <th> NUMERO TAGS </td>
            <th> DIRECCION ENTREGA </td>
            <th> INDICACIONES ENTREGA</td>
            <th> FECHA ENTREGA</td>
            <th> ASESOR </th>
        </tr>
    </thead> 
    <tbody>
    {% for item in data %}
        <tr>
            <td>{{ item.num }}</td>
            <td>{{ item.fechaGestion }}</td>
            <td>{{ item.franjaEntrega }}</td>
            <td>{{ item.nombreCliente }}</td>
            <td>{{ item.direccionCliente }}</td>
            <td>{{ item.telefonoCliente }} </td>
            <td>{{ item.celularCliente }}</td>
            <td>{{ item.placa }}</td>
            <td>{{ item.numeroTags }}</td>
            <td>{{ item.direccionEntrega }}</td>
            <td>{{ item.indicacionesEntrega }}</td>
            <td>{{ item.fechaEntrega }}</td>
            <td>{{ item.asesor }}</td>
        </tr>
    {% endfor %}
    </tbody>
</table>