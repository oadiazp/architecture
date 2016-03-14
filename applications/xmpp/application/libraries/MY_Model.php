<?php
    class MY_Model extends Model{
        protected $ioc;

        function MY_Model (){
            parent::Model ();
            $this->ioc = ZCIoC :: getInstance ();
        }

        function add_process_where () {
            $this->db->where ('idproceso', $this->ioc->nomencladores->get_current_process ());
        }

        function add_entity_where () {
            $this->db->where ('identidad', $this->ioc->nomencladores->get_current_entity ());
        }
        
        function get_all_children_entities ($pIdEntidad, &$pResult = array ()) {
            $this->db->select ('identidad');
            $this->db->where ('idpadre', $pIdEntidad);
            $results = $this->db->get ('entidades')->result ();
            $pResult = extend($pResult, $results);

            foreach ($pResult as $var) {
                $this->db->select ('identidad');
                $this->db->where ('idpadre', $var->identidad);
                $results = $this->db->get ('entidades')->result ();
                $pResult = extend($pResult, $results);
            }

            return $pResult;
        }
    }
?>
