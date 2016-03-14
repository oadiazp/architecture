<?php
class Access extends MY_Controller {
    function Access () {
        parent :: MY_Controller ();
        $this->load->model ('access_mdl', '_access');
    }

    function index () {
        echo json_encode($this->get_files ('access'));
    }

    function load () {
        $result = array ();

        if ($this->input->post ('rol') && $this->input->post ('app'))
            if ($this->input->post ('node') == '/')
                $result = $this->_access->roots ($this->input->post ('app'));
            else
                $result = $this->_access->load ($this->input->post ('node'), 
                                                $this->input->post ('rol'),
                                                $this->session->entidad);

        echo json_encode ($result);
    }


    function check () {
        $this->_access->check ($this->input->post ('rol'),
                               substr ($this->input->post ('node'), 1),
                               $this->input->post ('status') == 'true');
    }
}
?>