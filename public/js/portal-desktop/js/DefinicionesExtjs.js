/***	Panel	**
pCasoUso = new Ext.Panel({
		title:'titulo',
		id:'id',
		width:100,
		height:100,
		layout:'fit'
});*/
/***	TabPanel	**
var tpCasoUso = new Ext.TabPanel({
	activeTab:0,
	id:'id',
	width:300,
	height:200,
	items:[
				{title:'titulo 1'},
				{title:'titulo 2'},
				{title:'titulo .'}
	]
});*/
/***	ViewPort	**
var vpCasoUso = new Ext.Viewport({
	title:'titulo',
	id:'id',
	layout:'fit'
});*/
/***	Window	**
var	vCasoUso = new Ext.Window({
		title:'titulo',
		layout:'fit',
		width:100,
		height:180,
		modal:true,
		closeAction:'hide'
});
vCasoUso.show();*/
/***	JsonReader	***/
var rdCasoUso = new Ext.data.JsonReader({
	root:'campos',
	id:'idRecord',
	totalProperty:'totalRecords'
	},
	[	{name: 'campo1'},
		{name: 'campo2'},
		{name: 'campo3'}]
);
/***	Store	***/
var stCasoUso =  new Ext.data.Store({
	baseParams:{accion:'CargarDatosCU'},
	url: '../xml/libros1.xml',
	reader:rdCasoUso
});
/***	RowSelectionModel (seleccion simple)	***/
var smCasoUso = new Ext.grid.RowSelectionModel({singleSelect:true});
/***	GridPanel	***/
var gpCasoUso = new Ext.grid.GridPanel({
	title:'T&iacute;tulo del Grid',
	frame:true,
	iconCls:'icon-grid',
	autoExpandColumn:'expandir',
	store:stCasoUso,
	height:235,
	width:400,
	sm: smCasoUso,
	columns: [
		{id:'expandir',header: 'Campo 1', dataIndex: 'Campo1'},
		{header: 'Campo 2', width:100, dataIndex: 'Campo2'},
		{header: 'Campo 3', width:100, dataIndex: 'Campo3'}
	],
	bbar: new Ext.PagingToolbar({
		pageSize: 5,
		store: stCasoUso,
		displayInfo: true,
		displayMsg: 'Resultados de {0} - {1} de {2}',
		emptyMsg: "No hay resultados para mostrar."
	})
});
/***	TreePanel	**
var trCasoUso = new Ext.tree.TreePanel({
	title:'titulo',
	width:100,
	height: 100,
	loader: new Ext.tree.TreeLoader({
		baseParams:{accion:'cargarTreeCU'},
		dataUrl:''
	}),
});*/
/***	Insertando Nodo Raiz	**
var rootNode = new Ext.tree.AsyncTreeNode({
	text:'Nodo Raiz',
	id:'id'
});
treeCasoUso.setRootNode(rootNode);*/
/***	ComboBox	**
var cmbCasoUso = new Ext.form.ComboBox({
  emptyText:'Seleccione',
  fieldLabel:'Label Combo',
  store:stCasoUso,
  displayField:'campoStore',
  mode:'local'
});*/
/***	DateField	**
var dfCasoUso = new Ext.form.DateField({
  fieldLabel:'Label Campo',
	format: 'd/m/y'
});*/
/***	NumberField	**
var nfCasoUso = new Ext.form.NumberField({
  fieldLabel:'Label Campo',
	decimalPrecision:3
});*/
/***	Radio	**
var rdCasoUso = new Ext.form.Radio({
	boxLabel:'Label Campo',
	hideLabel:true
});*/
/***	Checkbox	**
var chkCasoUso = new Ext.form.Checkbox({
	boxLabel:'Label Campo',
	hideLabel:true
});*/
/***	TextArea	**
var taCasoUso = new Ext.form.TextArea({
	fieldLabel:'Label Campo'
});*/
/***	TextField	**
var tfCasoUso = new Ext.form.TextField({
	fieldLabel:'Label Campo'
});*/
/***	TimeField	**
var tmfCasoUso = new Ext.form.TimeField({
	fieldLabel:'Label Campo',
	minValue:'8:00am',
	maxValue:'6:00pm'
});*/
/***	FormPanel	**
var fpCasoUso = new Ext.FormPanel({
	title:'titulo',
	labelAlign: 'top',
	url:'../dirUrl.php',
	frame:true,
	width:140,
	height: 180,
	defaultType:'textfield',
	reader : new Ext.data.JsonReader({
			root : 'campos',
		}, [
			{name: 'campo1'},
			{name: 'campo2'},
			{name: 'campo3'}
	]),
	items:[{
		id:'campo1',
		fieldLabel:'Label 1 '
	},{
		id:'campo2',
		fieldLabel:'Label 2'
	},{
		id:'campo3',
		fieldLabel:'Label 3'
	}]
});*/
/***	Formato del Json **
{totalRecords:10,campos:[{idRecord:'id',campo1:'valor1',campo2:'valor2',campo3:'valor3'},
												 {idRecord:'id',campo1:'valor1',campo2:'valor2',campo3:'valor3'},
												 {idRecord:'id',campo1:'valor1',campo2:'valor2',campo3:'valor3'}]}*/
/***	XmlReader	**
var rdCasoUso = new Ext.data.XmlReader({
	record: 'libro',
	id: "titulo",
	totalRecords: 'total'
	},
	[{name:'titulo'},
	{name:'autor'},
	{name:'formato'},
	{name:'publicacion'},
	'precio',
	'cantidad'
])*/
/***	Formato del XML	**
<?xml version="1.0" encoding="utf-8" ?>
<libros>
	<total>5</total>
	<libro isbn="nsjs-sdd">
	  <titulo>Xml: Extensible Markup Language</titulo>
	  <autor>Elliotte Rusty Harold</autor>
	  <formato>Paperback</formato>
	  <publicacion>1998</publicacion>
	  <precio>800.00</precio>
	  <cantidad>100</cantidad>
	</libro>
</libros>*/
gpCasoUso.render('element');








