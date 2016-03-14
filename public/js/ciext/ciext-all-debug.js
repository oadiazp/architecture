Ext.Ajax.disableCaching = false
Ext.Ajax.method = 'post'
Ext.QuickTips.init();

Ext.Ajax.on('requestcomplete', function(conn, response, options){
	var respText = response.responseText;
	var respXML = response.responseXML;
	if (respText && !respXML){
		var respObj = Ext.decode(respText);
		if (respObj.mensaje && respObj.codMsg && typeof (respObj.mensaje) != 'xml') {
            showMessage (respObj.codMsg, respObj.mensaje, null, respObj.detalles)
        }
	}
});

Ext.BLANK_IMAGE_URL = 'data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';

winError = null

function showMessage (tipo, msg, fn, detalle){
	   var buttons = new Array(Ext.MessageBox.OK, Ext.MessageBox.OKCANCEL, Ext.MessageBox.OK);
	   var title   = new Array('Informaci&oacute;n', 'Confirmaci&oacute;n', 'Error');
	   var icons   = new Array(Ext.MessageBox.INFO, Ext.MessageBox.QUESTION , Ext.MessageBox.ERROR);

		if(tipo==4){
			if(!winError){
				winError = new Ext.Window({
					title:' ERROR ',
					width:400,
					minWidth :300,
					buttonAlign:'center',
					autoHeight: true,
					closeAction:'hide',
					bodyBorder :false,
					layout:'fit',
					defaults :{frame:true,border :false},
					items:new Ext.Panel({
						frame:true,monitorResize :true,
						autoHeight: true,layout:'column',
						items:[{columnWidth:.2,
							items: {style:'margin:2px 0px 0px 2px;',
								html:'<div id="iconoERROR" class="iconoERROR></div>'
							}
						},{columnWidth:.7,
							items: {xtype:'panel',
								autoHeight: true,
								html:'<div id="pMSG">'+msg+'</div>'}
						},{columnWidth:1,
							items: new Ext.form.FieldSet({
								autoScroll:true,
								layout:'form',title :' Detalles : ',
								autoWidth:true,html:'<div id="pDetalle">'+detalle+'</div>',
								autoHeight: true,collapsed:true,collapsible:true
							})
						}]
					}),
					buttons: [{text: 'OK',
						handler: function(){
						winError.hide();
						if (typeof(fn)=='function')fn();
						}
					}]
				});
			}
		winError.show(Ext.getBody());
		document.getElementById("pMSG").innerHTML = msg;
		document.getElementById("pDetalle").innerHTML = detalle;
		}else{
			Ext.MessageBox.show({
				title:title[tipo-1],
				msg:msg,
				//animEl: Ext.getBody(),
				buttons: buttons[tipo-1],
				icon:icons[tipo-1],
				fn:fn
			});
		}
	}

Ext.override (Ext.form.Field, {
    setRegEx : function (pRegEx) {
        this.regex = pRegEx;
    },
    setRegExText : function (pRegExText) {
        this.regexText = pRegExText;
    },
    setFieldLabel : function (pText) {
        this.label.update (pText + ':');
    },
    setAllowBlank: function (pAllowBlank) {
        this.allowBlank = pAllowBlank;
    },
    setBlankText: function (pBlankText) {
        this.blankText = pBlankText;
    }
});

Ext.ns ('Componentes');
Ext.ns ('APPP');
Ext.ns ('Componentes.CU');

function createGrid (pStore, pCM, pToolbar, pWidth, pHeight) {
	pHeight = (pHeight != null) ?  pHeight
                                : 555;

     pWidth = (pWidth != null) ?  pWidth
                                 : 'auto';

    return new Ext.grid.GridPanel ({
		height: pHeight,
		store: pStore,
        width: pWidth,
		columns: pCM,
		tbar: pToolbar,
		loadMask: {
			msg: 'Cargando ...',
			store: pStore
		},
		bbar: new Ext.PagingToolbar ({
			store: pStore,
            pageSize: 5
		})
	})
}

