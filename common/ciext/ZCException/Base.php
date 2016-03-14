<?php

abstract class ZCException_Base extends Exception {
    protected $_inner_exception;
    protected $_codigo;
    protected $_type;
    protected $_msg;
    protected $_descripcion;

    function  ZCException_Base ($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion) {
        parent::__construct($pMensaje);

        $this->_codigo = $pCode;
        $this->_inner_exception = $pInnerException;
        $this->_descripcion = $pDescripcion;
        $this->_msg = $pMensaje;
        $this->_type = $pTipo;
    }

    function getInnerException () {
        return $this->_inner_exception;
    }

    function getType () {
        return $this->_type;
    }

    function getDescripcion () {
        return $this->_descripcion;
    }

    function getInnerExceptionToStr () {
        $str = '';

        $tmp = $this->getInnerException();

        while ($tmp != null) {
            $str .= (string) $tmp->getInnerException ();
            $tmp = $this->getInnerException();
        }

        return $str;
    }

    function getCodigo () {
        return $this->_codigo;
    }

    function  __toString() {
        return "Código: {$this->getCodigo ()}
                Tipo: {$this->getType()}
                Mensaje: {$this->getMessage()}
                Descripcion: {$this->getDescripcion()}
                Traza: {$this->getTraceAsString()}
                Línea: {$this->getLine()}
                Excepciones Interiores: {$this->getInnerExceptionToStr()}
                Fichero: {$this->getFile()}
_______________________________________________________________________________\n";
    }

    abstract function handle ();
}
?>
