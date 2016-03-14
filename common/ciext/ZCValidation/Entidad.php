<?php
    class ZCValidation_Entidad extends ZCValidation_Abstract {
        function  __construct() {
            parent :: __construct ();
        }

        function validate () {
            $this->db->where ('identidad', $this->input->post ('id'));
            return $this->db->count_all_results ('mod_admin.roles_usuarios_entidades') == 0;
        }
    }
?>
