var xprinter;

function printmygridGO (a) {xprinter.printGrid(a)}

btnVP = new Ext.Button ({
                text: 'Vista previa',
                iconCls: 'vp',
                disabled: true,
                handler: function () {
                    xprinter.prepare ();
                    btnVP.disable ()
                }
            });

function createXPrinter (pGrid, pTitle, pSubtitle) {
    xprinter = createPrinter(pGrid, pTitle, pSubtitle)
}