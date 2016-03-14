<?php
    class ZCService_Simulator {
        private $_xml;
        private $_ci;

        function ZCService_Simulator () {
            $this->_ci = &get_instance();
            $this->_xml = $this->_ci->xml->ioc;
        }

        function __call ($pMethod, $pParams) {
            echo $pMethod; die;
        }
    }
?>
