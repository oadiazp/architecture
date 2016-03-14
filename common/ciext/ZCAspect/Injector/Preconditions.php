<?php
    class ZCAspect_Injector_Preconditions extends ZCAspect_Injector_Abstract{
        private $_db;

        function ZCAspect_Injector_Preconditions () {
            self::ZCAspect_Injector_Abstract ();
        }

        function preconditions () {
            parent::conditions('pre');
        }
    }
?>
