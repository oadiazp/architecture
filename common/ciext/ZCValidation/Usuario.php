<?php
    class ZCValidation_Usuario extends ZCValidation_Abstract {
        function  __construct() {
            parent :: __construct ();
        }

        function validate () {
			return ! $this->_usuario->exists ($this->input->post ('usuario'));
        }

        function tiene_partidos () {
            $this->load->model ('partido_mdl', '_partido');
            return ! $this->_partido->tiene_partidos ($this->input->post ('idpartido'));
        }
    }
?>
