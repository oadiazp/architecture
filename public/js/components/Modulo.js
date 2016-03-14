/**
 * Componente para la creación de módulos del escritorio de Ext.
 *
 * @author Omar Antonio Díaz Peña.
 * @version 1.0.0
 */

Componentes.Modulo = Ext.extend (Ext.app.Module, {
    /**
     * Método que levante una ventana cuando se selecciona una opción del menu.
     *
     * @param pConfig: El objeto de configuración del JSON
     */
    showWindow : function (pConfig) {
            var desktop = this.app.getDesktop();
            objDesk = this.app.getDesktop();
			var win = desktop.getWindow('win'+pConfig.id);
			if(!win){
					divId = Ext.id ();
					window.lastId = divId;
					
                   //Configuración de las ventanas por defecto
                   config = {                        
                        title: pConfig.text,
                        maximized:true,
                        width :800,
                        height:490,
						html:'<div id="' + window.lastId +'" style="width:99%; height:98%;" ></div>',
                        iconCls: 'bogus',
                        shim:false,
                        animCollapse:false,
                        constrainHeader:true
                    }

                    //Si se le pasa alto la ventana lo asume y le quita el maximinzar
                    if (pConfig.height) {
                        config.height = parseInt(pConfig.height);
                        config.maximized = false;
                    }

                    //Si se le pasa ancho la ventana lo asume y le quita el maximinzar
                    if (pConfig.width) {
                        config.width = parseInt(pConfig.width);
                        config.maximized = false;
                    }
                
                    win = desktop.createWindow(config);
					
					Ext.Ajax.request ({
						url: pConfig.url,
						success: function (pResp) {
							obj = Ext.decode (pResp.responseText);
							
							if (obj.js)
								for (i = 0; i < obj.js.length; i++)
									importarJS (obj.js [i]);

			               if (obj.css)
			                   for (i = 0; i < obj.css.length; i++)
			                        importarCSS (obj.css [i]);
						}
					});
                }
                
                win.show();                
    },
    /**
     * Método que le setea los handlers a los botones del menus.
     *
     * @param pMenu: Objeto del menú al que se le van a setear los handlers.
     * @param pModulo: Objeto del módulo.
     */
    getMenu : function (pMenu, pModulo) {
        /**
         * Se recorren todos los items del menu
         * si alguno tiene menu entonces se le pone un handler q no haga nada
         * y después se itera sobre las opciones de su menu invocandose a este método
         * recursivamente.
         */
        for (i = 0; i < pMenu.length; i++)
            if (pMenu [i].menu) {
                pMenu [i].handler = function () {
                    return false;
                }
            
                for (j = 0; j < pMenu [i].menu.length; j++)
                    pModulo.getMenu (pMenu[i].menu[j], pModulo)                
            } else {
                /**
                 * Si no entocnes se le pone como handler el método showWindow
                 */
                pMenu [i].configMenu = this;
                pMenu [i].handler = function () {
                    this.configMenu.showWindow (this);
                }
            }
    },
    init : function () {
        menu = this.getMenu (this.menu, this);

        this.launcher = {
            text: this.text,
            iconCls: 'bogus',
            handler: function() {return false;}
        }
		
        this.launcher.menu = this.menu;
    }
});