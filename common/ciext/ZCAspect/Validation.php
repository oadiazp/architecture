<?php
    class ZCAspect_Validation extends ZCAspect_Abstract {
        function  __construct() {
            parent::__construct();
        }

        function validate () {
            //Cargo el Xml
            $xml = $this->xml->ui;

            //Cargo las validaciones si tengo o no módulo
            $validations = ($this->current_module) ? $xml->{$this->current_module}->{$this->current_controller}->{$this->current_action}
                                                   : $xml->{$this->current_controller}->{$this->current_action};

            //Ejecuto las validaciones del cliente que estaban en el Xml
            if ($validations) {
                foreach ($validations->fields as $field) {
                    $id = (string) $field->field['id'];
                    $regex = (string) $this->xml->regexps->{(string) $field->field['regex']}['regex'];
                    $error = (string) $field->field['error'];

                    if (eregi($regex, $this->input->$id)) {
                        error_msg ($error); die ();
                    }
                }

                //Ejecuto las validaciones del servidor que estaban en el Xml
                foreach ($validations->bussiness as $bussines) {
                    //Instancio la clase que menciona el Xml
                    $class = (string) $bussines->class ['name'];
                    $error = (string) $bussines->class ['error'];
                    $method = (string) $bussines->class ['method'];

                    $validation = new $class ();

                    //Llamo al método abstracto
                    //Si retorna falso es porque da una excepción
                    if (! $validation->$method ()) {
                        error_msg ($error); die ();
                    }
                }
            }
        }
    }
?>
