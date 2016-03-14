Ext.extend (Ext.Panel, {
    initComponent: function () {
        this.superclass.initComponent.call (this);
    },
    loadUI: function (pUrl) {
        Ext.ajax.request ({
            url: pUrl,
            success: function (resp) {
                obj = Ext.decode (resp.responseText);
                csss = obj.css; jss = obj.js;

                for (i = 0; i < csss.length; i++) {
                    css = document.createElement('link');
                    css.href = csss[i];
                    css.type = 'text/css';
                    css.rel = 'stylesheet';
                }
            }
        })
    }
});