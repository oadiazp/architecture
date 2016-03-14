<?php
	class Role extends MY_Controller {
		function Role () {
			parent :: MY_Controller ();
			$this->load->model ('role_mdl', '_role');
		}
		
		function cargar () {
			$json->data = $this->_role->cargar ();
			$json->cant = $this->_role->contar ();
			
			echo json_encode ($json);
		}
		
		function adicionar () {
			$this->_role->adicionar ($this->input->post ('rol'));
										
			info_msg ('Rol adicionado correctamente');
		}
		
		function modificar () {
			$this->_role->modificar ($this->input->post ('id'),
									 $this->input->post ('rol'));
										
			info_msg ('Rol modificado correctamente');
		}
		
		function eliminar () {
			$this->_role->eliminar ($this->input->post ('id'));
			
			info_msg ('Rol eliminado correctamente');
		}
		
		function index () {
			$this->render ('role');
		}
	}
?>
