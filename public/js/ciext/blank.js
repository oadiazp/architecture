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
						},{ columnWidth:.7,
							items: {xtype:'panel',
								autoHeight: true,
								html:'<div id="pMSG">'+msg+'</div>'}
						},{ columnWidth:1,
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