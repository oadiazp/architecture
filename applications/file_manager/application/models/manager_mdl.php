<?php
class Manager_mdl extends Model {
	function __construct () {
		parent :: Model ();
	}

	function loadFiles ($pPath) {
		$f = new ZCFile($pPath);
        $dirs = $f->lsd (); $all = $f->ls();

        if (! is_array ($all))
            $all = array ();

        if (! is_array ($dirs)) {
            $dirs = array ();
        }

        $files = array_diff($all, $dirs);

        $result = array ();
        
        foreach ($dirs as $dir) {
            $n = substr($dir, strrpos($dir, '/') + 1);
            $result[] = array ('name' => $n, 'size' => '[DIR]', 'type' => 'dir');
        }
            
        
        foreach ($files as $file) {
            $info = $f->infos ($file);
            $result[] = array ('name' => substr($file, strrpos($file, '/') + 1), 
                               'size' => $info ['size'], 
                               'type' => 'file',
                               'date' => date("d/m/Y", $info ['ctime']));
        }

        return $result;
	}
}
?>