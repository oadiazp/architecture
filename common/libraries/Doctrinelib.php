<?php
    class Doctrinelib{
        private $_ci;

        function  __construct() {
            /*
             * Cargo la configuración de Doctrine
             */
            $this->_ci = &get_instance();
            $doctrine_config = $this->_ci->config->item ('doctrine');

            //Genero la Connection String
            if (! isset ($doctrine_config ['port']))
                $dsn =  "{$doctrine_config['dbdriver']}://{$doctrine_config['user']}:{$doctrine_config['passwd']}@{$doctrine_config['host']}/{$doctrine_config['db']}";
            else
                $dsn =  "{$doctrine_config['dbdriver']}://{$doctrine_config['user']}:{$doctrine_config['passwd']}@{$doctrine_config['host']}:{$doctrine_config['port']}/{$doctrine_config['db']}";

            // Load the Doctrine connection
            Doctrine_Manager::connection($dsn, $doctrine_config ['db']);

            //Se evita el uso de esquemas en toda la aplicacion
            $schemas = pg_get_schemas();

            $concat = '';

            foreach ($schemas as $schema) 
                $concat .= $schema->schema_name . ', ';

            $concat = substr($concat, 0, strlen($concat) - 2);

            $dm = Doctrine_Manager::getInstance();
            $conn = $dm->getCurrentConnection()->exec ('set search_path = ' . $concat);
        }

    }
?>
