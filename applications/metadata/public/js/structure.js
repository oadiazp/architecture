Metadata.UI.Structure = Ext.extend(Ext.Panel, {
    width: 872,
    height: 374,
    layout: 'border',
    initComponent: function() {
        this.frmTable = ({
            title: '',
            width: 407,
            height: 55,
            padding: 10,
            frame: true,
            items: [
                {
                    xtype: 'panel',
                    title: '',
                    layout: 'column',
                    defaults: {
                        columnWidth: .5
                    },
                    items: [
                        {
                            xtype: 'panel',
                            title: '',
                            layout: 'form',
                            items: [
                                {
                                    xtype: 'combo',
                                    fieldLabel: 'Esquma',
                                    anchor: '95%',
                                    id: 'schema'
                                }
                            ]
                        },
                        {
                            xtype: 'panel',
                            title: '',
                            layout: 'form',
                            items: [
                                {
                                    xtype: 'textfield',
                                    fieldLabel: 'Tabla',
                                    anchor: '95%',
                                    id: 'table'
                                }
                            ]
                        }
                    ]
                }
            ]
        });

        this.winTable = new Componentes.Window ({
            items: [this.frmTable],
            scope: this,
            modal: true,
            title: 'Tabla'
        });
        
        this.gpField = new Componentes.CRUDGrid ({
                addFn: function () {
                    this.win.show ();
                },
                width: 200,
                scope: this,
                win: new Componentes.Window ({
                    xtype: 'ciext-window',
                    items: this.frm,
                    width: 300,
                    height: 200,
                    title: 'Adicionar',
                    scope: this,
                    modal: true
                }),
                title: 'Campos',
                flex: 1,
                region: 'center',
                pageSize: 10,
                store: createStore ('table/load', createReader ('data', ['idfield', 'field', 'length', 'type'])),
                columns: [
                    {
                        xtype: 'gridcolumn',
                        header: 'Campo',
                        sortable: true,
                        dataIndex: 'field',
                        width: 200
                    },
                    {
                        xtype: 'gridcolumn',
                        header: 'Tipo',
                        dataIndex: 'type',
                        sortable: true,
                        width: 140
                    },
                    {
                        xtype: 'gridcolumn',
                        header: 'Longitud',
                        sortable: true,
                        dataIndex: 'length',
                        width: 100
                    }
                ]
            });



            this.gpTable = new Componentes.CRUDGrid ({
                store: createStore ('structure/load', createReader ('data', ['idtable', 'table', 'schema'])),
                title: 'Tablas',
                flex: 1,
                pageSize: 10,
                region: 'west',
                width: 500,
                scope: this,
                addFn: function () {
                    this.scope.winTable.setFn (function () {
                        alert (1);
                    });

                    this.winTable.show ();
                },
                columns: [
                    {
                        xtype: 'gridcolumn',
                        dataIndex: 'schema',
                        header: 'Esquema',
                        sortable: true,
                        width: 200
                    },
                    {
                        xtype: 'gridcolumn',
                        dataIndex: 'table',
                        header: 'Tabla',
                        sortable: true,
                        width: 200
                    }
                ]
            });

        this.items = [this.gpTable, this.gpField];
        Metadata.UI.Structure.superclass.initComponent.call(this);
    }
});

Metadata.Structure = Ext.extend (Metadata.UI.Structure, {
    initComponent: function () {
        Metadata.Structure.superclass.initComponent.call (this);
    }
});

Ext.getCmp (window.lastId).add (new  Metadata.Structure()).show ();
Ext.getCmp (window.lastId).doLayout ();