Security.Modules.Access = Ext.extend (Ext.tree.TreePanel,  {
    initComponent: function () {
        this.layout =  'fit';

        this.stApps = createStore ('admin/app/load', createReader ('data', ['idaplicacion', 'aplicacion']));

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

        this.cbRoles = new Ext.form.ComboBox ({
            store: createStore ('admin/role/cargar', createReader ('data', ['idrol', 'rol'])),
            displayField: 'rol',
            id: 'rol',
            scope: this,
            valueField: 'idrol',
            triggerAction: 'all',
            listeners: {
                select: function (c, r, i) {
                    loader = c.scope.getLoader ();
                    loader.baseParams.rol = r.data.idrol;

                    loader.load (c.scope.getRootNode ());
                }
            }
        });

        this.tbar = ['Aplicaci&oacute;n: ', this.cbApps,'-', 'Rol: ', this.cbRoles]
        this.loader = new Ext.tree.TreeLoader ({
            url: 'admin/access/load'
        });
         
        this.root = new Ext.tree.AsyncTreeNode ({
            id: '/',
            text: '/'
        });

        this.listeners = {
            checkchange: function (pNode, pChecked) {
                Ext.Ajax.request ({
                    url: 'admin/access/check',
                    params: {
                        node: pNode.id,
                        status: pChecked,
                        rol: Ext.getCmp ('rol').getValue ()
                    }
             });
          }
        }

        this.root = new Ext.tree.AsyncTreeNode ({
            id: '/',
            text: '/'
        })

        this.rootVisible = false;
        this.enableDD = true;
        
        Security.Modules.Access.superclass.initComponent.call (this);
    }
})

Ext.getCmp (window.lastId).add (new Security.Modules.Access ());
Ext.getCmp (window.lastId).doLayout();