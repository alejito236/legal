<?php

use Phalcon\Flash;
use Phalcon\Session;

class expedidorController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Expedidor');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->setTemplateAfter('LOGISTICAadminlayout');
        $this->date = new \DateTime('America/Bogota');
        $this->dateAnterior = new \DateTime('America/Bogota' . '-1 day');
        $this->view->campanas_roles = $this->session->get("campanas_roles");
        $this->date = new \DateTime('America/Bogota');
        $this->dateAnterior = new \DateTime('America/Bogota'.'-1 day');

        $id = $this->session->get('iduser');
        $fecha = $this->date->format("Y-m-d H:i:s");
        $usuarios = new Usuario();        
        $usuarios = Usuario::findFirst([
            "usuarioId = :id:",
            'bind' => ['id' => $id]
        ]);

        $post = $this->request->getPost(); 
        
        if(isset($post['fechaFinal'])){
            $this->session->set('filtroFechaFin', $post['fechaFinal']);            
            $this->session->set('filtroFechaIni', $post['fechaInicio']);     
            $this->session->set('contador',1);            
        }

        // $usuarios->ultimaSesion = $fecha;

        // if($usuarios->save()){
        //     echo "Entro <br>";
        // }
    }

    /**
     * Acccion para iniciar gestion de expedidor
     */

    public function indexAction(){        
        $post = $this->request->getPost();        
        $id = $this->session->get('iduser');
        $post = $this->request->getPost();  
    }


    public function generarAction(){        
        $post = $this->request->getPost();        
        $id = $this->session->get('iduser');
        $post = $this->request->getPost();
        //$ejecutaP = $this->request->get('ejecutaP');
        $get= $this->request->get();
        //$ejecutaP = $get1['ejecutaP']

        if(isset($get['ejecutaP'])){
            if($get['ejecutaP'] == 0){                
                $this->view->errorP = "Error al actualizar error";            
            }else{
                $this->view->exitoP = "Resgitros actualizados correctamente";
            }
        }

        $filtroFechaFin = $this->session->get('filtroFechaFin');
        $filtroFechaIni = $this->session->get('filtroFechaIni');
    
        if(isset($post['btnFiltrar']) || ($filtroFechaIni != '' and $filtroFechaFin != '' )){
            if($filtroFechaIni != '' and $filtroFechaFin != ''){
                $fechaInicial =  $filtroFechaIni;
                $fechaFinal = $filtroFechaFin;                
            }else{
                $fechaInicial =  $post['fechaInicio'];
                $fechaFinal = $post['fechaFinal'];
            }        
            $estadosExpedidor = new Estado();                
            $getEstadoExpedidor = $estadosExpedidor->getEstadoExpedidor();                        
            // $getEstadoExpedidor = $getEstadoExpedidor->fetchAll();
            // $getEstadoExpedidor = json_encode($getEstadoExpedidor);
            // $Estadopresupuesto[]="";
            // $estadoExpedidor[]="";
            foreach( $getEstadoExpedidor as $expedidor){
                if($expedidor["estadoid"]==27 ||$expedidor["estadoid"]==28){
                
                    $Estadopresupuesto[]=$expedidor;
                
                }
                else{
                    $estadoExpedidor[]=$expedidor;
                }
            }
            $Estadopresupuesto = json_encode($Estadopresupuesto);
            $estadoExpedidor = json_encode($estadoExpedidor);
            //     print_r($estadoExpedidor);
            //   die;
            $this->view->getEstadoExpedidor = json_decode($estadoExpedidor);

            $this->view->getEstadopresupuesto = json_decode($Estadopresupuesto);

        
        
            
            // $getEstadoExp = $estadosExpedidor->getEstadoExp();                        
            // $getEstadoExp = $getEstadoExpedidor->fetchAll();
            // $getEstadoExp = json_encode($getEstadoExp);
            // $this->view->getEstadoExp = json_decode($getEstadoExp);
            $criteriosExpedidor = new Criterio();
            $getCriteriosExpedidor = $criteriosExpedidor->getCriterioExpedidor();
            $getCriteriosExpedidor = $getCriteriosExpedidor->fetchAll();
            $getCriteriosExpedidor = json_encode($getCriteriosExpedidor);
            $this->view->getCriteriosExpedidor = json_decode($getCriteriosExpedidor);
    
    
            $Gestionexpedidor = new Gestionexpedidor();
            //print_r($fechaInicial);die;            
            $getListadoExpedidor = $Gestionexpedidor->getListadoExpedidor($fechaInicial,$fechaFinal);   
            // print_r($fechaInicial,$fechaFinal);die;                    
            $getListadoExpedidor = $getListadoExpedidor->fetchAll();
            
            $getListadoExpedidor = json_encode($getListadoExpedidor);
            $getListadoExpedidor = json_decode($getListadoExpedidor);       
            if(empty($getListadoExpedidor)){
                $this->view->vacio = "No hay datos ....";
            }else{
                $this->view->getListadoExpedidor = $getListadoExpedidor;
            }
        }else{
            $this->view->vacio = "Seleccione las fechas para iniciar ....";
        }
    }

        

