<?php
    class ZCProxy_Akademos extends ZCProxy_Abstract{
        function  __construct() {
            parent::ZCProxy_Abstract('http://akademos2.uci.cu/servicios/v1/AkademosWS.wsdl', 'Akademos');
		}
	}
?>
