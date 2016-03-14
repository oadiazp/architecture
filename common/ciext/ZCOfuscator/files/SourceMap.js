/**
 * SourceMap class,
 *	reads a generic language source code and returns its map.
 * ______________________________________________________________
 * The SourceMap goals is to create a map of a generic script/program language.
 * The getMap method returns an array/list of arrays/dictionary/objects
 * of source map using delimeters variable to map correctly:
 *  - multi line comments
 *  - single line comments
 *  - double quoted strings
 *  - single quoted strings
 *  - pure code
 *  - everything else (for example regexp [/re/] with javascript), just adding a correct delimeter
 * --------------------------------------------------------------
 * What about the delimeter
 * 	It's an array/list of arrays/dictionary/obects with some properties to find what you're looking for.
 * 
 * parameters are:
 *  - name, the name of the delimeter (i.e. "doublequote")
 *  - start, one or mode chars to find as start delimeter (i.e. " for double quoted string)
 *  - end, one or mode chars to find as end delimeter (i.e. " for double quoted string) [end should be an array/list too]
 * 
 * optional parameters are:
 *  - noslash, if true find the end of the delimeter only if last char is not slashed (i.e. "string\"test" find " after test)
 *  - match, if choosed language has regexp, verify if string from start to end matches used regexp (i.e. /^\/[^\n\r]+\/$/ for JavaScript regexp)
 * 
 * If end parameter is an array, match and noslash are not supported (i.e. ["\n", "\r"] for end delimeter of a single line comment)
 * --------------------------------------------------------------
 * What about SourceMap usage
 * 	It should be a good solution to create sintax highlighter, parser,
 * 	verifier or some other source code parsing procedure
 * --------------------------------------------------------------
 * What about SourceMap performance script/languages
 * 	I've created different version of this class to test each script/program language performance too.
 * Python with or without Psyco is actually the faster parser.
 * --------------------------------------------------------------
 * @Compatibility	>= JavaScript 1.1
 * @Author		Andrea Giammarchi
 * @Site		http://www.devpro.it/
 * @Date		2006/08/01
 * @LastMOd		2006/08/01
 * @Version		0.1
 */
function SourceMap() {
	
	/**
	 * public method
         * 	getMap(source:string, delimeters:array):array
	 * Maps the source code using $delimeters rules and returns map as an array
         * NOTE: read comments to know more about map and delimeter
         *
         * @param	string		generic source code
         * @param	array		array with nested objects with code rules
	 */
	this.getMap = function(source, delimeters) {
		
		// "unsigned integer" variables
		var 	sourcePosition = 0,
			delimetersPosition = 0,
			findLength = 0,
			len = 0,
			tempIndex = 0,
			sourceLength = source.length,
			delimetersLength = delimeters.length;
		
		// integer variables
		var	tempPosition = -1,
			endPosition = -1;
		
		// array variables
		var	map = [],
			tempMap = [];
		
		// object variable	
		var	tempDelimeter = {};
		
		while(sourcePosition < sourceLength) {
			endPosition = -1;
			for(delimetersPosition = 0; delimetersPosition < delimetersLength; delimetersPosition++) {
				tempPosition = source.indexOf(delimeters[delimetersPosition].start, sourcePosition);
				if(tempPosition !== -1 && (tempPosition < endPosition || endPosition === -1)) {
					endPosition = tempPosition;
					tempIndex = delimetersPosition;
				}
			}
			if(endPosition !== -1) {
				sourcePosition = endPosition;
				tempDelimeter = delimeters[tempIndex];
				findLength = tempDelimeter.start.length;
				if(tempDelimeter.end.constructor === Array) {
					delimetersPosition = 0;
					endPosition = -1;
					for(len = tempDelimeter.end.length; delimetersPosition < len; delimetersPosition++) {
						tempPosition = source.indexOf(tempDelimeter.end[delimetersPosition], sourcePosition + findLength);
						if(tempPosition !== -1 && (tempPosition < endPosition || endPosition === -1)) {
							endPosition = tempPosition;
							tempIndex = delimetersPosition;
						}	
					}
					if(endPosition !== -1)
						endPosition = endPosition + tempDelimeter.end[tempIndex].length;
					else
						endPosition = sourceLength;
					map.push({name:tempDelimeter.name, start:sourcePosition, end:endPosition});
					sourcePosition = endPosition - 1;
				}
				else if(tempDelimeter.match) {
					tempPosition = source.indexOf(tempDelimeter.end, sourcePosition + findLength);
					len = tempDelimeter.end.length;
					if(tempPosition !== -1 && tempDelimeter.match.test(source.substr(sourcePosition, tempPosition - sourcePosition + len))) {
						endPosition = tempDelimeter.noslash ? __endCharNoSlash(source, sourcePosition, tempDelimeter.end, sourceLength) : tempPosition + len;
						map.push({name:tempDelimeter.name, start:sourcePosition, end:endPosition});
						sourcePosition = endPosition - 1;
					}
				}
				else {
					if(tempDelimeter.noslash)
						endPosition = __endCharNoSlash(source, sourcePosition, tempDelimeter.end, sourceLength);
					else {
						tempPosition = source.indexOf(tempDelimeter.end, sourcePosition + findLength);
						if(tempPosition !== -1)
							endPosition = tempPosition + tempDelimeter.end.length;
						else
							endPosition = sourceLength;
					}
					map.push({name:tempDelimeter.name, start:sourcePosition, end:endPosition});
					sourcePosition = endPosition - 1;
				}
			}
			else
				sourcePosition = sourceLength - 1;
			++sourcePosition;
		}
		len = map.length;
		if(len === 0)
			tempMap.push({name:'code', start:0, end:sourceLength});
		else {
			for(tempIndex = 0; tempIndex < len; tempIndex++) {
				if(tempIndex === 0 && map[tempIndex].start > 0)
					tempMap.push({name:'code', start:0, end:map[tempIndex].start});
				else if(tempIndex > 0 && map[tempIndex].start > map[tempIndex-1].end)
					tempMap.push({name:'code', start:map[tempIndex-1].end, end:map[tempIndex].start});
				tempMap.push({name:map[tempIndex].name, start:map[tempIndex].start, end:map[tempIndex].end});
				if(tempIndex + 1 === len && map[tempIndex].end < sourceLength)
					tempMap.push({name:'code', start:map[tempIndex].end, end:sourceLength});
			}
		}
		return tempMap;
	};
	
	function __endCharNoSlash(source, position, find, len) {
		var	temp = find.length;
		do {
			position = source.indexOf(find, position + 1);
		}while(position !== -1 && !__charNoSlash(source, position));
		if(position === -1) position = len - temp;
		return position + temp;
	};
	
	function __charNoSlash(source, position) {
		var	next = 1,
			len = position - next;
		while(len > 0 && source.charAt(len) === '\\') len = position - (++next);
		return ((next - 1) % 2 === 0);
	};
};