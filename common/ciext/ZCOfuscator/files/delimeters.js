var
	// JavaScript genric delimeter [C# too without last object]
	jsRules = [
		{name:'doublequote', start:'"', end:'"', noslash:true},
		{name:'singlequote', start:"'", end:"'", noslash:true},
		{name:'singlelinecomment', start:'//', end:['\n', '\r']},
		{name:'multilinecomment', start:'/*', end:'*/'},
		{name:'regexp', start:'/', end:'/', match:/^\/[^\n\r]+\/$/, noslash:true}
	],

	// PHP genric delimeter
	phpRules = [
		{name:'doublequote', start:'"', end:'"', noslash:true},
		{name:'singlequote', start:"'", end:"'", noslash:true},
		{name:'singlelinecomment', start:'//', end:['\n', '\r']},
		{name:'singlelinecomment', start:'#', end:['\n', '\r']},
		{name:'multilinecomment', start:'/*', end:'*/'}
	],

	// Python genric delimeter
	pythonRules = [
		{name:'multiquote', start:'"""', end:'"""'},
		{name:'doublequote', start:'"', end:'"', noslash:true},
		{name:'singlequote', start:"'", end:"'", noslash:true},
		{name:'singlelinecomment', start:'#', end:['\n', '\r']}
	];