<?php
    class Ui extends MY_Controller {
        function Ui () {
            parent :: MY_Controller();
        }

        function load_ui () {
            $data->fields = array (); //Arreglo de las validaciones de los campos
            $labels = null;

            
            $module = ''; $controller = ''; $action = '';

            $url = $this->input->post ('url');

            if ($url != '') {
                $parts = explode('/', $url);
                $long = count($parts);

                if ($long == 2) {
                    $module = $parts [0];
                    $controller = $parts [1];
                    $action = 'index';
                } else {
                    $module = $parts [$long - 3];
                    $controller = $parts [$long - 2];
                    $action = $parts [$long - 1];
                }
                
                
            } else {
                $module = 'init';
                $controller = 'init';
                $action = 'init';
            }

            $xml = @$this->xml->ui->$module->$controller->$action->fields;

            if ($xml)
                foreach ($xml->children () as $field) {
                    $f->id = (string) $field['id'];
                    $f->blankText = (string) $field['blankText'];

                    $regExpAlias = (string) $field['regex'];
                    $tmp = $this->xml->regexps->$regExpAlias;
                    $f->regex = (string)  $tmp ['regex'];

                    $f->regexText = (string) $field ['regexText'];

                    $data->fields[] = $f; $f = null;
                }

            $lang = $this->config->item ('lang');
            $path = "public/modules/$module/json/$controller/$action/$lang.json";

            if (file_exists($path))
                $data->labels = file_get_contents($path);

            echo json_encode($data); //Envia la validacion al cliente
        }
    }
?>
