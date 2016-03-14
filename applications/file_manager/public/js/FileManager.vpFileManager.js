FileManager.vpFileManager = Ext.extend(FileManager.vpFileManagerUi, {
	setActivePane : function (pPane) {
		this.activePane = pPane	
	},
	getActivePane : function () {
		return this.activePane	
	},
	getMessageBus : function () {
		return this.mb;	
	},
	initComponent: function() {
		FileManager.vpFileManager.superclass.initComponent.call(this);
		
		window.mb = new Componentes.MessageBus ({
			url : 'manager/loadxmppconn',
		})

		window.mb.connect ()
		window.mb.on ('ready', function (pMB) {
			pMB.mb.suscribe ({
				code   : 'M001',
				event  : 'messagerecived',
				object : this.westPane.getActiveTab ()
			})
		}, this)
}
});

new FileManager.vpFileManager ()
