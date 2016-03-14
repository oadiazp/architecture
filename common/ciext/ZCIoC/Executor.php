<?php
    class ZCIoC_Executor {
        private $_lib;
        private $_xml;

        function  __construct($pXml, $pLib) {
            $this->_lib = $pLib;
            $this->_xml = $pXml;
        }

        function __call ($pMethod, $pParams) {
            $xml = null;
            $xml = $this->_xml->$pMethod;

            if ($xml == null)
                throw new ZCException ('IOC001');

            $method = (string) $xml ['method'];

            if (! method_exists($this->_lib, $method))
                throw new ZCException ('IOC002');

            return call_user_func_array (array ($this->_lib, $method), $pParams);
        }
    }
?>
