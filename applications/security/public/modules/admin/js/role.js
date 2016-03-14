Security.Modules.Role = Ext.extend (Componentes.CRUDGrid, {
    add: function () {
        f = this.frm.getForm ();

	if (f.isValid ()) {
		f.submit ({
			url: 'admin/role/adicionar',
			failure: function (pFrm) {
				pFrm.scope.store.reload ();
			}
		});
	}
    },
    rem: function () {
        r = this.getSelectionModel ().getSelected ();

	if (r) {
		Ext.Msg.show ({
			msg: 'Seguro que desea eliminar el registro?',
			buttons: Ext.MessageBox.YESNO,
			icon: Ext.MessageBox.QUESTION,
                        scope: this,
			fn: function (b) {
				if (b == 'yes') {
					Ext.Ajax.request ({
						url: 'admin/role/eliminar',
						params: {
							id: r.data.idrol
						},
						success: function (pFrm) {
							this.scope.store.reload ();
						}
					});
				}
			}
		});
	}
    },
    upd: function () {
        f = this.frm.getForm ();

	if (f.isValid ()) {
		f.submit ({
			url: 'admin/role/modificar',
			params: {
				id: this.getSelectionModel ().getSelected ().data.idrol
			},
			failure: function (pFrm) {
				pFrm.scope.store.reload ();
			}
		});
	}
    },
    updFn: function () {
            this.win.setFn (function () {
                 this.scope.upd ();
            });

            this.win.show ();

            this.frm.getForm ().loadRecord (gp.getSelectionModel ().getSelected ());
    },
    addFn: function () {
            this.win.setFn (function () {
                this.scope.add ();
            });
            
            this.win.show ();
    },
    remFn: function () {
            this.rem ();
    },
    initComponent: function () {
        this.store = createStore ('admin/role/cargar', createReader ('data', ['idrol', 'rol']));
        this.store.load ({
            params: {
                start: 0,
                limit: 8
            }
        })

        this.layout = 'fit';
	this.pageSize = 8;
        this.viewConfig = {forceFit: true};
        this.columns = [
            new Ext.grid.RowNumberer ({header: '#'}),
            {header: 'Rol', dataIndex: 'rol', width: 250}
	]

        this.frm = new Ext.form.FormPanel ({
            frame: true,
            scope: this,
            items : [{
                    xtype: 'textfield',
                    id: 'rol',
                    anchor: '95%',
                    fieldLabel: 'Rol'
            }]
        });
        
        this.win = new Componentes.Window ({
            items: this.frm,
            width: 280,
            scope: this,
            modal: true,
            title: 'Adicionar'
        });

        Security.Modules.Role.superclass.initComponent.call (this);
    }
})

Ext.getCmp (window.lastId).add (new Security.Modules.Role ()).show ();
Ext.getCmp (window.lastId).doLayout ();