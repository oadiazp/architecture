<?php
    class ZCValidation_Partido extends ZCValidation_Abstract {
        function  __construct() {
            parent :: __construct ();
        }

        function validate () {
            $tope = $this->_torneo->get_tope ($this->session->torneo);
            $t = null;
            return ! ($this->_partido->esta_completo ($this->input->post ('idpartido'), $tope, $t));
        }
    }
?>
