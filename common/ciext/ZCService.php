<?php
    class ZCService {
        protected $_ci;
        protected $_xml;
        protected $_module;
        protected $_class;


        function ZCService ($pParams) {
            $this->_module = $pParams [0];
            $this->_class = $pParams [1];

            $this->_ci = &get_instance ();
            $this->_xml = $this->_ci->xml->ioc;
        }

        function __call ($pMethod, $pParams) {
            $xml = $this->_xml;

            echo '<pre>';
            $tmp = $xml->{$this->_module};
            $aux = $tmp->$pMethod;

            $method = (string) $aux ['method'];
            $simulate = (string) $aux ['simulate'];
            $simulate_result = (string) $aux ['simulate_result'];

            if ($simulate == 'true') {
                $simulate_result = "return $simulate_result;";

                eval ($simulate_result);
            } else {
                return 0;
            }

        }
    }
?>
