<?php
    class Url extends MY_Controller {
        function Url () {
            parent :: MY_Controller();
            $this->load->model ('url_mdl', '_url');
        }

        function cargar () {
            $data->data = $this->_url->cargar ($this->input->post  ('func'),
                                               $this->input->post  ('start'),
                                               $this->input->post  ('limit'));

            $data->cant = $this->_url->contar ($this->input->post  ('func'));

            echo json_encode ($data);
        }

        function adicionar () {
			$principal = (int) $this->input->post ('principal') == 'on';
		
            $this->_url->adicionar ($this->input->post  ('func'),
                                    $this->input->post  ('url'),
									$principal);

            ZCMessageBox::show('Url adicionada correctamente', ZCMessageBox::INFO);
        }

        function eliminar () {
            $this->_url->eliminar ($this->input->post  ('idurl'));

            ZCMessageBox::show('Url eliminada correctamente', ZCMessageBox::INFO);
        }

        function modificar () {
			$principal = (int) $this->input->post ('principal') == 'on';
		
            $this->_url->modificar ($this->input->post  ('idurl'),
                                    $this->input->post  ('url'),
									$principal);

            ZCMessageBox::show('Url modificada correctamente', ZCMessageBox::INFO);
        }
    }
?>
