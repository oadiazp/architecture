
//Ext.BLANK_IMAGE_URL = '../extjs/images/default/s.gif';

// Sample desktop configuration
MyDesktop = new Ext.app.App({
	init :function(){
		Ext.QuickTips.init();
	},

	getModules : function(){
		return [
//                        new MyDesktop.BogusMenuModule(),
//                        new MyDesktop.BogusModule()
                          new Componentes.Modulo (),
                          new Componentes.Submodulo ()
                       ];
	},

    // config for the start menu
    getStartConfig : function(){
        return {
            title: 'Jack Slocum',
            iconCls: 'user',
            toolItems: [{
                text:'Settings',
                iconCls:'settings',
                scope:this
            },'-',{
                text:'Logout',
                iconCls:'logout',
                scope:this
            }]
        };
    }
});


// for example purposes
