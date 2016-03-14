FileManager.btnUp = Ext.extend(FileManager.btnUpUi, {
    initComponent: function() {
        FileManager.btnUp.superclass.initComponent.call(this);
		
        this.setHandler (function () {
            path = this.txtPath.getValue ()
            parts = path.split ('/')
            
            newPath = ''

            for (i = 1; i < parts.length - 2; i++)
                newPath += "/" + parts [i]

            this.txtPath.setValue (newPath + '/')
            
            if (parts.length > 3)
                this.setTitle (parts [parts.length - 3])
            else
                this.setTitle ('/')
            
            this.store.load ()
        }, this.scope)
    }
});