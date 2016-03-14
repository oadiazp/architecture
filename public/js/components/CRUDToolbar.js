Componentes.CRUDToolbar = Ext.extend (Ext.Toolbar, {
	initComponent: function () {
		addButton = new Ext.Button ({id: 'add', disabled: this.disableAdd, text: 'Adicionar', iconCls: 'add'});
		addButton.setHandler (function () {
			this.addFn ();
		}, this);
		
		updButton = new Ext.Button ({id: 'upd', disabled: this.disableUpd, text: 'Modificar', iconCls: 'option'});
		updButton.setHandler (function () {
			this.updFn ();
		}, this);
		
		remButton = new Ext.Button ({id: 'rem', disabled: this.disableRem, text: 'Eliminar', iconCls: 'remove'});
		remButton.setHandler (function () {
			this.remFn ();
		}, this);
		
		this.items = [addButton, updButton, remButton];
		
		Componentes.CRUDToolbar.superclass.initComponent.call (this);
	},
	disableAll : function () {
        for (i = 0; i < items.length; i++)
            Ext.getCmp (items[i].id).disable ();
    },	
	enableAll : function () {
        for (i = 0; i < items.length; i++)
            Ext.getCmp (items[i].id).enable ();
    }
});