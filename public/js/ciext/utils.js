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
                regex = /^[0-9]+$/; break;
        }
        case 'numerosguionbajo': {
                regex = /^[0-9]+(_[0-9]+)*$/; break;
        }
        case 'letras': {
                regex = /^([a-zA-ZáéíóúñüÑ]+ ?[a-zA-ZáéíóúñüÑ]*)+$/; break;
        }
        case 'numerosletras': {
                regex = /^([a-zA-Z0-9áéíóúñüÑ]+ ?[a-zA-Z0-9áéíóúñüÑ]*)+$/; break;
        }
        case 'email': {
                regex = /^[^@ ]+@[^@ ]+.[^@ .]+$/; break;
        }
        case 'real': {
                regex = /^-?^[0-9]+(.?[0-9]*)?$/; break;
        }
        case 'ireal': {
                regex = /^-?[0-9]+(\.[0-9]*)?$/; break;
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
    path = (pValue == 1) ? "../../../../public/js/ext/resources/images/default/menu/checked.gif"
                         : "../../../../public/js/ext/resources/images/default/menu/unchecked.gif";

    return "<img src = '" +path+ "'>";
}