<?php
    class ZCProxy_Identificacion_V5 extends ZCProxy_Abstract {
        function  __construct() {
            parent::ZCProxy_Abstract('http://identificacion.uci.cu/servicios/v5/servicios.php?wsdl');
        }

        function ObtenerFotoDadoIdExpediente ($pIdExpediente) {
            return $this->_service->ObtenerFotoDadoIdExpediente ($pIdExpediente);
        }
    }
?>
