<?php
    class ZCProxy_ASSETS extends  ZCProxy_Abstract{
		function ZCProxy_ASSETS () {
            parent::ZCProxy_Abstract('http://assets.uci.cu/servicios/v3/AssetsWS.php?wsdl', 'ASSETS');
		}
	}
?>
