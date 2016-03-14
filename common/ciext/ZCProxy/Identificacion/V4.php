<?php
    class ZCProxy_Identificacion_V4 extends ZCProxy_Abstract {
        function  __construct() {
            parent::ZCProxy_Abstract('http://identificacion.uci.cu/servicios/v4/servicios.asmx?wsdl', 'Identificacion');
        }

        function ObtenerCredencialDadoIdExpediente ($pIdExpediente) {
            $p->IdExpediente = $pIdExpediente;
            return $this->_service->ObtenerCredencialDadoIdExpediente ($p)->ObtenerCredencialDadoIdExpedienteResult;
        }
    }
?>
