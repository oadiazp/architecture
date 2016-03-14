<?php
    class ZCProxy_Telematicos extends ZCProxy_Abstract {
        function  __construct() {
            parent::ZCProxy_Abstract('https://serviciosi2.uci.cu/servicios_telematicos_ver3.0/ws_telematicos.php?wsdl');
        }

        function ObtenerUsuarioDadoIdExpedienteOUsuario ($pUser) {
            return $this->getService()->ObtenerUsuarioDadoIdExpedienteOUsuario ($pUser);
        }
    }
?>
