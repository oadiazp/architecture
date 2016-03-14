FileManager.vpFileManagerUi = Ext.extend(Ext.Viewport, {
    layout: {
        type: 'border'
    },
    id: 'vpFileManager',

    initComponent: function() {
        this.westPane = new FileManager.tabsFiles ({
            region : 'west',
            scope : this
        })

        this.eastPane = new FileManager.tabsFiles ({
            region : 'center',
            scope : this
        })

        this.westPane.opposite = this.eastPane
        this.eastPane.opposite = this.westPane

        this.btnView = new FileManager.btnView ({scope: this}); this.btnEdit = new FileManager.btnEdit ({scope: this})
        this.btnCopy = new FileManager.btnCopy ({scope: this}); this.btnRenMove = new FileManager.btnRenMove ({scope: this})
        this.btnCreateDir = new FileManager.btnCreateDir ({scope: this}); this.btnRemove = new FileManager.btnRemove ({scope: this})

        buttons = [this.btnView, this.btnEdit, this.btnCopy, this.btnRenMove, this.btnCreateDir, this.btnRemove]
        
        this.items = [
            {
                xtype: 'panel',
                layout: {
                    type: 'border'
                },
                title: 'Manejador Web de Archivos v0.1',
                region: 'center',
                items: [
                    this.westPane,
                    this.eastPane
                ],
                bbar: buttons
            }
        ];
        FileManager.vpFileManagerUi.superclass.initComponent.call(this);
        
        this.westPane.setWidth (this.getSize ().width / 2)
        
        for (i = 0; i < buttons.length; i++)
            buttons[i].setWidth(this.getSize ().width / 6)
    }
});