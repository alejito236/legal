<?php

    header("Content-Type: application/vnd.ms-excel");
    header("Expires: 0");
    header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
    header("content-disposition: attachment;filename=Reporte de Renovaciones en NEIVA .xls");
    header("Content-Type: text/html; charset=UTF-8");
    
    
?>

<table  id="tabla_master" class="display" cellspacing="0" width="100%" style="font-size: 9;">
    <thead>
        <!-- <tr>
            <th colspan="" rowspan="8" headers="" scope=""> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgRJYXHLAPgLFiH4HB0iS2qpoQX2JHnETqb3dkyN7jD2WKdzijPw" height="10px" width="15px" style="margin-right:50px;"></th>
            <th colspan="7" rowspan="8" headers="" scope="" style="color: #305F93; font-size: 20px;"> Reporte de Ventas por Asesor del {{fechaInicial}} al {{fechaFinal}} </th>
        </tr>

        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr>
        <tr></tr> -->
        <tr class="filas_master">
                
            <th> # </th>
            <th> FECHA </th>
            <th> ESTADO </th>
            <th> NOMBRE ASESOR </th>
            <th> NOMBRE CLIENTE </td>
            <th> PLACA </th>
            <th> CEDULA </th>
            <th> CELULAR </td>
            <th> VALOR SOAT </th>
            <th> NOMBRE SOAT </th>
            <th> CEDULA SOAT </th>
            <th> TELEFONO SOAT </th>
            <th> FECHA ENTREGA </th>
            <th> FORMA DE PAGO </th>
            <th> MD</th>
            <th> INDICACIONES DE ENTREGA </th>
            <th> DIRECCIÓN SOAT </th>
            <th> DIRECCIÓN ENTREGA </th>
            <th> LOCALIDAD </th>
            <th> COBERTURA </th>
            <th> CIUDAD </th>
        </tr>
    </thead> 
    <tbody>
        {% for item in data %}
            <tr> 
                <td>{{item.num}}</td>
                <td>{{item.fechaGestion}} </td>
                <td>{{item.tipificacion}} </td>
                <td>{{item.usuarioGestion}}</td>
                <td>{{item.nombreCliente}}</td>
                <td>{{item.placa}}</td>
                <td>{{item.cedulaCliente}}</td>
                <td>{{item.celularCliente}}</td>
                <td>{{item.valorSoat}}</td>
                <td>{{item.nombreTitular}}</td>
                <td>{{item.cedulaTitular}}</td>
                <td>{{item.telefonoTitular}}</td>
                <td>{{item.fechaEntrega}}</td>
                <td>{{item.formaPago}}</td>
                <td>{{item.momento}}</td>
                <td>{{item.indicaciones}}</td>
                <td>{{item.direccionTitular}}</td>
                <td>{{item.direccionEntrega}}</td>
                <td>{{item.localidad}}</td>
                <td>{{item.barrio}}</td>
                <td>{{item.ciudad}}</td>
            </tr>
        {% endfor %}
    </tbody>
</table>
