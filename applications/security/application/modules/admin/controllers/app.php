<?php
class App extends MY_Controller {
    function App () {
        parent::MY_Controller();
        $this->load->model ('app_mdl', '_app');
        $this->load->model ('module_mdl', '_module');
    }

    function index () {
        echo json_encode($this->get_files('app'));
    }

    function load () {
        $json->data = $this->_app->load ($this->input->post ('limit'), $this->input->post ('start'))->toArray ();
        $json->cant = $this->_app->count ();

        echo json_encode($json);
    }

    function add () {
        $this->_app->add ($this->input->post ('aplicacion'));
        ZCMessageBox::show('Aplicación adicionada correctamente', ZCMessageBox::INFO);
    }

    function upd () {
        $this->_app->upd ($this->input->post ('id'), $this->input->post ('aplicacion'));
        ZCMessageBox::show('Aplicación modificada correctamente', ZCMessageBox::INFO);
    }

    function rem () {
        $modules = $this->_app->get_modules_by_app ($this->input->post ('id'));

        foreach ($modules as $module)
            $this->_module->rem ($module->idmodulo);

        $this->_app->rem ($this->input->post ('id'));

        ZCMessageBox::show('Aplicación eliminada correctamente', ZCMessageBox::INFO);
    }
}
?>
