<?php
    class ZCSvn_ClientUSVN extends ZCSvn_Client {
        function ZCSvn_ClientUSVN () {
            parent::ZCSvn_Client();
        }

        function getDirectoryFiles ($pPath) {
            $cmd = ($pPath != '/') ? "svn ls --xml --username $this->user --password $this->pass {$this->_url}/{$pPath}"
                                   : "svn ls --xml --username $this->user --password $this->pass {$this->_url}";

            //echo $cmd; die;

            ob_start();
            passthru($cmd, $return);
            $msg = ob_get_contents();
            ob_end_clean();
            
            $xml = new SimpleXMLElement ($msg);

            $path = (string) $xml->list ['path'];
            
            $tmp = substr($path, strlen($this->_url) + 1);

            $res = array ();

            foreach ($xml->list->entry as $list) {
                if ($list['kind'] == 'file') {
                    array_push($res, array("text" => (string)$list->name, "leaf" => !false, "id" => $tmp .'/'. $list->name));
                }
                else {
                    array_push($res, array("text" => (string)$list->name, "leaf" => !true, "id" => $tmp .'/'. $list->name));
                }
            }

            $sortfunc = create_function('$a,$b', 'return (strcasecmp($a["name"], $b["name"]));');
            usort($res, $sortfunc);
            return $res;
        }
    }
?>
