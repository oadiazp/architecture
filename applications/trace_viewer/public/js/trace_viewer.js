Ext.ns ('Trace');

Trace.Viewport = Ext.extend(Ext.Viewport, {
    layout: 'border',
    title: 'Visor de trazas',
    initComponent: function() {
        this.items = [
            {
                xtype: 'grid',
                layout: 'fit',
                region: 'center',
                store: {},
                columns: [
                    {}
                ],
                bbar: {
                    xtype: 'paging'
                },
                tbar: {
                    xtype: 'toolbar',
                    items: [
                        {
                            xtype: 'tbtext',
                            text: 'Tipo de traza:'
                        },
                        {
                            xtype: 'combo',
                            width: 137
                        }
                    ]
                }
            },
            {
                xtype: 'panel',
                title: 'Buscar',
                height: 274,
                region: 'south',
                frame: true,
                items: [
                    {
                        xtype: 'fieldset',
                        title: 'Comunes',
                        layout: 'column',
                        height: 140,
                        items: [
                            {
                                xtype: 'form',
                                title: 'Fecha',
                                columnWidth: 0.33,
                                items: [
                                    {
                                        xtype: 'datefield',
                                        fieldLabel: 'Inicio',
                                        id: 'fecha_inicio',
                                        anchor: '95%'
                                    },
                                    {
                                        xtype: 'datefield',
                                        fieldLabel: 'Fin',
                                        id: 'fecha_fin',
                                        anchor: '95%'
                                    }
                                ]
                            },
                            {
                                xtype: 'form',
                                title: 'Hora',
                                columnWidth: 0.33,
                                items: [
                                    {
                                        xtype: 'timefield',
                                        fieldLabel: 'Inicio',
                                        anchor: '95%',
                                        id: 'hora_inicio'
                                    },
                                    {
                                        xtype: 'timefield',
                                        fieldLabel: 'Fin',
                                        anchor: '95%',
                                        id: 'hora_fin'
                                    }
                                ]
                            },
                            {
                                xtype: 'form',
                                title: 'Otras',
                                columnWidth: 0.33,
                                items: [
                                    {
                                        xtype: 'textfield',
                                        fieldLabel: 'Estructura',
                                        anchor: '95%',
                                        id: 'estructura'
                                    },
                                    {
                                        xtype: 'combo',
                                        fieldLabel: 'Categoría',
                                        anchor: '95%',
                                        id: 'categoria'
                                    },
                                    {
                                        xtype: 'textfield',
                                        id: 'usuario',
                                        fieldLabel: 'Usuario',
                                        anchor: '95%'
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        xtype: 'fieldset',
                        title: 'Específicos',
                        id: 'fsEspecificos'
                    }
                ]
            }
        ];
        Trace.Viewport.superclass.initComponent.call(this);
    }
});

new Trace.Viewport ();
