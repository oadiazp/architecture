<?php
function getTime($startTime = null) {
	list($usec, $sec) = explode(' ', microtime());
	$newtime = (float)$usec + (float)$sec;
	if($startTime !== null)
		$newtime = number_format(($newtime - $startTime), 3);
	return $newtime;
}
?>