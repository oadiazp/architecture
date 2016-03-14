<?php
    class Xml {
       private static $_cache;
       
        function Xml () {
            
        }

        function get ($pKey) {
            //Busco en la app
            $filename = "xml/$pKey.xml";

            //Si no está ahi busco en los xml del framework
            if (! file_exists($filename))
                $filename = '../../common/'. $filename;

            $xml = simplexml_load_file($filename);
            return $xml;
        }
        
        function  __get($name) {
            return $this->get ($name);
        }
    }
?>
