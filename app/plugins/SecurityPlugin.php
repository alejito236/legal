<?php

use Phalcon\Acl;
use Phalcon\Acl\Role;
use Phalcon\Acl\Resource;
use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Acl\Adapter\Memory as AclList;

/**
 * SecurityPlugin
 *
 * This is the security plugin which controls that users only have access to the modules they're assigned to
 */
class SecurityPlugin extends Plugin
{
	/**
	 * Returns an existing or new access control list
	 *
	 * @returns AclList
	 */
	public function getAcl()
	{  
		if (!isset($this->persistent->acl)) {
			
			$acl = new AclList();

			$acl->setDefaultAction(Acl::DENY);

			// Register roles
			$roles = [
				'users'  => new Role(
					'Users',
					'Member privileges, granted after sign in.'
				),
				'guests' => new Role(
					'Guests',
					'Anyone browsing the site who is not signed in is considered to be a "Guest".'
				)
			];

			foreach ($roles as $role) {
				$acl->addRole($role);
			}
          
			//Private area resources
			$privateResources = [
				'administrador'			=> ['index' , 'usuarios', 'editUsuario', 'nuevoUsuario','liberarRegistroBack','limpiarGestion' ],
				'LOGISTICAcoordinador'	=> ['index' , 'convenio', 'guardarConvenio', 'actualizarConvenio', 'eliminarConvenio', 'reagendamiento', 'reporteTipificaciones', 'reporteVentasAsesor', 'reporteReagendamientoVentasAsesor', 'contactos', 'usuarios', 'nuevoUsuario', 'editUsuario', 'cargarBase','reporteContactados','reportePresentacionPersonal','reporteConoceMembresias','reporteAdquiereMembresia'],
				'GOPASSasesor'			=> ['index' , 'fueraDeBase' , 'guardar' , 'guardarfuera' , 'contactos' , 'calidad', 'reagendamiento', 'reagendar','buscarLocalidad','buscarBarrio'],
				'GOPASSsac'				=> ['index' , 'reagendar', 'historico','postventa', 'fidelizacion','guardarPostventa','guardarFidelizacion','buscarLocalidad','buscarBarrio','gestionBack'],
				'GOPASSsac'				=> ['index' , 'reagendar', 'historico','postventa', 'fidelizacion','guardarPostventa','guardarFidelizacion','buscarLocalidad','buscarBarrio'],
				'Backoffice'			=> ['index' ,'anular','gestion', 'guardarGestion','limpiarEnGestion','borrarArrayCiudades','anulados'],
				'Asignacion'			=> ['index','guardarGestion','limpiarFecha'],
				'expedidor'				=> ['index' ,'generar','reagendar','limpiarFecha','ejecutaProcedimientos'],
				'gestionar'				=> ['index']
			];
			
			foreach ($privateResources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			//Public area resources
			$publicResources = [
				'index'      => ['index', 'guardarSolicitud'],
				'about'      => ['index'],
				'errors'     => ['show401', 'show404', 'show500'],
				'session'    => ['index', 'register', 'start', 'end'],
				'contact'    => ['index', 'send'],
				'prueba'	 => ['index'],
				'aspirante'	 => ['session']
			];
			foreach ($publicResources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			//Grant access to public areas to both users and guests
			foreach ($roles as $role) {
				foreach ($publicResources as $resource => $actions) {
					foreach ($actions as $action){
						$acl->allow($role->getName(), $resource, $action);
					}
				}
			}

			//Grant access to private area to role Users
			foreach ($privateResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Users', $resource, $action);
				}
			}

			//The acl is stored in session, APC would be useful here too
			$this->persistent->acl = $acl;
		}
	
		return $this->persistent->acl;
	}

	/**
	 * This action is executed before execute any action in the application
	 *
	 * @param Event $event
	 * @param Dispatcher $dispatcher
	 * @return bool
	 */
	public function beforeExecuteRoute(Event $event, Dispatcher $dispatcher)
	{
		$auth = $this->session->get('auth');
		if (!$auth){
			$role = 'Guests';
		} else {
			$role = 'Users';
		}
		$usuarios = new Usuario();

		#Se asigna formato a la hora y horario,hora Bogota Formato mes dia year
		date_default_timezone_set('America/Bogota');
		$DateAndTime2 = date('Y-m-d H:i:s ');
		

		#preguntamos si hay una cuenta en uso realize lo siguiente
		if ($this->session->get('auth')) {

			$usuario = $this->session->get('username');
			$userget = Usuario::findFirst([
				'conditions' => 'login = :login:',
				'bind' 		 => [ 'login' => $usuario ]
			]);
			$getLogin = Login::findFirst([
				"conditions"	=> "usuarioId = :usuarioId:",
				"bind"			=> ["usuarioId" => $userget->usuarioId]
			]);
			

			$getip = $_SERVER['REMOTE_ADDR'];			
			$ipdb =  $getLogin->ip;			
			
			if (strcmp($ipdb, $getip) == 0) {
				$userget->fechaIngreso = $DateAndTime2;				
				$userget->save();				
			}

			if (strcmp($ipdb, $getip) !== 0) {
				$this->session->destroy();
				$this->flash->error('Hay otro persona activa en esta sesion. entro 1 ');
			}
		}
		$controller = $dispatcher->getControllerName();
		$action = $dispatcher->getActionName();

		$acl = $this->getAcl();
  		print_r	($acl->isResource($controller));
		if (!$acl->isResource($controller)) {
			$dispatcher->forward([
				'controller' => 'errors',
				'action'     => 'show404'
			]);

			return false;
		}

		$allowed = $acl->isAllowed($role, $controller, $action);
		if (!$allowed) {
			$dispatcher->forward([
				'controller' => 'errors',
				'action'     => 'show401'
			]);
                        $this->session->destroy();
			return false;
		}
	}
}
