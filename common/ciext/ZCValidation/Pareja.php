<?php
    /**
     * ZCValidation_Pareja
     *
     * Clase para realizar los test de la validación del lado del servidor
     */
    class ZCValidation_Pareja extends ZCValidation_Abstract {
        function  __construct() {
            parent::__construct();
        }

        function validate () {
            $pareja = json_decode($this->input->post ('pareja'));
            $pPrimero = $pareja [0];  $pSegundo = $pareja[1];

            $this->db->where ("primer_usuario = $pPrimero and segundo_usuario = $pSegundo");
            $this->db->or_where ("primer_usuario = $pSegundo and segundo_usuario = $pPrimero");
            return $this->db->count_all_results ('parejas') == 0;
        }
    }
?>
