<?php
	class User extends MY_Controller {
		function User () {
			parent :: MY_Controller ();
			$this->load->model ('usuario_mdl', '_usuario');
		}
		
		function index () {
			$this->render ('usuario');
		}
		
		function adicionar () {
			$this->_usuario->adicionar ($this->input->post ('usuario'),
										$this->input->post ('correo'),
										$this->input->post ('passwd'),
										$this->input->post ('rol'),
										$this->input->post ('entidad'));
										
			info_msg ('Usuario adicionado correctamente');
		}
		
		function cargar () {
			$json->data = $this->_usuario->cargar ($this->input->post ('limit'),
												   $this->input->post ('start'));
			$json->cant = $this->_usuario->contar ();
			
			echo json_encode ($json);
		}
		
		function modificar () {
			$this->_usuario->modificar ($this->input->post ('usuario'),
										$this->input->post ('correo'),
										$this->input->post ('passwd'),
										$this->input->post ('rol'),
										$this->input->post ('entidad'),
										$this->input->post ('id'));
										
			info_msg ('Usuario modificado correctamente');
		}
		
		function eliminar () {
			$this->_usuario->eliminar ($this->input->post ('id'));
			
			info_msg ('Usuario eliminado correctamente');
		}
	}
?>
