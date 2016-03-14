
FileManager.btnView = Ext.extend(FileManager.btnViewUi, {
    initComponent: function() {
        FileManager.btnView.superclass.initComponent.call(this);

        this.setHandler (function () {
        	new FileManager.winViewEdit ({
        		scope : this
        	}).show ();
        }, this)
    }
});