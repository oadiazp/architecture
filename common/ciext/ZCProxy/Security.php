<?php
    class ZCProxy_Security extends ZCProxy_Abstract {
        public function  __construct() {
            parent::ZCProxy_Abstract('http://localhost/architecture/applications/security/public/ws/Security.php?wsdl');
        }
    }
?>
