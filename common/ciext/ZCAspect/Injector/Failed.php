<?php
    class ZCAspect_Injector_Failed extends ZCAspect_Injector_Abstract{
        function ZCAspect_Injector_Failed () {
            parent::ZCAspect_Injector_Abstract();
        }

        function failed ($pController, $pAction) {
            $this->_current_controller = $pController;
            $this->_current_action = $pAction;
            
            parent::conditions('failed');
        }
    }
?>
