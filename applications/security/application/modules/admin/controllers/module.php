<?php
class Module extends MY_Controller {
        function Module () {
            parent :: MY_Controller ();
            $this->load->model ('module_mdl', '_module');
        }

        function index () {
            echo json_encode($this->get_files ('module' ));
        }

        function load () {
            $result = array ();

            if ($this->input->post ('app'))
                if ($this->input->post ('node') == '/')
                    $result = $this->_module->roots ($this->input->post ('app'));
                else
                    $result = $this->_module->load ($this->input->post ('node'));

            echo json_encode ($result);
        }

        function adicionar () {
            $this->_module->adicionar ($this->input->post ('parent'),
                                       $this->input->post ('modulo'),
                                       $this->input->post ('app'));

            info_msg ('M&oacute;dulo modificado correctamente');
        }

        function modificar () {
            $this->_module->modificar ($this->input->post ('id'),
                                       $this->input->post ('modulo'));

            info_msg ('M&oacute;dulo modificado correctamente');
        }

        function eliminar () {
            $this->_module->eliminar ($this->input->post ('id'));

            info_msg ('M&oacute;dulo eliminado correctamente');
        }

        function move () {
            $this->_module->move ($this->input->post ('node'),
                                  $this->input->post ('parent'));
        }
}
?>