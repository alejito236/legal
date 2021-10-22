<?php

class Ciudad extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $ciudadId;

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
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $estado;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("ciudad");
        $this->hasMany('ciudadId', 'Cliente', 'ciudadResidenciaId', ['alias' => 'Cliente']);
        $this->hasMany('ciudadId', 'Cliente', 'ciudadExpedicionDocumentoId', ['alias' => 'Cliente']);
        $this->hasMany('ciudadId', 'Cliente', 'ciudadNacimientoId', ['alias' => 'Cliente']);
        $this->hasMany('ciudadId', 'HistoricoCiudad', 'ciudadId', ['alias' => 'HistoricoCiudad']);
        $this->hasMany('ciudadId', 'Localidad', 'ciudadId', ['alias' => 'Localidad']);
        $this->hasMany('ciudadId', 'Sede', 'ciudadId', ['alias' => 'Sede']);
        $this->hasMany('ciudadId', 'Venta', 'ciudadId', ['alias' => 'Venta']);
        $this->belongsTo('departamentoId', '\Departamento', 'departamentoId', ['alias' => 'Departamento']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'ciudad';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Ciudad[]|Ciudad|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Ciudad|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
