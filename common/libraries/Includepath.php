<?php
    class Includepath extends ZCLibrary {
        function __construct () {
            parent :: __construct ();

            $paths = $this->config->item ('include_paths');
            $new_paths = '';

            foreach ($paths as $path)
                    $new_paths .= '.'.PATH_SEPARATOR . $path;

            set_include_path (get_include_path () . $new_paths);
        }
    }
?>
