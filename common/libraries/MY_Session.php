<?php
    class MY_Session extends CI_Session {
        function MY_Session () {
            parent :: CI_Session ();
        }

        function  __get($name) {
            return $this->userdata ($name);
        }

        function  __set($name,  $value) {
            $this->set_userdata ($name, $value);
        }
    }
?>
