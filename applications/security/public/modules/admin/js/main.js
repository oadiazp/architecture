Ext.ns('Security.Modules');

Security.Modules.Viewport = Ext.extend(Ext.Viewport, {
    layout: 'border',
    initComponent: function() {
        this.items = [
            {
                xtype: 'treepanel',
                title: 'M&oacute;dulos',
                width: 124,
                id: 'tp',
                height: 558,
                root: new Ext.tree.AsyncTreeNode({
                    id: '/', text: '/',
                    children: [
                        {text: 'Usuarios', leaf: true, url: 'admin/user'},
                        {text: 'Roles', leaf: true, url: 'admin/role'},
                        {text: 'Entidades', leaf: true, url: 'admin/entity'},
                        {text: 'Aplicaciones', leaf: true, url: 'admin/app'},
                        {text: 'M&oacute;dulos', leaf: true, url: 'admin/module'},
                        {text: 'Accesos', leaf: true, url: 'admin/access'}
                    ]
                }),
                region: 'west',
                rootVisible: false,
                listeners: {
                    click: function (pNodo) {
                        Ext.getCmp ('tp').disable ()
                        tabs = Ext.getCmp ('tabs');

                        url = pNodo.attributes.url;

                        id = Ext.id ();window.lastId = id;

                        panel = {
                            closable : true,
                            id : window.lastId,
                            layout: 'fit',
                            title: pNodo.attributes.text
                        }

                        tab = tabs.findBy (function (pTab, pTabPanel ) {
                            return pTab.title == pNodo.attributes.text
                        }, this);

                        if (tab.length == 0)
                            tabs.add (panel).show ()
                        else
                            tab[0].show ();

                        Ext.Ajax.request ({
                            url: url,
                            success: function (pResp) {
                                window.curURL = url;
                                
                                resp = Ext.decode (pResp.responseText)

                                if (resp.js)
                                    for (i = 0; i< resp.js.length; i++)
                                        importarJS(resp.js [i]);
                                

                                if (resp.css) 
                                    for (i = 0; i< resp.css.length; i++)
                                        importarCSS(resp.css [i]);

                                Ext.getCmp ('tp').enable ()
                            }
                        })
                    }
            },
            bbar: ['->', {text: 'Salir', handler: function () {
                Ext.Ajax.request ({
                    url: 'admin/main/logout',
                    success: function (r) {
                        url = Ext.decode (r.responseText).url;
                        window.location = url
                    }
                })
            }}]
         },
            {
                xtype: 'panel',
                region: 'center',
                title: 'Funcionalidades',
                layout: 'fit',
                items: [
                    {
                        xtype: 'tabpanel',
                        title: 'Inicio',
                        width: 393,
                        id: 'tabs',
                        height: 550,
                        activeTab: 0,
                        items: [
                            {
                                xtype: 'panel',
                                title: 'Inicio',
                                frame: true,
                                html: '<br><br><br><br><br><br><br><br><br><br><br><br><br><br><center> <h1> Sistema de Seguridad </h1> </center>'
                            }
                        ]
                    }
                ]
            }
        ];
        Security.Modules.Viewport.superclass.initComponent.call(this);
    }
});

new Security.Modules.Viewport ();
