<?php

class Gestionmotorizado extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionMotorizadoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionAsignacionId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
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
     * @Column(type="string", nullable=false)
     */
    public $ubicacionReporte;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaGestion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $documentacionId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("gestionmotorizado");
        $this->hasMany('gestionMotorizadoId', 'HistoricoGestionmotorizado', 'gestionMotorizadoId', ['alias' => 'HistoricoGestionmotorizado']);
        $this->belongsTo('gestionAsignacionId', '\GestionAsignacion', 'gestionAsignacionId', ['alias' => 'GestionAsignacion']);
        $this->belongsTo('estadoMotorizado', '\Estado', 'estadoId', ['alias' => 'Estado']);
        $this->belongsTo('motivoId', '\Motivo', 'motivoId', ['alias' => 'Motivo']);
        $this->belongsTo('usuarioid', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
        $this->belongsTo('documentacionId', '\Documentacion', 'documentacionId', ['alias' => 'Documentacion']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'gestionmotorizado';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionmotorizado[]|Gestionmotorizado|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionmotorizado|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
