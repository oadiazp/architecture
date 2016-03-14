<?php
    class ZCProxy_Identificacion_V3 extends ZCProxy_Abstract{
        function  __construct() {
            parent::ZCProxy_Abstract('http://identificacion.uci.cu/servicios/v3/servicios.asmx?wsdl', 'Identificacion');
        }
		
		function ObtenerPersonaActivaDadoCI ($pCI) {
			$a->CI = $pCI;
			
			return $this->_service->ObtenerPersonaActivaDadoCI ($a)->ObtenerPersonaActivaDadoCIResult;
		}
    }
?>
