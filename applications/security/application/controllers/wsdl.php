<?php
    class Wsdl extends Controller {
        function Wsdl () {
            parent :: Controller();
        }

        function index ($pMethod) {
            header ("content-type: text/xml");
            echo file_get_contents("xml/$pMethod.wsdl");
        }
    }
?>
