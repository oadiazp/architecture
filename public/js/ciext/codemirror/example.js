/**
 * Ext.ux.panel.CodeMirror example
 * @author Dan Ungureanu - ungureanu.web@gmail.com / http://www.devweb.ro
 */
Ext.onReady(function(){
    var p = new Ext.Window({
        title: 'Examples',
        layout: 'border',
        height: 300,
        width: 800,
        items:[{
            xtype: 'tabpanel',
            id: 'cont-tabpanel',
            region: 'center',
            border: false,
            activeTab: 0,
            
            //frame:true,
            //defaults:{autoHeight: true},
            items:[{
                xtype: 'uxCodeMirrorPanel',
                title: 'Php example',
                sourceCode: '/* paste here somme php code */',
                layout: 'fit',
                parser: 'php',
                onSave: function() {
                    // save logic here
                    // this.codeMirrorEditor gets you access to original code mirror object :)
                },
                codeMirror: {
                    height: '100%',
                    width: '100%'
                }
            }]
        }]
        
    }).show();
    
    // dynamic add of code panel
    var oCodeMirrorPanel = Ext.getCmp('cont-tabpanel').add({
        xtype: 'uxCodeMirrorPanel',
        title: 'JS example',
        closable: true,
        listeners: {
            render: function(){
                this.doLayout();
            }
        },
        sourceCode: '/* paste here somme js code */',
        //layout: 'fit',
        parser: 'js',
        onSave: function() {
            // save logic here
            // this.codeMirrorEditor gets you access to original code mirror object :)
        },
        codeMirror: {
            height: '100%',
            width: '100%'
        }
    });
});
