Ext.ns('FileManager');
FileManager.btnUpUi = Ext.extend(Ext.Button, {
    text: '..',

    initComponent: function() {
        FileManager.btnUpUi.superclass.initComponent.call(this);
    }
});