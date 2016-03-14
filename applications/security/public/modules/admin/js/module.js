Security.Modules.TreeModule = Ext.extend (Ext.tree.TreePanel, {
    id: 'tpModule',
    addFn: function () {
        this.win.setFn (function () {
            f = this.scope.frm;
            
            p = {}

            if (this.scope.getSelectionModel ().getSelectedNode ()) {
                p = {
                  app: this.scope.cbApps.getValue (),
                  parent : this.scope.getSelectionModel ().getSelectedNode ().id
                }
            } else {
                p = {
                  app: this.scope.cbApps.getValue (),
                  parent : null
                }
            }

            f.getForm ().submit ({
                url: 'admin/module/adicionar',
                params: p,
                failure: function () {
                    selected = Ext.getCmp ('tpModule').getSelectionModel ().getSelectedNode ()

                    if (selected) {
                        selected.reload ();
                    } else {
                        Ext.getCmp ('tpModule').getRootNode ().reload ()
                    }
                }
            })
        })

        this.win.show ();
    },
    updFn: function () {
        this.win.setFn (function () {
            f = this.scope.frm;

            f.getForm ().submit ({
                url: 'admin/module/modificar',
                params: {
                    id: f.scope.getSelectionModel ().getSelectedNode ().id
                },
                failure: function (pFrm) {
                    pFrm.scope.getSelectionModel ().getSelectedNode ().parentNode.reload ()
                }
            })
        })

        this.frm.getForm ().loadRecord ({data: {modulo : this.frm.scope.getSelectionModel ().getSelectedNode ().attributes.text}});

        this.win.show ();
    },
    remFn: function () {
        r = this.getSelectionModel ().getSelectedNode();

	if (r) {
		Ext.Msg.show ({
			msg: 'Seguro que desea eliminar el registro?',
			buttons: Ext.MessageBox.YESNO,
			icon: Ext.MessageBox.QUESTION,
                        scope: this,
			fn: function (b) {
				if (b == 'yes') {
					Ext.Ajax.request ({
						url: 'admin/module/eliminar',
                                                scope: this,
						params: {
                                                        id: r.id
						},
						success: function (r, o) {
							o.scope.getSelectionModel ().getSelectedNode ().parentNode.reload ();
						}
					});
				}
			}
		});
	}
    },
    initComponent : function () {
        this.stApps = createStore ('admin/app/load', createReader ('data', ['idaplicacion', 'aplicacion']));

        this.frm = new Ext.form.FormPanel ({
            title: '',
            frame: true,
            scope: this,
            items: [
                {
                    xtype: 'textfield',
                    fieldLabel: 'M&oacute;dulo',
                    id: 'modulo',
                    anchor: '100%'
                }
            ]
        });

        this.win = new Componentes.Window ({
            items: this.frm,
            title: 'M&oacute;dulo',
            scope: this,
            width: 400
        })

        this.cbApps = new Ext.form.ComboBox ({
            store: this.stApps,
            triggerAction: 'all',
            displayField: 'aplicacion',
            valueField: 'idaplicacion',
            scope: this,
            listeners: {
                select: function(c, r) {
                    c.scope.getLoader ().baseParams.app = r.data.idaplicacion
                    c.scope.getLoader ().load (c.scope.getRootNode ());
                }
            }
        })

        this.tbar = ['Aplicaci&oacute;n: ', this.cbApps]

        this.root = new Ext.tree.AsyncTreeNode({id: '/', text: '/'})
        this.loader = new Ext.tree.TreeLoader({url: 'admin/module/load',
                                               scope: this,
                                               listeners: {
                                                   beforeload: function (tl, n) {
                                                       tl.baseParams.module = n.attributes.id
                                                   }
                                               }});
        this.listeners = {
            movenode  : function (t, n, op, np) {
                    Ext.Ajax.request ({
                            url: 'admin/module/move',
                            params: {
                                    node: n.id,
                                    parent : np.id
                            }
                    })
            }
        }

        this.rootVisible = false;
	this.enableDD = true;
	this.autoScroll = true;
        this.layout = 'fit';
        this.id = 'treeModule';
        this.disableUpd = true;
        this.disableRem = true;

        Security.Modules.TreeModule.superclass.initComponent.call (this)

        this.getSelectionModel ().on ('selectionchange', function () {
            Ext.getCmp ('pLayout').getTopToolbar ().get (2).setDisabled (this.getSelectionModel().getSelectedNode() == null);
            Ext.getCmp ('pLayout').getTopToolbar ().get (1).setDisabled (this.getSelectionModel().getSelectedNode () == null);
            
                st = this.scope.gpFuncs.getStore ();

                st.load ({
                    params: {
                        start: 0, limit: 5
                    }
                });
        }, this);
    }
})

