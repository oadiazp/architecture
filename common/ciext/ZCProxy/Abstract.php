<?php
    class ZCProxy_Abstract {
        protected $_ci;
        protected $_service;

        function getService () {
            return $this->_service;
        }

        function ZCProxy_Abstract ($pWSDL) {
            $this->_ci = &get_instance ();

            try {
                $this->_service = new SoapClient  ($pWSDL);
            }

            catch (Exception $e) {
                debug ($e);
            }
        }

        function __call ($pMethod, $pParams = array ()) {
            return call_user_func_array (array ($this->_service, $pMethod), $pParams);
        }
    }
?>
