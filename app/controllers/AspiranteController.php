<?php

class AspiranteController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenido');
        parent::initialize();
        $this->view->candidato = $this->session->get("candidato");
        $this->view->idcandidato = $this->session->get("idCandidato");
        $this->view->setTemplateAfter('RRHHaspirantelayout');
        $this->date = new \DateTime('America/Bogota');
    }

    /**
     * Action para ver los datos del candidato
     */

    public function indexAction()
    {   
        // print_r( $this->session->get("candidato"));die;
        $post = $this->request->getPost();
        $this->view->menu = 1;
        $idcandidato = $this->session->get('idCandidato');
        $candidatoContrato = Rrhhcontratacion::findFirst([
            "idcandidato = :id:",
            'bind' => ['id' => $idcandidato]
        ]);

        if(isset($candidatoContrato->idcandidato)){
            
            if($candidatoContrato->changePassword == 1){
                //ya tiene clave
                if($candidatoContrato->nombres != ''){
                    //el usuario ya fue Registrado
                    $this->view->listo = 1;
                }
                else{
                    // no tiene hoja de vida
                    $cedula = $this->session->get('cedula');
                    $ciudad = $this->session->get('ciudad');

                    // traer la caja de compensación segun la ciudad del candidato
                    $ccf = new Rrhhccf();
                    $ccf = $ccf->getCCF($ciudad)->fetch();

                    $dataccf = [
                        "id"    => $ccf['idccf'],
                        "nombre"=> $ccf['nombreccf']
                    ];

                    $dataccf = json_encode($dataccf);

                    // buscar las EPS
                    $eps = new Rrhheps();
                    $eps = $eps->getEPS();

                    foreach($eps as $list){
                        $dataeps[] = [
                            "id"    => $list['ideps'],
                            "nombre"=> $list['nombreEps']
                        ];
                    }


                    $dataeps = json_encode($dataeps);
                    $afp = new Rrhhafp();
                    $afp = $afp->getAFP();
                    foreach($afp as $list){
                        $dataafp[] = [
                            "id"    => $list['idafp'],
                            "nombre"=> $list['nombreAfp']
                        ];
                    }
                    $dataafp = json_encode($dataafp);
                    $this->view->afp = json_decode($dataafp);
                    $this->view->cedula = $cedula;
                    $this->view->ccf = json_decode($dataccf);
                    $this->view->eps = json_decode($dataeps);
                }
            }
            else{

                $this->view->change = 1;

            }

        }

        else{

            $this->view->change = 1;

        }

    }

    /**
     * Action para guardar datos del usuario
     */

    public function guardarAction()
    {
        $post=array();
        $post = $this->request->getPost();
        $candidato = Rrhhcandidatos::findFirst([
            "idocCandidato = :id:",
            'bind' => ['id' => $post['documento']]
        ]);
        
        if(isset($candidato->iidCandidato)){
    
            $candidato->fcontactoCandidato = $this->date->format("Y-m-d H:i:s"); 
            $candidato->iestatusCandidato = 40;
            $candidato->iresultpsiCandidato = NULL;
            $candidato->save();

            $candidatoContrato = Rrhhcontratacion::findFirst([
                "idcandidato = :id:",
                'bind' => ['id' => $candidato->iidCandidato]
            ]);
            
            if(isset($candidatoContrato->idcandidato)){
                //isset($_FILES['fotoCC']['name']) se cambio
                
                
                if(isset($_FILES['fotoCC']['name'])){
                    $picture = $this->request->getUploadedFiles()[0];
                    if (!$picture->getError()) {

                        $ruta=('../public/img/imgContratados/');
                        if (file_exists($ruta)) {
                            // echo "La ruta - $ruta - YA existe";
                        } else {
                            mkdir($ruta, 0755); // re agrega permiso a la carpeta
                            // echo "La ruta - $ruta - NO existe";
                        }
                        
                        $tmp_name = $_FILES["fotoCC"]["tmp_name"];
                        $name = $post['documento'].$post['nombres'].$post['apellidos'].'.jpg';
                        
                        move_uploaded_file($tmp_name, $ruta.$name);
                        $candidatoContrato->image = $ruta.$post['documento'].$post['nombres'].$post['apellidos'].'.jpg';
                    }
                }
                
              
                $candidatoContrato->tipoDocumento = $candidato->stipodocCandidato;
                $candidatoContrato->documento = $candidato->idocCandidato;
                $candidatoContrato->iddepartamento = $candidato->idptoCandidato;
                $candidatoContrato->idarea = $candidato->iareaCandidato;
                $candidatoContrato->idcargo = $candidato->icargoCandidato;
                $candidatoContrato->fechaAprobado = $candidato->fechaContrato;
                $candidatoContrato->documento = $post['documento'];
                $candidatoContrato->expedida = $post['expedida'];
                $candidatoContrato->fechaexp = $post['fechaexp'];
                $candidatoContrato->genero = $post['genero'][0];
                $candidatoContrato->nombres = $post['nombres']; 
                $candidatoContrato->apellidos = $post['apellidos']; 
                $candidatoContrato->ciudadnacimiento = $post['ciudadNacimiento']; 
                $candidatoContrato->fechanacimiento = $post['fechaNacimiento']; 
                $candidatoContrato->direccionresidencia = $post['direccionResidencia']; 
                $candidatoContrato->barrio = $post['barrio']; 
                $candidatoContrato->celular = $post['celular']; 
                $candidatoContrato->telefono = $post['telefono']; 
                $candidatoContrato->correo = $post['correo']; 
                $candidatoContrato->estadocivil = $post['estadoCivil']; 
                $candidatoContrato->libretamilitar = $post['libretaMilitar']; 
                $candidatoContrato->numerolibreta = $post['numeroLibreta']; 
                
                $candidatoContrato->ccf = $post['ccf']; 
             
                $candidatoContrato->tipovivienda = $post['tipoVivienda']; 
                if($post['estrato']=="" ){
                    $candidatoContrato->estrato =0;
                }else{
                    $candidatoContrato->estrato = $post['estrato']; 
                }
                $candidatoContrato->localidad = $post['localidad']; 
                $candidatoContrato->vehiculopropio = $post['vehiculoPropio']; 
                $candidatoContrato->numeropase = $post['numeropase']; 
                $candidatoContrato->categoriapase = $post['categoriapase']; 
                $candidatoContrato->usotiempolibre = $post['tiempoLibre']; 
                $candidatoContrato->rh = $post['rh']; 
                $candidatoContrato->medicamentos = $post['medicamentos'];
                $candidatoContrato->fuma = $post['fuma']; 
                $candidatoContrato->bebidas = $post['consumeBebidas'];
                $candidatoContrato->tiempobebidas = $post['tiempoBebidas']; 
                $candidatoContrato->practicadeporte = $post['practicaDeporte']; 
                $candidatoContrato->tiempodeporte = $post['tiempoDeporte'];
                $candidatoContrato->nombresContacto1 = $post['nombreEmergencia'][0]; 
                $candidatoContrato->parentesco1 = $post['parentescoEmergencia'][0]; 
                $candidatoContrato->celularContacto1 = $post['celularEmergencia'][0];
                $candidatoContrato->nombresContacto2 = $post['nombreEmergencia'][1];
                $candidatoContrato->parentesco2 = $post['parentescoEmergencia'][1];
                $candidatoContrato->celularContacto2 = $post['celularEmergencia'][1];
                $candidatoContrato->institucionBachiller = $post['institucion']; 
                $candidatoContrato->modalidad = $post['modalidad']; 
                $candidatoContrato->añoGrado = $post['fechaGrado'];
                $candidatoContrato->respuestaPregunta = $post['pregunta'];
                $candidatoContrato->parentescoPregunta = $post['parentescoPregunta'];
                $candidatoContrato->campanaPregunta = $post['campana'];
                $candidatoContrato->save();
                
                if($post['empresa'][0]!=''){
                    $num = 0;
                    $count = count($post['empresa']);
                    for($i = 0; $i < $count; $i++){
                      
                        $experiencia = new Rrhhexperiencialaboral();

                        $experiencia->idcandidato = $candidato->iidCandidato;
                        $experiencia->empresa = $post['empresa'][$num];
                        $experiencia->telefono = $post['telefonoEmpresa'][$num];
                        $experiencia->fechaInicio = $post['fechaInicioEmpresa'][$num];
                        if($post['fechaRetiroEmpresa'][$num]!=""){
                            $experiencia->fechaFinal = $post['fechaRetiroEmpresa'][$num];
                        }                         
                        $experiencia->motivoRetiro = $post['motivoEmpresa'][$num];
                        $experiencia->cargo = $post['cargoEmpresa'][$num];
                        $experiencia->dependencia = $post['dependenciaEmpresa'][$num];
                        $experiencia->promedioSalario = $post['salarioEmpresa'][$num];
                        $experiencia->jefe = $post['jefeEmpresa'][$num];
                        
                        $experiencia->save();
                        $num++;
                    }
                }
                
                if($post['nombreFamiliar']!=''){
                    $num = 0;
                    $count = count($post['nombreFamiliar']);
                   
                    for($i = 0; $i < $count; $i++){
                        $familiar = new Rrhhcomposicionfamiliar();
                        $familiar->idcandidato = $candidato->iidCandidato;
                        $familiar->parentesco = $post['parentesco'][$num];
                        $familiar->nombreCompleto = $post['nombreFamiliar'][$num];
                        $familiar->edad = $post['edadFamiliar'][$num];
                        $familiar->genero = $post['generoFamiliar'][$num];
                        $familiar->ocupacion = $post['ocupacionFamiliar'][$num];
                        $familiar->save();
                        $num++;
                        
                    }
                   
                }
                
                if($post['tituloOtros'][0]!=''){
                    $num = 0;
                    $count = count($post['tituloOtros']);
                    
                    for($i = 0; $i < $count; $i++){
                        $familiar = new Rrhhotrostitulos();
                        $familiar->idcandidato = $candidato->iidCandidato;
                        $familiar->nivel = $post['nivelOtros'][$num];
                        $familiar->titulo = $post['tituloOtros'][$num];
                        $familiar->modalidad = $post['modalidadOtros'][$num];
                        $familiar->institucion = $post['institucionOtros'][$num];
                        if($post['fechaGradoOtros'][$num]!=""){
                            $familiar->año = $post['fechaGradoOtros'][$num];
                        }
                        // 
                        $familiar->save();

                        $num++;
                    }
                }
               
                $this->view->registro = 1;
                 return $this->dispatcher->forward(
                    [
                        "action"     => "index"
                    ]
                );

                    
            }

            else{
                $candidatoInsert = new Rrhhcontratacion();
             
                $candidatoInsert->idcandidato = $candidato->iidCandidato;
                $candidatoInsert->tipoDocumento = $candidato->stipodocCandidato;
                $candidatoInsert->documento = $candidato->idocCandidato;
                $candidatoInsert->iddepartamento = $candidato->idptoCandidato;
                $candidatoInsert->idarea = $candidato->iareaCandidato;
                $candidatoInsert->idcargo = $candidato->icargoCandidato;
                $candidatoInsert->fechaAprobado = $candidato->fechaContrato;
                $candidatoInsert->documento = $post['documento'];
                $candidatoInsert->expedida = $post['expedida'];
                $candidatoInsert->fechaexp = $post['fechaexp'];
                $candidatoInsert->genero = $post['genero'][0];
                $candidatoInsert->nombres = $post['nombres']; 
                $candidatoInsert->apellidos = $post['apellidos']; 
                $candidatoInsert->ciudadnacimiento = $post['ciudadNacimiento']; 
                $candidatoInsert->fechanacimiento = $post['fechaNacimiento']; 
                $candidatoInsert->direccionresidencia = $post['direccionResidencia']; 
                $candidatoInsert->barrio = $post['barrio']; 
                $candidatoInsert->localidad = $post['localidad']; 
                $candidatoInsert->celular = $post['celular']; 
                $candidatoInsert->telefono = $post['telefono']; 
                $candidatoInsert->correo = $post['correo']; 
                $candidatoInsert->estadocivil = $post['estadoCivil']; 
                $candidatoInsert->libretamilitar = $post['libretaMilitar']; 
                $candidatoInsert->numerolibreta = $post['numeroLibreta']; 
                $candidatoInsert->eps = $post['eps']; 
                $candidatoInsert->ccf = $post['ccf']; 
                $candidatoInsert->afp = $post['afp']; 
                $candidatoInsert->tipovivienda = $post['tipoVivienda']; 
                if($post['estrato']=="" ){
                    $candidatoContrato->estrato =0;
                }else{
                    $candidatoContrato->estrato = $post['estrato']; 
                }
                $candidatoInsert->vehiculopropio = $post['vehiculoPropio']; 
                $candidatoInsert->numeropase = $post['numeropase']; 
                $candidatoInsert->categoriapase = $post['categoriapase']; 
                $candidatoInsert->usotiempolibre = $post['tiempoLibre']; 
                $candidatoInsert->rh = $post['rh']; 
                $candidatoInsert->medicamentos = $post['medicamentos'];
                $candidatoInsert->fuma = $post['fuma']; 
                $candidatoInsert->bebidas = $post['consumeBebidas'];
                $candidatoInsert->tiempobebidas = $post['tiempoBebidas']; 
                $candidatoInsert->practicadeporte = $post['practicaDeporte']; 
                $candidatoInsert->tiempodeporte = $post['tiempoDeporte'];
                $candidatoInsert->nombresContacto1 = $post['nombreEmergencia'][0]; 
                $candidatoInsert->parentesco1 = $post['parentescoEmergencia'][0]; 
                $candidatoInsert->celularContacto1 = $post['celularEmergencia'][0];
                $candidatoInsert->nombresContacto2 = $post['nombreEmergencia'][1];
                $candidatoInsert->parentesco2 = $post['parentescoEmergencia'][1];
                $candidatoInsert->celularContacto2 = $post['celularEmergencia'][1];
                $candidatoInsert->institucionBachiller = $post['institucion']; 
                $candidatoInsert->modalidad = $post['modalidad']; 
                $candidatoInsert->añoGrado = $post['fechaGrado'];
                $candidatoInsert->save();
                if($post['empresa'][0]!=''){
                    $num = 0;
                    $count = count($post['empresa']);
                    for($i = 0; $i < $count; $i++){
                      
                        $experiencia = new Rrhhexperiencialaboral();

                        $experiencia->idcandidato = $candidato->iidCandidato;
                        $experiencia->empresa = $post['empresa'][$num];
                        $experiencia->telefono = $post['telefonoEmpresa'][$num];
                        $experiencia->fechaInicio = $post['fechaInicioEmpresa'][$num];
                        if($post['fechaRetiroEmpresa'][$num]!=""){
                            $experiencia->fechaFinal = $post['fechaRetiroEmpresa'][$num];
                        }                         
                        $experiencia->motivoRetiro = $post['motivoEmpresa'][$num];
                        $experiencia->cargo = $post['cargoEmpresa'][$num];
                        $experiencia->dependencia = $post['dependenciaEmpresa'][$num];
                        $experiencia->promedioSalario = $post['salarioEmpresa'][$num];
                        $experiencia->jefe = $post['jefeEmpresa'][$num];
                        
                        $experiencia->save();
                        $num++;
                    }
                }
                
                if($post['nombreFamiliar']!=''){
                    $num = 0;
                    $count = count($post['nombreFamiliar']);
                   
                    for($i = 0; $i < $count; $i++){
                        $familiar = new Rrhhcomposicionfamiliar();
                        $familiar->idcandidato = $candidato->iidCandidato;
                        $familiar->parentesco = $post['parentesco'][$num];
                        $familiar->nombreCompleto = $post['nombreFamiliar'][$num];
                        $familiar->edad = $post['edadFamiliar'][$num];
                        $familiar->genero = $post['generoFamiliar'][$num];
                        $familiar->ocupacion = $post['ocupacionFamiliar'][$num];
                        $familiar->save();
                        $num++;
                        
                    }
                   
                }
                
                if($post['tituloOtros'][0]!=''){
                    $num = 0;
                    $count = count($post['tituloOtros']);
                    
                    for($i = 0; $i < $count; $i++){
                        $familiar = new Rrhhotrostitulos();
                        $familiar->idcandidato = $candidato->iidCandidato;
                        $familiar->nivel = $post['nivelOtros'][$num];
                        $familiar->titulo = $post['tituloOtros'][$num];
                        $familiar->modalidad = $post['modalidadOtros'][$num];
                        $familiar->institucion = $post['institucionOtros'][$num];
                        if($post['fechaGradoOtros'][$num]!=""){
                            $familiar->año = $post['fechaGradoOtros'][$num];
                        }
                        // 
                        $familiar->save();

                        $num++;
                    }
                }
                $this->view->registro = 1;
                return $this->dispatcher->forward(
                    [
                        "params"    => [$ok],
                        "action"     => "index"
                    ]
                );
            }

            // print_r($post['empresa'][$num]);die;
        }
        // else{

        // }




    }

    /**
     * Action para cambiar contraseña
     */

    public function changePasswordAction()
    {

        $post = $this->request->getPost();
        $candidato = Rrhhcandidatos::findFirst([
            "iidCandidato = :id:",
            'bind' => ['id' => $post['idcandidato']]
        ]);

        if(isset($candidato->iidCandidato)){
            $candidato->password = sha1($post['password']);
            $candidato->save();

            $candidatoContrato = Rrhhcontratacion::findFirst([
                "idcandidato = :id:",
                'bind' => ['id' => $post['idcandidato']]
            ]);

            if(isset($candidatoContrato->idcandidato)){

                $candidatoContrato->changePassword = 1;
                $candidatoContrato->save();

                return $this->dispatcher->forward(
                    [
                        "action"     => "index"
                    ]
                );

            }
            else{

                $candidatoContrato = new Rrhhcontratacion();

                $candidatoContrato->idcandidato = $post['idcandidato'];
                $candidatoContrato->changePassword = 1;
                $candidatoContrato->save();

                return $this->dispatcher->forward(
                    [
                        "action"     => "index"
                    ]
                );

            }
        }

    }
}