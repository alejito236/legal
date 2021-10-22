<?php

class IndexController extends ControllerBase
{
    public function initialize()
    {   
        //echo "entro controller";die;
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->role = $this->session->get("role");
        $this->tag->setTitle('Bienvenido');
        parent::initialize();

        $this->date = new \DateTime('America/Bogota');
    }

    public function indexAction()
    {
        $post = $this->request->getPost();
            if (!$this->request->isPost()) {
        }
    }

    public function guardarSolicitudAction()
    {    
        $post = $this->request->getPost();
        
        if($post){
            ///////////////////////////////////////////////////////////////////////// 
            $area = $post['area'];
            $soporte = $post['soporte'];
            $puesto = $post['puesto'];
            $resumen = $post['resumen'];
            $descripcion = $post['descripcion'];
            $estatus = 0;                 
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            $idsolitante = $this->session->get('iduser');
                if ($idsolitante == NULL) {
                    $idsolitante = 0;
                }
            $rol = $this->session->get('role');
                if ($rol == NULL) {
                    $rol = 0;
                }
            /////////////////////////////////////////////////////////////////////////
            $agregarsolicitudes = new solicitudes();
            
            $agregarsolicitudes->idsolitante = $idsolitante; 
            $agregarsolicitudes->area = $area;
            $agregarsolicitudes->soporte = $soporte;
            $agregarsolicitudes->rol = $rol;
            $agregarsolicitudes->puesto = $puesto;
            $agregarsolicitudes->fcreacion = $dateHoy;
            $agregarsolicitudes->resumen = $resumen;
            $agregarsolicitudes->descripcion = $descripcion;
            $agregarsolicitudes->estatus = $estatus;

            /////////////////////////////////////////////////////////////////////////
            if ($agregarsolicitudes->save() == false) {
                foreach ($agregarsolicitudes->getMessages() as $message) {
                    print_r($this->flash->error((string) $message));die;
                    $this->flash->error((string) $message);
                }
            } else {

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

                $solicitudeshist = new solicitudeshistorico();
                
                $solicitudeshist->idsolicitudes = $agregarsolicitudes->idsolicitudes;
                $solicitudeshist->idsolitante = $idsolitante;  
                $solicitudeshist->area = $area;
                $solicitudeshist->soporte = $soporte;
                $solicitudeshist->rol = $rol;
                $solicitudeshist->puesto = $puesto;
                $solicitudeshist->ip = $ip;
                $solicitudeshist->fcreacion = $dateHoy;
                $solicitudeshist->resumen = $resumen;
                $solicitudeshist->descripcion = $descripcion;
                $solicitudeshist->estatus = $estatus;
                
                $solicitudeshist->save();
               print_r("data ok");die;
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