<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte de los pagos en linea .xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

    <table id="tabla_master" class="display" cellspacing="0" width="100%" style="font-size: 9; ">
        <thead>
            <!-- <tr>
                <th colspan="" rowspan="8" headers="" scope=""> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgRJYXHLAPgLFiH4HB0iS2qpoQX2JHnETqb3dkyN7jD2WKdzijPw" height="10px" width="15px" style="margin-right:50px;"></th>
                <th colspan="7" rowspan="8" headers="" scope="" style="color: #305F93; font-size: 20px;"> Reporte de tipificaciones del {{fechaFinalAnterior}} al {{fechaActual}} </th>
            </tr>

            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr> -->
            <tr class="filas_master">
                    
                <!-- <th> # </th> -->
                <!-- <th> FECHA DE GESTIÓN </th>
                <th> USUARIO DE GESTIÓN </td> -->    
                <th> CEDULA </th>
                <th> VALOR/ CUPO </th>
                <th> PLACA/TIPO TDC </th>
                <th> FECHA LIMITE PAGÒ </th>
                <th> CORREO </th>
                <th> NOMBRE </td>
                <th> TELEFONO </th>
                <th> ASESOR </th>
                <!-- <th> FECHA DE VENCIMIENTO </th> -->
                <!-- <th> TIPO PETICIÓN </th>
                <th> ESTADO PETICIÓN </th> -->
            </tr>
        </thead> 
        <tbody>
            {% for item in data %}
                <tr> 
                    <!-- <td>{{item.num}}</td> -->
                    <td>{{item.cedula}} </td>
                    <td>{{item.valor}}</td>
                    <td>{{item.placa}}</td>
                    <td>{{item.fechaVigenciaPago}}</td>
                    <td>{{item.correo}}</td>
                    <td>{{item.nombre}}</td>
                    <td>{{item.telefono}}</td>
                    <td>{{item.userGestion}}</td>
                    <!-- <td>{{item.valor}}</td>
                    <td>{{item.tipoPeticion}}</td>
                    <td>{{item.estadoPeticion}}</td> -->
                </tr>
            {% endfor %}
        </tbody>
    </table>
