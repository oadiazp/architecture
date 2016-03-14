<?php
	class Structure extends MY_Controller {
		function Structure () {
			parent :: MY_Controller ();
		}
		
		function index () {
                    echo json_encode ($this->get_files ('structure'));
		}
	}
?>