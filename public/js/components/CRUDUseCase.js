Componentes.CRUDUseCase = Ext.extend (Ext.Viewport, {	
	initComponent: function () {
		this.win = new Componentes.Window ({items: this.frm,
											frm: this.frm,
											store: this.store});
		
		this.grid = new Componentes.CRUDGrid ({
			store: this.store,
			title: this.title,
			pageSize: this.pageSize,
			columns: this.columns,
			id: 'grid',
			disableUpd : true,
			disableRem : true,
			win: this.win,
			addFn : function () {
				this.cu.win.setTitle ('Adicionar');
				this.cu.win.setFn (this.cu.addElement);
				this.cu.win.show ();
			},
			updFn : function () {
				this.cu.updElement ();
				this.cu.win.show ();
				this.frm.getForm ().loadRecord(this.grid.getSelectionModel().getSelected());
			},
			remFn : function () {
				this.cu.remElement ();
			},
		});
		this.grid.cu = this;
		
		
		this.items = this.grid;
		this.layout = 'fit';
		
		Componentes.CRUDUseCase.superclass.initComponent.call (this);
	},
	addElement : function () {      
		//Si el formulario es válido
		if (this.frm.getForm ().isValid())
				//Se envian los datos al controlador
				this.frm.getForm ().submit ({
					waitMsg: 'Espere ...',
					url: 'add',
					failure: function () {
						//Una vez terminada la inserción se recarga el store
						/*this.store.reload ();
						//Se resetea el formulario
						this.frm.getForm ().reset ();

						//Se desabilitan los botones de modificar y eliminar
						this.grid.disableBtn('upd');
						this.grid.disableBtn('rem');*/
					}
				});
    }, 
	updElement : function ()  {
        //Seteo el nombre del formulario
        win.setTitle('Modificar');

        //Seteo la funcion a ejecutar cuando dan clic n el aceptar o el aplicar
        win.setFn (function () {
            //Si el formulario es válido
            if (this.frm.getForm ().isValid())
                    //Lo envio hacia el controlador
                    this.frm.getForm ().submit ({
                        //Mando la tupla entera
                        params: grid.getSelectionModel ().getSelected().data,
                        url: 'upd',
                        failure: function () {
                            //Una vez enviado el formulario
                            waitMsg: 'Espere ...',
                            this.store.reload ();

                            grid.disableBtn('upd');
                            grid.disableBtn('rem');
                        }
                    });
        });         
        
    },
	remElement: function () {
        Ext.Msg.show ({
            title: 'Mensaje',
            msg: 'Desea eliminar este elemento?',
            icon: Ext.MessageBox.QUESTION,
            buttons: Ext.MessageBox.YESNO,
            fn: function (o) {
                if (o == 'yes')
                    Ext.Ajax.request ({
                        url: 'rem',
                        params: grid.getSelectionModel ().getSelected().data,
                        success: function () {
                            this.store.reload ();
                            
                            this.grid.disableBtn('upd');
                            this.grid.disableBtn('rem');
                        }
                    });
            }
		})
    },
	getGrid : function () {
		return this.grid;
	}
});

