FileManager.gpPane = Ext.extend(FileManager.gpPaneUi, {
    initComponent: function() {
        FileManager.gpPane.superclass.initComponent.call(this);

        this.addEvents ('messagerecived');

        this.on ('messagerecived', function (p) {
            console.log (p)
        }, this)

        this.on ('resize', function (gp, w) {
            this.txtPath.setWidth (w * 0.9)
        }, this)
        
        this.on ('afteredit', function (e) {
            Ext.Ajax.request ({
                url: 'manager/rename',
                params: {
                    previous: e.grid.txtPath.getValue () + e.originalValue,
                    value: e.grid.txtPath.getValue () + e.value
                }, 
                success: function (pResp) {
                    e.record.commit ()
                },
                failure: function (pResp) {
                    e.record.reject ()
                }
            })
        })
        
        this.on ('dblclick', function () {
            sm = this.getSelectionModel()
            
            if (sm.hasSelection ()) {
                s = sm.getSelected ().data
                
                if (s.type == 'dir') {
                    this.txtPath.setValue (this.txtPath.getValue () + s.name + '/') 
                    this.setTitle (s.name)
                    this.store.load ()
                }
            }
        }, this)

        this.on ('render', function () {
            this.keyMap = new Ext.KeyMap(this.getGridEl(), [{
                key  : 'd',
                alt : true,
                ctrl : true,
                stopEvent : true,
                scope : this,
                fn : function () {
                    alert (1)
                }    
            },{
                key  : 9,
                stopEvent : true,
                scope : this,
                fn : function () {
                    this.scope.getOppositePane ().getActiveTab ().getSelectionModel ().selectFirstRow ()
                }    
            }, {
                ctrl : true,
                key  : 'w',
                stopEvent : true,
                scope : this,
                fn : function () {
                    if (this.closable) {
                        tp = this.scope
                        tp.remove (this)    
                    }
                }    
            },
            {
                ctrl : true,
                key  : 't',
                stopEvent : true,
                scope : this,
                fn : function () {
                    gp = new FileManager.gpPane ()
                    gp.txtPath.setValue (this.txtPath.getValue ())
                    gp.store.load ()
                    gp.scope = this.scope
                    gp.closable = true;

                    parts = this.txtPath.getValue ().split ('/')
                    
                    if (parts.length > 2)
                        gp.setTitle (parts [parts.length - 2])
                    else
                        gp.setTitle (this.txtPath.getValue ())
                    
                    this.scope.add (gp).show ()
                }
            }])
        }, this)

        sm = this.getSelectionModel ()
        sm.on ('selectionchange', function (sm) {
            if (sm.getCount ()) {
                this.scope.setActivePane (this.scope)
                this.scope.getOppositePane ().getActiveTab ().getSelectionModel ().clearSelections ()
            }
        }, this)
    }
});