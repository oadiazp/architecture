FileManager.txtPath = Ext.extend(FileManager.txtPathUi, {
    initComponent: function() {
        FileManager.txtPath.superclass.initComponent.call(this);
        
        this.on ('specialkey', function (tf, e) {
            if (e.getKey () == Ext.EventObject.ENTER) {
                this.scope.store.load ()
            }
        }, this)
    }
});