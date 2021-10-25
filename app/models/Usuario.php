<?php

class Usuario extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $cedula;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombre;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $apellido;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $login;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $password;

    /**
     *
     * @var integer
     * @Column(type="integer", length=4, nullable=true)
     */
    public $estado;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $rolId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=4, nullable=true)
     */
    public $cambioPassword;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $campanaId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("usuario");
        $this->hasMany('usuarioId', 'GestionAsignacion', 'usuarioid', ['alias' => 'GestionAsignacion']);
        $this->hasMany('usuarioId', 'GestionAsignacion', 'usuarioMensajeroId', ['alias' => 'GestionAsignacion']);
        $this->hasMany('usuarioId', 'Gestionbackoffice', 'usuarioid', ['alias' => 'Gestionbackoffice']);
        $this->hasMany('usuarioId', 'Gestionexpedidor', 'usuarioid', ['alias' => 'Gestionexpedidor']);
        $this->hasMany('usuarioId', 'Gestionmotorizado', 'usuarioid', ['alias' => 'Gestionmotorizado']);
        $this->hasMany('usuarioId', 'HistoricoActividadeconomica', 'usuarioId', ['alias' => 'HistoricoActividadeconomica']);
        $this->hasMany('usuarioId', 'HistoricoAfiliacioneps', 'usuarioId', ['alias' => 'HistoricoAfiliacioneps']);
        $this->hasMany('usuarioId', 'HistoricoBarrio', 'usuarioId', ['alias' => 'HistoricoBarrio']);
        $this->hasMany('usuarioId', 'HistoricoCampana', 'usuarioId', ['alias' => 'HistoricoCampana']);
        $this->hasMany('usuarioId', 'HistoricoCiudad', 'usuarioId', ['alias' => 'HistoricoCiudad']);
        $this->hasMany('usuarioId', 'HistoricoCriterio', 'usuarioId', ['alias' => 'HistoricoCriterio']);
        $this->hasMany('usuarioId', 'HistoricoDepartamento', 'usuarioId', ['alias' => 'HistoricoDepartamento']);
        $this->hasMany('usuarioId', 'HistoricoDocumentacion', 'usuarioId', ['alias' => 'HistoricoDocumentacion']);
        $this->hasMany('usuarioId', 'HistoricoEstado', 'usuarioId', ['alias' => 'HistoricoEstado']);
        $this->hasMany('usuarioId', 'HistoricoEstadocivil', 'usuarioId', ['alias' => 'HistoricoEstadocivil']);
        $this->hasMany('usuarioId', 'HistoricoGenero', 'usuarioId', ['alias' => 'HistoricoGenero']);
        $this->hasMany('usuarioId', 'HistoricoGestionAsignacion', 'usuarioid', ['alias' => 'HistoricoGestionAsignacion']);
        $this->hasMany('usuarioId', 'HistoricoGestionbackoffice', 'usuarioid', ['alias' => 'HistoricoGestionbackoffice']);
        $this->hasMany('usuarioId', 'HistoricoGestionexpedidor', 'usuarioId', ['alias' => 'HistoricoGestionexpedidor']);
        $this->hasMany('usuarioId', 'HistoricoGestionmotorizado', 'usuarioid', ['alias' => 'HistoricoGestionmotorizado']);
        $this->hasMany('usuarioId', 'HistoricoLocalidad', 'usuarioId', ['alias' => 'HistoricoLocalidad']);
        $this->hasMany('usuarioId', 'HistoricoMediopago', 'usuarioId', ['alias' => 'HistoricoMediopago']);
        $this->hasMany('usuarioId', 'HistoricoMotivo', 'usuarioId', ['alias' => 'HistoricoMotivo']);
        $this->hasMany('usuarioId', 'HistoricoProducto', 'usuarioId', ['alias' => 'HistoricoProducto']);
        $this->hasMany('usuarioId', 'HistoricoRol', 'usuarioId', ['alias' => 'HistoricoRol']);
        $this->hasMany('usuarioId', 'HistoricoSede', 'usuarioId', ['alias' => 'HistoricoSede']);
        $this->hasMany('usuarioId', 'HistoricoTipodocumento', 'usuarioId', ['alias' => 'HistoricoTipodocumento']);
        $this->hasMany('usuarioId', 'HistoricoTipotarjeta', 'usuarioId', ['alias' => 'HistoricoTipotarjeta']);
        $this->hasMany('usuarioId', 'HistoricoUsuario', 'usuarioId', ['alias' => 'HistoricoUsuario']);
        $this->hasMany('usuarioId', 'HistoricoUsuario', 'usuarioModifico', ['alias' => 'HistoricoUsuario']);
        $this->hasMany('usuarioId', 'HistoricoVenta', 'usuarioId', ['alias' => 'HistoricoVenta']);
        $this->hasMany('usuarioId', 'Login', 'usuarioId', ['alias' => 'Login']);
        $this->belongsTo('rolId', '\Rol', 'rolId', ['alias' => 'Rol']);
        $this->belongsTo('campanaId', '\Campana', 'campanaId', ['alias' => 'Campana']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'usuario';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Usuario[]|Usuario|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Usuario|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getUsuario($usuario){
        $consulta = "SELECT u.usuarioId, u.cedula, u.nombre nombreUsuario, u.apellido apellidoUsuario, 
        r.rolId, r.nombre nombreRol, c.campanaId, c.nombre nombreCampana, u.login
        from usuario u, rol r, campana c, campana_rol cr
        where u.rolId = r.rolId and u.campanaId = c.campanaId
        and cr.campanaId = c.campanaId and cr.rolId = r.rolid and u.estado = 1 
        and u.login = upper('$usuario')
        order by 1;";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

    public function getUsuarioRol($usuario = null){
        if($usuario == null){
            $consulta = "SELECT u.usuarioId, u.cedula, u.nombre nombreAsesor, u.apellido apellidoAsesor,
            u.login, u.estado, r.rolId, r.nombre nombreRol, c.campanaId, c.nombre nombreCampana
            from usuario u, rol r, campana c, campana_rol cr 
            where u.rolId = r.rolId and c.campanaId = u.campanaId and cr.campanaId = u.campanaId
            and cr.rolId = r.rolId";
        }else{
            $consulta = "SELECT u.usuarioId, u.cedula, u.nombre nombreAsesor, u.apellido apellidoAsesor,
            u.login, u.estado, r.rolId, r.nombre nombreRol, u.campanaId
            from usuario u, rol r where u.rolId = r.rolId and 
            (u.usuarioId = '$usuario' or upper(u.nombre) like upper('%$usuario%') or upper(u.apellido) like upper('%$usuario%')
            or upper(r.nombre) like upper('%$usuario%') or u.cedula like '%$usuario%')";
        }
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

}