public function reagendarAction(){        

           
    $post = $this->request->getPost();        
    $id = $this->session->get("iduser");
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

    if(isset($post['criterio'])){
        $criterioExpedidor = $post['criterio'];
        $Estado2 = null; 
    }

    if(isset($post['Estado2'])){
        $criterioExpedidor = null;
        $Estado2 = $post['Estado2']; 
    }        

    $Id = $post['Id']; 
    $estado = $post['estado'];
    
    
    $Observaciones = $post['Observaciones']; 
    
    if(isset($post['Poliza'])){
        $Poliza = $post['Poliza'];
        // if($Poliza)
    }else{
        $Poliza = NULL;
    }
    $fechaGestion = $dateHoy;
    
    
    $ip = $ip;

    
    
    

    
        $validaGestionexpedidor = Gestionexpedidor::findFirst([
            'conditions'    => 'ventaId = :ventaId:',
            'bind'          => ['ventaId' => $Id]
        ]);
        if(empty($validaGestionexpedidor)){
            $validaPoliza = Gestionexpedidor::findFirst([
                'conditions'    => 'poliza = :poliza:',
                'bind'          => ['poliza' => $Poliza]
            ]);
            if(empty($validaPoliza)){
                $insertGestionExpedidor = new Gestionexpedidor();
                $insertGestionExpedidor->ventaId = $Id; 
                $insertGestionExpedidor->estadoPresupuesto = $estado; 
                $insertGestionExpedidor->criterioPresupuesto = $criterioExpedidor; 
                $insertGestionExpedidor->observacion = $Observaciones; 
                $insertGestionExpedidor->estadoExpedidorId = $Estado2; 
                $insertGestionExpedidor->poliza = $Poliza; 
                $insertGestionExpedidor->fechaGestion = $fechaGestion; 
                $insertGestionExpedidor->ip = $ip;
                $insertGestionExpedidor->usuarioid= $id;
    
                if($estado == 27 && $Estado2 == 1){
                    $insertGestionExpedidor->tipificacionId = 1;
                }else{
                    $insertGestionExpedidor->tipificacionId = 5;
                }
        
                //print_r($insertGestionAsignacion);die;
                    // try{
                    //     if($insertGestionExpedidor->save()==false){
                    //     $messages = $insertGestionExpedidor->getMessages();
                    //     foreach ($messages as $message) {
                    //         echo $message . PHP_EOL;
                    //     }
                    // }die;
                    // }catch(Exception $e){
                    //     echo $e;
                    // }die;
            
              
                if($insertGestionExpedidor->save()){
                    
                    $validaGestionexpedidor = HistoricoGestionexpedidor::findFirst([
                        
                        'conditions'    => 'gestionExpedidorId = :gestionExpedidorId:',
                        'bind'          => ['gestionExpedidorId' => $insertGestionExpedidor->gestionExpedidorId]
                    ]);
                    
                    if(empty($validaGestionexpedidor)){
                        $fechaInsert = $dateHoy;
                        $fechaUpdate = null;
                    }else{
                        $fechaInsert = null;
                        $fechaUpdate = $dateHoy;
                    }
                    $insertHistGestionExpe = new HistoricoGestionexpedidor();
                    $insertHistGestionExpe->gestionExpedidorId =   $insertGestionExpedidor->gestionExpedidorId;
                    $insertHistGestionExpe->ventaId=$Id; 
                    $insertHistGestionExpe->estadoPresupuesto = $estado; 
                    $insertHistGestionExpe->criterioPresupuesto = $criterioExpedidor; 
                    $insertHistGestionExpe->observacion = $Observaciones; 
                    $insertHistGestionExpe->estadoExpedidorId = $Estado2; 
                    $insertHistGestionExpe->poliza = $Poliza; 
                    $insertHistGestionExpe->fechaGestion = $fechaGestion; 
                    $insertHistGestionExpe->ip = $ip; 
                    $insertHistGestionExpe->fechaInsert = $fechaInsert; 
                    $insertHistGestionExpe->fechaUpdate = $fechaUpdate;
                    $insertHistGestionExpe->usuarioId=$id;
                    $insertHistGestionExpe->tipificacionId=$insertGestionExpedidor->tipificacionId;
                  
                    if($insertHistGestionExpe->save() == false){
                        $this->view->error = "Error al guardar historico";
                        // $messages = $insertHistGestionExpe->getMessages();
                        // foreach ($messages as $message) {
                        //     echo $message . PHP_EOL;
                        // }
                        //die;
                    }else{
                        $this->view->guardo = "Se ha guardado correctamente el registro con ID $Id";
                        return $this->dispatcher->forward(
                            [
                                "controller" => "expedidor",
                                "action"     => "generar",
                            ]
                        );
                    }
                }else{
                    $this->view->error = "Error al guardar el registro con ID $Id";
                }

            }else{
                $this->view->existe ="La poliza $Poliza ya se encuentra registrada.";
                return $this->dispatcher->forward(
                    [
                        "controller" => "expedidor",
                        "action"     => "generar",
                    ]
                );
            }

    
        }else{
            $validaGestionexpedidor->ventaId = $Id; 
            $validaGestionexpedidor->estadoPresupuesto = $estado; 
            $validaGestionexpedidor->criterioPresupuesto = $criterioExpedidor; 
            $validaGestionexpedidor->observacion = $Observaciones; 
            $validaGestionexpedidor->estadoExpedidorId = $Estado2; 
            $validaGestionexpedidor->poliza = $Poliza; 
            $validaGestionexpedidor->fechaGestion = $fechaGestion; 
            $validaGestionexpedidor->ip = $ip;
            $validaGestionexpedidor->usuarioid=$id;
            if($estado == 27 && $Estado2 == 1){
                $validaGestionexpedidor->tipificacionId = 1;
            }else{
                $validaGestionexpedidor->tipificacionId = 5;
            }
            if($validaGestionexpedidor->save()){
              
                $histGestionexpedidor = HistoricoGestionexpedidor::findFirst([
                    'conditions'    => 'gestionExpedidorId = :Id:',
                    'bind'          => ['Id' => $validaGestionexpedidor->gestionExpedidorId]
                ]);
                if(empty($histGestionexpedidor)){
                    
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = null;
                    $insertHistGestionExpe = new HistoricoGestionexpedidor();
              
                    $insertHistGestionExpe->gestionExpedidorId =   $validaGestionexpedidor->gestionExpedidorId;
                    $insertHistGestionExpe->ventaId=$Id; 
                    $insertHistGestionExpe->estadoPresupuesto = $estado; 
                    $insertHistGestionExpe->criterioPresupuesto = $criterioExpedidor; 
                    $insertHistGestionExpe->observacion = $Observaciones; 
                    $insertHistGestionExpe->estadoExpedidorId = $Estado2; 
                    $insertHistGestionExpe->poliza = $Poliza; 
                    $insertHistGestionExpe->fechaGestion = $fechaGestion; 
                    $insertHistGestionExpe->ip = $ip; 
                    $insertHistGestionExpe->fechaInsert = $fechaInsert; 
                    $insertHistGestionExpe->fechaUpdate = $fechaUpdate;
                    $insertHistGestionExpe->usuarioId=$id;
                    $insertHistGestionExpe->tipificacionId=$validaGestionexpedidor->tipificacionId;
                    if($insertHistGestionExpe->save() == false){
                        $this->view->guardo = "Error al guardar el registro con ID $Id.";                  
                    }else{
                        $this->view->guardo = "Se ha guardado correctamente el registro con ID $Id.";
                        return $this->dispatcher->forward(
                            [
                                "controller" => "expedidor",
                                "action"     => "generar",
                            ]
                        );
                    }
                // }catch(Eception $e){
                //     echo $e;
                // }die;
                }else{
                    $fechaInsert =   $histGestionexpedidor->fechaInsert;
                    $fechaUpdate = $dateHoy;
                    $histGestionexpedidor = new HistoricoGestionexpedidor();
              
                    $histGestionexpedidor->gestionExpedidorId =   $validaGestionexpedidor->gestionExpedidorId; 
                    $histGestionexpedidor->ventaId=$Id; 
                    $histGestionexpedidor->estadoPresupuesto  = $estado; 
                    $histGestionexpedidor->criterioPresupuesto = $criterioExpedidor; 
                    $histGestionexpedidor->observacion = $Observaciones; 
                    $histGestionexpedidor->estadoExpedidorId = $Estado2; 
                    $histGestionexpedidor->poliza  = $Poliza; 
                    $histGestionexpedidor->fechaGestion = $fechaGestion; 
                    $histGestionexpedidor->ip = $ip; 
                    $histGestionexpedidor->fechaInsert = $fechaInsert; 
                    $histGestionexpedidor->fechaUpdate = $fechaUpdate;
                    $histGestionexpedidor->usuarioId=$id;
                    $histGestionexpedidor->usuarioId=$id;
    
    
                //       try{
                //     $histGestionexpedidor->save();
                //     if($histGestionexpedidor->save()==false){
                //     $messages = $histGestionexpedidor->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                // }die;
                // }catch(Exception $e){
                //     echo $e;
                // }die;
                    if($histGestionexpedidor->save() == false){
                        $this->view->guardo = "Error al guardar el historico del registro con ID $Id";
                    }else{
                        $this->view->guardo = "Se ha guardado correctamente el registro con ID $Id";
                        return $this->dispatcher->forward(
                            [
                                "controller" => "expedidor",
                                "action"     => "generar",
                            ]
                        );
                    }
                }
               
    
            }else{
                $this->view->guardo = "Error al guardar el registro con ID $Id";
            }
        }
    
}

    /**Elimina el array de ciudades elegidas para volver a seleccionar y cargar una nueva gestion */
    public function limpiarFechaAction(){
        $post = $this->request->getPost();        
        if(isset($post['eliminarFecha'])){
            $this->session->set('filtroFechaFin', '');            
            $this->session->set('filtroFechaIni', '');                     
            $this->session->set('contador','');
            //print_r($post['eliminarArray']);die;
            echo "Borrado";die;
        }
    }

    public function ejecutaProcedimientosAction(){
        $gestionExpedidor = new Gestionexpedidor();
        try{

            $gestionExpedidor = $gestionExpedidor->ejecutaProcedimientos();
        }catch(Exception $e){
            //$this->view->errorP = "Error al actualizar error";            
            echo "0";die;
        }
        //$this->view->exitoP = "Resgitros actualizados correctamente";
        echo "1";die;
    }

}

