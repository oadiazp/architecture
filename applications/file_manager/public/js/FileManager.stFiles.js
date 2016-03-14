FileManager.stFiles = Ext.extend(Ext.data.JsonStore, {
    constructor: function(cfg) {
        cfg = cfg || {};
        FileManager.stFiles.superclass.constructor.call(this, Ext.apply({
            autoLoad: true,
            root : 'data',
            url : 'manager/load_files',
            listeners : {
                beforeload : function (s) {
                    s.baseParams.path = s.scope.txtPath.getValue ()
                },
                load: function (s) {
                    s.scope.scope.getActiveTab ().getSelectionModel ().selectFirstRow ()
                }
            },
            storeId: 'MyJsonStore',
            fields: [
                {
                    name: 'type'
                },
                {
                    name: 'name'
                },
                {
                    name: 'size'
                },
                {
                    name: 'date'
                }
            ]
        }, cfg));
    }
});