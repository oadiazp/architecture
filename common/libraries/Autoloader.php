<?php
    class Autoloader {
        static function autoload ($pClassname) {
            if ($pClassname == 'Model')
                    return;
                    
            $preffix = substr($pClassname, 0, 2);
            $filename = str_replace('_', '/', $pClassname);
            $full = "../../common/ciext/$filename.php";

            if  ($preffix != 'CI'){
                if (file_exists($full)) {
                  include $full;
              } else {
                  $domain_paths = array ('domain/generated', 'domain');

                    foreach ($domain_paths as $domain_path) {
                        $filename =  $pClassname . '.php';
                        $full = $domain_path . '/' . $filename;

                        if (file_exists($full))
                              include $full;
                    }
              }
            }
         }

        function Autoloader () {
            spl_autoload_register(array('Autoloader', 'autoload'));
            
        }
    }
?>
