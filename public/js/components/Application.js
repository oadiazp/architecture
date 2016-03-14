Componentes.Application = Ext.extend (Ext.app.App, {
    constructor: function (pConfig) {
        menu = Ext.decode (pConfig.menu);
        this.loadedModules = this.getMenu (menu);
        this.profile = Ext.decode (pConfig.profile);
        
        Componentes.Application.superclass.constructor.call (this);
    },
    getModules : function () {
        return this.loadedModules;
    },
    getMenu : function (pMenu) {
        result = []; item = {};
        
        cont = 0;
        while (cont < pMenu.length) {
            result.push (new Componentes.Modulo (pMenu [cont]))
            cont ++;
        }

        return result;
    },
    getStartConfig : function(){
        return {
            title: 'Usuario: ' + this.profile.user,
            iconCls: 'user',
            toolItems: [{
                text:'Configurar',
                iconCls:'settings',
                scope:this
            },'-',{
                text:'Salir',
                iconCls:'logout',
                scope:this,
                handler: function () {
                    Ext.Ajax.request ({
                        url: 'auth/logout',
                        success: function (resp) {
                            location.href = Ext.decode (resp.responseText).url;
                        }
                    })
                }
            }]
        }
    }
})