function createReader (pRoot, pField) {
	return new Ext.data.JsonReader ({
		root: pRoot,
		totalProperty: 'cant'
	}, pField)
}

function renderPic (pValue) {
    return "<img src = '" +pValue+ "'/>";
}

function createForm (pFields, pTitle) {
    frm = new Ext.form.FormPanel ({
        items: pFields,
        frame: true,
        title: pTitle
    })

    return frm;
}

function createTextField (pId, pFieldLabel, pDatatype) {
    regex = null;

    switch (pDatatype) {
        case 'enterospos': {
                regex = /^[0-9]+$/;break;
        }
        case 'numerosguionbajo': {
                regex = /^[0-9]+(_[0-9]+)*$/;break;
        }
        case 'letras': {
                regex = /^([a-zA-ZáéíóúñüÑ]+ ?[a-zA-ZáéíóúñüÑ]*)+$/;break;
        }
        case 'numerosletras': {
                regex = /^([a-zA-Z0-9áéíóúñüÑ]+ ?[a-zA-Z0-9áéíóúñüÑ]*)+$/;break;
        }
        case 'email': {
                regex = /^[^@ ]+@[^@ ]+.[^@ .]+$/;break;
        }
        case 'real': {
                regex = /^-?^[0-9]+(.?[0-9]*)?$/;break;
        }
        case 'ireal': {
                regex = /^-?[0-9]+(\.[0-9]*)?$/;break;
        }
    }

    return new Ext.form.TextField ({
            regex: regex,
            fieldLabel: pFieldLabel,
            id: pId
    })
}

function createWindow (pTitle, pItems) {
    win = new Ext.Window ({
        title : pTitle,
		closable: false,
        items : pItems,
        modal : true,
		width: 300
    })

    return win;
}

function createStore  (pUrl, pReader) {
	return new Ext.data.Store ({
		url: pUrl,
        totalProperty: 'cant',
		reader: pReader
	})
}

function createGroupStore  (pField, pUrl, pReader) {
	return new Ext.data.GroupingStore ({
		url: pUrl,
                totalProperty: 'cant',
		reader: pReader,
                sortInfo: {
                    direction: 'ASC',
                    field: pField
                },
                groupField: pField
	})
}

function createCombo (pStore, pHiddenName, pValueField, pDispField, pFieldLabel) {
	combo = new Ext.form.ComboBox ({
		xtype: 'combo',
		store: pStore,
		hiddenName: pHiddenName,
		valueField: pValueField,
		displayField: pDispField,
		triggerAction: 'all',
		fieldLabel: pFieldLabel,
		mode: 'remote'
	})

	return combo;
}

function createPrinter (pGrid, pTitle, pSubtitle) {
        return new Ext.grid.XPrinter({
        grid: pGrid,
        pathPrinter: '../../../classes/ZCPrinter',
        pdfEnable: true,
        localeData: {
            Title: pTitle,
            footerText: 'Asamblea Provincial de Poder Popular',
            subTitle: pSubtitle,
            pageNo: 'P&aacute;gina #',
            printText: 'Imprimir',
            closeText: 'Cerrar',
            pdfText: 'Descargar'
        },
        useCustom : {
            custom: false,
            customStore: null,
            columns: [],
            alignCols: [],
            pageToolbar: null,
            useIt: true,
            showIt: false,
            location: 'bbar'
        }
    })
}

function importarJS(dirJS){
    var jsscript = document.createElement("script");
    jsscript.setAttribute("src", dirJS);
    jsscript.setAttribute("type", "text/javascript");
    document.getElementsByTagName("head")[0].appendChild(jsscript);
}

function importarCSS (pDirCSS) {
    var css = document.createElement("link");
    css.setAttribute("href", pDirCSS);
    css.setAttribute("rel", 'stylesheet');
    css.setAttribute("type", "text/css");
    document.getElementsByTagName("head")[0].appendChild(css);
}

