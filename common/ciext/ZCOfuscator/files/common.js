function getTime(startTime) {
	var	newtime = (new Date()).getTime();
	if(startTime)
		newtime = (newtime - startTime) / 1000;
	return newtime;
}