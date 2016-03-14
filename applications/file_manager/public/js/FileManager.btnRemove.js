
FileManager.btnRemove = Ext.extend(FileManager.btnRemoveUi, {
    initComponent: function() {
        FileManager.btnRemove.superclass.initComponent.call(this);

        this.setHandler (function (){
        	pane = Ext.getCmp ('vpFileManager').getActivePane ().getActiveTab ()

        	Ext.MessageBox.show ({
        		msg: 'Desea eliminar esto?',
        		title: 'File Manager',
        		buttons: Ext.MessageBox.YESNO,
        		icon: Ext.MessageBox.QUESTION,
        		scope : this,
        		fn: function (b) {
        			if (b == 'yes') {
        				Ext.Ajax.request ({
        					url : 'manager/remove',
        					params: {
        						files : Ext.encode (pane.getSelectionModel ().getSelections ())
        					}
        				})
        			}
        		}
        	})
        }, this)
    }
});