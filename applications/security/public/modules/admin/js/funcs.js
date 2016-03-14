//Security.Modules.Functionality = Ext.extend (Ext.Window, {
//      addFunc: function () {
//            f = this.frm.getForm ();
//
//            if (f.isValid ()) {
//                f.submit ({
//                    url: 'admin/funcs/adicionar',
//                    params: {
//                        node: this.modulo
//                    },
//                    failure: function (frm) {
//                        frm.scope.grid.store.reload ();
//                    }
//                });
//            }
//        },
//       updFunc: function () {
//        f = this.frm.getForm ();
//
//        if (f.isValid ()) {
//            f.submit ({
//                    url: 'admin/funcs/modificar',
//                    params: {
//                        id: this.grid.getSelectionModel ().getSelected ().data.idfuncionalidad
//                    },
//                    failure: function (frm) {
//                        frm.scope.grid.store.reload ();
//                    }
//            });
//          }
//       },
//      initComponent : function () {
//        this.grid = new Componentes.CRUDGrid ({
//           addFn: function () {
//                this.scope.win.setFn (function () {
//                    this.scope.addFunc ();
//                });
//
//                this.scope.win.show ();
//           },
//           updFn: function () {
//               this.scope.win.setFn (function () {
//                    this.scope.updFunc ();
//                });
//
//                this.scope.win.show ();
//
//                this.scope.frm.getForm ().loadRecord ({
//                    success: true,
//                    data: this.getSelectionModel ().getSelected ().data
//                });
//           },
//           remFn: function () {
//                r = this.getSelectionModel ().getSelected ();
//
//                if (r) {
//                    Ext.Msg.show ({
//                        msg: 'Seguro que desea eliminar el registro?',
//                        buttons: Ext.MessageBox.YESNO,
//                        icon: Ext.MessageBox.QUESTION,
//                        scope: this,
//                        fn: function (b) {
//                            if (b == 'yes') {
//                                Ext.Ajax.request ({
//                                    url: 'admin/funcs/eliminar',
//                                    params: {
//                                        id : this.getSelectionModel ().getSelected ().data.idfuncionalidad
//                                    },
//                                    scope: this,
//                                    success: function () {
//                                        this.store.reload ();
//                                    }
//                                });
//                            }
//                        }
//                    });
//                }
//           },
//           layout: 'fit',
//           height : 365,
//           scope: this,
//           viewConfig: {
//               forceFit: true
//           },
//           pageSize: 8,
//           store: createStore ('admin/funcs/cargar', createReader ('data', [{name: 'idfuncionalidad', mapping: 'f_idfuncionalidad'},
//                                                                            {name: 'funcionalidad', mapping: 'f_funcionalidad'},
//                                                                            {name: 'url', mapping: 'f_url'},
//                                                                            {name: 'ancho', mapping: 'f_ancho'},
//                                                                            {name: 'alto', mapping: 'f_alto'},
//                                                                            {name: 'menu', mapping: 'f_menu'}])),
//           columns: [{header: 'Funcionalidad', dataIndex: 'funcionalidad'},
//                      {header: 'Url', dataIndex: 'url', width: 150},
//                      {header: 'Alto', dataIndex: 'alto', width: 50},
//                      {header: 'Ancho', dataIndex: 'ancho', width: 50},
//                      {header: 'Menu', dataIndex: 'menu', width: 50, renderer: render_check}]
//        });
//
//        this.items = this.grid;
//        this.width = 500;
//        this.height = 400;
//        this.modal = true;
//        this.title = 'Funcionalidades';
//
//        this.frm = new Ext.form.FormPanel ({
//            frame: true,
//            scope: this,
//            items: [
//                    {
//                        xtype: 'textfield',
//                        id: 'funcionalidad',
//                        fieldLabel: 'Funcionalidad'
//                    }, {
//                        xtype: 'textfield',
//                        id: 'url',
//                        fieldLabel: 'Url'
//                    }, {
//                        xtype: 'numberfield',
//                        id: 'ancho',
//                        fieldLabel: 'Ancho'
//                    }, {
//                        xtype: 'numberfield',
//                        id: 'alto',
//                        fieldLabel: 'Alto'
//                    }, {
//                        xtype: 'checkbox',
//                        id: 'menu',
//                        fieldLabel: 'Menu'
//                    }
//            ]
//        });
//
//        this.win = new Componentes.Window ({
//            items: this.frm,
//            title: 'Adicionar',
//            modal: true,
//            scope: this
//        });
//
//        Security.Modules.Functionality.superclass.initComponent.call (this);
//   }
//});

