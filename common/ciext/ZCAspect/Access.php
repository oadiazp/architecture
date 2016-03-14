<?php
    class ZCAspect_Access {
        private $_ci;
        
        function  __construct() {
            $this->_ci = &get_instance ();
        }

        function access () {
            $url = current_url();
            $acl = $this->_ci->session->userdata ('acl');
            
            foreach ($acl as $access)
                if ($access == $url)
                    return true;

            ext_msg ('Acceso denegado', 'Error');
            die;
        }
    }
?>
