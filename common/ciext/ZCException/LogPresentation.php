<?php

class ZCException_LogPresentation extends ZCException_Log {
    function ZCException_LogPresentation ($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion) {
        parent :: ZCException_Base ($pInnerException, $pCode, $pTipo, $pMensaje, $pDescripcion);
    }

    function handle () {
        parent::handle();

        $obj->mensaje = $this->getMessage();
        $obj->codMsg = 4;
        $obj->detalles = $this->getTraceAsString();

        echo json_encode($obj);
    }
}
?>
