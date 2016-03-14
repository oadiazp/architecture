//Componente que engloba toda la lógica de interfaz de usuario
Componentes.UI = function (pFn) {
    //Se carga el json con los datos dinámicos de la UI
    Ext.Ajax.request ({
        url: location.href + 'load_ui',
        params: {
          url: location.href
        },
        success: function (resp) {
            //Se genera un obj con la respuesta de la llamada
            obj = Ext.decode (resp.responseText);

            //Se extraen los segmentos del objeto
            fields = obj.fields;labels = Ext.decode (obj.labels);

            //Se invoca la construcción de la UI
            pFn ({
                labels: labels,
                fields: fields
            });

            //Se setean las validaciones de interfaz de usuario
            for (i = 0; i < fields.length; i++) {
                id = fields[i].id;
                cmp = Ext.getCmp (id);

                //Si tengo una expresión regular pa este campo se la seteo
                if (fields [i].regex) {
                    cmp.setRegEx (new RegExp(fields [i].regex));
                    cmp.setRegExText (fields [i].regexText);
                }

                //Si no tengo 
                if (fields [i].blankText) {
                    cmp.setAllowBlank (false);
                    cmp.setBlankText (fields [i].blankText);
                }
            }
            
            for (key in labels) {
                currComponent = Ext.getCmp (key);

                if (currComponent) {
                    if (currComponent.getXType() == 'button')
                       currComponent.setText (labels [key]);
                    else
                       currComponent.setFieldLabel (labels [key]);
                } else {
                    grid = Ext.getCmp ('grid');
                    cm = grid.getColumnModel ();
                    index = cm.getIndexById (key);
                    
                    if (index != -1)
                        cm.setColumnHeader(index, labels[key]);
                }
            }
        }
    });
}