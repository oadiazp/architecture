<?php
	class Access extends MY_Controller {
		function Access () {
			parent :: MY_Controller ();
			$this->load->model ('access_mdl', '_access');
		}
		
		function index () {
			$this->render ('access');
		}
		
		function load () {
			if ($this->input->post ('node') == '/') 
				$result = $this->_access->roots ($this->input->post ('rol'));
			else 
				$result = $this->_access->load ($this->input->post ('node'), $this->input->post ('rol'));
		
			echo json_encode ($result);
		}
		
		
		function check () {
			$this->_access->check ($this->input->post ('rol'),
									substr ($this->input->post ('node'), 1),
									$this->input->post ('status'));
		}
	}
?>