Finder.UI.winInstructor = Ext.extend(Ext.Window, {
    title: 'Instructor',
    width: 521,
    height: 293,
    closable : false,
    frame : true,
    modal : true,
    layout: 'border',
    initComponent: function() {
        this.picTpl = new Ext.XTemplate(
            '<img src={url}>'
        )
            
        this.dataTpl = new Ext.XTemplate(
            '<p>Nombre: {name}</p>'
        )
        
        
        this.items = [
            {
                xtype: 'panel',
                title: '',
                id : 'data-panel',
                region: 'center'
            },
            {
                xtype: 'panel',
                title: '',
                id : 'pic-panel',
                region: 'west',
                width: 191
            }
        ];
        Finder.UI.winInstructor.superclass.initComponent.call(this);
    }
});
