Security.Modules.Entity = Ext.extend (Componentes.CRUDTree, {
    add: function () {
        f = this.frm.getForm ();

	if (f.isValid ()) {
		params = (this.getSelectionModel ().getSelectedNode ()) ? {
                    parent : this.getSelectionModel ().getSelectedNode ().id
		} : {
                    parent : null
		}

		f.submit ({
			url: 'admin/entity/adicionar',
			params: params,
			failure: function (pFrm) {
				if (pFrm.scope.getSelectionModel ().getSelectedNode ())
					pFrm.scope.getSelectionModel ().getSelectedNode ().reload ();
				else
					pFrm.scope.getRootNode ().reload ();
			}
		});
	}
    },
    rem: function () {
        r = this.getSelectionModel ().getSelectedNode ();

	if (r) {
		Ext.Msg.show ({
                    msg: 'Seguro que desea eliminar el registro?',
                    buttons: Ext.MessageBox.YESNO,
                    scope: this,
                    icon: Ext.MessageBox.QUESTION,
                    fn: function (b) {
                            if (b == 'yes') {
                                    Ext.Ajax.request ({
                                            url: 'admin/entity/eliminar',
                                            params: {
                                                    id : this.getSelectionModel ().getSelectedNode ().id
                                            },
                                            scope: this,
                                            success: function (resp, opt) {
                                                    opt.scope.getSelectionModel ().getSelectedNode ().parentNode.reload ();
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
			url: 'admin/entity/modificar',
			params: {
                            id: this.getSelectionModel ().getSelectedNode ().id
			},
			failure: function (pFrm) {
                            pFrm.scope.getSelectionModel ().getSelectedNode ().parentNode.reload ();
			}
		});
	}
    },
    updFn: function () {
        this.win.setFn (function () {
                this.scope.upd ();
        });

        this.win.show ();

        this.frm.getForm ().loadRecord ({
                success: true,
                data: {entidad: this.getSelectionModel ().getSelectedNode ().text}
        });
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
        this.root = new Ext.tree.AsyncTreeNode ({
            id: '/',
            text: '/'
	})

        this.loader = new Ext.tree.TreeLoader ({
            url: 'admin/entity/load'
	})

        this.listeners = {
            movenode  : function (t, n, op, np) {
                    Ext.Ajax.request ({
                            url: 'admin/entity/move',
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
        this.layout = 'fit'

        this.frm = new Ext.form.FormPanel ({
                frame: true,
                scope: this,
                items : [{
                        xtype: 'textfield',
                        id: 'entidad',
                        anchor: '95%',
                        fieldLabel: 'Entidad'
                }]
        });
        
        this.win = new Componentes.Window ({
            items: this.frm,
            width: 280,
            scope: this,
            modal: true,
            title: 'Adicionar'
        });

        Security.Modules.Entity.superclass.initComponent.call (this);
    }
})

Ext.getCmp (window.lastId).add (new Security.Modules.Entity ()).show ();
Ext.getCmp (window.lastId).doLayout ();