<?php
    /**
     * ZCAspect_Auth
     *
     * Aspecto arquitectónico de la autorizacion
     *
     * @author Omar Antonio Díaz Peña.
     * @package ZCAspect
     * @version 1.0.0
     */
    class ZCAspect_Auth {
        /**
         * Instancia de Code Igniter
         *
         * @var mixed Sigleton de CI
         */
        private $_ci;

        /**
         * Constructor del aspecto
         */
        function ZCAspect_Auth () {
            $this->_ci = &get_instance();
        }

        /**
         * auth
         */
        function auth () {
            if (! $this->_ci->session->userdata ('logged')) {
               ext_msg ('Acceso denegado', 'Error');
               die;
            }
        }
    }
?>
