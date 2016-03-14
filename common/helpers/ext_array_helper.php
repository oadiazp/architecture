<?php
    function extend ($pOriginal, $pExtension) {
        $result = array ();

        $result = $pOriginal;

        foreach ($pExtension as $var)
            $result [] = $var;

         return $result;
    }
?>
