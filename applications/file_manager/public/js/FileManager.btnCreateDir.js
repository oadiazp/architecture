
FileManager.btnCreateDir = Ext.extend(FileManager.btnCreateDirUi , {
    initComponent: function() {
        FileManager.btnCreateDir.superclass.initComponent.call(this);

        this.setHandler (function () {
        	pane = Ext.getCmp ('vpFileManager').getActivePane ().getActiveTab ()

        	new FileManager.winCreateDir ({
        		pane : pane,
        		path : pane.txtPath.getValue ()
        	}).show () 
        })
    }
});