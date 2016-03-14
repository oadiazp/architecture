<?php
    class ZCAspect_Transaction {
        private $_db;

        function ZCAspect_Transaction () {
            $this->_db = &DB();
        }

        function beginTransaction () {
            $this->_db->trans_begin ();
        }

        function commitTransaction () {
            $this->_db->trans_commit ();
        }

        function rollbackTransaction () {
            $this->_db->trans_rollback ();
        }
    }
?>
