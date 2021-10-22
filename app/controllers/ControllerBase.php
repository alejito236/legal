<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{

    protected function initialize()
    {


        $this->serverapi = $this->config->application->baseUriApi;
        $this->tag->prependTitle('Logística Master | ');
        $this->view->setTemplateAfter('main');
        $this->view->menu = 'index';

        $post = $this->request->getPost();
        
        //////////////////////////////////////////////////////////////////////////
        
       $iduserV = $this->session->get('iduser');

       if (isset($iduserV)) {
           $valArray[] = [
               "estatus"       => "1",
               "idsolicitudes" => "1",
               "resumen"       => "No hay Resumen",
           ];
           
           $valArray = json_encode($valArray);
           $this->view->valArray = json_decode($valArray);
       }
    }

     //Magic Para los servicios
     public function sendRedirect($url, $data)
     {
         $ch = curl_init();
         curl_setopt($ch, CURLOPT_URL, $url);
         curl_setopt($ch, CURLOPT_POST, 1);
         curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
         curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
         $serverOutput = curl_exec ($ch);
         curl_close ($ch);
         return $serverOutput;
     }
    
}
