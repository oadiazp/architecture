DoctrineGenerator.UI.Main = Ext.extend(Ext.Viewport, {
    layout: 'border',
    initComponent: function() {
        this.btnNewProject = new Ext.menu.Item({
                                        text: 'Nuevo'
                                    })

        this.btnOpenProject = new Ext.menu.Item({
                                        text: 'Abrir'
                                    })
                                    
       this.btnSaveProject = new Ext.menu.Item({
                                        text: 'Guardar'
                                    })
                                    
       this.btnGenerate = new Ext.menu.Item({
                                        text: 'Generar'
                                    })
                                    
       this.btnExit = new Ext.menu.Item({
                                        text: 'Salir'
                                    })
        this.items = [
            {
                xtype: 'panel',
                title: 'Generador de ficheros de Doctrine',
                region: 'center',
                frame: true,
                html: '<center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><img src = "public/img/main.gif"/></center>',
                tbar: {
                    xtype: 'toolbar',
                    items: [
                        {
                            xtype: 'button',
                            text: 'Proyecto',
                            menu: {
                                xtype: 'menu',
                                items: [
                                    this.btnNewProject,
                                    this.btnOpenProject,
                                    this.btnSaveProject,
                                    this.btnGenerate,
                                    this.btnExit
                                ]
                            }
                        },
                        {
                            xtype: 'button',
                            text: 'Consultas',
                            menu: {
                                xtype: 'menu',
                                items: [
                                    {
                                        xtype: 'menuitem',
                                        text: 'Nueva'
                                    },
                                    {
                                        xtype: 'menuitem',
                                        text: 'Abrir'
                                    },
                                    {
                                        xtype: 'menuitem',
                                        text: 'Guardar'
                                    }
                                ]
                            }
                        }
                    ]
                }
            }
        ];
        DoctrineGenerator.UI.Main.superclass.initComponent.call(this);
    }
});