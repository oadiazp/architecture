<?php
class ZCProxy_Residencia extends ZCProxy_Abstract {
    public function __construct() {
        parent::ZCProxy_Abstract('http://residencia2.uci.cu/servicios/v2/ResidenciaWS.php?wsdl');
    }
}
?>
