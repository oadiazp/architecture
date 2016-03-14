Finder.UI.vpFinder = Ext.extend(Ext.Viewport, {
    layout: 'border',
    initComponent: function() {
        this.pDetails = new Ext.Panel ({
            scope : this,
            title : 'Detalles',
            collapsed : true,
            collapsible: true,
            frame : true,
            width: 400,
            region : 'east'
        })
        
        this.winInstructor = new Finder.winInstructor ({
            scope : this
        })
        
        this.template = new Ext.XTemplate(
            '<img src={url}>',
            '<p><b>Nombre: </b> {name}</p>',
            '<p><b>Solap&iacute;n: </b> {id}</p>',
            '<p><b>Tel&eacute;fono: </b> {phone}</p>'
        );
            
        this.stInstructores = createStore ('', createReader ('data', ['IdExpendiente', 'NombreCompleto']))
        this.cbInstructores = new Ext.form.ComboBox ({
            scope : this,
            displayField : 'NombreCompleto',
            valueField : 'IdExpediente',
            mode : 'local',
            store : this.stInstructores
        })
        
        this.stApto = createStore('finder/aptos', createReader ('data', ['NumeroApartamento', 'IdApartamento', 'Telefono', 'IdEdificio'])),
        
        this.stApto.load ()
        
        this.cbApto = new Ext.form.ComboBox ({
            store : this.stApto,
            displayField : 'NumeroApartamento',
            valueField : 'IdApartamento',
            triggerAction : 'all',
            mode: 'local',
            typeAhead : true
        })
        
        this.stRoom = createStore('finder/persons', createReader('data', ['id', 'url', 'pic', 'name','phone', 'room']));
        
        this.btnInstructor = new Ext.Button ({
            text : 'Buscar instructor'
        })
        
        this.gpPersons = new Ext.grid.GridPanel({
                xtype: 'grid',
                title: 'Buscar por apartamentos',
                region: 'center',
                autoExpandColumn : 'name',
                store : this.stRoom,
                loadMask : {msg: 'Cargando ...'},
                columns: [
                    {
                        dataIndex: 'pic',
                        header: 'Foto',
                        sortable: true,
                        renderer: renderPic,
                        width: 100
                    },
                    {
                        dataIndex: 'name',
                        id : 'name',
                        header: 'Nombre',
                        sortable: true,
                        width: 100
                    },
                    {
                        dataIndex: 'room',
                        header: 'Cuarto',
                        sortable: true,
                        width: 100
                    }
                ],
                tbar: {
                    xtype: 'toolbar',
                    items: [
                        'Apartamento: ',
                        this.cbApto,
                        '->',
                        this.btnInstructor
                    ]
                }
            })
        
        this.items = [
            this.gpPersons, this.pDetails
        ];
        
        Finder.UI.vpFinder.superclass.initComponent.call(this);
    }
});
