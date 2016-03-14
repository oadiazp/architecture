<?php
	class Entity extends MY_Controller {
		function Entity () {
			parent :: MY_Controller ();
			$this->load->model ('entity_mdl', '_entity');
		}
		
		function index () {
			$this->render ('entity');
		}
		
		function load () {
			if ($this->input->post ('node') == '/') 
				$result = $this->_entity->roots ();
			else 
				$result = $this->_entity->load ($this->input->post ('node'));
		
			echo json_encode ($result);
		}
		
		function adicionar () {
			$this->_entity->adicionar ($this->input->post ('parent'),
									   $this->input->post ('entidad'));
										
			info_msg ('Entidad adicionada correctamente');
		}
		
		function modificar () {
			$this->_entity->modificar ($this->input->post ('id'),
									   $this->input->post ('entidad'));
										
			info_msg ('Entidad modificada correctamente');
		}
		
		function eliminar () {
			$this->_entity->eliminar ($this->input->post ('id'));
			
			info_msg ('Entidad eliminada correctamente');
		}
		
		function move () {
			$this->_entity->move ($this->input->post ('node'),
								  $this->input->post ('parent'));
		}
	}
?>
