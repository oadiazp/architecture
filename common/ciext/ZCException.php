<?php
    class ZCException extends Exception {
        private $_inner_exception;
        private $_xml;
        private $_ci;
        private $_type;
        private $_instance;
        private $_code;

        function ZCException ($pCode, $pInnerException = null) {
            $this->_ci = &get_instance();
            $this->_xml = $this->_ci->xml->excepciones;
            $this->_code = $pCode;
            $this->_inner_exception = $pInnerException;
            $exception = $this->_xml->$pCode;

            parent::__construct((string) $exception['mensaje']);

            $this->_type = (string) $exception ['tipo'];
            $class = (string) $this->_ci->xml->tipos_excepciones->{$this->_type} ['class'];

            $this->_instance = new $class ($this->_inner_exception, $this->code, $this->_type, $this->message, '');
        }

        function handle () {
            return $this->_instance->handle ();
        }
    }
?>
