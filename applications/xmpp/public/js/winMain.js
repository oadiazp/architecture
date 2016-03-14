XMPP.vpMain = Ext.extend(Ext.Viewport, {
    width: 523,
    layout: 'border',
    initComponent: function() {
        this.items = [
            {
                xtype: 'treepanel',
                title: 'Contactos',
                region: 'west',
                width: 136,
                root: {
                    text: 'Tree Node'
                }
            },
            {
                xtype: 'tabpanel',
                activeTab: 0,
                region: 'center',
                title: 'Conversaciones'
            }
        ];
        XMPP.vpMain.superclass.initComponent.call(this);
    }
});
