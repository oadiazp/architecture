FileManager.winCreateDir = Ext.extend(FileManager.winCreateDirUi, {
	okFn : function () {
    	Ext.Ajax.request ({
            url : 'manager/mkdir',
            scope : this,
            params: { 
                      path : this.path, 
                      name : this.txtPath.getValue ()
                    },
            success : function (pResponse, pOpt) {
                this.pane.store.loadData (Ext.decode (pResponse.responseText))
                this.txtPath.setValue ('');
                pOpt.scope.hide ()
            }
        })	
    },
    cancelFn : function () {
    	this.hide ()
    },
    initComponent: function() {
        FileManager.winCreateDir.superclass.initComponent.call(this);

        this.btnOk.setHandler (function () {
        	this.okFn ()
        }, this)

		this.btnCancel.setHandler (function () {
        	this.cancelFn ()
        }, this)        
    }
});