<?php
    class ZCAspect_Injector_Postconditions extends ZCAspect_Injector_Abstract{

        function ZCAspect_Postconditions() {
            self::ZCAspect_Injector_Abstract ();
        }

        function postconditions () {
            parent::conditions('post');
        }
    }
?>
