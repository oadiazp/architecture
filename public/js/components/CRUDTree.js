Componentes.CRUDTree = Ext.extend (Ext.tree.TreePanel, {
	initComponent: function () {
		configTbar = {
			addFn: function () {
				this.tree.addFn ();
			},
			updFn: function () {
				this.tree.updFn ();
			},
			remFn: function () {
				this.tree.remFn ();
			}
		};
		configTbar.tree = this;
	
		this.tbar = new Componentes.CRUDToolbar (configTbar);
		Componentes.CRUDGrid.superclass.initComponent.call (this);
	}
});