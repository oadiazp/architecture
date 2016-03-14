APPP.TreeEntidad = Ext.extend (Ext.tree.TreePanel, {
    initComponent: function () {
        this.frame = true;
        this.border = false;

        if (!this.height)
            this.height = 200;

        this.autoScroll = true;
        this.rootVisible = true;
        this.loader = new Ext.tree.TreeLoader ({url: this.url});
        this.root = new Ext.tree.AsyncTreeNode({text: 'Entidades', leaf: false, id: 'root'});

        APPP.TreeEntidad.superclass.initComponent.call (this);
    }
})