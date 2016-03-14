<?php
    /**
     * Extensión al controlador base de CI
     *
     * @author Omar Antonio Díaz Peña.
     * @copyright UCI
     * @package CIExt
     */

    class MY_Controller extends Controller {
        protected $excel;
        protected $ioc;
        protected $cache;

        /**
         * Controlador
         * 
         */
        function MY_Controller () {
            parent::Controller();
            
            $this->ioc   = ZCIoC   :: getInstance ();/*
            $this->excel = ZCExcel :: getInstance ();
            $this->cache = ZCCache :: getInstance ();*/
        }

        /**
         * Añade los ficheros que estan en los xml
         *
         * @param <type> $pExt
         */
        function _add_xml_files ($pExt, &$pResult) {
            $xml = $this->xml->js_loader->$pExt;

            foreach ($xml->file as $var) {
                $str = (string) $var ['name'];
                $pResult[] = $this->_find_file($str, $pExt);
            }
        }

        function _add_param_files ($pParam, $pExt, &$pResult) {
            if (is_string($pParam))
                $pResult[] = $this->_find_file($pParam, $pExt);
            else
                foreach ($pParam as $var)
                    $pResult[] = $this->_find_file ($var, $pExt);
        }

        /**
         * Buscar un fichero para incluirlo en el cliente
         *
         * @param string $pFile Nombre del fichero
         * @param string $pExt Extensión
         */
        function _find_file ($pFile, $pExt) {
            $filename = "$pFile.$pExt";

            if (!file_exists('tmp/cache.'))
                $this->_create_cache ();

            $unserialized = unserialize(file_get_contents('tmp/cache.'));
            return $unserialized [$filename] .'/'.$filename;
        }

        function get_files ($pJS = array (), $pCSS = array ()) {
            $js_array = array (); $css_array = array ();

            if (is_string($pJS))
                $js_array[] = $pJS;
            else
                $js_array = $pJS;

            if (is_string($pCSS))
                $css_array[] = $pCSS;
            else
                $css_array = $pCSS;

            $result = null; $js_paths = array (); $css_paths = array ();

            foreach ($js_array as $js)
                $js_paths[] = $this->_find_file($js, 'js');
                
            foreach ($css_array as $css)
                $css_paths[] = $this->_find_file($css, 'css');
            if ($js_paths)
                $result->js = $js_paths;
                
            if ($css_paths)
                $result->css = $css_paths;
                
            return $result;
        }

        function _create_cache () {
            $files = array ();
            $exts = array ('js', 'css');

            //Convierto el path de la web n un path local
            $begin = strpos(base_url (), '//') + 2;
            $end = strpos(substr(base_url (), $begin), '/');
            $ip = substr(base_url (), 0, $begin + $end);

            foreach ($exts as $ext) {
                $paths = $this->config->item ('paths');
                $paths = $paths [$ext];

                $modules = directory_map('application/modules', true);

                foreach ($modules as $module)
                    $paths[] = "{$this->config->item ('base_url')}public/modules/$module/$ext";


                foreach ($paths as $path) {
                    $local = str_replace($ip, $_SERVER ['DOCUMENT_ROOT'], $path);

                    $found_files = get_filenames($local);

                    if (is_array($found_files)) {
                        foreach ($found_files as $file) {
                            if (strpos($file, '.css') || strpos($file, '.js'))
                                  $files [$file] = $path;
                        }
                    }
                }
            }

            file_put_contents('tmp/cache.', serialize($files));
        }


        /**
         * Pinta una vista dados los js y las css
         *
         * @param array $pJS Arreglo de las JS que que componen la vista.
         * @param array $pCSS Arreglo de las CSS que que componen la vista.
         */
        function render ($pJS = array (), $pCSS = array (), $pView = '', $pCode = false) {
           $jsss = array (); $csss = array ();
           $js = ''; $css = '';

		   $this->_add_xml_files('js', $jsss);
           $this->_add_xml_files('css', $csss);
		   
           $this->_add_param_files($pJS, 'js', $jsss);
           $this->_add_param_files($pCSS, 'css', $csss);

            //Genero los tags HTML
            foreach ($jsss as $var)
                $js .= (! $pCode) ? "<script src = '". $var. "'></script>"
                                  : file_get_contents($var);

            foreach ($csss as $var)
                $css .=  "<link href = '" . $var. "' type='text/css' rel='stylesheet'/>";

             //Rendereo la vista con los parametros
            $data ['css'] = $css;
            $data ['js'] = $js;
            $data ['id'] = $this->input->post ('id');
            $data ['title'] = $this->config->item ('title');

            if ($pView)
                $this->load->view ($pView, $data);
            else
                $this->load->view ('view', $data);
        }


        /**
         * Esta acción se encarga de cargar todas las parametrizaciones de la ui
         *
         * @return void
         */
        function load_ui () {

            $data->fields = array (); //Arreglo de las validaciones de los campos
            $data->bussiness = array (); //Arreglo de las validaciones de negocio
            $data->labels = null; // String de las etiquetas de la ui
            
            
             // Saco del parametro de la url el controlador, la accion y si existe el modulo
            $module = $this->router->fetch_module ();
            $controller = $this->router->fetch_controller ();

            //Cargo si existe el json de las etiquetas de esa accion
            $path = ($module) ? "application/modules/$module/json/$controller"
                              : "json/$controller";

            //Obtengo la url
            $url = $this->input->post ('url');

            //¿Cual es la posición del controlador?
            $last = strripos($url, '/');
            //La acción es lo que queda de la url. Obvio ¿verdad?
            $action = substr($url, $last);

            /**
             * Pero como a nadie que no tenga un frijol en el cerebro se
             * le ocurre ponerle a un método en el controlador con el mismo
             * nombre del controlador ¿Ese no es el constructor?.
             *
             * Si eso pasa es que me pusieron el método por omisión,
             * o sea, el index
             */
            if ($action == '/')
                $action = 'index';

            //Nombre del fichero
            $file = "$path/$action.json";

            //Si existe el fichero lo cargo
            if (file_exists($file))
                $data->labels = file_get_contents($file);
            
            //Cargo el xml
            $xml = $this->xml->ui;

            //Cargo las validaciones si tengo o no módulo
            $ui = ($module) ? @$xml->$module->$controller->$action
                            : @$xml->$controller->$action;


            //Añado los campos al json
            if ($ui && $ui->fields) {
                foreach ($ui->fields->field as $field) {
                    //Añado los campos para la validacion del lado del cliente
                    $json_field->regex = (string) $this->xml->regexps->{(string) $field['regex']}['regex'];
                    $json_field->id = (string) $field['id'];
                    $json_field->regexText = (string) $field['error'];

                    if ($field ['blankText'])
                          $json_field->blankText = (string) $field['blankText'];

                    $data->fields[] = $json_field; $json_field = null;
                }
            }

            echo json_encode($data); //Envia la validacion al cliente
        }
        
    }
?>
