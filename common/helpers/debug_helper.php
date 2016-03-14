<?php
    function debug ($pVar, $pDie = true) {
        echo '<pre>';
        print_r ($pVar);
        
        if ($pDie)
            die;
    }
?>
