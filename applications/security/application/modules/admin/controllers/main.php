<?php
    class Main extends MY_Controller {
        function Main () {
            parent :: Controller();
            $this->load->model ('login_mdl', '_model');
        }

        function index () {
            if ($this->session->logged)
                $this->render ('main');
            else
                $this->render ('login');
        }

        function login () {
            $r = $this->_model->login ($this->input->post ('usuario'),
                                       $this->input->post ('passwd'),
                                       $this->input->post ('entidad'));

            if ($r) {
                $this->session->logged = true;
                $this->session->usuario = $this->input->post ('usuario');
                $this->session->entidad = $this->input->post ('entidad');
            }
            
            $json->url = base_url();
            echo json_encode($json);
        }

        function logout () {
            $this->session->sess_destroy ();

            $json->url = base_url();
            echo json_encode($json);
        }
    }
?>
