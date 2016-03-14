<?php
    class ZCLibrary {
        protected $ci;

        function  __construct() {
            $this->ci = &get_instance ();
        }

        function  __get($name) {
            return $this->ci->$name;
        }
    }
?>
