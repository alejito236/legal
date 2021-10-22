<?php

class Cliente extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=11, nullable=false)
     */
    public $cedulaCliente;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $tipoDocumentoId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombres_Apellidos;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $departamentoResidenciaId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $ciudadResidenciaId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $direccionResidencia;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaExpedicionDocumento;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $ciudadExpedicionDocumentoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $telefono;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $celular1;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $celular2;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaNacimiento;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $ciudadNacimientoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $estadoCivilId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $actividadEconomicaId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $correoElectronico;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $ingresosMensuales;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $afiliacionEpsId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $salarioMensual;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $generoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $edad;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $nichoId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("cliente");
        $this->hasMany('cedulaCliente', 'Tipoventa', 'cedulaCliente', ['alias' => 'Tipoventa']);
        $this->belongsTo('tipoDocumentoId', '\Tipodocumento', 'tipoDocumentoId', ['alias' => 'Tipodocumento']);
        $this->belongsTo('nichoId', '\Nicho', 'nichoId', ['alias' => 'Nicho']);
        $this->belongsTo('departamentoResidenciaId', '\Departamento', 'departamentoId', ['alias' => 'Departamento']);
        $this->belongsTo('ciudadResidenciaId', '\Ciudad', 'ciudadId', ['alias' => 'Ciudad']);
        $this->belongsTo('ciudadExpedicionDocumentoId', '\Ciudad', 'ciudadId', ['alias' => 'Ciudad']);
        $this->belongsTo('ciudadNacimientoId', '\Ciudad', 'ciudadId', ['alias' => 'Ciudad']);
        $this->belongsTo('estadoCivilId', '\Estadocivil', 'estadoCivilId', ['alias' => 'Estadocivil']);
        $this->belongsTo('actividadEconomicaId', '\Actividadeconomica', 'actividadEconomicaId', ['alias' => 'Actividadeconomica']);
        $this->belongsTo('afiliacionEpsId', '\Afiliacioneps', 'afiliacionEpsId', ['alias' => 'Afiliacioneps']);
        $this->belongsTo('generoId', '\Genero', 'generoId', ['alias' => 'Genero']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'cliente';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Cliente[]|Cliente|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Cliente|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
