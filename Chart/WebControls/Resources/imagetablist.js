//---------------------------------------
//Class JImageTabList
//---------------------------------------
//Constructor
function JImageTabList(varId, width, selectedIndex, imageUrlFormat, spacerImageUrl, divFormatString, config, enabled, rtlDirection){
	this.Items = [];
	this.VarId = varId;
	this.Width = width;
	this.SelectedIndex = selectedIndex ? selectedIndex : 0;
	this.HighlightIndex = this.SelectedIndex;
	this.ImageUrlFormat = imageUrlFormat;
	this.SpacerImageUrl = spacerImageUrl;
	this.DivFormatString = divFormatString;
	this.Config = config;
	this.Enabled = enabled;
	this.RtlDirection = rtlDirection;
}
//Methods
JImageTabList.prototype.Add = function (val, imageUrl, text, layer) {
	var item = new JImageListItem(val, imageUrl, text, layer); //Layer is not used in the TabList but is provided for consistency
	this.Items[this.Items.length] = item;
}
JImageTabList.prototype.AddItems = function(){
	var args = this.AddItems.arguments;
	var item;
	for(i=0; i<args.length; i+=5){
		this.Items[this.Items.length] = new JImageListItem(args[i], args[i+1], args[i+2], args[i+3], args[i+4]);
	}
}
JImageTabList.prototype.SelectedItem = function (){
	return this.Items[this.SelectedIndex];
}
JImageTabList.prototype.FindIndexByText = function(text) {
	//First look for items starting by the string
	var index = -1;
	var minPos = 32000;
	for(i=0; i<this.Items.length; i++){
		pos = this.Items[i].Text.toLowerCase().indexOf(text.toLowerCase());
		if (pos>-1 && pos<minPos){
			index = i;
			minPos = pos;
		}
	}
	return index;
}

JImageTabList.prototype.Render = function (autoPostBackJs) {	
	if (this.Enabled)
		this.RenderEnabled(autoPostBackJs);
	else
		this.RenderDisabled(autoPostBackJs);
}

