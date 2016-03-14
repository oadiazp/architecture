<?php
    class Entidad extends MY_Controller {
        function Entidad () {
            parent :: MY_Controller ();
        }

        function load () {
            $proxy = new ZCProxy_Security();
			$entidades = array ();
			
			if ($this->input->post ('node') == '/')
				$entidades = $proxy->getService ()->obtenerEntidades ()->item;
			else
				$entidades = $proxy->getService ()->obtenerEntidadesSubordinadasDadoIdEntidad ($this->input->post ('node'))->item;
			
			$json = array ();
			foreach ($entidades as $entidad) {
				$item->id = $entidad->idEntidad;
				$item->text = $entidad->entidad;
				$json[] = $item; $item = null;
			}
			
			echo json_encode ($json);
        }
    }