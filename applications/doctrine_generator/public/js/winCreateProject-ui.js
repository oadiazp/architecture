DoctrineGenerator.UI.winCreateProject = Ext.extend(Ext.Window, {
    title: 'Crear proyecto',
    width: 615,
    height: 248,
    closable: false,
    layout: 'border',
    modal: true,
    initComponent: function() {
        this.items = [
            {
                xtype: 'form',
                title: '',
                frame: true,
                region: 'center',
                items: [
                    {
                        xtype: 'combo',
                        fieldLabel: 'Gestor',
                        anchor: '100%',
                        width: 429,
                        id: 'dbms'
                    },
                    {
                        xtype: 'textfield',
                        fieldLabel: 'Servidor',
                        anchor: '100%',
                        width: 442,
                        id: 'host'
                    },
                    {
                        xtype: 'numberfield',
                        fieldLabel: 'Puerto',
                        anchor: '100%',
                        id: 'port'
                    },
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
                        width: 451,
                        id: 'passwd'
                    },
                    {
                        xtype: 'textfield',
                        fieldLabel: 'Base de datos',
                        anchor: '100%',
                        id: 'db'
                    },
                    {
                        xtype: 'combo',
                        fieldLabel: 'Versión',
                        anchor: '100%',
                        id: 'version'
                    },
                    {
                        xtype: 'button',
                        text: 'Conectar'
                    }
                ]
            },
            {
                xtype: 'listview',
                columnResize: false,
                region: 'east',
                width: 300,
                columns: [
                    {
                        xtype: 'lvbooleancolumn',
                        header: '',
                        width: 0.25
                    },
                    {
                        xtype: 'lvcolumn',
                        header: 'Tabla',
                        align: 'center'
                    }
                ]
            }
        ];
        
        DoctrineGenerator.UI.winCreateProject.superclass.initComponent.call(this);
    }
});
