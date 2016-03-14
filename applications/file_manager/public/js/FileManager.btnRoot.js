FileManager.btnRoot = Ext.extend(FileManager.btnRootUi, {
    initComponent: function() {
        FileManager.btnRoot.superclass.initComponent.call(this);
        
        this.setHandler (function () {
            this.txtPath.setValue ('/')
            this.setTitle ('/')
            this.store.load ()
        }, this.scope)
    }
});