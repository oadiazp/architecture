<?php
class Manager extends MY_Controller {
    function __construct() {
        parent::MY_Controller();
        $this->load->model ('manager_mdl', '_model');
    }
    
    function index () {
        $this->render(array (
            'ns',
            'strophe',

            'codemirror',
            'jslint',
            'Ext.ux.panel.CodeMirror',

            'Componentes.MessageBus',
            'FileManager.btnRoot.ui',
            'FileManager.btnRoot',
            'FileManager.btnUp.ui',
            'FileManager.btnUp',
            'FileManager.txtPath.ui',
            'FileManager.txtPath',
            'FileManager.stFiles',
            'FileManager.gpPane.ui',
            'FileManager.gpPane',
            'FileManager.btnView.ui',
            'FileManager.btnEdit.ui',
            'FileManager.btnCopy.ui',
            'FileManager.btnRenMove.ui',
            'FileManager.btnRemove.ui',
            'FileManager.btnCreateDir.ui',
            'FileManager.btnCreateDir',

            'FileManager.btnOk.ui',
            'FileManager.btnOk',
            'FileManager.btnCancel.ui',
            'FileManager.btnCancel',
            'FileManager.winCreateDir.ui',
            'FileManager.winCreateDir',

            'FileManager.winViewEdit.ui',
            'FileManager.winViewEdit',

            'FileManager.btnView',            
            'FileManager.btnEdit',
            'FileManager.btnCopy',
            'FileManager.btnRenMove',
            'FileManager.btnRemove',
            'FileManager.tabsFiles.ui',
            'FileManager.tabsFiles',
            'FileManager.vpFileManager.ui',
            'FileManager.vpFileManager'
        ), 'codemirror');
    }
    
    function load_files () {
        $path = $this->config->item('root') . $this->input->post ('path');
        
        $result = $this->_model->loadFiles ($path);
        
        echo json_encode(array ('data' => $result));
    }
    
    function rename () {
        rename ($this->config->item ('root') . $this->input->post ('previous'),
                $this->config->item ('root') . $this->input->post ('value'));
    }

    function mkdir () {
        $xmpp = $this->config->item ('xmpp');
        $server = $xmpp ['server'];

        $this->_xmpp = new XMPPHP_XMPP ($server ['domain'],
                                        $server ['port'],
                                        $server ['username'], 
                                        $server ['password'],
                                        'server');
        $this->_xmpp->connect ();

        mkdir ($this->config->item ('root') .'/'. $this->input->post ('path') .'/'. $this->input->post ('name'));
        $result = $this->_model->loadFiles ($this->config->item ('root') .'/'. $this->input->post ('path'));
        
        $this->_xmpp->message ('a@localhost', json_encode(array ('code' => 'M001',
                                                                 'msg'  => $result)));
    }

    function loadxmppconn () {
        $xmpp = $this->config->item ('xmpp');
        echo json_encode($xmpp ['client']);
    }
}
?>
