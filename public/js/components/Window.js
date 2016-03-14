Componentes.Window = Ext.extend (Ext.Window, {
	initComponent : function () {
		this.btnOk = new Ext.Button ({text: 'Aceptar'});
		this.btnOk.setHandler (function () {
			this.fn ();

                        arrFrm = this.findByType ('form');
                        frm = arrFrm [0];
                        frm.getForm ().reset();

			this.hide ();
		}, this);
		
		this.btnApply = new Ext.Button ({text: 'Aplicar'});
		this.btnOk.setHandler (function () {
			this.fn ();
		}, this);
		
		this.btnCancel = new Ext.Button ({text: 'Cancelar'});
		this.btnCancel.setHandler (function () {
			this.hide ();
		}, this);
		
		this.closable = false;
		this.modal = true;
		this.closeAction = 'hide';
		
		this.buttons = [this.btnOk, this.btnApply, this.btnCancel];
		
		Componentes.Window.superclass.initComponent.call (this);
	},	
	setFn : function (pFn) {
		this.fn = pFn;
	}, 
	getFn : function () {
		return this.fn;
	}
}); 