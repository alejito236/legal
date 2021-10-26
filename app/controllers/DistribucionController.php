<?php

use Phalcon\Flash;
use Phalcon\Session;

class DistribucionController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('SAC');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");        
        $this->view->iduser = $this->session->get("iduser");
        $this->view->role = $this->session->get("role");
        $this->view->campana = $this->session->get("campana");
        $this->view->setTemplateAfter('LEGALlayout');
        $this->date = new \DateTime('America/Bogota');

       
    }

    /**
     * Acccion para iniciar gestios de asesor SOAT
     */

    public function indexAction()
    {   
       
    }

    /**
     * Accion para guardar el historico del SAC
     */

    public function historicoAction()
    {   
        if ($this->session->get("role") == 4) {

            $id = $this->session->get('iduser');

            // consulta para traer la cantidad gestionada del asesor
            $soatAsesor = new Soatgestion();
            $soatSqlAsesor = $soatAsesor->getCantidadSAC($id);
            $total = 0;
            $ventas= 0;
            $renovaciones= 0;
            foreach ($soatSqlAsesor as $cantidad) {

                if($cantidad['tipificacionHS'] == 78){
                    $ventas++;
                }
                else if($cantidad['tipificacionHS'] == 50){
                    $renovaciones++;
                }
            }
            
            $cantidad1 = [
                "ventas"        => $ventas,
                "renovaciones"  => $renovaciones,
                "total"         => $ventas+$renovaciones
            ];

            $cantidad1 = json_encode($cantidad1);
            // print_r($cantidad);die;
            $this->view->cantidad = json_decode($cantidad1);

            $ciudad = new Masterciudad();
            $ciudadSql = $ciudad->getCiudadEspecificasSoat();

            foreach ($ciudadSql as $ciudad) {
                $ciudades[] = [
                    "id"          => $ciudad['iidciudad'],
                    "ciudad"      => $ciudad['snombreCiudad'],
                ];
            }

            $ciudades = json_encode($ciudades);
            $this->view->ciudades = json_decode($ciudades);

            $post = $this->request->getPost();

            if(isset($post['placa'])){

                $placa = $post['placa'];

                $soat = new Ventastag();

                $soat = $soat->getHistorico($placa);

                 print_r($soat->fetch());die;

                $num = 1;
                
                foreach($soat as $list){
                    $data[] = [
                        "num"                     => $num,
                        "id"                      => $list['id_venta'],
                        "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                        "nombre_clie"             => $list['nombre_clie'],
                        "apellido_clie"           => $list['apellido_clie'],
                        "documento_clie"          => $list['documento_clie'],
                        "celular_clie"            => $list['celular_clie'], 
                        "correo_clie"             => $list['correo_clie'],
                        "fecha_gestion"           => $list['fecha_gestion'],
                        "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                        "establecimiento"         => $list['nombre'],
                        "placa"                   => $list['placa'],
                        "tag"                     => $list['tag'],
                        "direccionEntrega"        => $list['direccionEntrega'],
                        "indicacionesEntrega"     => $list['indicacionesEntrega'],
                        "fechaEntrega"            => $list['fechaEntrega']
                    ];

                    $num++;
                    
                }
          
                
                if(isset($data)){
                    
                }
                else{

                    $soat2 = new Ventastag();

                    $soat2 = $soat2->getHistorico2($placa);

                    $num = 1;

                    foreach($soat2 as $list){
                        $data[] = [
                            "num"                     => $num,
                            "id"                      => $list['id_venta'],
                            "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                            "nombre_clie"             => $list['nombre_clie'],
                            "apellido_clie"           => $list['apellido_clie'],
                            "documento_clie"          => $list['documento_clie'],
                            "celular_clie"            => $list['celular_clie'], 
                            "correo_clie"             => $list['correo_clie'],
                            "fecha_gestion"           => $list['fecha_gestion'],
                            "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                            "establecimiento"         => $list['nombre'],
                            "placa"                   => $list['placa'],
                            "tag"                     => $list['tag'],
                            "direccionEntrega"        => $list['direccionEntrega'],
                            "indicacionesEntrega"     => $list['indicacionesEntrega'],
                            "fechaEntrega"            => $list['fechaEntrega']
        
                        ];

                        $num++;
                    }

                }

                
                if(isset($data)){
                    
                    $data = json_encode($data);
                    $this->view->data = json_decode($data);   
                    // print_r($data);die;
                }else{    
  
                    $this->view->notFoundDB = $placa;
                                 
                    return $this->dispatcher->forward(
                        [
                            "action"     => "index",
                        ]
                    );    
                }
            }else if(isset($post['id'])){

                $id = $post['id'];

                $soat = new Ventastag();

                $soat = $soat->getHistoricoID($id);

                $conSoat = $soat->fetch();

                if(isset($conSoat['id_venta'])){
                    foreach($soat as $list){
                        $data[] = [
                            "id"                      => $list['id_venta'],
                            "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                            "nombre_clie"             => $list['nombre_clie'],
                            "apellido_clie"           => $list['apellido_clie'],
                            "documento_clie"          => $list['documento_clie'],
                            "celular_clie"            => $list['celular_clie'], 
                            "correo_clie"             => $list['correo_clie'],
                            "fecha_gestion"           => $list['fecha_gestion'],
                            "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                            "establecimiento"         => $list['nombre'],
                            "placa"                   => $list['placa'],
                            "tag"                     => $list['tag'],
                            "direccionEntrega"        => $list['direccionEntrega'],
                            "indicacionesEntrega"     => $list['indicacionesEntrega'],
                            "fechaEntrega"            => $list['fechaEntrega']
        
                        ];
    
                    }
                }

                else{
                    $soat2 = new Ventastag();

                    $soat2 = $soat2->getHistoricoID2($id);

                    foreach($soat2 as $list){
                        $data[] = [
                        "id"                      => $list['id_venta'],
                        "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                        "nombre_clie"             => $list['nombre_clie'],
                        "apellido_clie"           => $list['apellido_clie'],
                        "documento_clie"          => $list['documento_clie'],
                        "celular_clie"            => $list['celular_clie'], 
                        "correo_clie"             => $list['correo_clie'],
                        "fecha_gestion"           => $list['fecha_gestion'],
                        "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                        "establecimiento"         => $list['nombre'],
                        "placa"                   => $list['placa'],
                        "tag"                     => $list['tag'],
                        "direccionEntrega"        => $list['direccionEntrega'],
                        "indicacionesEntrega"     => $list['indicacionesEntrega'],
                        "fechaEntrega"            => $list['fechaEntrega']
                        
                        ];
                    }
                }

                if(empty($data)){

                    $data = 0;
                    print_r($data);die;
                    
                    
                }else{
                    $data = json_encode($data);
                    print_r($data);die;
                }

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

    public function postventaAction(){        
        $post = $this->request->getPost();
        if ($this->session->get("role") == 4){
            if(isset($post['buscar'])){
                //
                //Funciones para SAC
                /*Recibe la placa y retorna los datos de la campaña postventa
                Obtiene las datos de la campaña de postventa con tipificacion 216(no contacto)
                *Pendiente confirmar tipificaciones
                */
                $gestionGopass = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);

                function buscarPostventa($placa){                    
                    $postVenta = new Gestiongopass();
                    $postVentaSql = $postVenta->getPostventa($placa);                    
                    $datos = array();
                    foreach($postVentaSql as $resultado){
                        $datos[] = [
                            'gestionId'             => $resultado['gestionId'],
                            'placa'	                => $resultado['placa'],
                            'tipificacionId'	    => $resultado['tipificacionId'],
                            'tipoBonoId'	        => $resultado['tipoBonoId'],
                            'campanaId'	            => $resultado['campanaId'],
                            'tagAsociado'	        => $resultado['tagAsociado'],
                            'fechaActivacion'	    => $resultado['fechaActivacion'],
                            'redimeBono'	        => $resultado['redimeBono'],
                            'fechaRedimeBono'	    => $resultado['fechaRedimeBono'],
                            'usuarioId'	            => $resultado['usuarioId'],
                            'nombreUser'	        => $resultado['nombreUser'],
                            'apellidoUser'	        => $resultado['apellidoUser'],
                            'cedulaPersona'	        => $resultado['cedulaPersona'],
                            'nombrePersona'	        => $resultado['nombrePersona'],
                            'apellidoPersona'	    => $resultado['apellidoPersona'],
                            'telefono'	            => $resultado['telefono'],
                            'celularLlamadas'	    => $resultado['celularLlamadas'],
                            'tipoId'	            => $resultado['tipoIdentificacion'],
                            'celularWhatsapp'	    => $resultado['celularWhatsapp'],
                            'puntoActivacionId'	    => $resultado['puntoActivacionId'],
                            'nombrePuntoActivacion' => $resultado['nombrePuntoActivacion'],
                            'tipoBonoId'	        => $resultado['tipoBonoId'],
                            'nombreBono'        	=> $resultado['nombreBono'],
                            'tipoMembresiaId'       => $resultado['tipoMembresiaId'],
                            'nombreMembresia'       => $resultado['nombreMembresia'],

                        ];
                    }
                    return $datos;
                }
                //Retorna los tipos de bonos con estado 1     
                function getTipoBonos(){
                    $datos = array();
                    $bonos = new TipoBono();
                    $bonosSql = $bonos->getTipoBono();
                    foreach($bonosSql as $resultado){
                        $datos [] = [
                            'tipoBonoId'    => $resultado['tipoBonoId'], 
                            'nombre'        => $resultado['nombre'], 
                            'estado'        => $resultado['estado']
                        ];
                    }
                    return $datos;

                }
                //Retorna los tipos de membresias con estado 1     
                function getTipoMembresias(){
                    $datos = array();
                    $membresias = new Tipomembresia();
                    $membresiasSql = $membresias->getTipoMembresia();
                    foreach($membresiasSql as $resultado){
                        $datos[] =[
                            'tipoMembresiaId'   => $resultado['tipoMembresiaId'], 
                            'nombre'            => $resultado['nombre'], 
                            'estado'            => $resultado['estado'], 
                        ];
                    }
                    return $datos;
                }
                //Retorna las tipificaciones con estado 1     
                function getTipifiaciones(){
                    $datos = array();
                    $tipificaciones = new Tipificacion();
                    $tipificacionesSql = $tipificaciones->getTipificacion();
                    foreach($tipificacionesSql as $resultado){
                        $datos[]=[
                            'tipificacionId'    => $resultado['tipificacionId'], 
                            'nombre'            => $resultado['nombre'], 
                            'fechaCreacion'     => $resultado['fechaCreacion'], 
                            'estado'            => $resultado['estado'],
                        ];
                    }
                    return $datos;

                }
                //Fin Funciones para POSTVENTA ROL SAC
                $placa = $post['placa'];                
                $resultadoPostventa = buscarPostventa($placa);
                
                if(empty($resultadoPostventa)==1){
                    $yaGestionada = $placa;
                    $this->view->yaGestionada = $yaGestionada;
                }else{
                    $bonos = getTipoBonos();
                    $membresias = getTipoMembresias();
                    $tipificaciones = getTipifiaciones();                
                    $resultadoPostventa = json_encode($resultadoPostventa);    
                    $this->view->resultadoPostventa = json_decode($resultadoPostventa);                    
                    $bonos = json_encode($bonos);
                    $this->view->bonos = json_decode($bonos);
                    $membresias = json_encode($membresias);
                    $this->view->membresias = json_decode($membresias);                
                    $tipificaciones = json_encode($tipificaciones);
                    $this->view->tipificaciones = json_decode($tipificaciones);                    
                }                
                
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

    public function guardarPostventaAction(){
        $post = $this->request->getPost();        
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
        //print_r($post);die;
        if ($this->session->get("role") == 4){
            if(isset($post['btnEnviar'])){
                $ip = get_client_ip();
                $usuario = $this->session->get("iduser");
                $gestionId = $post['gestionId']; 
                $placa = $post['placaForm'];
                $tagAsociado = $post['tagAsociado'];
                $documento = $post['documento']; 
                $celular = $post['celular'];
                $activador = $post['activador'];
                $puntoActivacion = $post['puntoActivacion'];
                $fechaActivacion = $post['fechaActivacion'];
                $logroContacto = $post['logroContacto'];
                $noContacto = $post['noContacto'];
                $tipoMembresia = $post['tipoMembresia'];
                $tipoBono = $post['tipoBono'];
                $redimeBono = $post['redimeBono'];
                $fechaRedimeBono = $post['fechaRedimeBono'];
                $infoBono = $post['infoBono'];
                $conoceMembresias = $post['conoceMembresias'];
                $adquiereMembresia = $post['adquiereMembresia'];
                $observacion = $post['observacion'];
                $tipificacionId = $post['tipificacion'];
                $expGopass = $post['expGopass'];
                $calificacionPresentacionPersonal = $post['calificacionPresentacionPersonal'];
                $calificacionInfoClara = $post['calificacionInfoClara'];
                $calificacionAcompanamiento = $post['calificacionAcompanamiento'];
                $calificacionTiempoEspera = $post['calificacionTiempoEspera'];
                $calificacionComportamiento = $post['calificacionComportamiento'];
                $calificacionAmabilidad = $post['calificacionAmabilidad'];
                $fechaGestion = $this->date->format("Y-m-d H:i:s");
                $gestionGopass = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);
                $campana = $gestionGopass->campanaId;
                $fechaVolverLlamar = $gestionGopass->fechaVolverLlamar;
                if($logroContacto == 0){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoBono)){
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoMembresia)){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                }
                
                if(($adquiereMembresia == 0) && ($tipificacionId == 217)){
                    $campana = 3;
                    $dia = date('d');
                    $mes = date('m')+1;
                    $ano = date('Y');
                    if($mes > 12){
                        $mes = 1;
                        $ano ++;                        
                    }
                    $fechaVolverLlamar = date_create(($ano . "-" . $mes . "-" . $dia));                    
                    $fechaVolverLlamar = json_encode($fechaVolverLlamar);
                    $fechaVolverLlamar = json_decode($fechaVolverLlamar);                    
                }elseif(($adquiereMembresia == 0) && ($tipificacionId == 219)){
                    $campana = 2;
                    $fechaVolverLlamar = null;
                }
                //print_r($fechaVolverLlamar->date);die;
                $gestionGopass->fechaGestion = $fechaGestion;
                $gestionGopass->fechaVolverLlamar = $fechaVolverLlamar->date;
                $gestionGopass->ip = $ip;
                $gestionGopass->usuarioId = $usuario;
                $gestionGopass->campanaId = $campana;                
                $gestionGopass->placa = $placa;
                $gestionGopass->celularLlamadas = $celular;
                $gestionGopass->fechaActivacion = $fechaActivacion;
                $gestionGopass->existeContacto = $logroContacto;
                $gestionGopass->motivoNoContacto = $noContacto;                
                $gestionGopass->tipoMembresiaId = $tipoMembresia;
                $gestionGopass->tipoBonoId = $tipoBono;
                $gestionGopass->redimeBono = $redimeBono;
                $gestionGopass->fechaRedimeBono = $fechaRedimeBono;
                $gestionGopass->infoBono = $infoBono;
                $gestionGopass->conoceMembresias = $conoceMembresias;
                $gestionGopass->adquiereMembresia = $adquiereMembresia;
                $gestionGopass->observacion = $observacion;
                $gestionGopass->tipificacionId = $tipificacionId;
                $gestionGopass->calificacionPresentacionPersonal = $calificacionPresentacionPersonal;
                $gestionGopass->calificacionInfoClara = $calificacionInfoClara;
                $gestionGopass->calificacionAcompanamiento = $calificacionAcompanamiento;
                $gestionGopass->calificacionTiempoEspera = $calificacionTiempoEspera;
                $gestionGopass->calificacionComportamiento = $calificacionComportamiento;
                $gestionGopass->calificacionAmabilidad = $calificacionAmabilidad;
                $gestionGopass->tagAsociado = $tagAsociado;
                
                // try{
                //     $gestionGopass->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ';
                //     $messages = $gestionGopass->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                if ($gestionGopass->save() === false) {
                        // echo 'Error saving Invoice: ';
                        // $messages = $gestionGopass->getMessages();
                        // foreach ($messages as $message) {
                        //     echo $message . PHP_EOL;
                        // }
                        // die;
                        $error = json_encode($placa);
                        $error = $this->view->error = $error;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$error],
                            "action"     => "index",
                        ]);
                    }else{
                        $exito = json_encode($placa);
                        $exito = $this->view->exito = $exito;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$exito],
                            "action"     => "index",
                        ]);
                    }
            }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
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


    public function fidelizacionAction(){     
        $post = $this->request->getPost(); 
        if ($this->session->get("role") == 4){
            if(isset($post['buscar'])){
                $placa = $post['placa'];
                $validar = Gestiongopass::findFirst([
                    'conditions' => 'placa = :placa: and campanaId = :campana:',
                    'bind'       => [
                        'placa' => $placa,
                        'campana' => 3
                    ]
                ]);
                $fechaHoy = $this->date->format("Y-m-d H:i:s");
                if(!empty($validar)){

                    $fecha = $validar->fechaVolverLlamar;
                    $idGestion = $validar->gestionId;
                    if($fecha <= $fechaHoy){
                        function buscarFidelizacion($placa){                    
                            $postVenta = new Gestiongopass();
                            $postVentaSql = $postVenta->getFidelizacion($placa);                    
                            $datos = array();
                            foreach($postVentaSql as $resultado){
                                $datos[] = [
                                    'gestionId'                        => $resultado['gestionId'],
                                    'placa'	                           => $resultado['placa'],
                                    'tipificacionId'	               => $resultado['tipificacionId'],
                                    'tipoBonoId'	                   => $resultado['tipoBonoId'],
                                    'campanaId'	                       => $resultado['campanaId'],
                                    'tagAsociado'	                   => $resultado['tagAsociado'],
                                    'fechaActivacion'	               => $resultado['fechaActivacion'],
                                    'redimeBono'	                   => $resultado['redimeBono'],
                                    'fechaRedimeBono'	               => $resultado['fechaRedimeBono'],
                                    'usuarioId'	                       => $resultado['usuarioId'],
                                    'nombreUser'	                   => $resultado['nombreUser'],
                                    'apellidoUser'	                   => $resultado['apellidoUser'],
                                    'cedulaPersona'	                   => $resultado['cedulaPersona'],
                                    'nombrePersona'	                   => $resultado['nombrePersona'],
                                    'apellidoPersona'	               => $resultado['apellidoPersona'],
                                    'telefono'	                       => $resultado['telefono'],
                                    'celularLlamadas'	               => $resultado['celularLlamadas'],
                                    'tipoId'	                       => $resultado['tipoIdentificacion'],
                                    'celularWhatsapp'	               => $resultado['celularWhatsapp'],
                                    'puntoActivacionId'	               => $resultado['puntoActivacionId'],
                                    'nombrePuntoActivacion'            => $resultado['nombrePuntoActivacion'],
                                    'tipoBonoId'	                   => $resultado['tipoBonoId'],
                                    'nombreBono'        	           => $resultado['nombreBono'],
                                    'tipoMembresiaId'                  => $resultado['tipoMembresiaId'],
                                    'nombreMembresia'                  => $resultado['nombreMembresia'],
                                    'infoBono'                         => $resultado['infoBono'],
                                    'conoceMembresias'                 => $resultado['conoceMembresias'],
                                    'calificacionPresentacionPersonal' => $resultado['calificacionPresentacionPersonal'],
        
                                ];
                            }
                            return $datos;
                        }
                        function getTipifiaciones(){
                            $datos = array();
                            $tipificaciones = new Tipificacion();
                            $tipificacionesSql = $tipificaciones->getTipificacion();
                            foreach($tipificacionesSql as $resultado){
                                $datos[]=[
                                    'tipificacionId'    => $resultado['tipificacionId'], 
                                    'nombre'            => $resultado['nombre'], 
                                    'fechaCreacion'     => $resultado['fechaCreacion'], 
                                    'estado'            => $resultado['estado'],
                                ];
                            }
                            return $datos;
        
                        }
                        function getTipoBonos(){
                            $datos = array();
                            $bonos = new TipoBono();
                            $bonosSql = $bonos->getTipoBono();
                            foreach($bonosSql as $resultado){
                                $datos [] = [
                                    'tipoBonoId'    => $resultado['tipoBonoId'], 
                                    'nombre'        => $resultado['nombre'], 
                                    'estado'        => $resultado['estado']
                                ];
                            }
                            return $datos;
        
                        }
                        //Retorna los tipos de membresias con estado 1     
                        function getTipoMembresias(){
                            $datos = array();
                            $membresias = new Tipomembresia();
                            $membresiasSql = $membresias->getTipoMembresia();
                            foreach($membresiasSql as $resultado){
                                $datos[] =[
                                    'tipoMembresiaId'   => $resultado['tipoMembresiaId'], 
                                    'nombre'            => $resultado['nombre'], 
                                    'estado'            => $resultado['estado'], 
                                ];
                            }
                            return $datos;
                        }
                                      
                        $resultadoFidelizacion = buscarFidelizacion($placa);
                        if(empty($resultadoFidelizacion)==1){
                            $yaGestionada = $placa;
                            $this->view->yaGestionada = $yaGestionada;
                        }else{
                            $tipificaciones = getTipifiaciones();
                            $bonos = getTipoBonos();
                            $membresias = getTipoMembresias();
                            $resultadoFidelizacion = json_encode($resultadoFidelizacion);    
                            $this->view->resultadoFidelizacion = json_decode($resultadoFidelizacion);                    
                            $tipificaciones = json_encode($tipificaciones);
                            $this->view->tipificaciones = json_decode($tipificaciones);
                            $bonos = json_encode($bonos);
                            $this->view->bonos = json_decode($bonos);
                            $membresias = json_encode($membresias);
                            $this->view->membresias = json_decode($membresias); 
                        }
                    }else{
                        $fecha = new DateTime($fecha);
                        $fecha = $fecha->format("d-m-Y");
                        $fecha = json_encode($fecha);
                        $this->view->fechaInvalida = json_decode($fecha);
                    }
                }else{
                    $notFound = json_encode($notFound);
                    $this->view->notFound = $placa;
                }
               

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

    public function guardarFidelizacionAction(){        
        $post = $this->request->getPost();        
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
        
        //print_r($post);die;
        if ($this->session->get("role") == 4){
            if(isset($post['btnEnviar'])){
                $ip = get_client_ip();
                $usuario = $this->session->get("iduser");
                $gestionId = $post['gestionId']; 
                $placa = $post['placaForm'];
                $tagAsociado = $post['tagAsociado'];
                $documento = $post['documento']; 
                $celular = $post['celular'];
                $activador = $post['activador'];
                $puntoActivacion = $post['puntoActivacion'];
                $fechaActivacion = $post['fechaActivacion'];
                $logroContacto = $post['logroContacto'];
                $noContacto = $post['noContacto'];
                $tipoMembresia = $post['tipoMembresia'];
                $tipoBono = $post['tipoBono'];
                $redimeBono = $post['redimeBono'];
                $fechaRedimeBono = $post['fechaRedimeBono'];
                $infoBono = $post['infoBono'];
                $conoceMembresias = $post['conoceMembresias'];
                $adquiereMembresia = $post['adquiereMembresia'];
                $observacion = $post['observacion'];
                $tipificacionId = $post['tipificacion'];
                $expGopass = $post['expGopass'];
                $calificacionPresentacionPersonal = $post['calificacionPresentacionPersonal'];
                $calificacionInfoClara = $post['calificacionInfoClara'];
                $calificacionAcompanamiento = $post['calificacionAcompanamiento'];
                $calificacionTiempoEspera = $post['calificacionTiempoEspera'];
                $calificacionComportamiento = $post['calificacionComportamiento'];
                $calificacionAmabilidad = $post['calificacionAmabilidad'];
                $fechaGestion = $this->date->format("Y-m-d H:i:s");
                $gestionGopass = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);
                $campana = $gestionGopass->campanaId;
                $fechaVolverLlamar = $gestionGopass->fechaVolverLlamar;
                if($logroContacto == 0){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoBono)){
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoMembresia)){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                }
                if(!is_numeric($redimeBono)){
                    $redimeBono = $gestionGopass->redimeBono;
                }
                if(!is_numeric($infoBono)){
                    $infoBono = $gestionGopass->infoBono;
                }
                if(!is_numeric($conoceMembresias)){
                    $conoceMembresias = $gestionGopass->conoceMembresias;
                }
                
                if(($adquiereMembresia == 0) && ($tipificacionId == 217)){
                    $campana = 3;
                    $dia = date('d');
                    $mes = date('m')+1;
                    $ano = date('Y');
                    if($mes > 12){
                        $mes = 1;
                        $ano ++;                        
                    }
                    $fechaVolverLlamar = date_create(($ano . "-" . $mes . "-" . $dia));                    
                    $fechaVolverLlamar = json_encode($fechaVolverLlamar);
                    $fechaVolverLlamar = json_decode($fechaVolverLlamar);                    
                }elseif(($adquiereMembresia == 0) && ($tipificacionId == 219)){
                    $campana = 3;
                    $fechaVolverLlamar = null;
                }
                
                $gestionGopass->fechaGestion = $fechaGestion;
                $gestionGopass->fechaVolverLlamar = $fechaVolverLlamar->date;
                $gestionGopass->ip = $ip;
                $gestionGopass->usuarioId = $usuario;
                $gestionGopass->campanaId = $campana;                
                $gestionGopass->placa = $placa;
                $gestionGopass->celularLlamadas = $celular;
                $gestionGopass->fechaActivacion = $fechaActivacion;
                $gestionGopass->existeContacto = $logroContacto;
                $gestionGopass->motivoNoContacto = $noContacto;                
                $gestionGopass->tipoMembresiaId = $tipoMembresia;
                $gestionGopass->tipoBonoId = $tipoBono;
                $gestionGopass->redimeBono = $redimeBono;
                $gestionGopass->fechaRedimeBono = $fechaRedimeBono;
                $gestionGopass->infoBono = $infoBono;
                $gestionGopass->conoceMembresias = $conoceMembresias;
                $gestionGopass->adquiereMembresia = $adquiereMembresia;
                $gestionGopass->observacion = $observacion;
                $gestionGopass->tipificacionId = $tipificacionId;
                $gestionGopass->calificacionPresentacionPersonal = $calificacionPresentacionPersonal;
                $gestionGopass->calificacionInfoClara = $calificacionInfoClara;
                $gestionGopass->calificacionAcompanamiento = $calificacionAcompanamiento;
                $gestionGopass->calificacionTiempoEspera = $calificacionTiempoEspera;
                $gestionGopass->calificacionComportamiento = $calificacionComportamiento;
                $gestionGopass->calificacionAmabilidad = $calificacionAmabilidad;
                $gestionGopass->tagAsociado = $tagAsociado;
                
                // try{
                //     $gestionGopass->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ';
                //     $messages = $gestionGopass->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                if ($gestionGopass->save() === false) {
                        // echo 'Error saving Invoice: ';
                        // $messages = $gestionGopass->getMessages();
                        // foreach ($messages as $message) {
                        //     echo $message . PHP_EOL;
                        // }
                        // die;
                        $error = json_encode($placa);
                        $error = $this->view->error = $error;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$error],
                            "action"     => "index",
                        ]);
                    }else{
                        $exito = json_encode($placa);
                        $exito = $this->view->exito = $exito;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$exito],
                            "action"     => "index",
                        ]);
                    }
            }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
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

    
    
}
