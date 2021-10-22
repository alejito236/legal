<?php

use Phalcon\Flash;
use Phalcon\Session;

class GOPASSasesorController extends ControllerBase
{
    public function initialize()
    {
        
        $this->tag->setTitle('Asesor Comercial');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->role = $this->session->get("role");
        $this->view->setTemplateAfter('LOGISTICAasesorlayouts');
        $this->date = new \DateTime('America/Bogota');

        $id = $this->session->get('iduser');
        $fecha = $this->date->format("Y-m-d H:i:s");
        $usuarios = new Usuario();        
        $usuarios = Usuario::findFirst([
            "usuarioId = :id:",
            'bind' => ['id' => $id]
        ]);
        // $usuarios->ultimaSesion = $fecha;
        $usuarios->save();
    }

    /**
     * Acccion para iniciar gestios de asesor SOAT
     */

    public function indexAction()
    {   
        $post = $this->request->getPost();
        if ($this->session->get("role") == 5) {
            $id = $this->session->get('iduser');
            $fechaInicio = $this->date->format("Y-m-d");
            $fechaFin = $this->date->format("Y-m-d");
            
            $agendadas = new Gestiongopass();
            //Cambiar consulta de getReagendadas
            $reagendadas = $agendadas->getReagendadas($fechaInicio, $fechaFin, $id);              
            $cantidad = array();            
            foreach($reagendadas as $reagendada){
                $cantidad[] = [
                    'cantidad' => $reagendada['cantidad']
                ];
            }
            $cantidad = json_encode($cantidad);
            $this->view->cantidad = json_decode($cantidad);
            
            $convenios = Convenio::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);
            $convenios = json_encode($convenios);
            $this->view->convenios = json_decode($convenios);
            
            $ciudades = Ciudad::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);
            $ciudades = json_encode($ciudades);
            $this->view->ciudades = json_decode($ciudades);                

