Ext.ns('FileManager');
FileManager.winCreateDirUi = Ext.extend(Ext.Window, {
    height: 101,
    width: 310,
    layout: {
        type: 'border'
    },
    closable: false,
    title: 'Crear directorio',
    modal: true,

    initComponent: function() {
        this.btnOk = new FileManager.btnOk ({scope : this})
        this.btnCancel = new FileManager.btnCancel ({scope : this})
        this.txtPath = new Ext.form.TextField ({
            anchor: '100%',
            fieldLabel: 'Nombre',
            scope : this,
            enableKeyEvents : true,
            listeners : {
                specialkey : function (tf, e) {
                    if (e.getKey () == Ext.EventObject.ENTER) {
                        this.scope.okFn ()
                    }
                }
            }
        })

        this.buttons = [this.btnCancel, this.btnOk]

        this.items = [
            {
                xtype: 'form',
                frame: true,
                title: '',
                region: 'center',
                items: this.txtPath
            }
        ];
        FileManager.winCreateDirUi.superclass.initComponent.call(this);
    }
});