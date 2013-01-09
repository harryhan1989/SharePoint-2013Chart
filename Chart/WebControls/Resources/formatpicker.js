//---------------------------------------
//Class JFormatItem
//---------------------------------------
//Constructor
function JFormatItem(name, val, format, sample, description, hasPrecision, hasCustomFormat){
	this.Name = name;
	this.Val = val;	
	this.Format = format;
	this.Sample = sample;
	this.Description = description;
	this.HasPrecision = hasPrecision;
	this.HasCustomFormat = hasCustomFormat;
	this.ValHistory = null;
}

//---------------------------------------
//Class JFormatPicker
//---------------------------------------
function JFormatPicker(varId, expanded, onChangeJS){	
	this.Items = [];		
	this.txtFormat = document.getElementById(varId+"_txtFormat");
	this.imgButton = document.getElementById(varId+"_imgButton");
	this.pnlDetails = document.getElementById(varId+"_pnlDetails");
	this.ddlFormat = document.getElementById(varId+"_ddlFormat");
	this.trFormatString = document.getElementById(varId+"_trFormatString");
	this.txtFormatString = document.getElementById(varId+"_txtFormatString");
	this.trPrecision = document.getElementById(varId+"_trPrecision");
	this.txtPrecision = document.getElementById(varId+"_txtPrecision");
	this.txtSample = document.getElementById(varId+"_txtSample");
	this.pnlDescription = document.getElementById(varId+"_pnlDescription");	
	this.expanded = expanded;
	this.onChangeJS = onChangeJS;
	this.isChanged = false;
}
//Routines
JFormatPicker.prototype.Initialize = function(format, value){
	this.Add('Not set', '', '', '', 'Default format', false, false);
	this.Add('Numeric', 'NG_', 'G', '', 'Please select one of the numeric formats below', false, false);
	this.Add(' - General', 'NG', 'G', '12345.6789', 'The number is converted to the most compact decimal form, using fixed or scientific notation. The precision specifier determines the number of significant digits in the resulting string.', true, false);
	this.Add(' - Currency', 'NC', 'C', '$12,345.68', 'The number is converted to a string that represents a currency amount. The conversion is controlled by the system currency format information. The precision specifier indicates the desired number of decimal places.', true, false);
	this.Add(' - Number', 'NN', 'N', '12,345.68', 'The number is converted to a string of the form "-d,ddd,ddd.ddd…", where each "d" indicates a digit (0-9). The string starts with a minus sign if the number is negative. Thousand separators are inserted between each group of three digits to the left of the decimal point. The precision specifier indicates the desired number of decimal places.', true, false);
	this.Add(' - Fixed-point', 'NF', 'F', '12345.68', 'The number is converted to a string of the form "-ddd.ddd…" where each "d" indicates a digit (0-9). The string starts with a minus sign if the number is negative. The precision specifier indicates the desired number of decimal places.', true, false);
	this.Add(' - Percent', 'NP', 'P', '12.60 %', 'When using percentages, no actual conversion of any number takes place. Therefore, the precision displayed will always show two decimal places regardless of input. In the example shown here, a percentage sign (%) was simply appended to the original number to indicate that it represents a percentage value.', true, false);
	this.Add(' - Scientific', 'NE', 'E', '1.234568E+004', 'The number is converted to a string of the form "-d.ddd…E+ddd" or "-d.ddd…e+ddd", where each "d" indicates a digit (0-9). The string starts with a minus sign if the number is negative. One digit always precedes the decimal point. The precision specifier indicates the desired number of digits after the decimal point.', true, false);
	this.Add('DateTime', 'Df_', 'f', 'Wednesday, January 24, 2007 6:27 PM', 'Please select one of the numeric formats below', false, false);
	this.Add(' - Short date', 'Dd', 'd', '1/24/2007', 'The date/time is converted to the short date format.', false, false);
	this.Add(' - Long date', 'DD', 'D', 'Wednesday, January 24, 2007', 'The date/time is converted to the long date format.', false, false);
	this.Add(' - Short time', 'Dt', 't', '6:27 PM', 'The date/time is converted to the short time format.', false, false);
	this.Add(' - Long time', 'DT', 'T', '6:27:03 PM', 'The date/time is converted to the long time format.', false, false);
	this.Add(' - Full date/time (short time)', 'Df', 'f', 'Wednesday, January 24, 2007 6:27 PM', 'Displays a combination of the long date and short time patterns, separated by a space.', false, false);
	this.Add(' - Full date/time (long time)', 'DF', 'F', 'Wednesday, January 24, 2007 6:27:03 PM', 'Displays a combination of the long date and long time patterns, separated by a space.', false, false);
	this.Add(' - General date/time (short time)', 'Dg', 'g', '1/24/2007 6:27 PM', 'Displays a combination of the short date and short time patterns, separated by a space.', false, false);
	this.Add(' - General date/time (long time)', 'DG', 'G', '1/24/2007 6:27:03 PM', 'Displays a combination of the short date and long time patterns, separated by a space.', false, false);
	this.Add(' - Month day', 'DM', 'M', 'January 24', 'The date/time is converted to the month day format.', false, false);
	this.Add(' - RFC1123', 'DR', 'R', 'Wed, 24 Jan 2007 18:27:03 GMT', 'The date/time is converted to the RFC1123 standart format. It follows the custom pattern "ddd, dd MMMM yyyy HH:mm:ss G\MT". Note that the "M" in "GMT" needs an escape character so it is not interpreted.', false, false);
	this.Add(' - Sortable date/time ISO8601', 'Ds', 's', '2007-01-24T18:27:03', 'The date/time is converted to the sortable format. Format follows the custom pattern "yyyy-MM-ddTHH:mm:ss".', false, false);
	this.Add(' - Universal sortable date/time', 'Du', 'u', '2007-01-24 18:27:03Z', 'The date/time is converted to the universal sortable format. Pattern is always the same regardless of culture or format provider. The format follows the custom pattern "yyyy-MM-dd HH:mm:ssZ".', false, false);
	this.Add(' - Universal full date/time', 'DU', 'U', 'Wednesday, January 24, 2007 11:27:03 PM', 'The date/time is converted to the universal full format. Pattern is always the same regardless of culture or format provider. Note that the time displayed is for the Universal, rather than local time.', false, false);
	this.Add(' - Year/month', 'DY', 'Y', 'January, 2007', 'The date/time is converted to the year month format.', false, false);
	this.Add('Custom', 'C-', '', '', 'Pick one of the custom formats', false, true);
	this.Add(' - Numeric', 'Cn ', 'n', '', 'Characters that can be used to create custom numeric format strings:  "0" - Zero placeholder, "#" - Digit placeholder, "." - Decimal point, "," - Thousand separator and number scaling, "%" - Percentage placeholder, "E0" - Scientific notation, "\" - Escape character, ";" - Section separator. All other characters are copied to the output string as literals in the position they appear.', false, true);
	this.Add(' - Date/time', 'Cd', 'd', '', 'Some characters that can be used to create custom date/time format strings: "d or dd" - One or two digit day of the month, "ddd or dddd" - Three character or full week day name, "h or hh" - One or two digit hour (1-12), "H or HH" - One or two digit hour (1-24), "m or mm" - One or two digit minute, "M or MM" - One or two digit month, "MMM or MMMM" - Three character or full month name, "s or ss" - One or two digit second, "t or tt" - One or full A.M./P.M. designator, "y or yy or yyy" - One, two digit or full year.', false, true);	

	this.ChangeCurrent(this.Find(value));		
	this.txtFormatString.value = format;
}
JFormatPicker.prototype.Add = function (name, val, format, sample, description, hasPrecision, hasCustomFormat) {
	var item = new JFormatItem(name, val, format, sample, description, hasPrecision, hasCustomFormat);
	this.ddlFormat.options[this.Items.length] = new Option(name, val);
	this.Items[this.Items.length] = item;
}
JFormatPicker.prototype.Find = function (val) {
	for( var i=0; i<this.Items.length; i++){
		if (this.Items[i].Val==val)
			return this.Items[i];
	}
	return null;
}
JFormatPicker.prototype.ChangeCurrent = function (formatItem) {	
	//Select new format
	if (formatItem){
		this.txtFormat.value = formatItem.Name.indexOf(' - ')<0 ? formatItem.Name : formatItem.Name.substring(2);
		this.trFormatString.style.display = formatItem.HasCustomFormat ? "" : "none";
		this.ddlFormat.value = formatItem.Val;
		this.txtFormatString.value = formatItem.Format;		
		this.trPrecision.style.display = formatItem.HasPrecision ? "" : "none";				
		this.txtSample.value = formatItem.Sample;
		this.pnlDescription.innerHTML = formatItem.Description;
	}
}
JFormatPicker.prototype.GetSelectedFormat = function(){
	return txtFormat.value;
}
//Event handlers
JFormatPicker.prototype.imgButton_Click = function(){
	this.expanded = !this.expanded;
	this.pnlDetails.style.display = this.expanded ? "block" : "none";
	if (!this.expanded && this.isChanged && this.onChangeJS && this.onChangeJS!=""){ 
		this.isChanged = false;
		eval(this.onChangeJS);
	}
}
JFormatPicker.prototype.ddlFormat_Change = function(){
	var formatItem = this.Items[this.ddlFormat.selectedIndex];
	this.ChangeCurrent(formatItem);
	this.isChanged = true;	
}
JFormatPicker.prototype.txtFormatString_Change = function(){
	//Find current selected item and persist it if custom format has been defined
	var oldFormatItem = this.Find(this.ddlFormat.value);
	if (oldFormatItem && oldFormatItem.Format!=this.txtFormatString.value){
		oldFormatItem.Format = this.txtFormatString.value;				
	}	
}

