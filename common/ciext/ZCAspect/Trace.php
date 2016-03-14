<?php
	class ZCAspect_Trace {
		private $_ci;
		
		function ZCAspect_Trace () {
			$this->_ci = &get_instance ();
			$this->_ci->load->module_model ('admin', 'usuario_mdl', '_usuario');
			$this->_ci->load->module_model ('admin', 'trazas_mdl', '_trace');
			$this->_ci->load->helper ('url');
		}
		
		function trace () {
                $obj->idusuario = $this->_ci->session->userdata ('iduser');
				$obj->ip = $this->_ci->session->userdata ('ip_address');
				$obj->fecha = date ($this->_ci->xml->config->date_format ['style']);
				$obj->hora = date ($this->_ci->xml->config->time_format ['style']);
				$obj->url = current_url ();
				$this->_ci->_trace->add ($obj);
		}
	}
?>