Security.Modules.Functionality = Ext.extend (Componentes.CRUDGrid, {
    id: 'gpFunc',
    addFn: function () {
        this.win.setFn (function () {
            f = this.scope.frm;

            f.getForm ().submit ({
                url: 'admin/funcs/adicionar',
                params: {
                  module: Ext.getCmp ('tpModule').getSelectionModel ().getSelectedNode ().id
                },
                failure: function (pFrm) {
                    pFrm.scope.gpFuncs.getStore ().reload ()
                }
            })
        })

        this.win.show ();
    },
    updFn: function () {
        this.win.setFn (function () {
            f = this.scope.frm;

            f.getForm ().submit ({
                url: 'admin/funcs/modificar',
                params: {
                    id: f.scope.getSelectionModel ().getSelected ().data.idfuncionalidad
                },
                failure: function (pFrm) {
                    pFrm.scope.getStore ().reload ()
                }
            })
        })

        this.frm.getForm ().loadRecord (this.getSelectionModel ().getSelected ());

        this.win.show ();
    },
    remFn: function () {
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
						url: 'admin/funcs/eliminar',
                                                scope: this,
						params: {
                                                        idfuncionalidad: r.data.idfuncionalidad
						},
						success: function (r, o) {
							o.scope.store.reload ();
						}
					});
				}
			}
		});
	}
    },
    initComponent: function () {
        this.frm = new Ext.form.FormPanel ({
            xtype: 'form',
            scope: this,
            title: '',
            frame: true,
            items: [
                {
                    xtype: 'textfield',
                    fieldLabel: 'Funcionalidad',
                    anchor: '100%',
                    id: 'funcionalidad'
                },
                {
                    xtype: 'numberfield',
                    fieldLabel: 'Alto',
                    anchor: '100%',
                    id: 'alto'
                },
                {
                    xtype: 'numberfield',
                    fieldLabel: 'Ancho',
                    anchor: '100%',
                    id: 'ancho'
                },
                {
                    xtype: 'checkbox',
                    fieldLabel: '¿Poner en el men&uacute;?',
                    anchor: '100%',
                    id: 'menu'
                }
            ]
        });

        this.win = new Componentes.Window ({
            title: 'Funcionalidades',
            items: this.frm,
            scope: this,
            width: 400
        })

        this.columns = [{header: 'Funcionalidad', dataIndex: 'funcionalidad'},
                        {header: 'Alto', dataIndex: 'alto', width: 50},
                        {header: 'Ancho', dataIndex: 'ancho', width: 50},
                        {header: 'Menu', dataIndex: 'menu', width: 50, renderer: render_check}]

        this.store = createStore ('admin/funcs/cargar', createReader ('data', [{name: 'idfuncionalidad', mapping: 'f_idfuncionalidad'},
                                                                               {name: 'funcionalidad', mapping: 'f_funcionalidad'},
                                                                               {name: 'ancho', mapping: 'f_ancho'},
                                                                               {name: 'alto', mapping: 'f_alto'},
                                                                               {name: 'menu', mapping: 'f_menu'}]))

         this.store.scope = this.scope;

         this.store.on ('beforeload', function (s, o) {
             if (s.scope.tpModule.getSelectionModel ().getSelectedNode ())
                o.params.module = s.scope.tpModule.getSelectionModel ().getSelectedNode ().id
         })


        Security.Modules.Functionality.superclass.initComponent.call (this);

        this.getSelectionModel ().on ('selectionchange', function () {
            this.getTopToolbar ().get (1).setDisabled (this.getSelectionModel().getSelected () == null);
            this.getTopToolbar ().get (2).setDisabled (this.getSelectionModel().getSelected () == null);

            st = this.scope.gpUrl.getStore ();

            if (this.getSelectionModel().getSelected ())
                st.load ({
                    params: {
                        start: 0, limit: 5
                    }
                });
        }, this);
    }
})

