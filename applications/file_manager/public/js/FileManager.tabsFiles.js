FileManager.tabsFiles = Ext.extend (FileManager.tabsFilesUi, {
    getOppositePane : function () {
    	return this.opposite
    },
    getActivePane : function () {
    	return this.activePane
    },
    setActivePane : function (pPane) {
    	this.activePane = pPane
    	this.scope.setActivePane (pPane)
    },
    initComponent : function () {
        FileManager.tabsFiles.superclass.initComponent.call (this)
    }
})

