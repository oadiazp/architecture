<?php
    class ZCCache {
        private $_db;
        private $_ci;
        private static $_instance;

        function  __construct() {
            /*$this->_db = &db ();
            $this->_ci = &get_instance();*/
        }

        function getInstance () {
            if (self::$_instance == null)
                self::$_instance = new self ();

            return self::$_instance;
        }

        function get ($pKey) {
            $this->_db->where ('llave', $pKey);
            $result = $this->_db->get ('cache')->row ();

            return (! $this->_isXml ($pKey)) ? unserialize($result->serializado)
                                             : $this->_unserializeXml($result->serializado);
        
        
            
        }

        function __get ($pStr) {
            return $this->get($pStr);
        }

        function  __set ($pKey, $pObj) {
            $this->add ($pKey, $pObj);
        }

        function _isXml ($pKey) {
            $this->_db->where ('llave', $pKey);
            return $this->_db->get ('cache')->row ()->xml;
        }

        function _unserializeXml ($pStr) {
            return simplexml_load_string(unserialize($pStr)->data);
        }

        function _serializeXml ($pObject) {
            $stdClass = new stdClass();
            $stdClass->data = $pObject->asXml();

            return serialize($stdClass);
        }

        /**
         * Adiciona un elemento a la cache
         *
         * @param string $pKey
         * @param mixed $pObject
         * @param boolean $pPublic
         * @param int $pTTL
         * 
         * @todo Poner los demás atributos.
         */
        function add ($pKey, $pObject, $pPublic = true, $pTTL = -1) {
          if ($pTTL == -1)
                $pTTL = $this->_ci->config->item ('ttl');

          $cache_item->llave = $pKey;

          $cache_item->xml = $pObject instanceof SimpleXMLElement;
          $cache_item->serializado = (! $pObject instanceof SimpleXMLElement ) ? serialize($pObject)
                                                                               : $this->_serializeXml ($pObject);

//          $cache_item->publico = (int) $pPublic;
//          $cache_item->idusuario = $this->_ci->session->userdata ('iduser');
//          $cache_item->inicio  = $this->_ci->config->item ('last_activity');
//          $cache_item->fin = $this->_ci->config->item ('last_activity') + $pTTL;

          $this->_db->insert ('cache', $cache_item);
        }

        function exist ($pKey) {
            $this->_db->where ('llave', $pKey);
            return $this->_db->count_all_results ('cache') > 0;
        }
    }
?>
