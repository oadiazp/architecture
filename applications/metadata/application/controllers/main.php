<?php
    class Main extends MY_Controller {
        function Main () {
            parent::MY_Controller();
			$this->_proxy = new ZCProxy_Security ();
        }

        function index () {
            if ($this->session->logged)
                $this->render ('main');
            else
                $this->render ('login');
        }
		
        function login () {
            $entidad = $this->_proxy->getService()->obtenerIdEntidadDadoEntidad ($this->input->post ('entidad'));

            $result = $this->_proxy->getService ()->autenticarUsuario ($this->input->post ('user'),
                                                                       $this->input->post ('passwd'),
                                                                       $entidad);

            if ($result && $result != '0') {
                $this->session->logged = true;
                $this->session->token = $result;
            }

            $url->url = base_url ();
            echo json_encode ($url);
        }

        function load () {
            $id = $this->_proxy->getService()->obtenerIdAplicacionDadoAplicacion ('Metadatos');
            $module = $this->_proxy->getService ()->obtenerModulosDadoIdAplicacionYToken ($id, $this->session->token)->item->idModulo;
            $funcs = $this->_proxy->getService()->obtenerFuncionalidadesDadoIdModuloYToken ($module, $this->session->token)->item;

            $array = array ();

            foreach ($funcs as $item) {
                $f->id = $item->idFuncionalidad;
                $f->text = $item->funcionalidad;
                $f->leaf = true;
                $f->url = $this->_proxy->getService ()->obtenerUrlPrincipalDadoIdFuncionalidad ($item->idFuncionalidad);
                $array[] = $f; $f = null;
            }

            echo json_encode ($array);
        }
    }
?>
