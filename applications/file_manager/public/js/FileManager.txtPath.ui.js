FileManager.txtPathUi = Ext.extend(Ext.form.TextField, {
    enableKeyEvents: true,
    initComponent: function() {
        FileManager.txtPathUi.superclass.initComponent.call(this);
        this.setValue ('/')
    }
});