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
                <th> FECHA GESTION</th>
                <th> NOMBRE ASESOR </th>
                <th> NOMBRE CLIENTE </th>
                <th> DOCUMENTO CLIENTE </th>
                <th> TELEFONO CLIENTE </th>
                <th> CELULAR CLIENTE </th>
                <th> CIUDAD RESIDENCIA </th>
                <th> LOCALIDAD RESIDENCIA </th>
                <th> BARRIO RESIDENCIA </th>
                <th> TIPIFICACION </th>
                <th> PLACA </th>
                <th> NUMERO TAGS </th>
                <th> DIRECCION ENTREGA </th>
                <th> FECHA ENTREGA </th>
                <th> INDICACIONES ENTREGA </th>
            </tr>
        </thead> 
        <tbody>
            {% for item in data %}
                <tr> 
                    <td>{{ item.num }}</td>
                    <td>{{ item.fechaGestion }} </td>
                    <td>{{ item.asesor }} </td>
                    <td>{{ item.nombreCliente }}</td>
                    <td>{{ item.documentoCliente }}</td>
                    <td>{{ item.telefonoCliente }}</td>
                    <td>{{ item.celularCliente }}</td>
                    <td>{{ item.ciudadResidencia }}</td>
                    <td>{{ item.localidadResidencia }}</td>
                    <td>{{ item.barrioResidencia }}</td>
                    <td>{{ item.tipificacion }}</td>
                    <td>{{ item.placa }}</td>
                    <td>{{ item.numeroTags }}</td>
                    <td>{{ item.direccionEntrega }}</td>
                    <td>{{ item.fechaEntrega }}</td>
                    <td>{{ item.indicacionesEntrega }}</td>
                </tr>
            {% endfor %}
        </tbody>
    </table>