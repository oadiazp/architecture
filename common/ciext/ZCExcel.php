<?php
    class ZCExcel {
        private $_excel;
        private static $_instance;

        private function  __construct() {
            $this->_excel = new PHPExcel ();
        }

        function getInstance () {
            if (self::$_instance == null)
                self::$_instance = new self ();

            return self::$_instance;
        }

        function getExcel () {
            return $this->_excel;
        }

        function save ($pFilename) {
            $io = PHPExcel_IOFactory::createWriter($this->_excel, 'Excel2007');
            $io->save($pFilename);
        }
    }
?>
