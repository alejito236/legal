<?php

class Estado extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombre;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("estado");
        $this->hasMany('estadoId', 'EstadoRol', 'estadoId', ['alias' => 'EstadoRol']);
        $this->hasMany('estadoId', 'GestionAsignacion', 'estadoAsignacion', ['alias' => 'GestionAsignacion']);
        $this->hasMany('estadoId', 'Gestionbackoffice', 'estadoBackoffice', ['alias' => 'Gestionbackoffice']);
        $this->hasMany('estadoId', 'Gestionbackoffice', 'estadoCierre', ['alias' => 'Gestionbackoffice']);
        $this->hasMany('estadoId', 'Gestionmotorizado', 'estadoMotorizado', ['alias' => 'Gestionmotorizado']);
        $this->hasMany('estadoId', 'HistoricoEstado', 'estadoId', ['alias' => 'HistoricoEstado']);
        $this->hasMany('estadoId', 'Tipoventa', 'estadoId', ['alias' => 'Tipoventa']);
        $this->hasMany('estadoId', 'Venta', 'estadoId', ['alias' => 'Venta']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'estado';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Estado[]|Estado|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Estado|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getEstadosBack(){
        $consulta = "SELECT e.estadoid, e.nombre
        FROM estado e, estado_rol er, rol r
        where e.estadoid = er.estadoid and r.rolid = er.rolid
        and r.rolid = 1 and e.estadoid not in(21,22)";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

    public function getEstadoAsignacion(){
        $consulta = "SELECT e.estadoid, e.nombre
        from rol r, estado_rol re, estado e
        where r.rolid = re.rolid and re.estadoid = e.estadoid
        and r.rolid = 2 and e.estadoid != 23";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
    public function getEstadoExpedidor(){
        $consulta = "SELECT e.estadoid, e.nombre
        from rol r, estado_rol re, estado e
        where r.rolid = re.rolid and re.estadoid = e.estadoid
        and r.rolid = 3 and e.estadoid != 33";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
}
