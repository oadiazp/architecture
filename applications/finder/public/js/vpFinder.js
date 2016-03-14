/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


Finder.vpFinder = Ext.extend (Finder.UI.vpFinder, {
    updateDetailsPanel : function () {
        record = this.gpPersons.getSelectionModel ().getSelected().data
        this.template.overwrite (this.pDetails.body, record)
    },
    initComponent : function () {
        Finder.vpFinder.superclass.initComponent.call (this)
        
        this.cbApto.on ('select', function (c, r, i) {
            this.stRoom.load ({
                params: {apto : r.data.IdApartamento,
                         telef : r.data.Telefono,
                         edificio : r.data.IdEdificio}
            })
        }, this)
        
        this.gpPersons.on ('rowclick', function () {
            this.pDetails.expand ()
            this.updateDetailsPanel ()
        }, this)
        
        this.btnInstructor.setHandler (function () {
            this.winInstructor.show (null, function () {
                this.winInstructor.loadInstructor (this.cbAptos.get)
            }, this)
        }, this)
    }
})

new Finder.vpFinder ()