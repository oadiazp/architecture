Componentes.CRUDPanel = new Ext.extend (Ext.Panel, {
    initComponent: function () {
        this.tbar = new Componentes.CRUDToolbar (this)
        Componentes.CRUDPanel.superclass.initComponent.call (this)
    }
})

Ext.reg ('crudpanel', Componentes.CRUDPanel);