function render_check (pValue) {
    path = (pValue == 1) ? "../../../public/js/ext/resources/images/default/menu/checked.gif"
                         : "../../../public/js/ext/resources/images/default/menu/unchecked.gif";

    return "<img src = '" +path+ "'>";
}

Componentes.CRUDToolbar = Ext.extend (Ext.Toolbar, {
	initComponent: function () {
		addButton = new Ext.Button ({disabled: this.disableAdd, text: 'Adicionar', iconCls: 'add'});
		addButton.setHandler (function () {
			this.addFn ();
		}, this);

		updButton = new Ext.Button ({disabled: this.disableUpd, text: 'Modificar', iconCls: 'option'});
		updButton.setHandler (function () {
			this.updFn ();
		}, this);

		remButton = new Ext.Button ({disabled: this.disableRem, text: 'Eliminar', iconCls: 'remove'});
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

Componentes.PagedGridPanel = Ext.extend (Ext.grid.GridPanel, {
	initComponent: function () {
		this.bbar = new Ext.PagingToolbar ({
			pageSize: this.pageSize,
			store: this.store
		});

		Componentes.PagedGridPanel.superclass.initComponent.call (this);
	}
});

Componentes.Window = Ext.extend (Ext.Window, {
	setFn : function (pFn, pScope) {
		this.fn = pFn;
	},
	getOkBtn : function () {
		return this.btnOk;
	},
	getCancelBtn : function () {
		return this.btnCancel;
	},
	getApplyBtn : function () {
		return this.btnApply;
	},
	initComponent: function () {
		this.btnOk = new Ext.Button ({
			text: 'Aceptar',
			id: Ext.id ()
		});
		
		this.btnCancel = new Ext.Button ({
                        text: 'Cancelar',
			id: Ext.id ()
		});
		
		this.btnApply = new Ext.Button ({
			text: 'Aplicar',
			id: Ext.id ()
		});
		
		this.btnOk.setHandler (function () {
			f = this.findByType ('form');
                        f = f [0];
                        f.getForm ().on ('actionfailed', function (frm) {
                           frm.reset ();
                        });

                        this.fn ();
			this.hide ();
		}, this);
		
		this.btnApply.setHandler (function () {
			f = this.findByType ('form');
                        f = f [0];
                        f.getForm ().on ('actionfailed', function (frm) {});

                        this.fn ();
		}, this);
		
		this.btnCancel.setHandler (function () {
			f = this.findByType ('form');
                        f = f [0];
                        f.getForm ().reset();
                        
                        this.hide ();
		}, this);
		
		this.buttons = [this.btnOk, this.btnApply, this.btnCancel];
		Componentes.Window.superclass.initComponent.call (this);
	}
});
Ext.reg ('ciext-window', Componentes.Window);

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
			},
                        disableRem: true,
                        disableUpd: true
		};
		configTbar.grid = this;

		this.tbar = new Componentes.CRUDToolbar (configTbar);
		Componentes.CRUDGrid.superclass.initComponent.call (this);

		this.getSelectionModel ().on ('selectionchange', function () {
			this.getTopToolbar ().get (1).setDisabled (this.getSelectionModel().getSelected () == null);
			this.getTopToolbar ().get (2).setDisabled (this.getSelectionModel().getSelected () == null);
		}, this);
	},
	addToolbarButton : function (btn) {
		this.tbar.add (btn);
	},
	disableBtn : function (pId) {
        Ext.getCmp (pId).disable ();
    }
});
Ext.reg ('crudgrid', Componentes.CRUDGrid);


