<?php
    class Xmpp extends MY_Controller {
        function  __construct() {
            parent::Controller();
        }

        function index () {
            $this->render('trace_viewer');
        }
    }
?>
