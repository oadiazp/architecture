<?php
# source code to map [requires specified JS file]
$source = str_replace(array("\n", "\r"), array("\\n", "\\r"), addslashes(file_get_contents("dojo.js.uncompressed.js")));
?>
<html>
	<head>
		<title>Class SourceMap :: JavaScript Version</title>
		<script type="text/javascript" src="SourceMap.js"><!--// (C) SourceMap //--></script>
		<script type="text/javascript" src="delimeters.js"><!--// delimeters arrays //--></script>
		<script type="text/javascript" src="common.js"><!--// common variables //--></script>
		<script type="text/javascript">
			// SourceMap variable
			var	sourceMap = new SourceMap();
			
			// chosed delimeter rules (JavaScript in this case)
			var	rules = jsRules;
			
			// source code to map
			var	source = "<?php echo $source; ?>";
			
			// Benchmark: start time variable
			var	startTime = getTime();
			
			// generated map
			var	map = sourceMap.getMap(source, jsRules);
			
			// Benchmark: end time variable
			var	endTime = getTime(startTime);
			
			// Output and Verify
			onload = function() {
				var	tempCode = '',
					correctParse = '',
					output = '';
				var	b = map.length;
				for(var a = 0; a < b; a++) {
					tempCode = source.substr(map[a].start, map[a].end - map[a].start);
					correctParse += tempCode;
					output += '<strong>' + map[a].name + '</strong><pre>' + tempCode.replace(/</g, '&lt;').replace(/>/g, '&gt;') + '</pre>';
					if(a + 1 < b)
						output += '<hr />';
				}
				if(correctParse === source)
					output = '<h3>Source file successfull mapped [' + endTime + ' sec.] - Map length: ' + b + '</h3><hr />' + output;
				else
					output = '<h3>WARNING, map failure or invalid source code [' + endTime + ' sec.] - Map length: ' + b + '</h3><hr />' + output;
				document.body.innerHTML = output;
			};
		</script>
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
	</body>
</html>