<?php

class HistoricoGestionAsignacion extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $historico_gestionAsignacionId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionAsignacionId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoAsignacion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $criterioAsignacion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioMensajeroId;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $observacion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioid;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $fechaGestion;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $ip;

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
        $this->setSource("historico_gestionAsignacion");
        $this->belongsTo('gestionAsignacionId', '\GestionAsignacion', 'gestionAsignacionId', ['alias' => 'GestionAsignacion']);
        $this->belongsTo('usuarioid', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'historico_gestionAsignacion';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoGestionAsignacion[]|HistoricoGestionAsignacion|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoGestionAsignacion|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
