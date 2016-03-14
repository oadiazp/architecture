<?php
class Funcs extends MY_Controller {
    function Funcs () {
        parent :: MY_Controller ();
        $this->load->model ('funcs_mdl', '_funcs');
        $this->load->model ('url_mdl', '_url');
    }

    function index () {
        $this->render ('funcs');
    }

    function adicionar () {
        $this->_funcs->adicionar ($this->input->post ('funcionalidad'),
                                  $this->input->post ('alto'),
                                  $this->input->post ('ancho'),
                                  (int) ($this->input->post ('menu') == 'on'),
                                  $this->input->post ('module'));

        info_msg ('Funcionalidad adiicionada correctamente');
    }

    function cargar () {
        $json->data = $this->_funcs->cargar ($this->input->post ('module'),
                                             $this->input->post ('limit'),
                                             $this->input->post ('start'));
        $json->cant = $this->_funcs->contar ($this->input->post ('module'));

        echo json_encode ($json);
    }

    function modificar () {
        $this->_funcs->modificar ($this->input->post ('funcionalidad'),
                                  $this->input->post ('ancho'),
                                  $this->input->post ('alto'),
                                  (int) ($this->input->post ('menu') == 'on'),
                                  $this->input->post ('id'));

        info_msg ('Funcionalidad modificada correctamente');
    }

    function eliminar () {
        $this->_funcs->eliminar ($this->input->post ('idfuncionalidad'));

        info_msg ('Usuario eliminado correctamente');
    }
}
?>