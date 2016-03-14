<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class ZCException_Log extends ZCException_Base {
    function ZCException_Log ($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion) {
        parent::ZCException_Base($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion);
    }

    function handle () {
        $file = 'log/logfile.';
        $result = parent::__toString();

        $logfile = fopen ($file, 'a+');
        fwrite($logfile, $result);
        fclose($logfile);
    }
}
?>
