<?php

class CambioClaveController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenido');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->role = $this->session->get("role");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->setTemplateAfter('cambioClavelayout');
        $this->date = new \DateTime('America/Bogota');
    }

    /**
     * Action para ver los datos del candidato
     */

    public function indexAction()
    {   
       $id = $this->view->iduser;
      
       $cambioClave = new Usuarios();
       $cambioClave = $cambioClave->getUsuarioCambio($id);
       
       
       foreach($cambioClave as $list){
            $data=[
                "id"        => $list['iidUser'],
                "cedula"    => $list['cedulaUser'],
                "nombre"    => $list['snombresUser'],
                "apellido"  => $list['sapellidosUser'],
                "campana"   => $list['snombreCampana'],
                "rol"       => $list['snombreRol']
            ];
       }


       
       $post = $this->request->getPost(); 
       if($post['id']){
           
           if(isset($post['id'])){
               $cambio = Usuarios::findFirst([
                   "iidUser = :id:",
                   'bind' => ['id' => $post['id']]
                   ]);
                   
                   
                   $cambio->spassUser = sha1($post['password']);
                   $cambio->cambioClave = 0;
                   $cambio->save();
                   if($cambio->save() != false){
                       
                       $this->view->cambio =1;
                    }else{
                        print_r("error");
                    }
                    
                }
            }
            
            $data = json_encode($data);
            $this->view->dato = json_decode($data);
    }
   

   
}