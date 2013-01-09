
function ShowHideElements( visible ){
	var args = ShowHideElements.arguments;
	var element;
	//Loop through supplied element IDs
	for(i=1; i<args.length; i++){
		//Get element by id
		element = document.getElementById(args[i]);
		//Show/hide element 
		if (element){
			element.style.display = visible ? "" : "none";
		}
	}
}

function ShowHideClass( visible, selector ){
	//Find the rule
	var rule = GetCssRule( selector );	
	//Change rule definition
	rule.style.display = visible ? "" : "none";
}

function GetCssRule( selector ) {
	//Find css class in the existing stylesheets
	for (var si=0; si<document.styleSheets.length; si++){
		var cssRules = document.styleSheets[si].cssRules ? document.styleSheets[si].cssRules : document.styleSheets[si].rules;
		for (var ri=0; ri<cssRules.length; ri++) {
			if (cssRules[ri].selectorText == '.'+selector) {
				return cssRules[ri];
			}
		}
	}	
	//If not found - add one
	if (document.styleSheets[0].cssRules){
		//Mozilla
		document.styleSheets[0].insertRule('.'+selector+'{visible:true;}', 0)
		return document.styleSheets[0].cssRules[0];
	}else{
		//IE
		document.styleSheets[0].addRule('.'+selector, 'visible:true;', 0)
		return document.styleSheets[0].rules[0];
	}
}


