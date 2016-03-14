<?php
    class ZCAspect_Injector_Abstract{
        protected $_ci;
        protected $_current_module;
        protected $_current_controller;
        protected $_current_action;
        protected $_xmls;
        
        function ZCAspect_Injector_Abstract () {
            $this->_ci = &get_instance();

            $this->_current_module =  $this->_ci->router->fetch_module ();
            $this->_current_controller = $this->_ci->router->fetch_class ();
            $this->_current_action = $this->_ci->router->fetch_method ();

            $names = array ('weaver',
                           'aspects',
                           'aspecttemplate');

            foreach ($names as $var)
                 $this->_xmls [$var] = $this->_ci->xml->$var;
        }


        function conditions ($pTime) {
            //Cargo el weaver si tengo modulos o si no
            $weaver = ($this->_current_module) ? @$this->_xmls ['weaver']->{$this->_current_module}->{$this->_current_controller}->{$this->_current_action}
                                               : @$this->_xmls ['weaver']->{$this->_current_controller}->{$this->_current_action};

            //Si tengo aspectos para esta acción
            if (isset ($weaver)) {
                //Cargo los aspectos de la plantilla aspectos
                $aspecttemplate = (string) $weaver ['aspecttemplate'];
                $aspects = $this->_xmls ['aspecttemplate']->$aspecttemplate->$pTime;

                //Si tengo aspectos
                if (isset ($aspects)) {
                    foreach ($aspects as $var) {
                        //Busco el aspecto
                        $aspect = (string) $var->aspect ['name'];

                        //Si está habilitado
                        if ((string) $var->aspect ['enabled'] === 'true') {
                            $tmp = $this->_xmls ['aspects']->$aspect;
                            $class = (string)  $tmp ['class']; $method = (string)  $tmp ['method'];

                            //Instancia el aspecto
                            $instance = new $class ();
                            
                            //Si existe el método lo invocas
                            if (method_exists($instance, $method)) 
                                $instance->$method ();
                         }
                     }
                 }
            }
        }
    }
?>
