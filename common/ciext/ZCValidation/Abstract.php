<?php
    /**
     * ZCValidation_Abstract
     *
     * Esta es la clase base de las validaciones de negocio
     *
     * @author Omar Antonio Díaz Peña
     * @copyright MegaSoft
     * @version 1.0.0
     */
    class ZCValidation_Abstract extends ZCLibrary {
        protected $db;

        /**
         * Constructor
         * 
         * @return ZCValidation_Abstract
         */
        function  __construct() {
            parent::__construct();
            $this->db = &DB ();
        }

       /**
        * validate
        *
        * Método que se redefine para realizar las validaciones
        *
        * @return bool
        */
        function validate () {
            
        }
    }
?>
