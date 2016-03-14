Componentes.TreeText = Ext.extend (Ext.form.TextField, {
    VALUE : 1,
    TEXT : 2,
    CHECK : 3,
    getValue : function () {
        if (this.submitType == this.CHECK) {
            result = [];
            checked = this.tree.getChecked ();

            for (i = 0; i < checked.length; i++)
                result.push(checked [i]);

            return Ext.encode (result);
        } else {
            if (this.tree.getSelectionModel ().getSelectedNode ())
                return this.tree.getSelectionModel ().getSelectedNode ().id;
            else
                return null;
        }
    },
    select : function () {
        if (this.submitType == this.CHECK)
            this.setValue ('...');
        else
            this.setValue (this.tree.getSelectionModel ().getSelectedNode ().attributes.text);

        this.win.hide ();
    },
    initComponent: function () {
        this.tree = new Ext.tree.TreePanel (this.tree);

        if (! this.window) 
            this.window = {}
        
        this.window.closable = false;
        this.window.modal = true;
        this.window.title = 'Seleccionar';
        this.window.items = this.tree;
        this.window.buttons = [{text: 'Seleccionar', handler: function (b) {
            b.select ();
        }}]
        this.win = new Ext.Window (this.window);

        this.listeners = {
            focus : function (tb) {
                tb.win.show ();
            }
        }

        Componentes.TreeText.superclass.initComponent.call (this);
    }
});

Ext.reg ('treetext', Componentes.TreeText);