Componentes.UI = function (pFn) {
    if (typeof(window.curURL) == 'undefined')
        window.curURL = ''

    //Se carga el json con los datos dinámicos de la UI
    Ext.Ajax.request ({
        url: location.href + 'ui/load_ui',
        params: {
          url: window.curURL
        },
        success: function (resp) {
            //Se genera un obj con la respuesta de la llamada
            obj = Ext.decode (resp.responseText);

            //Se extraen los segmentos del objeto
            fields = obj.fields;labels = Ext.decode (obj.labels);

            //Se invoca la construcción de la UI
            pFn ({
                labels: labels,
                fields: fields
            });

            //Se setean las validaciones de interfaz de usuario
            for (i = 0; i < fields.length; i++) {
                id = fields[i].id;
                cmp = Ext.getCmp (id);

                //Si tengo una expresión regular pa este campo se la seteo
                if (fields [i].regex) {
                    cmp.setRegEx (new RegExp(fields [i].regex));
                    cmp.setRegExText (fields [i].regexText);
                }

                //Si no tengo
                if (fields [i].blankText) {
                    cmp.setAllowBlank (false);
                    cmp.setBlankText (fields [i].blankText);
                }
            }

            for (key in labels) {
                currComponent = Ext.getCmp (key);

                if (currComponent) {
                    if (currComponent.getXType() == 'button')
                       currComponent.setText (labels [key]);
                    else
                       currComponent.setFieldLabel (labels [key]);
                } else {
                    grid = Ext.getCmp ('grid');

                    if (grid) {
                        cm = grid.getColumnModel ();
                        index = cm.getIndexById (key);

                        if (index != -1)
                            cm.setColumnHeader(index, labels[key]);
                    }
                }
            }
        }
    });
}
Ext.reg ('ui', Componentes.UI);

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
			},
                        disableRem: true,
                        disableUpd: true
		};
		configTbar.tree = this;

                this.getSelectionModel ().on ('selectionchange', function () {
			Ext.getCmp ('rem').setDisabled (this.getSelectionModel().getSelectedNode () == null);
			Ext.getCmp ('upd').setDisabled (this.getSelectionModel().getSelectedNode () == null);
		}, this);

		this.tbar = new Componentes.CRUDToolbar (configTbar);
		Componentes.CRUDTree.superclass.initComponent.call (this);
	}
});
Ext.reg ('crudtree', Componentes.CRUDTree);

Componentes.TreeText = Ext.extend (Ext.form.TextField, {
    VALUE : 1,
    TEXT : 2,
    CHECK : 3,
    getValue : function () {
        if (this.submitType == this.CHECK) {
            result = [];
            checked = this.tree.getChecked ();

            for (i = 0; i < checked.length; i++)
                result.push(checked [i]);

            return Ext.encode (result);
        } else {
            if (this.tree.getSelectionModel ().getSelectedNode ())
                return this.tree.getSelectionModel ().getSelectedNode ().id;
            else
                return null;
        }
    },
    select : function () {
        if (this.submitType == this.CHECK)
            this.setRawValue ('...');
        else
            this.setRawValue (this.tree.getSelectionModel ().getSelectedNode ().attributes.text);

        this.win.hide ();
    },
    initComponent: function () {
        this.tree = new Ext.tree.TreePanel (this.tree);

        if (! this.window)
            this.window = {}

        this.window.closable = false;
        this.window.modal = true;
        this.window.title = 'Seleccionar';
        this.window.items = this.tree;

        this.btn = new Ext.Button ({
            scope: this,
            text: 'Seleccionar',
            handler: function () {
                this.select ();
            }
        })

        this.window.buttons = [this.btn]
        this.win = new Ext.Window (this.window);

        this.listeners = {
            focus : function (tb) {
                tb.win.show ();
            }
        }

        Componentes.TreeText.superclass.initComponent.call (this);
    }
});
Ext.reg ('treetext', Componentes.TreeText);

Componentes.CRUDPanel = new Ext.extend (Ext.Panel, {
    initComponent: function () {
        this.tbar = new Componentes.CRUDToolbar ({
            addFn: this.addFn,
            updFn: this.updFn,
            remFn: this.remFn
        })
        Componentes.CRUDPanel.superclass.initComponent.call (this)
    }
})

Ext.reg ('crudpanel', Componentes.CRUDPanel);

Componentes.ComboBox = Ext.extend (Ext.form.ComboBox, {
    triggerAction: 'all',
    mode: 'remote',
    initComponent: function () {
        Componentes.ComboBox.superclass.initComponent.call (this);
    }
})