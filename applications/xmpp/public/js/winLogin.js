XMPP.winLogin = Ext.extend(Ext.Window, {
    title: 'Iniciar sesi&oacute;n',
    width: 284,
    height: 147,
    standardSubmit: true,
    modal: true,
    closable: false,
    buttons: [{
       text: 'Aceptar',
       handler: function () {
           Ext.Ajax.request ({
               url: 'xmpp/login',
               params: {
                    user: Ext.getCmp ('user').getValue(),
                    passwd: Ext.getCmp ('passwd').getValue(),
                    host: Ext.getCmp ('server').getValue()
               },
               success: function (pResp) {
                   window.location = Ext.decode (pResp.responseText).url;
               }
           });
       }
    }],
    initComponent: function() {
        this.items = [
            {
                xtype: 'form',
                title: '',
                height: 117,
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
                        fieldLabel: 'Contrase&oacute;a',
                        anchor: '100%',
                        inputType: 'password',
                        id: 'passwd'
                    },
                    {
                        xtype: 'textfield',
                        fieldLabel: 'Servidor',
                        anchor: '100%',
                        id: 'server'
                    }
                ]
            }
        ];
        XMPP.winLogin.superclass.initComponent.call(this);
    }
});