Security.Modules.Url = Ext.extend (Componentes.CRUDGrid, {
    scope: this,
    addFn: function () {
        this.win.setFn(function () {
            f = this.scope.frm.getForm ();

            f.submit ({
                url: 'admin/url/adicionar',
                params: {
                    func: Ext.getCmp ('gpFunc').getSelectionModel ().getSelected ().data.idfuncionalidad
                },
                failure: function (f) {
                    f.scope.getStore ().reload ();
                }
            })
        })

        this.win.show ();
    },
    updFn: function () {
        this.win.setFn(function () {
            f = this.scope.frm

            f.getForm ().submit ({
                url: 'admin/url/modificar',
                params: {
                    idurl: f.scope.getSelectionModel ().getSelected ().data.idurl
                },
                failure: function (f) {
                    f.scope.getStore ().reload ();
                }
            })
        })

        this.win.show ();

        this.frm.getForm ().loadRecord (this.getSelectionModel ().getSelected ())
    },
    remFn: function () {
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
						url: 'admin/url/eliminar',
                                                scope: this,
						params: {
                                                        idurl: r.data.idurl
						},
						success: function (r, o) {
							o.scope.store.reload ();
						}
					});
				}
			}
		});
	}
    },
    initComponent: function () {
        this.store = createStore ('admin/url/cargar', createReader ('data', [{name: 'idfuncionalidad', mapping: 'u_idfuncionalidad'},
                                                                             {name: 'url', mapping: 'u_url'},
																			 {name: 'principal', mapping: 'u_principal'},
                                                                             {name: 'idurl', mapping: 'u_idurl'}]))

        this.store.scope = this.scope;

        this.store.on ('beforeload', function (s, o) {
             if (s.scope.gpFuncs.getSelectionModel ().getSelected ())
                o.params.func = s.scope.gpFuncs.getSelectionModel ().getSelected ().data.idfuncionalidad
         })
		 
        this.frm = new Ext.form.FormPanel ({
            title: '',
            frame: true,
            scope: this,
            items: [
                {
                    xtype: 'textfield',
                    fieldLabel: 'URL',
                    id: 'url',
                    anchor: '100%'
                }, {
					xtype: 'checkbox',
					fieldLabel: 'Principal',
					id: 'principal',
					anchor: '100%'
				}
            ]
        });

        this.win = new Componentes.Window ({
            items: this.frm,
            title: 'URL',
            scope: this,
            width: 400
        })

        this.columns = [
            {dataIndex: 'url', header: 'URL', mapping: 'u_url'},
			{dataIndex: 'principal', header: 'Principal', mapping: 'u_principal', renderer: render_check}
        ]
        this.configView = {forceFit: true}

        Security.Modules.Url.superclass.initComponent.call (this)
    }
})

Security.Modules.ModulesLayout = Ext.extend(Ext.Panel, {
    title: '',
    width: 853,
    height: 572,
    layout: 'border',
    initComponent: function() {
        this.tpModule = new Security.Modules.TreeModule ({
            scope: this
        });

        this.gpFuncs = new Security.Modules.Functionality ({
            height: 254,
            region: 'north',
            scope: this,
            pageSize: 5,
            viewConfig: {forceFit: true}
        });

        this.gpUrl = new Security.Modules.Url ({pageSize: 5, region: 'center', id:  'gpUrl',
                                                scope: this, viewConfig: {forceFit: true}});
        
        this.items = [{
                width: 500,
                region: 'west',
                xtype: 'crudpanel',
                id: 'pLayout',
                items: this.tpModule,
                addFn: function () {Ext.getCmp ('tpModule').addFn ()},
                updFn: function () {Ext.getCmp ('tpModule').updFn ()},
                remFn: function () {Ext.getCmp ('tpModule').remFn ()}
            },
            {
                xtype: 'panel',
                title: '',
                region: 'center',
                layout: 'border',
                items: [
                    this.gpFuncs,
                    this.gpUrl
                ]
            }
        ];
        Security.Modules.ModulesLayout.superclass.initComponent.call(this);
    }
});

Ext.getCmp (window.lastId).add (new Security.Modules.ModulesLayout ()).show ();
Ext.getCmp (window.lastId).doLayout ();
