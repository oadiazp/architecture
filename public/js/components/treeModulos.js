APPP.TreeModulos = Ext.extend (Ext.tree.TreePanel, {
    initComponent: function () {
        this.frame = true;
        this.border = false;

        if (!this.height)
            this.height = 200;

        this.autoScroll = true;
        this.rootVisible = false;
        this.loader = new Ext.tree.TreeLoader ({url: this.url});
        this.root = new Ext.tree.AsyncTreeNode({preloadChildren: true, text: 'Módulos', leaf: false, id: -1});

        APPP.TreeModulos.superclass.initComponent.call (this);
    }
});