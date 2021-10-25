<?php

class HistoricoGestionmotorizado extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $histoico_gestionMotorizadoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionMotorizadoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoMotorizado;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioid;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $motivoId;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $observacion;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $ubicacionReporte;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $fechaGestion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $documentacionId;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaInsert;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaUpdate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaDelete;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("historico_gestionmotorizado");
        $this->belongsTo('gestionMotorizadoId', '\Gestionmotorizado', 'gestionMotorizadoId', ['alias' => 'Gestionmotorizado']);
        $this->belongsTo('usuarioid', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'historico_gestionmotorizado';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoGestionmotorizado[]|HistoricoGestionmotorizado|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoGestionmotorizado|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getHistoricoReporte($gestionAsignacionId){
        $consulta = "SELECT DATE_FORMAT(hgm.fechagestion,'%d/%m/%Y') fecha, e.nombre nombreEstado, m.nombre nombreMotivo, hgm.observacion,
        concat(EXTRACT(HOUR from hgm.fechagestion),':',EXTRACT(MINUTE from hgm.fechagestion))  hora, hgm.ubicacionReporte
        from historico_gestionmotorizado hgm, estado e, motivo m, gestionmotorizado gm 
        where hgm.estadoMotorizado = e.estadoid and hgm.motivoid = m.motivoid and hgm.gestionmotorizadoid = gm.gestionmotorizadoid
        and gm.gestionAsignacionId = $gestionAsignacionId";
        //echo $consulta;die;
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

}
