Security.Modules.User = Ext.extend (Componentes.CRUDGrid, {
    add: function () {
        f = this.frm.getForm ();
	t = Ext.getCmp ('entidad').getSelectionModel ().getSelectedNode ();

	if (f.isValid () && t) {
		f.submit ({
			url: 'admin/user/adicionar',
			params: {
                            entidad : t.id
			},
			failure: function (pFrm, pOpt) {
                            pFrm.scope.store.reload ();
			}
		});
	}
    },
    upd: function () {
        f = this.frm.getForm ();
	t = Ext.getCmp ('entidad').getSelectionModel ().getSelectedNode ();

	if (f.isValid () && t) {
		f.submit ({
			url: 'admin/user/modificar',
			params: {
				entidad : t.id,
				id: this.getSelectionModel ().getSelected ().data.idusuario
			},
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
                        scope: this,
			icon: Ext.MessageBox.QUESTION,
			fn: function (b, t, o) {
				if (b == 'yes') {
					Ext.Ajax.request ({
                                                scope: o,
						url: 'admin/user/eliminar',
						params: {
							id: r.data.idusuario
						},
						success: function () {
							this.scope.store.reload ();
						}
					});
				}
			}
		});
	}
    },
    updFn: function () {
            this.win.setFn (function () {
                   this.scope.upd ();
            });

            this.win.show ();

            this.frm.getForm ().loadRecord (this.getSelectionModel ().getSelected ());
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
    initComponent : function () {
       this.store = new Ext.data.Store ({
            url: 'admin/user/cargar',
            totalRecord: 'cant',
            reader: new Ext.data.JsonReader ({
                root: 'data',
                totalProperty: 'cant',
                fields: [
                        {name: 'denom_rol', mapping: 'r_rol'},
                        {name: 'rol', mapping: 'r_idrol'},
                        {name: 'entidad', mapping: 'e_entidad'},
                        {name: 'usuario', mapping: 'u_usuario'},
                        {name: 'idusuario', mapping: 'u_idusuario'},
                        {name: 'correo', mapping: 'u_correo'}
                    ]
                })
        });

        this.store.load ({
            params: {
                start: 0,
                limit: 8
            }
        });

       this.scope = this;
        
       this.enabledUpd = false;
       this.disableRem = true;
       this.pageSize = 8
       this.viewConfig = {forceFit: true};

       this.columns = [{header: 'Usuario', dataIndex: 'usuario'},
                       {header: 'Correo', dataIndex: 'correo'},
                       {header: 'Rol', dataIndex: 'denom_rol'},
                       {header: 'Entidad', dataIndex: 'entidad'}];

       this.cbRole = new Ext.form.ComboBox ({
            fieldLabel: 'Rol',
            scope: this,
            store: createStore ('admin/role/cargar', createReader ('data', ['idrol', 'rol'])),
            displayField: 'rol',
            valueField: 'idrol',
            hiddenName: 'rol',
            mode: 'local',
            triggerAction: 'all'
        });

        this.cbRole.getStore ().load ({
            params: {start: 0, limit : 8}
        });

       this.frm = new Ext.form.FormPanel ({
                layout: 'column',
                scope: this,
                defaults: {
                        columnWidth: .5,
                        layout: 'form',
                        border: false
                },
                items: [{
                                        defaults: {
                                                anchor: '95%'
                                        },
                                        title: 'Datos',
                                        frame: true,
                                        scope: this,
                                        items: [
                                                                {
                                                                        xtype: 'textfield',
                                                                        fieldLabel: 'Usuario',
                                                                        id: 'usuario'
                                                                },
                                                                {
                                                                        xtype: 'textfield',
                                                                        fieldLabel: 'Correo',
                                                                        id: 'correo'
                                                                },
                                                                {
                                                                        xtype: 'textfield',
                                                                        fieldLabel: 'Contrase&ntilde;a',
                                                                        inputType: 'password',
                                                                        id: 'passwd'
                                                                },
                                                                {
                                                                        xtype: 'textfield',
                                                                        fieldLabel: 'Confirmar',
                                                                        inputType: 'password',
                                                                        id: 'confirm'
                                                                }, this.cbRole
                                                                
                                                        ]
                                },
                                {
                                        items: new Ext.tree.TreePanel ({
                                                height: 165,
                                                title: 'Entidad',
                                                id: 'entidad',
                                                rootVisible: false,
                                                autoScroll: true,
                                                loader: new Ext.tree.TreeLoader ({
                                                        url: 'admin/entity/load',
                                                        preloadChildren: true
                                                }),
                                                root: new Ext.tree.AsyncTreeNode ({
                                                        id: '/',
                                                        text: 'Raiz'
                                                })
                                        })
                                }
                ]
        });

        this.win = new Componentes.Window ({
            items: this.frm,
            scope: this,
            width: 500,
            modal: true,
            title: 'Adicionar'
        });
        
        Security.Modules.User.superclass.initComponent.call (this);
    }
});

Ext.getCmp (window.lastId).add (new Security.Modules.User ());
Ext.getCmp (window.lastId).doLayout ();
