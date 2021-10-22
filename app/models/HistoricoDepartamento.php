<?php

class HistoricoDepartamento extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $historico_departamentoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $departamentoId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
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
        $this->setSource("historico_departamento");
        $this->belongsTo('departamentoId', '\Departamento', 'departamentoId', ['alias' => 'Departamento']);
        $this->belongsTo('usuarioId', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'historico_departamento';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoDepartamento[]|HistoricoDepartamento|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return HistoricoDepartamento|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
