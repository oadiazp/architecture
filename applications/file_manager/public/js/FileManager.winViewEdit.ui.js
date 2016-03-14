FileManager.winViewEditUi = Ext.extend (Ext.Window, {
	initComponent : function () {
		this.pEditor = new Ext.ux.panel.CodeMirror ({
            sourceCode: '/* paste here somme php code */',
            layout: 'fit',
            scope : this,
            parser: 'php',
            onSave: function() {
                // save logic here
                // this.codeMirrorEditor gets you access to original code mirror object :)
            },
            codeMirror: {
                height: '100%',
                width: '100%'
            }
		})

		this.items = [this.pEditor]

		FileManager.winViewEditUi.superclass.initComponent.call (this);
	}
})