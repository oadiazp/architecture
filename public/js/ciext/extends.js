Ext.override (Ext.form.Field, {
    setRegEx : function (pRegEx) {
        this.regex = pRegEx;
    },
    setRegExText : function (pRegExText) {
        this.regexText = pRegExText;
    },
    setFieldLabel : function (pText) {
        this.fieldLabel = pText;
    },
    setAllowBlank: function (pAllowBlank) {
        this.allowBlank = pAllowBlank;
    },
    setBlankText: function (pBlankText) {
        this.blankText = pBlankText;
    }
});