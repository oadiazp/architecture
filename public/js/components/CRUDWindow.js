Componentes.CRUDWindow = function (config) {
    this.modal = true,
    this.closable = false,

    tbar = [{id: 'add', disabled: config.disableAdd, text: 'Adicionar', iconCls: 'add', handler : function () {config.addFn ()}},
            {id: 'upd', disabled: config.disableUpd, text: 'Modificar', iconCls: 'option', handler : function () {config.updFn ()}},
            {id: 'rem', disabled: config.disableRem, text: 'Eliminar',  iconCls: 'remove', handler : function () {config.remFn ()}}]

    this.addToolbarButton = function (btn) {
        tbar.push (btn)
    }

    this.tbar = tbar

    Componentes.CRUDWindow.superclass.constructor.call (this, config);
};

Ext.extend(Componentes.CRUDWindow, Ext.Window, {});
