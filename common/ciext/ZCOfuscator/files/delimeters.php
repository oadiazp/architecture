<?php
// JavaScript genric delimeter [C# too without last array]
$jsRules = array(
	array('name'=>'doublequote', 'start'=>'"', 'end'=>'"', 'noslash'=>true),
	array('name'=>'singlequote', 'start'=>"'", 'end'=>"'", 'noslash'=>true),
	array('name'=>'singlelinecomment', 'start'=>'//', 'end'=>array("\n", "\r")),
	array('name'=>'multilinecomment', 'start'=>'/*', 'end'=>'*/'),
	array('name'=>'regexp', 'start'=>'/', 'end'=>'/', 'match'=>"/^\/[^\n\r]+\/$/", 'noslash'=>true)
);

// PHP genric delimeter
$phpRules = array(
	array('name'=>'doublequote', 'start'=>'"', 'end'=>'"', 'noslash'=>true),
	array('name'=>'singlequote', 'start'=>"'", 'end'=>"'", 'noslash'=>true),
	array('name'=>'singlelinecomment', 'start'=>'//', 'end'=>array("\n", "\r")),
	array('name'=>'singlelinecomment', 'start'=>'#', 'end'=>array("\n", "\r")),
	array('name'=>'multilinecomment', 'start'=>'/*', 'end'=>'*/')
);

// PHP embed in HTML genric delimeter
$embedPhpRules = array(
	array('name'=>'phpcode', 'start'=>'<?php', 'end'=>'?>', 'noslash'=>true),
	array('name'=>'phpcode', 'start'=>'<?', 'end'=>'?>', 'noslash'=>true),
	array('name'=>'doublequote', 'start'=>'"', 'end'=>'"', 'noslash'=>true),
	array('name'=>'singlequote', 'start'=>"'", 'end'=>"'", 'noslash'=>true),
	array('name'=>'singlelinecomment', 'start'=>'//', 'end'=>array("\n", "\r")),
	array('name'=>'singlelinecomment', 'start'=>'#', 'end'=>array("\n", "\r")),
	array('name'=>'multilinecomment', 'start'=>'/*', 'end'=>'*/')
);

// Python genric delimeter
$pythonRules = array(
	array('name'=>'multiquote', 'start'=>'"""', 'end'=>'"""'),
	array('name'=>'doublequote', 'start'=>'"', 'end'=>'"', 'noslash'=>true),
	array('name'=>'singlequote', 'start'=>"'", 'end'=>"'", 'noslash'=>true),
	array('name'=>'singlelinecomment', 'start'=>'#', 'end'=>array("\n", "\r"))
);
?>