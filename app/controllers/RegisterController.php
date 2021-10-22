<?php

/**
 * SessionController
 *
 * Allows to register new users
 */
class RegisterController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Sign Up/Sign In');
        parent::initialize();
    }

    /**
     * Action to register a new user
     */
    public function indexAction()
    {
        $form = new RegisterForm;

        if ($this->request->isPost()) {

            $name = $this->request->getPost('name', ['string', 'striptags']);
            $lastname = $this->request->getPost('lastname', ['string', 'striptags']);
            $username = $this->request->getPost('username', 'alphanum');
            // $email = $this->request->getPost('email', 'email');
            $password = $this->request->getPost('password');
            $cedula = $this->request->getPost('cedula');
            $active = $this->request->getPost('active');
            $repeatPassword = $this->request->getPost('repeatPassword');
            $role = $this->request->getPost('role');

            if ($password != $repeatPassword) {
                $this->flash->error('Passwords are different');
                return false;
            }

            $user = new Users();
            $user->username = $username;
            $user->password = sha1($password);
            $user->name = $name;
            $user->lastname = $lastname;
            // $user->email = $email;
            $user->cedula = $cedula;
            $user->role = $role;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->active = $active;
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    print_r($this->flash->error((string) $message));die;
                    $this->flash->error((string) $message);
                }
            } else {
                $this->tag->setDefault('email', '');
                $this->tag->setDefault('password', '');
                $this->flash->success('Gracias por registrarse, inicie sesión para comenzar a usar nuestras WebApp.');

                return $this->dispatcher->forward(
                    [
                        "controller" => "admin",
                        "action"     => "users",
                    ]
                );
            }
        }

        $this->view->form = $form;
    }

    public function editAction()
    {

        if ($this->request->getPost()) {

            $post = $this->request->getPost();

            // print_r($post);die;

            $id = $this->request->getPost('id');
            $name = $this->request->getPost('name', ['string', 'striptags']);
            $lastname = $this->request->getPost('lastname', ['string', 'striptags']);
            $username = $this->request->getPost('username', 'alphanum');
            $password = $this->request->getPost('password');
            $cedula = $this->request->getPost('cedula');
            $active = $this->request->getPost('active');
            $repeatPassword = $this->request->getPost('repeatPassword');
            $role = $this->request->getPost('role');

            if ($password != $repeatPassword) {
                $this->flash->error('Contraseñas son diferentes');
                return $this->dispatcher->forward(
                        [
                            "controller" => "admin",
                            "action"     => "users",
                        ]
                    );
            }

            $user = Users::findFirst([
                "id = :id:",
                'bind' => ['id' => $id]
            ]);

            if($user->id){

                $user->username = $username;
                $user->password = sha1($password);
                $user->name = $name;
                $user->lastname = $lastname;
                $user->cedula = $cedula;
                $user->role = $role;
                $user->updated_at = new Phalcon\Db\RawValue('now()');
                $user->active = $active;


                if ($user->save() == false) {
                    foreach ($user->getMessages() as $message) {
                        print_r($this->flash->error((string) $message));die;
                        $this->flash->error((string) $message);
                    }
                } else {

                    return $this->dispatcher->forward(
                        [
                            "controller" => "admin",
                            "action"     => "users",
                        ]
                    );
                }

            }

        }
    }

}
