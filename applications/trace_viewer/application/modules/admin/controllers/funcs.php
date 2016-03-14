<?php
class Funcs extends MY_Controller {
		function Funcs () {
			parent :: MY_Controller ();
			$this->load->model ('funcs_mdl', '_funcs');
		}
		
		function index () {
			$this->render ('funcs');
		}
		
		function adicionar () {
			$this->_funcs->adicionar ($this->input->post ('funcionalidad'),	
									  $this->input->post ('url'),
									  $this->input->post ('alto'),
									  $this->input->post ('ancho'),
									  (int) ($this->input->post ('menu') == 'on'),
									  $this->input->post ('node'));
										
			info_msg ('Funcionalidad adiicionada correctamente');
		}
		
		function cargar () {
			$json->data = $this->_funcs->cargar ($this->input->post ('limit'),
												   $this->input->post ('start'));
			$json->cant = $this->_funcs->contar ();
			
			echo json_encode ($json);
		}
		
		function modificar () {
			$this->_funcs->modificar ($this->input->post ('funcionalidad'),
									  $this->input->post ('url'),
									  $this->input->post ('alto'),
									  $this->input->post ('ancho'),
									  (int) ($this->input->post ('menu') == 'on'),
									  $this->input->post ('id'));
										
			info_msg ('Funcionalidad modificada correctamente');
		}
		
		function eliminar () {
			$this->_funcs->eliminar ($this->input->post ('id'));
			
			info_msg ('Usuario eliminado correctamente');
		}
	}
?>