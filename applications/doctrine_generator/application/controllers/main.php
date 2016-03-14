<?php
    class Main extends MY_Controller {
        function Main () {
            parent::MY_Controller();

            $this->load->model ('main_mdl', '_main');
        }

        function index () {
            $this->render (array ('winCreateProject-ui', 'winCreateProject', 'main-ui', 'main'));
        }
    }
?>
