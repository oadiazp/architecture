<?php
    class Xmpp extends MY_Controller {
        function  __construct() {
            parent::Controller();
        }

        function index () {
            if (! $this->session->logged)
                $this->render (array ('strophe', 'namespace', 'winLogin', 'login'));
            else
                $this->render (array ('strophe', 'namespace', 'winLogin', 'main'));
        }

        function login () {
            $conn = new XMPPHP_BOSH($this->input->post ('server'),
                                    $port, $user, $password, $resource, $server, $printlog, $loglevel)
            $obj->url = config_item('base_url');
            echo json_encode($obj);
        }
    }
?>
