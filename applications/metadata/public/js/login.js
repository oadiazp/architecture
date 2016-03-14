Metadata.UI.Login = Ext.extend(Ext.Window, {
    title: 'Autenticar usuario',
    width: 229,
    height: 150,
    closable: false,
    modal: true,
    initComponent: function() {
        this.btnSend = new Ext.Button ({
           text: 'Entrar'
        });

        this.buttons = [this.btnSend]
		this.frmLogin = new Ext.FormPanel ({
                xtype: 'form',
                title: '',
                frame: true,
                items: [
                    {
                        xtype: 'textfield',
                        fieldLabel: 'Usuario',
                        anchor: '100%',
                        id: 'user'
                    },
                    {
                        xtype: 'textfield',
                        fieldLabel: 'Contrase&ntilde;a',
                        anchor: '100%',
                        inputType: 'password',
                        id: 'passwd'
                    }, {
                        xtype: 'treetext',
                        fieldLabel: 'Entidad',
                        id: 'entidad',
						submitType: Componentes.TreeText.VALUE,
                        anchor: '100%',
                        window: {
                            width: 300,
                            height: 200
                        },
                        tree : {
                            root: {id: '/'},
                            height: 180,
                            rootVisible: false,
                            loader: new Ext.tree.TreeLoader ({
                                url: 'index.php/entidad/load'
                            })
                        }
                    }
                ]
            });
		
        this.items = this.frmLogin;
        Metadata.UI.Login.superclass.initComponent.call(this);
    }
});

Metadata.Login = Ext.extend (Metadata.UI.Login, {
    login: function () {
        this.frmLogin.getForm ().submit ({
            url: 'main/login',
            failure: function (pFrm, pAction) {
                    resp = Ext.decode (pAction.response.responseText);
                    url = resp.url;
                    window.location = url;
            }
        });
    },
    initComponent: function () {
        Metadata.Login.superclass.initComponent.call (this);
        this.btnSend.setHandler (function () {this.login ()}, this);
    }
})

new Metadata.Login ().show ();
