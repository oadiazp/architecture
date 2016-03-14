BLANK_IMAGE_URL = 'http://localhost/projects/sgconst/js/ext/resources/images/default/s.gif';


var itemsVentanaCrear,tbDesktop;
var windowIndex = 0;
var perfil = {}; 
perfilPortal = {};
perfilPortal.etiquetas = {};

/*
 * Componente portal de aplicaciones
 *
 * Interfaz del portal desktop con ventana por acciones.
 *
 * @author Dionisdel Ponce Santana
 * @package Portal
 * @subpackage Portal
 * @copyright UCID-ERP Cuba
 * @version 1.0-0
 */

//importarCSS(document.getElementById('dir_extjs').value+'temas/'+perfil.tema+'/css/desktop.css');
function definirBotonesBarras(){
	var txtUser = (perfil.alias) ? perfil.alias : 'perfil.usuario';
	tbDesktop = [ {iconCls:'btn', icon:perfil.dirImg+'ayuda.png', text:perfilPortal.etiquetas.lbBtnAyuda,	handler:function(){},scope:this },'-',
					 {iconCls:'btn', icon:perfil.dirImg+'usuario.png', text:txtUser, handler:function(){mostrarWinSelectEntidad();},scope:this},
					 {iconCls:'btn', icon:perfil.dirImg+'salir.png', text:perfilPortal.etiquetas.lbSalir, handler:function(){cerrarSesion();}, scope:this}];
}
definirBotonesBarras();
var itemsVentanaCrear;
//Begining portal-desktop.js
var menuTMP = {};
	MyDesktop = new Ext.app.App({
		init :function(){
			Ext.QuickTips.init();
		},
		getModules : function(){
			return dameMenuModules(menuTMP);
			/*return [
				new MyDesktop.BogusMenuModule()
				//new MyDesktop.BogusModule()
			];*/
		},
		// config for the start menu
		getStartConfig : function(){
			var txtUser = (perfil.alias) ? perfil.alias : perfil.usuario;
			return {
				title:'<center>'+perfilPortal.etiquetas.lbStartTitle +' '+txtUser+'&nbsp; | &nbsp;'+'Tema: '+perfil.tema+'</center>',
				iconCls: 'user',
				toolItems: tbDesktop
			};
		}
	});
	MyDesktop.BogusModule = Ext.extend(Ext.app.Module, {
		init : function(){
			this.launcher = {
				text: 'ddd',
				iconCls:'bogus',
				handler : this.createWindow,
				scope: this,
				windowId:'ddd'
			}
		},
		createWindow : function(src){
			var desktop = this.app.getDesktop();
            objDesk = this.app.getDesktop();
			var win = desktop.getWindow('win'+src.aWinConfig.id);
			if(!win){
				win = desktop.createWindow({
					id: 'win'+src.aWinConfig.id,
					title:src.aWinConfig.text,
					layout:'fit',
					items:new Ext.Panel({
						id: 'iframe'+src.aWinConfig.id,
						border:false,
						html: '<iframe id="ifMarco' + src.aWinConfig.id + '" style="width:100%; height: 100%; border:none;"></iframe>',
						layout:'fit'
					}),
					width:800,
					maximized:true,
					height:490,
					minWidth :800,
					minHeight:480,
					iconCls: 'bogus',
					shim:false,
					animCollapse:false,
					constrainHeader:true
				});
			}
			win.show();
			idFuncionalidad = src.aWinConfig.id;
			document.getElementById('ifMarco' + src.aWinConfig.id).src = src.aWinConfig.url;
		}
	});
	MyDesktop.BogusMenuModule = Ext.extend(MyDesktop.BogusModule, {
		init : function(){
			this.launcher = {
				text: perfilPortal.etiquetas.lbTituloMenu,
				iconCls: 'bogus',
				handler: function() {
					return false;
				},
				menu: {
					items:dameItemsMenu(this, menuTMP)
				}
			}
		}
	});
	//Funciones
	function dameItemsMenu(objDesk, objson){
		var arrayItems = Array();
		if (objson && objson.length){
			for(var i=0; i<objson.length;i++){
				if (objson[i].menu){
					arrayItems[i]={
						text: objson[i].text,
						iconCls:'btn',
						icon:(objson[i].icono)?UCID.portal.perfil.dirImg+objson[i].icono+'.png':'',
						handler: function() {
							return false;
						},
						menu: {
							items:dameItemsMenu(objDesk, objson[i].menu)
						}
					}
				}
				else {
					arrayItems[i]={
						text: objson[i].text,
						iconCls:'btn',
						icon:(objson[i].icono)?UCID.portal.perfil.dirImg+objson[i].icono+'.png':'',
						handler : objDesk.createWindow,
						scope: objDesk,
						aWinConfig:objson[i],
						a:'hola',
						windowId: objson[i].id
					}
				}
			}
		}
		return arrayItems;
	}


function creaMenuModules(aMenu,aPos){
		//MyDesktop.BogusMenuModule
		eval('MyDesktop.Subsistema'+aPos+' = Ext.extend(MyDesktop.BogusModule, {init : function(){this.launcher = {text:"'+aMenu.text+'",iconCls: "bogus",handler: function() {return false;},menu: {items:dameItemsMenu(this, aMenu.menu) }}}});');
	}

	function dameMenuModules(menuTMP){
		//alert(menuTMP.length);
		var arrayModules = [];
		arrayModules = '[';
		for(var i=0;i<menuTMP.length;i++){
			arrayModules+= (i+1 == menuTMP.length)?'new MyDesktop.Subsistema'+i+'()]':'new MyDesktop.Subsistema'+i+'(),';
			if(menuTMP[i].menu) creaMenuModules(menuTMP[i],i);
		}
		return eval(arrayModules);
	}
;