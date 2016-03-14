<?php
# import of necessary files
require 'SourceMap.class.php';
require 'delimeters.php';
require 'common.php';

# SourceMap variable
$sourceMap = new SourceMap();

# chosed delimeter rules (JavaScript in this case)
$rules = &$jsRules;

# source code to map [requires specified JS file]
$source = file_get_contents("dojo.js.uncompressed.js");

# Benchmark: start time variable
$startTime = getTime();

# generated map
$map = $sourceMap->getMap($source, $rules);

# Benchmark: end time variable
$endTime = getTime($startTime);

# Output and Verify
$tempCode = '';
$correctParse = '';
$output = '';
$b = count($map);
for($a = 0; $a < $b; $a++) {
	$tempCode = substr($source, $map[$a]['start'], $map[$a]['end'] - $map[$a]['start']);
	$correctParse .= $tempCode;
	$output .= '<strong>'.$map[$a]['name'].'</strong><pre>'.str_replace(array('<', '>'), array('&lt;', '&gt;'), $tempCode).'</pre>';
	if($a + 1 < $b)
		$output .= '<hr />';
}
if($correctParse === $source)
	$output = '<h3>Source file successfull mapped ['.$endTime.' sec.] - Map length: ' . $b . '</h3><hr />'.$output;
else
	$output = '<h3>WARNING, map failure or invalid source code ['.$endTime.' sec.] - Map length: ' . $b . '</h3><hr />'.$output;
?>
<html>
	<head>
		<title>Class SourceMap :: PHP Test Version</title>
		<style type="text/css">
		* {
			margin:2;
			padding:0;
			font-family: Verdana, Helvetica, sans-serif;
			font-size: 8pt;
		}
		</style>
	</head>
	<body>
		<?php echo $output; ?>
	</body>
</html>