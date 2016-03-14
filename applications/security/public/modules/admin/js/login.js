Security.Modules.Login = Ext.extend(Ext.Window, {
    title: 'Iniciar sesi&oacute;n',
    width: 272,
    modal: true,
    closable: false,
    scope: this,
    height: 150,
    login: function () {
        Ext.Ajax.request ({
            url: 'admin/main/login',
            params: {
                usuario : Ext.getCmp ('user').getValue (),
                passwd: Ext.getCmp ('passwd').getValue (),
                entidad: Ext.getCmp ('entidad').getValue ()
            },
            success: function (pResp) {
                window.location = Ext.decode (pResp.responseText).url;
            }
        });
    },
    initComponent: function() {
        this.btnAceptar = new Ext.Button ({
            text: 'Aceptar',
            scope: this,
            handler : function () {
                this.login ();
            }
        });

        this.txtPasswd = new Ext.form.TextField ({
            fieldLabel: 'Contrase&ntilde;a',
            anchor: '100%',
            inputType: 'password',
            id: 'passwd',
            scope: this,
            enableKeyEvents: true,
            listeners: {
                specialkey: function (t, e) {
                    if (e.getKey() == e.ENTER) {
                        t.scope.login ();
                    }
                }
            }
        });

        this.buttons = [this.btnAceptar];

        this.items = [
            {
                xtype: 'form',
                frame: true,
                items: [
                    {
                        xtype: 'textfield',
                        fieldLabel: 'Usuario',
                        anchor: '100%',
                        id: 'user'
                    }, this.txtPasswd,
                    new Componentes.TreeText ({
                        fieldLabel: 'Entidad',
                        anchor: '100%',
                        window: {width: 200},
                        id: 'entidad',
                        submitType: Componentes.TreeText.VALUE,
                        tree: {
                            rootVisible: false,
                            height: 200,
                            loader: new Ext.tree.TreeLoader ({url: 'admin/entity/load'}),
                            root: new Ext.tree.AsyncTreeNode({id: '/', text: '/'})
                        }
                    })]
            }
        ];
        Security.Modules.Login.superclass.initComponent.call(this);
    }
});

//new Componentes.UI(function () {
    new Security.Modules.Login ().show ();
//})


