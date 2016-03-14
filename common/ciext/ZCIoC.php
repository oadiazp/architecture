<?php
    class ZCIoC {
        static $_instance;
        private $_xml;
        private $_ci;

        private function  __construct () {
            $this->_ci = &get_instance();
            $this->_xml = $this->_ci->xml->ioc;
        }

        function getInstance () {
            if (self::$_instance == null)
                self::$_instance = new self ();

            return self::$_instance;
        }

        function __get ($pModule) {
            $xml =  $this->_xml->$pModule;
            $lib = (string) $xml  ['library'];

            include_once "application/modules/$pModule/libraries/$lib.php";

            $lib = ucfirst($lib);
            return new ZCIoC_Executor ($xml, new $lib ());
        }
    }
?>
