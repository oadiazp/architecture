DoctrineGenerator.Main = Ext.extend (DoctrineGenerator.UI.Main, {
    initComponent: function () {
        DoctrineGenerator.Main.superclass.initComponent.call (this)

        this.btnNewProject.setHandler (function () {
            new DoctrineGenerator.UI.winCreateProject ().show ();
        }, this);
    }
})

new DoctrineGenerator.Main ();