Componentes.CRUDGrid = Ext.extend (Componentes.PagedGridPanel, {
	initComponent : function () {
		configTbar = {
			addFn: function () {
				this.grid.addFn ();
			},
			updFn: function () {
				this.grid.updFn ();
			},
			remFn: function () {
				this.grid.remFn ();
			}
		};
		configTbar.grid = this;
	
		this.tbar = new Componentes.CRUDToolbar (configTbar);
		Componentes.CRUDGrid.superclass.initComponent.call (this);
		
		this.on ('rowclick', function () {
			Ext.getCmp ('rem').enable ();
			Ext.getCmp ('upd').enable ();
		});
	},
	addToolbarButton : function (btn) {
		this.tbar.add (btn);
	},
	disableBtn : function (pId) {
        Ext.getCmp (pId).disable ();
    }
});