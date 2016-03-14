Componentes.PagedGridPanel = Ext.extend (Ext.grid.GridPanel, {
	initComponent: function () {
		this.bbar = new Ext.PagingToolbar ({
			pageSize: this.pageSize,
			store: this.store
		});
		
		Componentes.PagedGridPanel.superclass.initComponent.call (this);
	}
});