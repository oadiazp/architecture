FileManager.gpPaneUi = Ext.extend(Ext.grid.EditorGridPanel, {
    title: '',
    clicksToEdit: 1,
    loadMask: {msg: 'Cargando ...'},
    autoExpandColumn: 'name',
    renderIcon : function (pValue) {
        return (pValue == 'dir') ? "<img src='../../public/img/folder.gif'>"
                                 : "<img src='../../public/img/leaf.gif'>";
    },
    initComponent: function() {
        this.store = new FileManager.stFiles ({scope : this})
        this.sm = new Ext.grid.CheckboxSelectionModel ({scope : this})
        
        this.columns = [
            this.sm,
            {
                xtype: 'gridcolumn',
                dataIndex: 'type',
                width: 30,
                renderer : {
                    fn : this.renderIcon,
                    scope : this
                }
            },
            {
                xtype: 'gridcolumn',
                dataIndex: 'name',
                header: 'Nombre',
                id: 'name',
                editor: new Ext.form.TextField ({
                    allowBlank : false,
                    blankText  : 'Debe introducir el nombre'
                }),
                sortable: true,
                width: 100
            },
            {
                xtype: 'gridcolumn',
                dataIndex: 'size',
                header: 'Tama&ntilde;o',
                sortable: true,
                width: 100
            },
            {
                xtype: 'gridcolumn',
                dataIndex: 'date',
                header: 'Fecha',
                sortable: true,
                width: 100
            }
        ];
        
        this.txtPath = new FileManager.txtPath ({
            scope : this
        })
		
        this.btnUp = new FileManager.btnUp ({
            scope : this
        })

        this.btnRoot = new FileManager.btnRoot ({
            scope : this
        })
        
        this.tbar = {
            xtype: 'toolbar',
            items: [
                {
                    xtype: 'tbtext',
                    text: 'Ruta:'
                },
                this.txtPath, this.btnUp, this.btnRoot
            ]
        };
        FileManager.gpPaneUi.superclass.initComponent.call(this);
    }
});