            $localidades = Localidad::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);
            $localidades = json_encode($localidades);
            $this->view->localidades = json_decode($localidades);

            $barrios = Barrio::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);
            $barrios = json_encode($barrios);
            $this->view->barrios = json_decode($barrios);

            $mastertipificacion = Tipificacion::find([
                'conditions' => 'estado = :estado: AND tipificacionId != 188 AND tipificacionId != 218',
                'bind'       => [                        
                    'estado' => 1
                ]
            ]);
            $mastertipificacion = json_encode($mastertipificacion);
            $mastertipificacion = $this->view->mastertipificacion = json_decode($mastertipificacion);

            
            //Busqueda por placa
            if(($post['placaBuscar'])){
                $placa = $post['placaBuscar'];

                $gopass = Gestiongopass::findFirst([
                    'conditions' => 'placa = :placa:',
                    'bind' => ['placa' => $placa]
                ]);
                
                
                if(!empty($gopass)){
                    $telefono = null;
                    $cedula=null;
                    $gestionGopass = new Gestiongopass();
                    $reagendamientoCampana = $gestionGopass->getReagendamientoCampana($placa, $cedula, $telefono);
                    $datoReagendamientoCampana = array();
                    foreach($reagendamientoCampana as $resultado){
                        $datoReagendamientoCampana =[
                        'gestionId'         => $resultado['gestionId'], 
                        'placa'             => $resultado['placa'], 
                        'cedulaPersona'     => $resultado['cedulaPersona'], 
                        'nombrePersona'     => $resultado['nombrePersona'],
                        'direccionCasa'     => $resultado['direccionCasa'], 
                        'fechaEntrega'      => $resultado['fechaEntrega'], 
                        'celularLlamadas'   => $resultado['celularLlamadas'], 
                        'celularWhatsapp'   => $resultado['celularWhatsapp'], 
                        'telefono'          => $resultado['telefono'], 
                        'convenioId'        => $resultado['convenioId'],
                        'nombreConvenio'    => $resultado['nombreConvenio'], 
                        'observacion'       => $resultado['observacion'], 
                        'numTags'           => $resultado['numTags'], 
                        'barrioId'          => $resultado['barrioId'], 
                        'nombreBarrio'      => $resultado['nombreBarrio'],  
                        'localidadId'       => $resultado['localidadId'], 
                        'nombreLocalidad'   => $resultado['nombreLocalidad'],
                        'ciudadId'          => $resultado['ciudadId'], 
                        'nombreCiudad'      => $resultado['nombreCiudad'],
                        'direccionEntrega'  => $resultado['direccionEntrega'],
                        'franjaHoraria'     => $resultado['franjaHoraria'],
                        ];
                    }

                    
                    if(!empty($datoReagendamientoCampana)){                        
                        $datoReagendamientoCampana = json_encode($datoReagendamientoCampana);
                        $this->view->consulta = json_decode($datoReagendamientoCampana);        
                        $fechaEntrega = new DateTime($datoReagendamientoCampana->fechaEntrega);
                        $fechaEntrega = $fechaEntrega->format("Y-m-d");
                        $fechaEntrega = json_encode($fechaEntrega);
                        $this->view->fechaEntrega = json_decode($fechaEntrega);                        
                        
                    }else{                        
                        $error = $this->view->error = "La placa $placa ya se encuentra gestionada.";
                    }

                }
                else{
                    
                    $error = $this->view->error = "La placa $placa no se ecnuentra en la base de datos.";
                }
            }

            //Busqueda por cedula ***NUEVA
            if(($post['cedulaBuscar'])){
                $cedula = $post['cedulaBuscar'];
                $placa = null;
                $telefono = null;
                $gopass = Gestiongopass::findFirst([
                    'conditions' => 'cedulaPersona = :cedula:',
                    'bind' => ['cedula' => $cedula]
                ]);
                    //echo ($gopass->count());die;
                if(!empty($gopass)){
                    $gestionGopass = new Gestiongopass();
                    $reagendamientoCampana = $gestionGopass->getReagendamientoCampana($placa, $cedula, $telefono);
                    $datoReagendamientoCampana = array();
                    foreach($reagendamientoCampana as $resultado){
                        $datoReagendamientoCampana[] =[
                        'gestionId'         => $resultado['gestionId'], 
                        'placa'             => $resultado['placa'], 
                        'cedulaPersona'     => $resultado['cedulaPersona'], 
                        'nombrePersona'     => $resultado['nombrePersona'],
                        'direccionCasa'     => $resultado['direccionCasa'], 
                        'fechaEntrega'      => $resultado['fechaEntrega'], 
                        'celularLlamadas'   => $resultado['celularLlamadas'], 
                        'celularWhatsapp'   => $resultado['celularWhatsapp'], 
                        'telefono'          => $resultado['telefono'], 
                        'convenioId'        => $resultado['convenioId'],
                        'nombreConvenio'    => $resultado['nombreConvenio'], 
                        'observacion'       => $resultado['observacion'], 
                        'numTags'           => $resultado['numTags'], 
                        'barrioId'          => $resultado['barrioId'], 
                        'nombreBarrio'      => $resultado['nombreBarrio'],  
                        'localidadId'       => $resultado['localidadId'], 
                        'nombreLocalidad'   => $resultado['nombreLocalidad'],
                        'ciudadId'          => $resultado['ciudadId'], 
                        'nombreCiudad'      => $resultado['nombreCiudad'],
                        'direccionEntrega'  => $resultado['direccionEntrega'],
                        'franjaHoraria'     => $resultado['franjaHoraria'],
                        ];
                    }

                    if(!empty($datoReagendamientoCampana)){                        
                        $datoReagendamientoCampana = json_encode($datoReagendamientoCampana);
                        $this->view->consulta = json_decode($datoReagendamientoCampana);        
                        $fechaEntrega = new DateTime($datoReagendamientoCampana->fechaEntrega);
                        $fechaEntrega = $fechaEntrega->format("Y-m-d");
                        $fechaEntrega = json_encode($fechaEntrega);
                        $this->view->fechaEntrega = json_decode($fechaEntrega);  
                        $cedulaConsulta = $this->view->cedulaConsulta = "cedula";                      
                        
                    }else{                        
                        $error = $this->view->error = "La cedula $cedula ya se encuentra gestionada.";
                    }
                    
                                            
                }else{
                    $errorCon = $this->view->errorCon = "No hay registros con la cédula ".$cedula." en la base de datos.";
                }
            }

            //Busqueda por telefono ***NUEVA
            if(($post['telefonoBuscar'])){
                $cedula = null;
                $placa = null;
                $telefono = $post['telefonoBuscar'];
                $gestionGopass = new Gestiongopass();
                $gestionGopassSql = $gestionGopass->getPersonaAgendamiento($telefono);                
                
                if(!empty($gestionGopass)){
                    
                    $reagendamientoCampana = $gestionGopass->getReagendamientoCampana($placa, $cedula, $telefono);
                    $datoReagendamientoCampana = array();
                    foreach($reagendamientoCampana as $resultado){
                        $datoReagendamientoCampana[] =[
                        'gestionId'         => $resultado['gestionId'], 
                        'placa'             => $resultado['placa'], 
                        'cedulaPersona'     => $resultado['cedulaPersona'], 
                        'nombrePersona'     => $resultado['nombrePersona'],
                        'direccionCasa'     => $resultado['direccionCasa'], 
                        'fechaEntrega'      => $resultado['fechaEntrega'], 
                        'celularLlamadas'   => $resultado['celularLlamadas'], 
                        'celularWhatsapp'   => $resultado['celularWhatsapp'], 
                        'telefono'          => $resultado['telefono'], 
                        'convenioId'        => $resultado['convenioId'],
                        'nombreConvenio'    => $resultado['nombreConvenio'], 
                        'observacion'       => $resultado['observacion'], 
                        'numTags'           => $resultado['numTags'], 
                        'barrioId'          => $resultado['barrioId'], 
                        'nombreBarrio'      => $resultado['nombreBarrio'],  
                        'localidadId'       => $resultado['localidadId'], 
                        'nombreLocalidad'   => $resultado['nombreLocalidad'],
                        'ciudadId'          => $resultado['ciudadId'], 
                        'nombreCiudad'      => $resultado['nombreCiudad'],
                        'direccionEntrega'  => $resultado['direccionEntrega'],
                        'franjaHoraria'     => $resultado['franjaHoraria'],
                        ];
                    }

                    if(!empty($datoReagendamientoCampana)){                        
                        $datoReagendamientoCampana = json_encode($datoReagendamientoCampana);
                        $this->view->consulta = json_decode($datoReagendamientoCampana);        
                        $fechaEntrega = new DateTime($datoReagendamientoCampana->fechaEntrega);
                        $fechaEntrega = $fechaEntrega->format("Y-m-d");
                        $fechaEntrega = json_encode($fechaEntrega);
                        $this->view->fechaEntrega = json_decode($fechaEntrega);  
                        $telConsulta = $this->view->telConsulta = "cedula";                      
                        
                    }else{                        
                        $error = $this->view->error = "No hay registros con el telefono $telefono pendientes por gestionar.";
                    }
                    
                                            
                }else{
                    $errorCon = $this->view->errorCon = "No hay registros con el télefono $telefono en la base de datos.";                        
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

    /**
     * Accion para iniciar fuera de base
     */

    public function fueraDeBaseAction()
    {   
        if ($this->session->get("role") == 5) {
            $convenios = Convenio::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);

            $convenios = json_encode($convenios);
            $this->view->convenios = json_decode($convenios);

            $ciudades = Ciudad::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);

            $ciudades = json_encode($ciudades);
            $this->view->ciudades = json_decode($ciudades);

            $barrios = Barrio::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);

            $barrios = json_encode($barrios);
            $this->view->barrios = json_decode($barrios);

            $localidades = Localidad::find([
                'conditions' => 'estado = :estado:',
                'bind'       => [
                    'estado' => 1,
                ]
            ]);

            $localidades = json_encode($localidades);
            $this->view->localidades = json_decode($localidades);

            
            $tipoId = TipoIdentificacion::find([
                'order' => 'tipoId'
            ]);
            $tipoId = json_encode($tipoId);
            $this->view->tipoId = json_decode($tipoId);
            

        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function guardarAction()
    {   
        
        if ($this->session->get("role") == 5) {
            $post = $this->request->getPost();
            
            if(isset($post['tipificacionInput'])){
                $tipificacionInput = $post['tipificacionInput'];
            }elseif(isset($post['tipificacion'])){
                $tipificacionInput = $post['tipificacion'];
            }
            
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
            $usuarioGestion = $this->session->get('iduser');
            $fechaGestion = $this->date->format("Y-m-d H:i:s");            
            
            $ip = get_client_ip();
            
            if(isset($post)){                
                if(($tipificacionInput) != 215){
                    $gopass = Gestiongopass::findFirst([
                        'conditions' => 'placa = :placa: and campanaId = 1',
                        'bind'       => [
                            'placa' => $post['placaTipi'],
                        ]
                    ]);
                    
                    if(!empty($gopass)){
                        
                        
                        if($tipificacionInput == 216 || $tipificacionInput == 218){
                            $fechaGestion = $this->date->format("Y-m-d H:i:s");
                        }
                        elseif($tipificacionInput == 217){
                            $gopass->fechaVolverLlamar = $post['fechaReagendar'];
                            $fechaGestion = $this->date->format("Y-m-d H:i:s");
                        }
                        $gopass->fechaGestion = $fechaGestion;
                        $gopass->ip = $ip;
                        $gopass->usuarioId = $usuarioGestion;
                        $gopass->tipificacionId = $tipificacionInput;
                        if($gopass->save()){
                            $exito = json_encode($post['placaTipi']);
                            $exito = $this->view->exito = $exito;                                                        
                                return $this->dispatcher->forward(
                                [
                                    "params"    => [$exito],
                                    "action"     => "index",
                                ]);
                        }else{
                            $error ="No se logro guardar la placa " .  $post['placaTipi'] . " comuniquese con el administrador";
                            $error = json_encode($error);
                            $this->view->error = json_decode($error);
                            return $this->dispatcher->forward(
                            [
                                "params"    => [$error],
                                "action"     => "index",
                            ]);
                        }

                    }else{
                        $error = "La placa " . $post['placaTipi'] . " no se encuentra en la campaña de agendamiento";
                        $error = json_encode($post['placa']);
                        $this->view->error = json_decode($error);
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$error],
                            "action"     => "index",
                        ]);
                    }                   
                }elseif(isset($tipificacionInput) == 215){                    
                    $documentoCliente = $post['documentoCliente'];            
                    $nombreCliente = $post['nombreCliente'];
                    $direccionCliente = $post['direccionCliente'];
                    $telefonoCliente = $post['telefonoCliente'];
                    $celularCliente = $post['celularCliente'];
                    $ciudadCliente = $post['ciudadCliente'];
                    $localidadCliente = $post['localidadCliente'];
                    $barrioCliente = $post['barrioCliente'];
                    $franjaEntrega = $post['franjaEntrega'];
                    $fechaEntrega = $post['fechaEntrega'];
                    $direccionEntrega = $post['direccionEntrega'];
                    $convenio = $post['convenio'];
                    $observaciones = $post['observaciones'];
                    $numeroTags = $post['numeroTags'];
                    $placa = explode(',',$post['placa']);
                    $tipificacionInput = $tipificacionInput;             
                    $contador=0;
                    for($i = 0; $i < count($placa); ++$i) {
                        $placaInsert = $placa[$i];
                        $contador++;
                        $gestionGopass = Gestiongopass::findFirst([
                            "placa = :placa:",
                            'bind' => ['placa' => $placaInsert]
                        ]);
                        $nuevoRegistro = 0;
                        if (empty($gestionGopass)) {                            
                            $gestionGopass = new Gestiongopass();
                            $nuevoRegistro = 1;
                        }
                        
                        $gestionGopass->cedulaPersona = $documentoCliente;
                        $gestionGopass->placa = $placaInsert;
                        $gestionGopass->fechaGestion = $fechaGestion;
                        $gestionGopass->ip = $ip;
                        $gestionGopass->usuarioId = $usuarioGestion;
                        $gestionGopass->campanaId = 1;
                        $gestionGopass->tagAsociado = 0;
                        $gestionGopass->direccionCasa = $direccionCliente;
                        $gestionGopass->telefono = $telefonoCliente;
                        $gestionGopass->celularLlamadas = $celularCliente;                              
                        $gestionGopass->barrioId = $barrioCliente;              
                        $gestionGopass->franjaHoraria = $franjaEntrega;
                        $gestionGopass->fechaEntrega = $fechaEntrega;
                        $gestionGopass->direccionEntrega = $direccionEntrega;
                        $gestionGopass->convenioId = $convenio;
                        $gestionGopass->observacion = $observaciones;
                        $gestionGopass->numTags = 1;                        
                        $gestionGopass->tipificacionId = $tipificacionInput;
                        $gestionGopass->fechaReagendamiento = NULL;
                        
                        
                        if($gestionGopass->save()){
                            $exito = json_encode($post['placa']);
                            $exito = $this->view->exito = $exito;                            
                            if($contador == count($placa) ){
                                return $this->dispatcher->forward(
                                [
                                    "params"    => [$exito],
                                    "action"     => "index",
                                ]);
                            }
                        }else{
                                $error2 = json_encode($post['placa']);
                                $this->view->error2 = json_decode($error2);
                                return $this->dispatcher->forward(
                                [
                                    "params"    => [$exito],
                                    "action"     => "index",
                                ]);
                            }                        
                        
                    }

                    

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
 /**
     * Accion para hacer un doble registro en el formulario fuera de base
     */

    public function guardarfueraAction()
    {   
        if ($this->session->get("role") == 5) {            
            $post = $this->request->getPost();            
            if(isset($post)){
                $documentoCliente = $post['documentoCliente'];
                $nombreCliente = $post['nombreCliente'];
                $apellidoCliente = $post['apellidoCliente'];
                $direccionCliente = $post['direccionCliente'];
                $telefonoCliente = $post['telefonoCliente'];
                $celularCliente = $post['celularCliente'];
                $ciudadCliente = $post['ciudadCliente'];
                $localidadCliente = $post['localidadCliente'];
                $barrioCliente = $post['barrioCliente'];
                $franjaEntrega = $post['franjaEntrega'];
                $fechaEntrega = date('Y-m-d', strtotime($post['fechaEntrega']));
                $direccionEntrega = $post['direccionEntrega'];
                $convenio = $post['convenio'];
                $observaciones = $post['observaciones'];
                $numeroTags = $post['numeroTags'];
                $placa = explode(',',$post['placa']);
                $dateHoy = $this->date->format("Y-m-d H:i:s");
                $tipoId = $post['tipoId'];
                $celularWhatsapp = $post['celularWhatsapp'];
                $usuarioGestion = $this->session->get('iduser');
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

                $consultaPersona = Persona::findFirst([
                    'conditions' => 'cedulaPersona = :cedula:',
                    'bind'       => [
                        'cedula' => $documentoCliente,
                    ]
                ]);
                
                if(empty($consultaPersona)){                    
                    $crearPersona = new Persona();
                    $crearPersona->cedulaPersona = $documentoCliente;
                    $crearPersona->nombre = $nombreCliente;
                    $crearPersona->apellido = $apellidoCliente;
                    $crearPersona->telefono = $telefonoCliente;
                    $crearPersona->celularLlamadas = $celularCliente;
                    $crearPersona->tipoId = $tipoId;
                    $crearPersona->celularWhatsapp = $celularWhatsapp;
                    $crearPersona->usuarioId = $usuarioGestion;
                    $crearPersona->ip = $ip;                    
                    if($crearPersona->save()==false){
                        $error = 'Hubo un error al ingresar al nuevo usuario';
                        $this->view->error = $error;                  
                    }
                    

                }
                $contador = 0;
                for($i = 0; $i < count($placa); ++$i) {
                    $placaInsert = $placa[$i];
                    $acumPlaca = array();
                    $contador++;
                    $gestionGopass = Gestiongopass::findFirst([
                        "placa = :placa:",
                        'bind' => ['placa' => $placaInsert]
                    ]);                    
                    if (empty($gestionGopass)) {                         
                        $gestionGopass = new Gestiongopass();
                        $nuevoRegistro = 1;
                        $gestionGopass = new Gestiongopass();
                        $gestionGopass->cedulaPersona = $documentoCliente;
                        $gestionGopass->placa = $placaInsert;
                        $gestionGopass->fechaGestion = $dateHoy;
                        $gestionGopass->ip = $ip;
                        $gestionGopass->usuarioId = $usuarioGestion;
                        $gestionGopass->campanaId = 1;
                        $gestionGopass->tagAsociado = 0;
                        $gestionGopass->direccionCasa = $direccionCliente;
                        $gestionGopass->telefono = $celularCliente;
                        $gestionGopass->celularLlamadas = $celularCliente;                              
                        $gestionGopass->barrioId = $barrioCliente;              
                        $gestionGopass->franjaHoraria = $franjaEntrega;
                        $gestionGopass->fechaEntrega = $fechaEntrega;
                        $gestionGopass->direccionEntrega = $direccionEntrega;
                        $gestionGopass->convenioId = $convenio;
                        $gestionGopass->observacion = $observaciones;
                        $gestionGopass->numTags = 1;                        
                        $gestionGopass->tipificacionId = 215;
                        $gestionGopass->fechaReagendamiento = NULL;                        
                        if($gestionGopass->save()){
                            $acumPLaca[$i] = $placaInsert;
                            if($contador == count($placa) ){
                                $exito = json_encode($acumPLaca);
                                $exito = $this->view->exito = json_decode($exito);                                
                                return $this->dispatcher->forward(
                                [
                                    "params"    => [$exito],
                                    "action"     => "fueraDeBase",
                                ]);
                            }
                        }else{                            
                                $error = "Hubo problemas al registrar la placa $placaInsert";
                                $this->view->error = json_decode($error);
                                return $this->dispatcher->forward(
                                [
                                    "params"    => [$error],
                                    "action"     => "fueraDeBase",
                                ]);
                            } 
                    }else{
                        $error = "La placa $placaInsert ya se encuentra registrada, favor validar";
                        $this->view->error = $error;

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
     * Accion para guardar contactos del cliente que tienen que volver a llamar o venta pendiente
     */

    public function contactosAction()
    {   
        if ($this->session->get("role") == 5) {

            $iduser = $this->session->get('iduser');
            $consulta = new Gestiongopass();                
            $consulta = $consulta->getContactosAsesor($iduser);
            
            
            $consultaSql = array();
            foreach($consulta as $resultado){
                $consultaSql[] = [
                    'gestionId' => $resultado['gestionId'], 
                    'nombrePersona' => $resultado['nombrePersona'], 
                    'cedulaPersona' => $resultado['cedulaPersona'], 
                    'placa' => $resultado['placa'], 
                    'telefono' => $resultado['telefono'],
                    'celularLlamadas' => $resultado['celularLlamadas'], 
                    'celularWhatsapp' => $resultado['celularWhatsapp'], 
                    'convenioId' => $resultado['convenioId'], 
                    'nombreConvenio' => $resultado['nombreConvenio'],
                    'fechaGestion' => $resultado['fechaGestion'], 
                    'fechaVolverLlamar' => $resultado['fechaVolverLlamar'], 
                    'tipificacionId' => $resultado['tipificacionId'], 
                    'nombreTipi' => $resultado['nombreTipi'],
                    'usuarioId' => $resultado['usuarioId'],
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
    
    public function reagendamientoAction()
    {   
        if ($this->session->get("role") == 5) {

            $id = $this->session->get('iduser');
            $fechaInicio = $this->date->format("Y-m-d");
            $fechaFin = $this->date->format("Y-m-d");
            $post = $this->request->getPost();

            $reagendadas = new Gestiongopass();
            //ArreglarCOnsulta
            $reagendadas = $reagendadas->getReagendadas($fechaInicio, $fechaFin, $id);

            $cantidad = array();

            foreach($reagendadas as $reagendada){
                $cantidad[] = [
                    'cantidad' => $reagendada['cantidad']
                ];
            }
            
            $cantidad = json_encode($cantidad);
            $this->view->cantidad = json_decode($cantidad);

            if(isset($post['placa'])){
                $placa = $post['placa'];
                $consulta = new Gestiongopass();
                $consulta = $consulta->getHistorialSac($placa);
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
                        'direccionEntrega'  => $resultado['direccionEntrega'],
                        'observacion'       => $resultado['observacion'],
                        'numTags'           => $resultado['numTags'],
                        'fechaEntrega'      => $resultado['fechaEntrega'],
                    ];
                }                
                if(!empty($consultaSql)){
                    $consulta = json_encode($consultaSql);
                    $this->view->historial = json_decode($consulta);
                    $placa = json_encode($placa);
                    $this->view->placa = json_decode($placa);                    
                }
                else{
                    $error = json_encode($post['placa']);
                    $this->view->error = json_decode($error);
                }
            }
            if(isset($post['placaGestionar'])){
                $placa = $post['placaGestionar'];
                $convenios = Convenio::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
                $convenios = json_encode($convenios);
                $this->view->convenios = json_decode($convenios);
                
                $ciudades = Ciudad::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
                $ciudades = json_encode($ciudades);
                $this->view->ciudades = json_decode($ciudades);                
    
                $localidades = Localidad::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
                $localidades = json_encode($localidades);
                $this->view->localidades = json_decode($localidades);
    
                $barrios = Barrio::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
                $barrios = json_encode($barrios);
                $this->view->barrios = json_decode($barrios);

                $gestionGopass = new Gestiongopass();
                $reagendamientoCampana = $gestionGopass->getReagendamientoCampana($placa, null, null);
                $datoReagendamientoCampana = array();
                foreach($reagendamientoCampana as $resultado){
                    $datoReagendamientoCampana =[
                    'gestionId'         => $resultado['gestionId'], 
                    'placa'             => $resultado['placa'], 
                    'cedulaPersona'     => $resultado['cedulaPersona'], 
                    'nombrePersona'     => $resultado['nombrePersona'],
                    'direccionCasa'     => $resultado['direccionCasa'], 
                    'fechaEntrega'      => $resultado['fechaEntrega'], 
                    'celularLlamadas'   => $resultado['celularLlamadas'], 
                    'celularWhatsapp'   => $resultado['celularWhatsapp'], 
                    'telefono'          => $resultado['telefono'], 
                    'convenioId'        => $resultado['convenioId'],
                    'nombreConvenio'    => $resultado['nombreConvenio'], 
                    'observacion'       => $resultado['observacion'], 
                    'numTags'           => $resultado['numTags'], 
                    'barrioId'          => $resultado['barrioId'], 
                    'nombreBarrio'      => $resultado['nombreBarrio'],  
                    'localidadId'       => $resultado['localidadId'], 
                    'nombreLocalidad'   => $resultado['nombreLocalidad'],
                    'ciudadId'          => $resultado['ciudadId'], 
                    'nombreCiudad'      => $resultado['nombreCiudad'],
                    'direccionEntrega'  => $resultado['direccionEntrega'],
                    'franjaHoraria'     => $resultado['franjaHoraria'],
                    ];
                }
                if(!empty($datoReagendamientoCampana)){                        
                    $datoReagendamientoCampana = json_encode($datoReagendamientoCampana);
                    $this->view->consulta = json_decode($datoReagendamientoCampana);        
                    $fechaEntrega = new DateTime($datoReagendamientoCampana->fechaEntrega);
                    $fechaEntrega = $fechaEntrega->format("Y-m-d");
                    $fechaEntrega = json_encode($fechaEntrega);
                    $this->view->fechaEntrega = json_decode($fechaEntrega);  
                    $telConsulta = $this->view->telConsulta = "cedula";
                    // print_r ($this->view->consulta);die;
                    //echo "Entro if";die;
                    
                }else{                        
                    $this->view->error = "Esta placa $placa ya se encuentra gestionada.";                    
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

    public function reagendarAction()
    {   
        if ($this->session->get("role") == 5) {
            
            $fechaHoy = $this->date->format("Y-m-d");
            $post = $this->request->getPost();
            $id = $this->session->get('iduser');            
            $gestionId =  $post['id'];            
            if(isset($post)){
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

                $consulta = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);
                if(!empty($consulta)){

                }
                $consulta->cedulaPersona = $post['documentoCliente'];                
                $consulta->direccionCasa = $post['direccionCliente'];
                $consulta->telefono = $post['telefonoCliente'];
                $consulta->celularllamadas = $post['celularCliente'];                
                $consulta->barrioId = $post['barrioCliente'];                
                $consulta->franjaHoraria = $post['franjaEntrega'];
                $consulta->fechaEntrega = $post['fechaEntrega'];
                $consulta->direccionEntrega = $post['direccionEntrega'];            
                $consulta->observacion = $post['observaciones'];
                $consulta->placa = $post['placa'];
                $consulta->numTags = $post['numeroTags'];
                $consulta->tipificacion = 215;
                $consulta->usuarioId = $id;
                $consulta->fechaReagendamiento = $fechaHoy;
                $consulta->fechaGestion = $fechaHoy;
                $consulta->ip = $ip;

                if($consulta->save()){
                    $exito = json_encode($post['placa']);
                    $exito = $this->view->exito = $exito;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$exito],
                        "action"     => "reagendamiento",
                    ]);
                }else{
                    $error ="No se logro guardar la placa " .  $post['placa'] . " comuniquese con el administrador";
                    $error = json_encode($error);
                    $this->view->error = json_decode($error);
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$error],
                        "action"     => "index",
                    ]);
                }
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401"
                ]
            );
        }
    }

    public function buscarLocalidadAction(){
        $post = $this->request->getPost();        
        if ($this->session->get("role") == 5){
            if(isset($post['ciudadResidencia']) && isset($post['traerLocalidad'])){
                $ciudad = $post['ciudadResidencia'];
                $localidades = Localidad::find([
                    'conditions' => 'ciudadId = :ciudad: and estado = :estado:',
                    'bind'       => [
                        'ciudad' => $ciudad,
                        'estado' => 1
                    ]
                ]);
                $localidades = json_encode($localidades);                
                print_r($localidades);die;
            }
        }
    }

    public function buscarBarrioAction(){
        $post = $this->request->getPost();        
        if ($this->session->get("role") == 5){
            if(isset($post['localidadCliente']) && isset($post['traerBarrios'])){
                $localidad = $post['localidadCliente'];
                $barrios = Barrio::find([
                    'conditions' => 'localidadId = :localidad: and estado = :estado:',
                    'bind'       => [
                        'localidad' => $localidad,
                        'estado' => 1
                    ]
                ]);
                $barrios = json_encode($barrios);
                print_r($barrios);die;
            }
        }
    }
}
