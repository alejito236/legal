<?php

use Phalcon\Flash;
use Phalcon\Session;

class GOPASScoordinadorController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Coordinador');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->role = $this->session->get("role");
        $this->view->campana = $this->session->get("campana");
        $this->view->setTemplateAfter('LOGISTICAadminlayout');
        $this->date = new \DateTime('America/Bogota');
        $this->dateAnterior = new \DateTime('America/Bogota'.'-1 day');

        $id = $this->session->get('iduser');
        $fecha = $this->date->format("Y-m-d H:i:s");
        $usuarios = new Usuario();        
        $usuarios = Usuario::findFirst([
            "usuarioId = :id:",
            'bind' => ['id' => $id]
        ]);

        // $usuarios->ultimaSesion = $fecha;

        // if($usuarios->save()){
        //     echo "Entro <br>";
        // }
    }

    /**
     * Acccion para iniciar gestion de coordinador SOAT
     */

    public function indexAction(){        
        $post = $this->request->getPost();
        if ($this->session->get("role") == 5) {
            //print_r($post);die;
            $id = $this->session->get('iduser');
            
            if(isset($post['btnFiltrar'])){
                $fechaInicial =  $post['fechaInicio'];
                $fechaFinal = $post['fechaFinal'];
            }else{
                $fechaInicial = $this->date->format("Y-m-d");
                $fechaFinal = $this->date->format("Y-m-d");
            }

            $convenios = Convenio::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);
            $gestionGopass = new Gestiongopass();
            $totalBase = $gestionGopass->getTotalBase($fechaInicial,$fechaFinal);            
            $contactados = $gestionGopass->getContactados($fechaInicial,$fechaFinal);
            $ventas = $gestionGopass->getVentas($fechaInicial,$fechaFinal);            
            $contactadoCampana = $gestionGopass->getContactadosCampana($fechaInicial,$fechaFinal);
            $conoceMembresias = $gestionGopass->getConoceMembresias($fechaInicial,$fechaFinal);
            $adquiereMembresia = $gestionGopass->getAdquiereMembresia($fechaInicial,$fechaFinal);
            $presentacionPersonal = $gestionGopass->getResultadoPresentacionPersonal($fechaInicial, $fechaFinal);
            $datoTotalBase = 0;
            $datoContactados = 0;
            $datoVentas = 0;
            $efectividadInforme = 0;
            $efectividadVenta = 0;            
            $datoContactadoCampana = array();
            $datoConoceMembresias = array();
            $datoAdquiereMembresia = array();
            $datoPresentacionPersonal = array();
            
            foreach($totalBase as $resultado){
                $datoTotalBase = $resultado['cantidad'];
            }

            foreach($contactados as $resultado){
                $datoContactados = $resultado['cantidad'];
            }

            foreach($ventas as $resultado){
                $datoVentas = $resultado['cantidad'];
            }

            foreach($contactadoCampana as $resultado){
                $datoContactadoCampana[] = [
                    'cantidad'  => $resultado['cantidad'],
                    'campanaId' => $resultado['campanaId']
                ];
            }

            foreach($conoceMembresias as $resultado){
                $datoConoceMembresias[] = [
                    'cantidad'  => $resultado['cantidad'],
                    'conoceMembresias' => $resultado['conoceMembresias']
                ];
            }

            foreach($adquiereMembresia as $resultado){
                $datoAdquiereMembresia[] = [
                    'campanaId'         => $resultado['campanaId'],
                    'adquiereMembresia' => $resultado['adquiereMembresia'],
                    'cantidad'          => $resultado['cantidad'],
                ];
            }

            foreach($presentacionPersonal as $resultado){
                $datoPresentacionPersonal[] = [
                    'calificacion'  => $resultado['calificacionPresentacionPersonal'],
                    'cantidad'      => $resultado['cantidad'],
                ];
            }

            if($datoContactados == 0){
                $efectividadInforme = 0;
            }else{
                $efectividadInforme = $datoContactados*100/$datoTotalBase;
            }

            if($datoVentas == 0){
                $efectividadVenta = 0;
            }else{
                $efectividadVenta = $datoVentas*100/$datoContactados;                
            }            
            $datoContactadoCampana = json_encode($datoContactadoCampana);
			$this->view->datoContactadoCampana = json_decode($datoContactadoCampana);

            $datoAdquiereMembresia = json_encode($datoAdquiereMembresia);
			$this->view->datoAdquiereMembresia = json_decode($datoAdquiereMembresia);

            $datoConoceMembresias = json_encode($datoConoceMembresias);
			$this->view->datoConoceMembresias = json_decode($datoConoceMembresias);

            $datoPresentacionPersonal = json_encode($datoPresentacionPersonal);
			$this->view->datoPresentacionPersonal = json_decode($datoPresentacionPersonal);
            
            $this->view->datoTotalBase = $datoTotalBase;
            $this->view->datoContactados = $datoContactados;
            $this->view->datoVentas = $datoVentas;
            $this->view->efectividadInforme = $efectividadInforme;
            $this->view->efectividadVenta = $efectividadVenta;
            $this->view->contactadoCampanaPostventa = $contactadoCampanaPostventa;
            $this->view->contactadoCampanaFidelizacion = $contactadoCampanaFidelizacion;            
            
            
            $convenios = json_encode($convenios);
            $this->view->convenios = json_decode($convenios);
            
            $this->view->fechaInicial = $fechaInicial;
            $this->view->fechaFinal = $fechaFinal;
            $this->view->filtroConvenio = $filtroConvenio;
            $this->view->fechaFinalAnterior = $fechaFinalAnterior;
            $this->view->fechaActual = $fechaActual;



        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function reagendamientoAction(){

        if ($this->session->get("role") == 3) {

         $id = $this->session->get('iduser');

         $post = $this->request->getPost();
        
        $fechaInicial = $this->date->format("Y-m-d");
        $fechaFinal = $this->date->format("Y-m-d");

            if(isset($post['fechaInicio'])){
                $fechaInicial = $post['fechaInicio'];
                $fechaFinal = $post['fechaFinal'];
            }

            // trae la ventas efectivas y renovaciones de bogota

            $ventasEfectivas = new  gopassgestion();
            $ventasEfectivasSql =  $ventasEfectivas->getReagendamientosCoordinador($fechaInicial,$fechaFinal);

            $reagendamientoBarranquilla = 0;
            $reagendamientoBogota = 0;            
            $reagendamientoBucaramanga = 0;
            $reagendamientoCali = 0;
            $reagendamientoMedellin = 0;

            $reagendamientotal=0;

        //    print_r($ventasEfectivas);die;
            foreach($ventasEfectivasSql as $venta){
                if($venta['snombreCiudad'] == 'BARRANQUILLA' && $venta['tipificacion'] == 188){
                    $reagendamientoBarranquilla = $venta['cantidad'];
                }
                if($venta['snombreCiudad'] == 'BOGOTÁ' && $venta['tipificacion'] == 188){
                    $reagendamientoBogota = $venta['cantidad'];
                }
                if($venta['snombreCiudad'] == 'BUCARAMANGA' && $venta['tipificacion'] == 188){
                    $reagendamientoBucaramanga = $venta['cantidad'];
                }
                if($venta['snombreCiudad'] == 'CALI' && $venta['tipificacion'] == 188){
                    $reagendamientoCali = $venta['cantidad'];
                }
                if($venta['snombreCiudad'] == 'MEDELLÍN' && $venta['tipificacion'] == 188){
                    $reagendamientoMedellin = $venta['cantidad'];
                }

                if($venta['tipificacion'] == 188){
                    $reagendamientotal += $venta['cantidad'];
                }
            }

            $reagendados = [
                "barranquilla"  => $reagendamientoBarranquilla,
                "bogota"        => $reagendamientoBogota,
                "bucaramanga"   => $reagendamientoBucaramanga,
                "cali"          => $reagendamientoCali,
                "medellin"     => $reagendamientoMedellin,
                "total"         => $reagendamientotal
            ];

            $reagendados=json_encode($reagendados);

            $ventasAsesorSql = new gopassgestion();
            $ventasAsesorSql =  $ventasAsesorSql->getReagendamientosAsesor($fechaInicial,$fechaFinal);

            foreach($ventasAsesorSql as $ventaAse){
                $ventasAsesor[] = [
                    "asesor"        => $ventaAse['snombresUser'].' '. $ventaAse['sapellidosUser'],
                    "cantidad"      => $ventaAse['cantidad']
                ];
            }

            if($ventasAsesor == null){
                $ventasAsesor[] = [
                    "asesor"    => "vacio",
                    "cantidad"  => 0 
                ];
            }
            $ventasAsesor = json_encode($ventasAsesor);

            // //trae la cantidad de ventas por asesor

            $ventasBarranquillaSql = new FamisanarGestion();
            $ventasBarranquillaSql =  $ventasBarranquillaSql->getVentasAsesorBarranquilla($fechaInicial,$fechaFinal);
            
            foreach($ventasBarranquillaSql as $ventaBarran){
                if($ventaBarran['cantidad'] >= 1){
                    $ventasBarranquilla[] = [
                        "asesor"        => $ventaBarran['snombresUser'].' '. $ventaBarran['sapellidosUser'],
                        "cantidad"      => $ventaBarran['cantidad']
                    ];
                }
            }
            // print_r($ventasBarranquilla);die;
            if($ventasBarranquilla == null){
                $ventasBarranquilla[] = [
                    "asesor"    => "vacio",
                    "cantidad"  => 0 
                ];
            }
            $ventasBarranquilla = json_encode($ventasBarranquilla);

            
            // //trae la cantidad de ventas por asesor

            $ventasOperacionSql = new FamisanarGestion();
            $ventasOperacionSql =  $ventasOperacionSql->getVentasAsesorOperacion($fechaInicial,$fechaFinal);

            foreach($ventasOperacionSql as $ventaOperacion){
                if($ventaOperacion['cantidad'] >= 1){
                    $ventasOperacion[] = [
                        "asesor"        => $ventaOperacion['snombresUser'].' '. $ventaOperacion['sapellidosUser'],
                        "cantidad"      => $ventaOperacion['cantidad']
                    ];
                }
            }

            if($ventasOperacion == null){
                $ventasOperacion[] = [
                    "asesor"    => "vacio",
                    "cantidad"  => 0 
                ];
            }
            $ventasOperacion = json_encode($ventasOperacion);

			// trae la cantidad de usuario de la Cra 30
            $usuariosCraTreinta = new FamisanarGestion();
            $usuariosCraTreintasql =  $usuariosCraTreinta->getUsuariosCraTreinta($fechaInicial,$fechaFinal);

            foreach($usuariosCraTreintasql as $getUsuarioCraTreinta){
                if($getUsuarioCraTreinta['cantidad'] >= 1){
                    $ventasCraTreinta[] = [
                        "asesor"        => $getUsuarioCraTreinta['snombresUser'].' '. $getUsuarioCraTreinta['sapellidosUser'],
                        "cantidad"      => $getUsuarioCraTreinta['cantidad']
                    ];
                }
            }

            if($ventasCraTreinta == null){
                $ventasCraTreinta[] = [
                    "asesor"    => "vacio",
                    "cantidad"  => 0 
                ];
            }
            $ventasCraTreinta = json_encode($ventasCraTreinta);

			$this->view->ventasCraTreinta = json_decode($ventasCraTreinta);

            //trae la cantidad de tipificaciones

            $tipificacionesSql = new GopassGestion();
            $tipificacionesHoySql =  $tipificacionesSql->getCantidadTipificacionesHoy($fechaInicial, $fechaFinal);

            foreach($tipificacionesHoySql as $tipificacionHoy){
                // if($tipificacionesHoy['cantidadHoy'] > 0){
                    $tipificacionesHoy[] = [
                        "tipificacionHoy"      => $tipificacionHoy['snombreTipificacion'],
                        "cantidadHoy"      => $tipificacionHoy['cantidadHoy']
                    ];
                // }
            }
            // print_r($tipificacionesHoy);die;
            if($tipificacionesHoy == null){
                $tipificacionesHoy[] = [
                    "tipificacionHoy"    => "Vacio",
                    "cantidadHoy"  => 0 
                ];
            }

            
            
            $this->view->ventas = json_decode($ventas);
            $this->view->reagendamientos=json_decode($reagendamientos);
         
            $this->view->reagendados = json_decode($reagendados);
            
            // $tipificacionesAyer = json_encode($tipificacionesAyer);
            $tipificacionesHoy = json_encode($tipificacionesHoy);
            // // $tipificacionesTipo = json_encode($tipificacionesTipo);
            // $this->view->tipificacionesAyer = json_decode($tipificacionesAyer);
            $this->view->tipificacionesHoy = json_decode($tipificacionesHoy);
            // // $this->view->tipificacionesTipo = json_decode($tipificacionesTipo);
            $this->view->ventasAsesor = json_decode($ventasAsesor);
            $this->view->ventasBarranquilla = json_decode($ventasBarranquilla);
            $this->view->ventasOperacion = json_decode($ventasOperacion);
            $this->view->cantidad = json_decode($cantidad);
            $this->view->cantidadRetracto = json_decode($cantidadRetracto);
			$this->view->cantidadRetractoGrafica = json_decode($cantidadRetractoGrafica);
            $this->view->fechaInicial = $fechaInicial;
            $this->view->fechaFinal = $fechaFinal;
            $this->view->fechaFinalAnterior = $fechaFinalAnterior;
            $this->view->fechaActual = $fechaActual;



        }else{
            return $this->dispatcher->forward(
                [       
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function convenioAction(){
        if ($this->session->get("role") == 3) {
            
            $post = $this->request->getPost();
            $dateHoy = $this->date->format("Y-m-d H:i:s");

            $convenios = Convenio::find([
                'order' => 'estado desc'
            ]);

            $convenios = json_encode($convenios);
            $this->view->convenios = json_decode($convenios);
        }
        else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function cargarBaseAction(){
        if ($this->session->get("role") == 3) {
            
            $post = $this->request->getPost();
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            $usuario = $this->session->get("iduser");
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $ip = get_client_ip();
            /* Traer convenios para las indicaciones */
            $convenios = Convenio::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);

            $convenios = json_encode($convenios);
            $this->view->convenios = json_decode($convenios);

            $tipoIdentificacion = Tipoidentificacion::find([
                'order' => 'tipoId'
            ]);

            $tipoIdentificacion = json_encode($tipoIdentificacion);
            $this->view->tipoIdentificacion = json_decode($tipoIdentificacion);

            $barrios = new Barrio();
            $barrios = $barrios ->getBarrios();
            $datoBarrios = array();
            foreach($barrios as $resultado){
                $datoBarrios[] = [
                    'barrioId'           => $resultado['barrioId'],
                    'nombreBarrio'       => $resultado['nombreBarrio'],
                    'localidadId'        => $resultado['localidadId'],
                    'nombreLocalidad'    => $resultado['nombreLocalidad'],
                    'ciudadId'           => $resultado['ciudadId'],
                    'nombreCiudad'       => $resultado['nombreCiudad'],
                    'departamentoId'     => $resultado['departamentoId'],
                    'nombreDepartamento' => $resultado['nombreDepartamento']
                ];
            }
            $datoBarrios = json_encode($datoBarrios);
            $this->view->datoBarrios = json_decode($datoBarrios);
            // print_r($this->view->datoBarrios);die;

            if (isset($_FILES['archivoExcel'])) {

                $Gopassgestion = $_FILES['archivoExcel'];
                
            
                ini_set('max_execution_time', 3600); //aumentar el tiempo de ejecucion en las inserciones
            
                //obtenemos el archivo .csv
                $PROMEDIO_CONSUMO = $_FILES['archivoExcel']['type'];
            
                $tamanio = $_FILES['archivoExcel']['size'];

                $archivotmp = $_FILES['archivoExcel']['tmp_name'];
                $date = $this->date->format("YmdHis");
                $dest_path = "/GestionNovusProd/upload/Tarjetas" + $date;

                move_uploaded_file($Gopassgestion, $dest_path);
                //cargamos el archivo
                $lineas1 = file($archivotmp);                
                

                //inicializamos variable a 0, esto nos ayudar� a indicarle que no lea la primera l�nea
                $i = 0;
                $in = 0;
                $actualizados = 0;
                $errores = 0;
                $existe = 0;
                $errorLinea= 0;
                $contador = 0;
                
                //Recorremos el bucle para leer l�nea por l�nea
                foreach($lineas1 as $linea_num => $linea1) {
                    // echo "linea ".$linea_num."<br>";
                    // echo "linea1 ".$linea1."<br>";
                    // echo "Valor de i: ".$i."<br>";
                    //echo "valor de i: ".$i."<br>";
                    
                    
                    //abrimos bucle
                    /*si es diferente a 0 significa que no se encuentra en la primera l�nea
                    (con los t�tulos de las columnas) y por lo tanto puede leerla*/
                    // echo $i."<br>";
                    if ($i != 0 && $i <= count($lineas1)) {
                        //abrimos condici�n, solo entrar� en la condici�n a partir de la segunda pasada del bucle.
                        /* La funcion explode nos ayuda a delimitar los campos, por lo tanto ir�
                        leyendo hasta que encuentre un ; */
                        $linea1 = (trim($linea1,'"'));
                        $datos = explode(";", $linea1);
                        //$datos = explode(",", $linea1);
                        // echo "<pre>";
                        // //echo ($datos[0]);
                        // var_dump($datos);die;
                        
                        // 
                        //Almacenamos los datos que vamos leyendo en una variable

                        $tipoIdentificacion = trim(utf8_encode($datos[0]));
                        $documentoCliente = trim(utf8_encode($datos[1]));
                        $nombreCliente = trim(utf8_encode($datos[2]));
                        $apellidoCliente = trim(utf8_encode($datos[3]));
                        $telefonoCliente = trim(utf8_encode($datos[4]));
                        $celularCliente = trim(utf8_encode($datos[5]));
                        $ciudadResidencia = trim(utf8_encode($datos[6]));
                        $convenio = trim(utf8_encode($datos[7]));
                        $placa = trim(utf8_encode($datos[8]));
                        $numeroTags = 1;
                        $campana =1;
                        $puntoActivacion = 10;
                        $tipoBono = 1;
                        $tipoMembresia = 1;
                        $tagAsociado = 0;                        
                        
                        // $fechaEntrega = trim(utf8_encode($datos[8]));
                        echo "<br> valida $i vez <br>";
                        if(!preg_match_all('/^[a-zA-Z]{3}[0-9]{3}/', $placa,$m)){
                            $validacion=0;
                            $errores++;
                            echo "<br>Error: $errores <br>"; 
                            echo "<br>Contador: $contador <br> valor i: $i <br>";
                            $contador = $i+1;
                            //echo "Entro placa $placa";die;
                            if($errorLinea == 0){
                                //echo $i.".Entro linea = 0: ".$errorLinea . "<br>";
                                $errorLinea = $contador;
                                echo "entro if1 error $errorLinea   placa $placa<br>";                               
                                
                                // echo $i.".Incrementa linea = 0: ".$errorLinea . "<br>";
                            }else{
                                //echo $i.".Entro linea != 0: ".$errorLinea . "<br>";
                                $errorLinea = $errorLinea . ",".$contador;
                                echo "entro else1 error $errorLinea   placa $placa<br>";                                
                                // echo $i.".Incrementa linea != 0: ".$errorLinea . "<br>";
                            }
                            
                        }else {
                            $validacion=1;
                            // echo "Entro <br>";
                            // echo $placa."<br>";
                        }
                        // echo "validacion: ".$validacion."<br>";
                        if($validacion == 1){
                            if (is_numeric($documentoCliente) && is_numeric($telefonoCliente) && is_numeric($celularCliente) && ($ciudadResidencia == 1 || $ciudadResidencia == 2 || $ciudadResidencia == 3 || $ciudadResidencia == 4 || $ciudadResidencia == 9 || $ciudadResidencia == 19 || $ciudadResidencia == 22 || $ciudadResidencia == 23 || $ciudadResidencia == 30 || $ciudadResidencia == 49) && is_numeric($convenio)) {
                            // if(is_numeric($ciudadResidencia) && is_numeric($convenio) && is_numeric($numeroTags)){
                                echo "Entro <br>";
                                echo $placa."<br>";
                                echo "validacion: ".$validacion."<br>";
    
                                //Valida si existe el tipo de indentifiacion
                                $validaTipoIdentificacion = Tipoidentificacion::findFirst([
                                    'conditions' => 'tipoId = :tipoIdentificacion:',
                                    'bind'       => ['tipoIdentificacion' => $tipoIdentificacion]
                                ]);
                                
                                //Sino existe la deja como CC por defecto
                                if(empty($validaTipoIdentificacion)){
                                    $tipoIdentificacion = 1;
                                }
                                
                                //Valida si la persona existe o no
                                $validaCedulaPersona = Persona::findFirst([
                                    'conditions' => 'cedulaPersona = :cedulaPersona:',
                                    'bind'       => ['cedulaPersona' => $documentoCliente]
                                ]);
                                
                                //Sino existe la persona la crea
                                if(empty($validaCedulaPersona)){
                                    $crearPersona = new Persona();
                                    $crearPersona->cedulaPersona = $documentoCliente;
                                    $crearPersona->nombre = $nombreCliente;
                                    $crearPersona->apellido = $apellidoCliente;
                                    $crearPersona->telefono = $telefonoCliente;
                                    $crearPersona->celularLlamadas = $celularCliente;
                                    $crearPersona->tipoId = $tipoIdentificacion;
                                    $crearPersona->celularWhatsapp = $celularCliente;
                                    $crearPersona->usuarioId = $usuario;
                                    $crearPersona->ip = $ip;
                                    if($crearPersona->save() == false){
                                        $errores++;
                                        echo "Entro error al crear persona $errores<br>";
                                    }                                
                                }                            
                                $validaConvenio = Convenio::findFirst([
                                    'conditions' => 'convenioId = :convenio:',
                                    'bind'      => ['convenio' => $convenio]
                                ]);
                                
                                if (!empty($validaConvenio)) {
                                    $gopassGestion = Gestiongopass::findFirst([
                                        'conditions' =>"placa = :placa: ",
                                        'bind' => ['placa' => $placa]
                                    ]);             
                                    
                                    
    
                                    if(!empty($gopassGestion)){
                                        $existe++;
                                    }else{
                                            
                                        $gopassInsert = new Gestiongopass();
                                        $gopassInsert->cedulaPersona = $documentoCliente;
                                        $gopassInsert->placa = $placa;
                                        $gopassInsert->campanaId = $campana;
                                        $gopassInsert->puntoActivacion = $puntoActivacion;
                                        $gopassInsert->tipoBonoId = $tipoBono;
                                        $gopassInsert->tipoMembresiaId = $tipoMembresia;
                                        $gopassInsert->convenioId = $convenio;
                                        $gopassInsert->tagAsociado = $tagAsociado;
                                        $gopassInsert->ip = $ip;
                                        $gopassInsert->usuarioId = $usuario;
                                        $gopassInsert->tipificacionId = 218; //Preguntar que tipificacion debe ir
                                        $gopassInsert->barrioId = 1; //Preguntar que barrio poner                                    
                                        $gopassInsert->fechaGestion = $dateHoy;
                                        $gopassInsert->numTags = 1;
                                        $in++;
                                        // try{
                                        //     if($gopassInsert->save()==false){
                                        //         echo "No Guardo " . $placa;
                                        //         $messages = $gopassInsert->getMessages();
                                        //         foreach ($messages as $message) {
                                        //             echo $message . PHP_EOL;
                                        //         }
                                        //     }
                                        // }catch(Exception $e){
                                        //     echo $e;
                                        // }
                                        // die;
    
                                        if($gopassInsert->save()==false){
                                            $errores++;
                                            echo "Entro error al insertar en gestion gopass $errores<br>";
                                        }
                                    }
    
                                }else {
                                    $errores++;
                                    echo "Entro error al validar convenio $errores<br>";
                                    $contador = $i+1;
                                    if($errorLinea == 0){
                                        //echo $i.".Entro linea = 0: ".$errorLinea . "<br>";
                                        $errorLinea = $contador;
                                        echo "entro if2 error $errorLinea   placa $placa<br>";
                                        
                                        // echo $i.".Incrementa linea = 0: ".$errorLinea . "<br>";
                                    }else {
                                        //echo $i.".Entro linea != 0: ".$errorLinea . "<br>";
                                        $errorLinea = $errorLinea . ",".$contador;
                                        echo "entro else2 error $errorLinea   placa $placa<br>";
                                        
                                        // echo $i.".Incrementa linea != 0: ".$errorLinea . "<br>";
                                    }
                                    //;
                                }
                                
                            }else {
                                $errores++;
                                echo "Entro error al validar si cedula es numerico $errores placa $placa<br> ";
                                $contador = $i +1;
                                if($errorLinea == 0){
                                    //echo $i.".Entro linea = 0: ".$errorLinea . "<br>";
                                    $errorLinea = $contador;
                                    echo "entro if3 error $errorLinea   placa $placa<br>";
                                    
                                    // echo $i.".Incrementa linea = 0: ".$errorLinea . "<br>";
                                }else {
                                    //echo $i.".Entro lina != 0: ".$errorLinea . "<br>";
                                    $errorLinea = $errorLinea . ",".$contador;
                                    echo "entro else3 error $errorLinea   placa $placa<br>";
                                    
                                    // echo $i.".Incrementa linea != 0: ".$errorLinea . "<br>";
                                }
                                //;
                                //;
                            }
                        }
                }
                    $i++;
                    
                }
                
            }
                //echo $errorLinea;die;
                $data = [
                    "total"         => $i -1,
                    "insertados"    => $in,                    
                    "errores"       => $errores,
                    "actualizados"    => $actualizados,                    
                    "existen"       => $existe,
                    "errorLinea"         => $errorLinea
                ];
                // print_r($data);die;

                $data = json_encode($data);

                $this->view->data = json_decode($data);
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function guardarConvenioAction(){
        if ($this->session->get("role") == 3) {
            
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $post = $this->request->getPost();
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            $ip = get_client_ip();
            $usuario = $this->session->get("iduser");            

            if(isset($post['btnNuevoConv'])){
                
                $convenios = new Convenio();

                $convenios->nombre = $post['nombreConvenio'];
                $convenios->ip = $ip;
                $convenios->usuarioId = $usuario;
                $convenios->estado = 1;
                $convenios->fechaCreacion =  $this->date->format("Y-m-d H:i:s");
                // try{
                //     $convenios->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ' . $e;
                //     $messages = $convenios->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                
                if($convenios->save()){
                    $nuevo = "ok";
                    $nuevo = $this->view->nuevo = $nuevo;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$nuevo],
                        "action"     => "convenio",
                    ]); 
                 }else{
                    $error = "error";
                    $error = $this->view->error = $error;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$error],
                        "action"     => "convenio",
                    ]); 
                }
            }else{
                $error = "error";
                $error = $this->view->error = $error;
                return $this->dispatcher->forward(
                [
                    "params"    => [$error],
                    "action"     => "convenio",
                ]); 
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function actualizarConvenioAction(){
        if ($this->session->get("role") == 3) {
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $post = $this->request->getPost();
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            $ip = get_client_ip();
            $usuario = $this->session->get("iduser");

            if(isset($post['actualizar'])){
                $convenioId = $post['actualizar'];
                $convenios = Convenio::findFirst([
                    'conditions'  => 'convenioId = :id:',
                    'bind'        => [
                        'id'      => $convenioId,
                    ]
                ]);

                $convenios->nombre = $post['nombreConvenioA'];
                $convenios->ip = $ip;
                $convenios->usuarioId = $usuario;
                $convenios->estado = 1;
                // try{
                //     $convenios->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ' . $e;
                //     $messages = $convenios->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                
                if($convenios->save()){
                    $actualizado = "ok";
                    $actualizar = $this->view->actualizar = $actualizado;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$actualizar],
                        "action"     => "convenio",
                    ]); 
                 }else{
                    $error = "error";
                    $error = $this->view->error = $error;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$error],
                        "action"     => "convenio",
                    ]); 
                }
            }else{
                $error = "error";
                $error = $this->view->error = $error;
                return $this->dispatcher->forward(
                [
                    "params"    => [$error],
                    "action"     => "convenio",
                ]); 
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function eliminarConvenioAction(){
        if ($this->session->get("role") == 3) {
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $post = $this->request->getPost();
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            $ip = get_client_ip();
            $usuario = $this->session->get("iduser");

            if(isset($post['eliminar'])){
                $convenioId = $post['eliminar'];
                $convenios = Convenio::findFirst([
                    'conditions'  => 'convenioId = :id:',
                    'bind'        => [
                        'id'      => $convenioId,
                    ]
                ]);

                $convenios->ip = $ip;
                $convenios->usuarioId = $usuario;
                $convenios->estado = 0;
                // try{
                //     $convenios->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ' . $e;
                //     $messages = $convenios->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                
                if($convenios->save()){
                    $desactivo = "ok";
                    $desactivo = $this->view->desactivo = $desactivo;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$desactivo],
                        "action"     => "convenio",
                    ]); 
                 }else{
                    $error = "error";
                    $error = $this->view->error = $error;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$error],
                        "action"     => "convenio",
                    ]); 
                }
            }else{
                $error = "error";
                $error = $this->view->error = $error;
                return $this->dispatcher->forward(
                [
                    "params"    => [$error],
                    "action"     => "convenio",
                ]); 
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }
    
    /**
     * Acccion para traer todos los usuarios
     */

    public function usuariosAction(){   

        if ($this->session->get("role") == 3) {

            $post = $this->request->getPost();
            $usuarioRol = new Usuario();
            if(isset($post['btnBuscar'])){
                $usuarioBuscar = $post['buscarUsuario'];                
            }else{
                $usuarioBuscar = null;
            }
            $getUsuarioRol = $usuarioRol->getUsuarioRol($usuarioBuscar);
            $datoUsuarioRol = array();
            foreach($getUsuarioRol as $resultado){
                $datoUsuarioRol[] =[
                    'usuarioId'     => $resultado['usuarioId'], 
                    'cedula'        => $resultado['cedula'], 
                    'nombreAsesor'  => $resultado['nombreAsesor'],
                    'apellidoAsesor'=> $resultado['apellidoAsesor'],
                    'login'         => $resultado['login'], 
                    'estado'        => $resultado['estado'], 
                    'rolId'         => $resultado['rolId'], 
                    'nombreRol'     => $resultado['nombreRol'],
                ];
            }

            $datoUsuarioRol = json_encode($datoUsuarioRol);
            $this->view->usuarios = json_decode($datoUsuarioRol);
            $roles = Rol::find([
                'conditions'  => 'estado = :estado:',
                'bind'        => [
                    'estado'      => 1,
                ]
            ]);
            $roles = json_encode($roles);
            $this->view->roles = json_decode($roles);
            
            if(isset($post['edit'])){
                $this->view->dato = $post;                
            }

            
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    // Nuevo usuario
    public function nuevoUsuarioAction(){   

        if ($this->session->get("role") == 3) {

            $post = $this->request->getPost();
            $usuarioModifica = $this->session->get("iduser");
            $id = $post['id'];
            $nombres = $post['nombres'];
            $apellidos = $post['apellidos'];
            $nameusuario = $post['usuario'];
            $rol = $post['rol'];
            $estado = $post['estado'];
            $contrasena = $post['password'];
            $cedula = $post['cedula'];
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $ip = get_client_ip();

            $usuario = Usuario::findFirst([
                'conditions' =>"cedula = :cedula:",
                'bind'       => ['cedula' => $cedula]
            ]);
            
            if(empty($usuario)){
                $usuario = new Usuario();
                $usuario->nombre = $nombres;
                $usuario->apellido = $apellidos;
                $usuario->login = $nameusuario;
                $usuario->password = password_hash($contrasena, PASSWORD_DEFAULT);
                $usuario->rolId = $rol;
                $usuario->estado = $estado;
                $usuario->cedula = $cedula;
                $usuario->ip = $ip;
                $usuario->usuarioModifica = $usuarioModifica;
                
                
                if($usuario->save()==false){
                    $error = $this->view->error = "Erro al actualizar";
                    return $this->dispatcher->forward([
                            "action"     => "usuarios",
                            "params"     => [$error]
                    ]);
                }else{    
                    $usuario = Usuario::findFirst([
                        'conditions' =>"cedula = :cedula:",
                        'bind'       => ['cedula' => $cedula]
                    ]);
                                       
                    $insertHistoricoUsuario = new Historico_usuario();
                    $insertHistoricoUsuario->cedula = $cedula;
                    $insertHistoricoUsuario->nombre = $nombres;
                    $insertHistoricoUsuario->apellido = $apellidos;
                    $insertHistoricoUsuario->login = $nameusuario;
                    $insertHistoricoUsuario->cambioPassword =1;
                    $insertHistoricoUsuario->estado = $estado;
                    $insertHistoricoUsuario->usuarioId = $usuario->usuarioId;
                    $insertHistoricoUsuario->fechaUpdate = $dateHoy;
                    $insertHistoricoUsuario->ip = $ip;
                    $insertHistoricoUsuario->usuarioModifico = $usuarioModifica;
                    $insertHistoricoUsuario->rolId = $rol;
                    // try{
                    //     if($insertHistoricoUsuario->save()==false){
                    //         $messages = $insertHistoricoUsuario->getMessages();
                    //         foreach ($messages as $message) {
                    //             echo $message . PHP_EOL;
                    //         }
                    //     } 
                    // }catch(Exception $e){
                    //     echo $e;
                    // }die;
                    if($insertHistoricoUsuario->save()){
                        
                        $ok = $this->view->ok = "Nuevo usuario insertado";
                        return $this->dispatcher->forward([
                            "action"     => "usuarios",
                            "params"     => [$ok]
                        ]);
                    }else{
                        
                        $error = $this->view->error = "Error al insertar el historico";
                        return $this->dispatcher->forward([
                                "action"     => "usuarios",
                                "params"     => [$error]
                        ]);
                    }                
                }
            }else{
                $error = $this->view->error = "Ya existe un usuario con este número de cedula $cedula";
                return $this->dispatcher->forward([
                        "action"     => "usuarios",
                        "params"     => [$error]
                ]);
            }
                        
            
        }else{
            return $this->dispatcher->forward([
                    "controller" => "erros",
                    "action"     => "show401",
            ]);
        }    
               
        
    }

    //Actualiza el usuario
    public function editUsuarioAction(){   

        if ($this->session->get("role") == 3) {

            $post = $this->request->getPost();
            $usuarioModifica = $this->session->get("iduser");
            $id = $post['id'];
            $nombres = $post['nombres'];
            $apellidos = $post['apellidos'];
            $nameusuario = $post['usuario'];
            $rol = $post['rol'];
            $estado = $post['estado'];
            $contrasena = $post['password'];
            $cedula = $post['cedula'];
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $ip = get_client_ip();

            $usuario = Usuario::findFirst([
                'conditions' =>"usuarioId = :id:",
                'bind'       => ['id' => $id]
            ]);            
            // echo password_hash($contrasena, PASSWORD_DEFAULT)."\n";
            // $hash = '$2y$10$CuoInYbJ8xpEY426NezzzueYZvI1PSbQPQ1IrJogFQdTfEZ5rLM66';
            // if (password_verify($contrasena, $hash)) {
            //     echo '¡La contraseña es válida!';
            // } else {
            //     echo 'La contraseña no es válida.';
            // }die;
            $usuario->nombre = $nombres;
            $usuario->apellido = $apellidos;
            $usuario->login = $nameusuario;
            $usuario->password = password_hash($contrasena, PASSWORD_DEFAULT);
            $usuario->rolId = $rol;
            $usuario->estado = $estado;
            $usuario->cedula = $cedula;
            $usuario->ip = $ip;
            $usuario->usuarioModifica = $usuarioModifica;
            
            if($usuario->save()==false){
                $error = $this->view->error = "Erro al actualizar";
                return $this->dispatcher->forward([
                        "action"     => "usuarios",
                        "params"     => [$error]
                ]);
            }else{                
                $insertHistoricoUsuario = new Historico_usuario();
                $insertHistoricoUsuario->cedula = $cedula;
                $insertHistoricoUsuario->nombre = $nombres;
                $insertHistoricoUsuario->apellido = $apellidos;
                $insertHistoricoUsuario->login = $nameusuario;
                $insertHistoricoUsuario->cambioPassword =1;
                $insertHistoricoUsuario->estado = $estado;
                $insertHistoricoUsuario->usuarioId = $id;
                $insertHistoricoUsuario->fechaUpdate = $dateHoy;
                $insertHistoricoUsuario->ip = $ip;
                $insertHistoricoUsuario->usuarioModifico = $usuarioModifica;
                $insertHistoricoUsuario->rolId = $rol;
                // try{
                //     if($insertHistoricoUsuario->save()==false){
                //         $messages = $insertHistoricoUsuario->getMessages();
                //         foreach ($messages as $message) {
                //             echo $message . PHP_EOL;
                //         }
                //     } 
                // }catch(Exception $e){
                //     echo $e;
                // }die;
                if($insertHistoricoUsuario->save()){
                    
                    $ok = $this->view->ok = "Registro actualizado";
                    return $this->dispatcher->forward([
                        "action"     => "usuarios",
                        "params"     => [$ok]
                    ]);
                }else{
                    
                    $error = $this->view->error = "Erro al insertar el historico";
                    return $this->dispatcher->forward([
                            "action"     => "usuarios",
                            "params"     => [$error]
                    ]);
                }                
            }
        }else{
            return $this->dispatcher->forward([
                    "controller" => "erros",
                    "action"     => "show401",
            ]);
        }        
    }

      /**
     * Acccion para generar reporte de  las tipificaciones
     */

    public function reporteContactadosAction(){
        $post = $this->request->getPost();
        if ($this->session->get("role") == 3) {

            $this->view->setTemplateAfter('reportelayouts');
            $fechaInicial = $post['fechaInicio'];
            $fechaFinal = $post['fechaFinal'];  

            if($post['filtroConvenio']){
                $filtroConvenio = $post['filtroConvenio'];
            }

            $gestionGopass = new Gestiongopass();
            $contactadoCampana = $gestionGopass->reporteContactosCamapana($fechaInicial, $fechaFinal);
            $datoContactadoCampana = array();
            $num = 1;
            foreach($contactadoCampana as $resultado){
                $datoContactadoCampana[] = [
                    'placa'             => $resultado['placa'] ,
                    'fechaGestion'      => $resultado['fechaGestion'] ,
                    'nombreAsesor'      => $resultado['nombreAsesor'] ,
                    'cedulaPersona'     => $resultado['cedulaPersona'] ,
                    'nombrePersona'     => $resultado['nombrePersona'] ,
                    'campanaNombre'     => $resultado['campanaNombre'] ,
                    'nombreTpificacion' => $resultado['nombreTpificacion'] ,
                    'existeContacto'    => $resultado['existeContacto'] ,
                ];
                $num++;
            }
            $datoContactadoCampana = json_encode($datoContactadoCampana);
			$this->view->data = json_decode($datoContactadoCampana);            
            $this->view->fechaInicial = date( 'd-m-Y', strtotime($fechaInicial));
            $this->view->fechaFinal = date( 'd-m-Y', strtotime($fechaFinal));


        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    
    public function reportePresentacionPersonalAction(){
        $post = $this->request->getPost();
        if ($this->session->get("role") == 3) {

            $this->view->setTemplateAfter('reportelayouts');
            $fechaInicial = $post['fechaInicio'];
            $fechaFinal = $post['fechaFinal'];  

            if($post['filtroConvenio']){
                $filtroConvenio = $post['filtroConvenio'];
            }

            $gestionGopass = new Gestiongopass();
            $presentacionPersonal = $gestionGopass->reporteEncuenta($fechaInicial, $fechaFinal);
            $datoPresentacionPersonal = array();
            foreach($presentacionPersonal as $resultado){
                $datoPresentacionPersonal[] = [
                    'placa'                             => $resultado['placa'] ,
                    'fechaGestion'                      => $resultado['fechaGestion'] ,
                    'nombreAsesor'                      => $resultado['nombreAsesor'] ,
                    'cedulaPersona'                     => $resultado['cedulaPersona'] ,
                    'nombrePersona'                     => $resultado['nombrePersona'] ,
                    'campanaNombre'                     => $resultado['campanaNombre'] ,
                    'nombreTpificacion'                 => $resultado['nombreTpificacion'] ,
                    'calificacionPresentacionPersonal'  => $resultado['calificacionPresentacionPersonal'] ,
                    'calificacionInfoClara'             => $resultado['calificacionInfoClara'] ,
                    'calificacionAcompanamiento'        => $resultado['calificacionAcompanamiento'] ,
                    'calificacionTiempoEspera'          => $resultado['calificacionTiempoEspera'] ,
                    'calificacionComportamiento'        => $resultado['calificacionComportamiento'] ,
                    'calificacionAmabilidad'            => $resultado['calificacionAmabilidad'] ,
                ];
            }
            $datoPresentacionPersonal = json_encode($datoPresentacionPersonal);
            $this->view->data = json_decode($datoPresentacionPersonal);
            $this->view->fechaInicial = date( 'd-m-Y', strtotime($fechaInicial));
            $this->view->fechaFinal = date( 'd-m-Y', strtotime($fechaFinal));


        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function reporteConoceMembresiasAction(){
        $post = $this->request->getPost();
        if ($this->session->get("role") == 3) {

            $this->view->setTemplateAfter('reportelayouts');
            $fechaInicial = $post['fechaInicio'];
            $fechaFinal = $post['fechaFinal'];  

            if($post['filtroConvenio']){
                $filtroConvenio = $post['filtroConvenio'];
            }

            $gestionGopass = new Gestiongopass();
            $conoceMembresias = $gestionGopass->reporteConoceMembresias($fechaInicial, $fechaFinal);
            $datoConoceMembresias = array();
            foreach($conoceMembresias as $resultado){
                $datoConoceMembresias[] = [
                    'placa'             => $resultado['placa'] ,
                    'fechaGestion'      => $resultado['fechaGestion'] ,
                    'nombreAsesor'      => $resultado['nombreAsesor'] ,
                    'cedulaPersona'     => $resultado['cedulaPersona'] ,
                    'nombrePersona'     => $resultado['nombrePersona'] ,
                    'campanaNombre'     => $resultado['campanaNombre'] ,
                    'nombreTpificacion' => $resultado['nombreTpificacion'] ,
                    'conoceMembresias'  => $resultado['conoceMembresias'] ,
                ];
            }
            $datoConoceMembresias = json_encode($datoConoceMembresias);
            $this->view->data = json_decode($datoConoceMembresias);
            $this->view->fechaInicial = date( 'd-m-Y', strtotime($fechaInicial));
            $this->view->fechaFinal = date( 'd-m-Y', strtotime($fechaFinal));


        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function reporteAdquiereMembresiaAction(){
        $post = $this->request->getPost();
        if ($this->session->get("role") == 3) {

            $this->view->setTemplateAfter('reportelayouts');
            $fechaInicial = $post['fechaInicio'];
            $fechaFinal = $post['fechaFinal'];  

            if($post['filtroConvenio']){
                $filtroConvenio = $post['filtroConvenio'];
            }

            $gestionGopass = new Gestiongopass();
            $adquiereMembresia = $gestionGopass->reporteAdquiereMembresia($fechaInicial, $fechaFinal);
            $datoAdquiereMembresia = array();
            foreach($adquiereMembresia as $resultado){
                $datoAdquiereMembresia[] = [
                    'placa'             => $resultado['placa'] ,
                    'fechaGestion'      => $resultado['fechaGestion'] ,
                    'nombreAsesor'      => $resultado['nombreAsesor'] ,
                    'cedulaPersona'     => $resultado['cedulaPersona'] ,
                    'nombrePersona'     => $resultado['nombrePersona'] ,
                    'campanaNombre'     => $resultado['campanaNombre'] ,
                    'nombreTpificacion' => $resultado['nombreTpificacion'] ,
                    'adquiereMembresia' => $resultado['adquiereMembresia'] ,
                ];
            }
            $datoAdquiereMembresia = json_encode($datoAdquiereMembresia);
            $this->view->data = json_decode($datoAdquiereMembresia);
            $this->view->fechaInicial = date( 'd-m-Y', strtotime($fechaInicial));
            $this->view->fechaFinal = date( 'd-m-Y', strtotime($fechaFinal));


        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

      /**
     * Acccion para generar reporte de las ventas efectivas por asesor
     */

    public function reporteVentasAsesorAction(){

        if ($this->session->get("role") == 3) {

            $this->view->setTemplateAfter('reportelayouts');

            $post = $this->request->getPost();

                $fechaInicial = $post['fechaInicio'];
                $fechaFinal = $post['fechaFinal'];  

                if($post['filtroConvenio']){
                    $filtroConvenio = $post['filtroConvenio'];
                }

                $reporteVentas = new GopassGestion();

                $reporteVentasSQL = $reporteVentas->getReporteVentasAsesor($fechaInicial,$fechaFinal, $filtroConvenio);

                $data = array();

                $num = 1;
                foreach ($reporteVentasSQL as $reporteVentas) {
                    $data[] = [
                        "num"                   => $num,
                        "id"                    => $reporteVentas['id'],
                        "nombreCliente"           => $reporteVentas['nombreCliente'],
                        "documentoCliente"        => $reporteVentas['documentoCliente'],
                        "telefonoCliente"         => $reporteVentas['telefonoCliente'],
                        "celularCliente"          => $reporteVentas['celularCliente'],
                        "ciudadResidencia"           => $reporteVentas['snombreCiudad'],
                        "localidadResidencia"           => $reporteVentas['snombreLocalidad'],
                        "barrioResidencia"           => $reporteVentas['snombreBarrio'],
                        "tipificacion"                 => $reporteVentas['snombreTipificacion'],
                        "placa"                 => $reporteVentas['placa'],
                        "numeroTags"                   => $reporteVentas['numeroTags'],
                        "direccionEntrega"      => $reporteVentas['direccionEntrega'],
                        "fechaEntrega"          => $reporteVentas['fechaEntrega'],
                        "fechaGestion"         => $reporteVentas['fechaGestion'],
                        "indicacionesEntrega"   => $reporteVentas['indicacionesEntrega'],
                        "asesor"                => $reporteVentas['snombresUser'].' '.$reporteVentas['sapellidosUser']
                    ];
                    $num++;
                }
                $data = json_encode($data);
                //print_r($data);die;

                $this->view->data = json_decode($data);
                $this->view->fechaInicial = date( 'd-m-Y', strtotime($fechaInicial));
                $this->view->fechaFinal = date( 'd-m-Y', strtotime($fechaFinal));

        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function reporteReagendamientoVentasAsesorAction(){

        if ($this->session->get("role") == 3) {

                $this->view->setTemplateAfter('reportelayouts');

                $post = $this->request->getPost();

                $fechaInicial = $post['fechaInicio'];
                $fechaFinal = $post['fechaFinal'];  

                $reporteReagendamiento = new GopassGestion();

                $reporteReagendamientosSQL = $reporteReagendamiento->reporteReagendamientoVentas($fechaInicial,$fechaFinal);

                $data = array();

                $num = 1;
                foreach ($reporteReagendamientosSQL as $reagendamientos) {
                    $data[] = [
                        "num"                   => $num,
                        "id"                    => $reagendamientos['idMasterHist'],
                        "fechaReagendamiento"   => $reagendamientos['fechaReagendamientoHist'],
                        "tipificacion"          => $reagendamientos['tipificacionHist'],
                        "usuarioReagendamiento" => $reagendamientos['snombresUser'].' '.$reagendamientos['sapellidosUser'],
                        "nombreCliente"         => $reagendamientos['nombreClienteHist'],
                        "documentoCliente"      => $reagendamientos['documentoClienteHist'],
                        "direccionCliente"      => $reagendamientos['direccionClienteHist'],
                        "celularCliente"        => $reagendamientos['celularClienteHist'],
                        "telefonoCliente"       => $reagendamientos['telefonoClienteHist'],
                        "placa"                 => $reagendamientos['placaHist'],
                        "numeroTags"            => $reagendamientos['numeroTagsHist'],
                        "franja"                => $reagendamientos['franjaEntregaHist'],
                        "indicacionesEntrega"   => $reagendamientos['indicacionesEntregaHist'],
                        "observaciones"         => $reagendamientos['observacionesHist'],
                        "localidad"             => $reagendamientos['localidadResidenciaHist'],
                        "barrio"                => $reagendamientos['barrioResidenciaHist']
                    ];
                    $num++;
                }
                $data = json_encode($data);
                //print_r($data);die;

                $this->view->data = json_decode($data);
                $this->view->fechaInicial = $fechaInicial;
                $this->view->fechaFinal = $fechaFinal;

        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }
    
    public function contactosAction(){

        if ($this->session->get("role") == 3) {

            $consulta = new Gestiongopass();
            $consulta = $consulta->getContactosCoordinador();
            $consultaSql = array();
            foreach($consulta as $resultado){
                $consultaSql[] = [
                    'gestionId'         => $resultado['gestionId'], 
                    'nombrePersona'     => $resultado['nombrePersona'], 
                    'cedulaPersona'     => $resultado['cedulaPersona'], 
                    'placa'             => $resultado['placa'], 
                    'telefono'          => $resultado['telefono'],
                    'celularLlamadas'   => $resultado['celularLlamadas'], 
                    'celularWhatsapp'   => $resultado['celularWhatsapp'], 
                    'convenioId'        => $resultado['convenioId'], 
                    'nombreConvenio'    => $resultado['nombreConvenio'],
                    'fechaGestion'      => $resultado['fechaGestion'], 
                    'fechaVolverLlamar' => $resultado['fechaVolverLlamar'], 
                    'tipificacionId'    => $resultado['tipificacionId'], 
                    'nombreTipi'        => $resultado['nombreTipi'],
                    'usuarioId'         => $resultado['usuarioId'],
                    'nombreAsesor'      => $resultado['nombreAsesor'],
                    'numTags'           => $resultado['numTags'],
                ];
            }

            $consultaSql = json_encode($consultaSql);
            $this->view->contactos = json_decode($consultaSql);
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }
}