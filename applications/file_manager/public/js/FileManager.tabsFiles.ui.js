FileManager.tabsFilesUi = Ext.extend (Ext.TabPanel, {
    activeTab: 0,
    initComponent : function () {
        FileManager.tabsFilesUi.superclass.initComponent.call (this)
        
        gp = new FileManager.gpPane ({
            scope : this,
            title : '/',
            closable: false
        })
        
        this.add (gp).show ()
    }
})

