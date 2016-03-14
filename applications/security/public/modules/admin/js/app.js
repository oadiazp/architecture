Security.Modules.App = Ext.extend(Componentes.CRUDGrid, {
    layout: 'fit',
    pageSize: 9,
    addFn: function () {
        this.win.setFn(function () {
            f = this.scope.frm;

            if (f.getForm ().isValid ())
                f.getForm ().submit ({
                    url: 'admin/app/add',
                    failure: function (frm) {
                        frm.scope.getStore ().reload ()
                    }
                })
        });

        this.win.show ();
    },
    updFn: function () {
        this.win.setFn(function () {
            f = this.scope.frm;

            if (f.getForm ().isValid ())
                f.getForm ().submit ({
                    url: 'admin/app/upd',
                    params: {id: this.scope.getSelectionModel ().getSelected ().data.idaplicacion},
                    failure: function (frm) {
                        frm.scope.getStore ().reload ()
                    }
                })
        });

        this.win.show ();
        this.frm.getForm ().loadRecord (this.getSelectionModel ().getSelected ());
    },
    remFn: function () {
        Ext.MessageBox.show ({
            msg: 'Seguro de que desea eliminar este registro?',
            buttons: Ext.MessageBox.YESNO,
            icon: Ext.MessageBox.QUESTION,
            scope: this,
            fn: function (b) {
                if (b == 'yes')
                    Ext.Ajax.request ({
                        url: 'admin/app/rem',
                        scope: this,
                        params: {id: this.getSelectionModel ().getSelected ().data.idaplicacion},
                        success: function (r, o) {
                            o.scope.getStore ().reload ()
                        }
                    })
            }
        })


        
    },
    initComponent: function() {
        this.viewConfig = {
            forceFit: true
        };
        
        this.frm = new Ext.form.FormPanel ({
            frame: true,
            scope: this,
            items: {
                id: 'aplicacion',
                xtype: 'textfield',
                fieldLabel: 'Aplicaci&oacute;n'
            }
        });

        this.win = new Componentes.Window ({
            title: 'Adicionar',
            modal: true,
            closable: false,
            items: this.frm,
            scope: this,
            width: 300
        })

        this.store = createStore ('admin/app/load', createReader ('data', ['idaplicacion', 'aplicacion']));
        this.store.load ({
            params: {
                start: 0, 
                limit: 9
            }
        })

        this.columns = [
            {
                xtype: 'gridcolumn',
                dataIndex: 'aplicacion',
                header: 'Aplicaci&oacute;n',
                sortable: true,
                width: 1
            }
        ];
        
        Security.Modules.App.superclass.initComponent.call(this);
    }
});

Ext.getCmp (window.lastId).add (new Security.Modules.App ());
Ext.getCmp (window.lastId).doLayout();
