<?php

class HistoricoCampana extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $historico_CampanaId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $campanaId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estado;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $nombre;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $ip;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioId;

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
        $this->setSource("historico_campana");
        $this->belongsTo('campanaId', '\Campana', 'campanaId', ['alias' => 'Campana']);
        $this->belongsTo('usuarioId', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'historico_campana';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoCampana[]|HistoricoCampana|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoCampana|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
