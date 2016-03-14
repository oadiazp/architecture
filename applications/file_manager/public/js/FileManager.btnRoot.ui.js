Ext.ns('FileManager');
FileManager.btnRootUi = Ext.extend(Ext.Button, {
    text: '/',

    initComponent: function() {
        FileManager.btnRootUi.superclass.initComponent.call(this);
    }
});