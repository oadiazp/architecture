<?php
    class ZCAspect_Abstract extends ZCLibrary {
        protected $db;
        protected $current_module;
        protected $current_controller;
        protected $current_action;

        function  __construct() {
            parent::__construct();

            $this->db = &DB();
            
            $this->current_module = $this->router->fetch_module ();
            $this->current_controller = $this->router->fetch_class ();
            $this->current_action = $this->router->fetch_method ();
        }
    }
?>
