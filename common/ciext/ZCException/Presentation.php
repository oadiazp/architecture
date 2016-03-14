<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class ZCException_Presentation extends ZCException_Base {

    function ZCException_Presentation ($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion) {
        parent :: ZCException_Base ($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion);
    }

    function handle () {
        $obj->mensaje = $this->getMessage();
        $obj->codMsg = 4;
        $obj->detalles = $this->getTraceAsString();

        if(isset($_SERVER['HTTP_X_REQUESTED_WITH']))
            echo json_encode($obj);
        else
            show_error($obj->mensaje);
    }
}

?>