JImageTabList.prototype.RenderEnabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\""+this.Width+"\">");
	document.write("<tr><td style=\"padding-right:5px; padding-left:5px\">");
	document.write("	<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"text\" class=\"itab_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\" onfocus=\"_Itabc.Focus(this);\" onblur=\"_Itabc.Blur(this);\" onkeydown=\"_Itabc.KeyDown(this, event);\"/>");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"itab_Div_"+this.Config.BrowserTheme+"\" style=\"width:"+this.Width+";height:"+this.Height+"\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"itab_Table_"+this.Config.BrowserTheme+"\" width=\"100%\" >");
	document.write("		<tr>");
	
	for(var i=0; i<this.Items.length; i++){
		var item = this.Items[i];		
		var cls = i==0 ? 
					(this.SelectedIndex==0 ? "TabAFirst" : "TabPFirst") :
					(i==this.SelectedIndex ? "TabPA" : (i==this.SelectedIndex+1 ? "TabAP" : "TabPP"));

		if (this.RtlDirection)
		{
			if (i == this.SelectedIndex)
				document.write("		<td class=\"itab_"+cls+"_"+this.Config.BrowserTheme+"\" style=\"background-image: url('spacer.gif'); background-color:rgb(243,241,230); border-style:solid; border-width:1px; border-color: #7f9db9; padding-right:10px; padding-left:10px\" onclick=\"_Itabc.ListItemClick('"+this.VarId+"', this, event);"+autoPostBackJs+"\">");
			else
				document.write("		<td class=\"itab_"+cls+"_"+this.Config.BrowserTheme+"\" style=\"background-image: url('spacer.gif');  background-color:rgb(255,255,255); border-style:solid; border-width:1px; border-color: #7f9db9; padding-right:10px; padding-left:10px\" onclick=\"_Itabc.ListItemClick('"+this.VarId+"', this, event);"+autoPostBackJs+"\">");			
		}
		else
		{
			document.write("		<td class=\"itab_"+cls+"_"+this.Config.BrowserTheme+"\" onclick=\"_Itabc.ListItemClick('"+this.VarId+"', this, event);"+autoPostBackJs+"\">");
		}
		document.write("			<span class=\"itab_TabIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
		document.write("			<span class=\"itab_TabValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
		if (item.ImageUrl!="")
			document.write("		<img class=\"itab_TabIcon_"+this.Config.BrowserTheme+"\" src=\""+this.ImageUrlFormat.replace("{0}",item.ImageUrl) +"\">");
		document.write(				"<span class=\"itab_TabText_"+this.Config.BrowserTheme+"\">"+item.Text+"</span>");
		document.write("		</td>");
	}

	if (this.RtlDirection)
	{
		document.write("			<td class=\"itab_Tab"+(this.SelectedIndex==this.Items.length-1 ? "A" : "P")+"Last_"+this.Config.BrowserTheme+"\" style=\"background-image: url('spacer.gif');\" ><img src=\""+this.SpacerImageUrl+"\" width=\"10px\" height=\"1px\"</td>");
		if (this.Width!="")
			document.write("			<td class=\"itab_TabBg_"+this.Config.BrowserTheme+"\" width=\"100%\" style=\"background-image: url('spacer.gif');\">&nbsp;</td>");
	}
	else
	{
		document.write("			<td class=\"itab_Tab"+(this.SelectedIndex==this.Items.length-1 ? "A" : "P")+"Last_"+this.Config.BrowserTheme+"\"><img src=\""+this.SpacerImageUrl+"\" width=\"10px\" height=\"1px\"</td>");
		if (this.Width!="")
			document.write("			<td class=\"itab_TabBg_"+this.Config.BrowserTheme+"\" width=\"100%\">&nbsp;</td>");
	}	
	document.write("		</tr>");
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}

JImageTabList.prototype.RenderDisabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	document.write("<tr><td>");
	document.write("	<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"text\" class=\"itab_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\" onfocus=\"_Itabc.Focus(this);\" onblur=\"_Itabc.Blur(this);\" onkeydown=\"_Itabc.KeyDown(this, event);\"/>");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"itab_Div_"+this.Config.BrowserTheme+"\" style=\"width:"+this.Width+";height:"+this.Height+"\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"itab_Table_"+this.Config.BrowserTheme+"\" width=\"100%\" >");
	document.write("		<tr valign='middle'>");
	
	for(var i=0; i<this.Items.length; i++){
		var item = this.Items[i];
		var cls = i==0 ? 
					(this.SelectedIndex==0 ? "TabAFirst" : "TabPFirst") :
					(i==this.SelectedIndex ? "TabPA" : (i==this.SelectedIndex+1 ? "TabAP" : "TabPP"));
		if (this.RtlDirection)
		{
			if (i == this.SelectedIndex)
				document.write("		<td nobr class=\"itab_"+cls+"_"+this.Config.BrowserTheme+"\" style=\"background-image: url('spacer.gif');  background-color:rgb(243,241,230); border-style:solid; border-width:1px; border-color: #7f9db9; padding-right:10px; padding-left:10px \" >"); 
			else
				document.write("		<td nobr class=\"itab_"+cls+"_"+this.Config.BrowserTheme+"\" style=\"background-image: url('spacer.gif');  background-color:rgb(255,255,255); border-style:solid; border-width:1px; border-color: #7f9db9; padding-right:10px; padding-left:10px\" >"); 
		}
		else
		{
			document.write("		<td nobr class=\"itab_"+cls+"_"+this.Config.BrowserTheme+"\">");
		}
		document.write("			<span class=\"itab_TabIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
		document.write("			<span class=\"itab_TabValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
		if (item.ImageUrl!="")
			document.write("			<img class=\"itab_TabIcon_"+this.Config.BrowserTheme+"\" src=\""+this.ImageUrlFormat.replace("{0}",item.ImageUrl) +"\">");
		document.write(			"<span class=\"itab_TabText_"+this.Config.BrowserTheme+"\">"+item.Text+"</span>");
		document.write("		</td>");
	}

	if (this.RtlDirection)
	{
		document.write("			<td class=\"itab_Tab"+(this.SelectedIndex==this.Items.length-1 ? "A" : "P")+"Last_"+this.Config.BrowserTheme+"\" style=\"background-image: url('spacer.gif');\">&nbsp;</td>")
	}
	else
	{
		document.write("			<td class=\"itab_Tab"+(this.SelectedIndex==this.Items.length-1 ? "A" : "P")+"Last_"+this.Config.BrowserTheme+"\">&nbsp;</td>")
	}
	document.write("			<td width=\"*\">T E S T</td>");
	document.write("		</tr>");
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}
JImageTabList.prototype.GetVal = function (){
	return document.getElementById(this.VarId);
}
JImageTabList.prototype.GetDiv = function (){
	return document.getElementById(this.VarId+"_listDiv");
}



//---------------------------------------
//JImageTabListController
//---------------------------------------
//Instance of JImageTabListController will provide helper functions for image list items and will control modality, focus, keydown handlers
var _Itabc = new JImageTabListController();
//Constructor 
function JImageTabListController(){
	this.IE = navigator.appVersion.indexOf("MSIE")>-1;
}
//Methods
JImageTabListController.prototype.ProcessKeyDown = function (e, tab){
	var val = tab.GetVal();
	var div = tab.GetDiv();
	var td = div.getElementsByTagName("td")[tab.HighlightIndex];
	var tr = td.parentNode;
	
	var keyCode;
	if (window.event) //IE
		keyCode = e.keyCode;
	else
		keyCode = e.which;
	
	//Each Panel was rendered by the instance of the JImageTabList class with the same name. So we can use this instance as a model - every time user selects something different we update it's SelectedIndex property.
	var newIndex = -1;
	if (keyCode==JKeyCodes.Right){ //Right
		if (tab.HighlightIndex<tab.Items.length-1){ 
			newIndex = tab.HighlightIndex+1;
			this.ChangeHighlight(tab, newIndex, true);
			this.ChangeSelection(tab, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Left){ //Left
		if (tab.HighlightIndex>0){ 
			newIndex = tab.HighlightIndex-1;
			this.ChangeHighlight(tab, newIndex, true);
			this.ChangeSelection(tab, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.End){ //End
		var newIndex = tab.Items.length-1;
		if (newIndex!=tab.HighlightIndex){
			this.ChangeHighlight(tab, newIndex, true);
			this.ChangeSelection(tab, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Home){ //Home
		var newIndex = 0;
		if (newIndex!=tab.HighlightIndex){
			this.ChangeHighlight(tab, newIndex, true);
			this.ChangeSelection(tab, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}
}

JImageTabListController.prototype.ListItemClick = function (tabId, td, e){
	var tab = eval(tabId);
	var val = tab.GetVal();
	var selectedIndex = Number(td.getElementsByTagName("span")[0].innerHTML);	
	this.ChangeSelection(tab, selectedIndex);
	this.ChangeHighlight(tab, selectedIndex, true);
	val.focus();
}
JImageTabListController.prototype.ChangeSelection = function (tab, newIndex){
	var val = tab.GetVal();
	tab.SelectedIndex = newIndex;
	val.value = tab.SelectedItem().Val;
}
JImageTabListController.prototype.ChangeHighlight = function (tab, newIndex, scrollIntoView, dontFocus){
	//Turn off the currently selected element
	var div = tab.GetDiv();
	var td = div.getElementsByTagName("td")[tab.HighlightIndex];
	var tdNext = div.getElementsByTagName("td")[tab.HighlightIndex+1];
	if (td){
		td.className =  tab.HighlightIndex==0 ? "itab_TabPFirst_"+tab.Config.BrowserTheme : "itab_TabPP_"+tab.Config.BrowserTheme;
		tdNext.className = tab.HighlightIndex==tab.Items.length-1 ? "itab_TabPLast_"+tab.Config.BrowserTheme : "itab_TabPP_"+tab.Config.BrowserTheme;

		if(tab.RtlDirection)
		{
			td.style.backgroundColor = "#FFFFFF";
		}
	}
	//Turn off current Div
	if (tab.DivFormatString){
		var val = td.getElementsByTagName("span")[1].innerHTML.split(";");		
		for (var i=0; i<val.length; i++){
			var divToHide = document.getElementById(tab.DivFormatString.replace("{0}", val[i]));
			if (divToHide) divToHide.style.display="none";
		}
	}
	
	//Turn on the new selected element
	tab.HighlightIndex = newIndex;
	var td = div.getElementsByTagName("td")[tab.HighlightIndex];
	var tdNext = div.getElementsByTagName("td")[tab.HighlightIndex+1];
	if (td){
		td.className =  tab.HighlightIndex==0 ? "itab_TabAFirst_"+tab.Config.BrowserTheme : "itab_TabPA_"+tab.Config.BrowserTheme;
		tdNext.className = tab.HighlightIndex==tab.Items.length-1 ? "itab_TabALast_"+tab.Config.BrowserTheme : "itab_TabAP_"+tab.Config.BrowserTheme;

		if(tab.RtlDirection)
		{
			td.style.backgroundColor = "#F3F1E6";
		}

	}
	//Turn on new Div
	if (tab.DivFormatString){
		var val = td.getElementsByTagName("span")[1].innerHTML.split(";");
		for (var i=0; i<val.length; i++){
			var divToShow = document.getElementById(tab.DivFormatString.replace("{0}", val[i]));
			if (divToShow) divToShow.style.display="block";
		}
	}
}
JImageTabListController.prototype.Focus = function (val){
	var tab = eval(val.id);
	var div = tab.GetDiv();
	var td = div.getElementsByTagName("td")[tab.HighlightIndex];
}
JImageTabListController.prototype.Blur = function (val){
	var tab = eval(val.id);
	var div = tab.GetDiv();
	var td = div.getElementsByTagName("td")[tab.HighlightIndex];
}
JImageTabListController.prototype.KeyDown = function (val, e){
	var tab = eval(val.id); //tab is a JImageTabList
	this.ProcessKeyDown(e, tab);
}

JImageTabListController.prototype.HidePassiveDivs = function (tab){
	if (tab.DivFormatString){
		for(var i=0; i<tab.Items.length; i++){
			var val = tab.Items[i].Val.split(";");
			for(var j=0; j<val.length; j++){
				var div = document.getElementById(tab.DivFormatString.replace("{0}", val[j]));
				if (div) div.style.display = i==tab.SelectedIndex ? "block" : "none";
			}
		}				
	}
}


