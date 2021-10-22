<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte-ventas-por-Asesor.xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table  id="tabla_master" class="display" cellspacing="0" width="100%" style="font-size: 9;">
    <thead>
        <tr class="filas_master">
                
            <th> # </th>
            <th> ID</th>
            <th> FECHA REAGENDAMIENTO</th>
            <th> TIPIFICACION </th>
            <th> NOMBRE SAC </th>
            <th> NOMBRE CLIENTE </th>
            <th> DOCUMENTO CLIENTE </th>
            <th> DIRECCION CLIENTE </th>
            <th> CELULAR CLIENTE </th>
            <th> TELEFONO CLIENTE </th>
            <th> PLACA </th>
            <th> NUMERO TAGS </th>
            <th> FRANJA </th>
            <th> INDICACIONES ENTREGA </th>
            <th> OBSERVACIONES </th>
            <th> LOCALIDAD </th>
            <th> BARRIO </th>
        </tr>
    </thead> 
    <tbody>
        {% for item in data %}
            <tr> 
                <td>{{ item.num }}</td>
                <td>{{ item.id }} </td>
                <td>{{ item.fechaReagendamiento }} </td>
                <td>{{ item.tipificacion }} </td>
                <td>{{ item.usuarioReagendamiento }}</td>
                <td>{{ item.nombreCliente }}</td>
                <td>{{ item.documentoCliente }}</td>
                <td>{{ item.direccionCliente }}</td>
                <td>{{ item.celularCliente }}</td>
                <td>{{ item.telefonoCliente }}</td>
                <td>{{ item.placa }}</td>
                <td>{{ item.numeroTags }}</td>
                <td>{{ item.franja }}</td>
                <td>{{ item.indicacionesEntrega }}</td>
                <td>{{ item.observaciones }}</td>
                <td>{{ item.localidad }}</td>
                <td>{{ item.barrio }}</td>
            </tr>
        {% endfor %}
    </tbody>
</table>