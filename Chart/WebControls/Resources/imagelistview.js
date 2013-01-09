//---------------------------------------
//Class JImageListView
//---------------------------------------
//Constructor
function JImageListView(varId, width, height, selectedIndex, imageUrlFormat, spacerImageUrl, multiSelectMode, columns, config, enabled){
	this.Items = [];
	this.VarId = varId;
	this.Width =  width;
	this.Height = height;
	this.SelectedIndex = selectedIndex ? selectedIndex : 0;
	this.HighlightIndex = this.SelectedIndex;
	this.ImageUrlFormat = imageUrlFormat;
	this.SpacerImageUrl = spacerImageUrl;
	this.MultiSelectMode = multiSelectMode;
	this.Columns = columns;
	this.Config = config;
	this.Enabled = enabled;
}
//Methods
JImageListView.prototype.Add = function (val, imageUrl, text, layer) {
	var item = new JImageListItem(val, imageUrl, text, layer); //Layer is not used in the ListView but is provided for consistency
	this.Items[this.Items.length] = item;
}
JImageListView.prototype.AddItems = function(){
	var args = this.AddItems.arguments;
	var item;
	for(i=0; i<args.length; i+=5){
		this.Items[this.Items.length] = new JImageListItem(args[i], args[i+1], args[i+2], args[i+3], args[i+4]);
	}
}
JImageListView.prototype.SelectedItem = function (){
	return this.Items[this.SelectedIndex];
}
JImageListView.prototype.FindIndexByText = function(text) {
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

JImageListView.prototype.Render = function (autoPostBackJs) {	
	if (this.Enabled)
		this.RenderEnabled(autoPostBackJs);
	else
		this.RenderDisabled(autoPostBackJs);
}

JImageListView.prototype.RenderEnabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	document.write("<tr><td>");
	document.write("	<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"text\" class=\"ilvw_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\" onfocus=\"_Ilvwc.Focus(this);\" onblur=\"_Ilvwc.Blur(this);\" onkeydown=\"_Ilvwc.KeyDown(this, event);\"/>");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"ilvw_Div_"+this.Config.BrowserTheme+"\" style=\"width:"+this.Width+";height:"+this.Height+"\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
	
	var col=0;
	var row=0;
	for(row=0; row*this.Columns+col<this.Items.length; row++){
		document.write("	<tr>");
		for(col=0; col<this.Columns; col++){
			if (row*this.Columns+col<this.Items.length){
				var i = row*this.Columns+col;
				var item = this.Items[i];
				document.write("		<td class=\"ilvw_ListItemTd_"+this.Config.BrowserTheme+"\" onmouseover=\"_Ilvwc.TurnOnCell(this, '"+this.VarId+"');\" onmouseout=\"_Ilvwc.TurnOffCell(this, '"+this.VarId+"');\" onclick=\"_Ilvwc.ListItemClick('"+this.VarId+"', this, event);"+autoPostBackJs+"\">");
				document.write("			<span class=\"ilvw_ListItemIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
				document.write("			<span class=\"ilvw_ListItemValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
				document.write("			<img class=\"ilvw_ListItemIcon_"+this.Config.BrowserTheme+"\" src=\""+(item.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}",item.ImageUrl):this.SpacerImageUrl) +"\"><br>");
				if (this.MultiSelectMode) 
					document.write("				<input type=\"checkbox\" name=\""+this.VarId+"_M\" value="+item.Val+" "+(item.Selected==1?"checked=\"checked\"":"")+" onfocus=\"_Ilvwc.CheckboxFocus(this);\" onblur=\"_Ilvwc.CheckboxBlur(this);\"/>");
				document.write("			<span>"+item.Text+"</span>");
				document.write("		</td>");
			}else{
				var tdPercentageWidth = 100/this.Columns;
				document.write("		<td class=\"ilvw_ListItemTd_"+this.Config.BrowserTheme+"\" style='width:"+tdPercentageWidth+"%'>&nbsp;</td>");
			}
		}
		document.write("	</tr>");
		col = 0;
	}	
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}

JImageListView.prototype.RenderDisabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	document.write("<tr><td>");
	document.write("	<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"hidden\" />");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"ilvw_Div_Disabled_"+this.Config.BrowserTheme+"\" style=\"width:"+this.Width+";height:"+this.Height+"\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
	
	var col=0;
	var row=0;
	for(row=0; row*this.Columns+col<this.Items.length; row++){
		document.write("	<tr>");
		for(col=0; col<this.Columns && row*this.Columns+col<this.Items.length; col++){
			var i = row*this.Columns+col;
			var item = this.Items[i];
			document.write("		<td class=\"ilvw_ListItemTd_Disabled_"+this.Config.BrowserTheme+"\" >");
			document.write("			<span class=\"ilvw_ListItemIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
			document.write("			<span class=\"ilvw_ListItemValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
			document.write("			<img class=\"ilvw_ListItemIcon_"+this.Config.BrowserTheme+"\" src=\""+(item.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}",item.ImageUrl):this.SpacerImageUrl) +"\"><br>");
			if (this.MultiSelectMode) 
				document.write("				<input type=\"checkbox\" disabled=\"disabled\" name=\""+this.VarId+"_M\" value="+item.Val+" "+(item.Selected==1?"checked=\"checked\"":"")+" />");
			document.write("			<span>"+item.Text+"</span>");
			document.write("		</td>");
		}
		document.write("	</tr>");
		col = 0;
	}	
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}
JImageListView.prototype.GetVal = function (){
	return document.getElementById(this.VarId);
}
JImageListView.prototype.GetDiv = function (){
	return document.getElementById(this.VarId+"_listDiv");
}




//---------------------------------------
//JImageListViewController
//---------------------------------------
//Instance of JImageListViewController will provide helper functions for image list items and will control modality, focus, keydown handlers
var _Ilvwc = new JImageListViewController();
//Constructor 
function JImageListViewController(){
	this.IE = navigator.appVersion.indexOf("MSIE")>-1;
	this.SearchPhrase = "";
	this.SearchResetInterval = null;
	this.FocusedCheckbox = null;
}
//Methods
JImageListViewController.prototype.ResetSearch = function (){
	this.SearchPhrase = null;
	this.SearchLastKeyDownEventTime = new Date(1);
}
JImageListViewController.prototype.ProcessKeyDown = function (e, lvw){
	var val = lvw.GetVal();
	var div = lvw.GetDiv();
	var td = div.getElementsByTagName("td")[lvw.HighlightIndex];
	var tr = td.parentNode;
	
	var keyCode;
	if (window.event) //IE
		keyCode = e.keyCode;
	else
		keyCode = e.which;
	
	//Each Panel was rendered by the instance of the JImageListView class with the same name. So we can use this instance as a model - every time user selects something different we update it's SelectedIndex property.
	var newIndex = -1;
	if (keyCode==JKeyCodes.Down){ //Down
		if (lvw.HighlightIndex<lvw.Items.length-1){ 
			newIndex = lvw.HighlightIndex+lvw.Columns;
			if (newIndex<lvw.Items.length){
				this.ChangeHighlight(lvw, newIndex, true);
				this.ChangeSelection(lvw, newIndex);
			}
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Up){ //Up
		if (lvw.HighlightIndex>0){ 
			var newIndex = lvw.HighlightIndex-lvw.Columns;
			if (newIndex>-1) {
				this.ChangeHighlight(lvw, newIndex, true);
				this.ChangeSelection(lvw, newIndex);
			}
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Right){ //Right
		if (lvw.HighlightIndex<lvw.Items.length-1){ 
			newIndex = lvw.HighlightIndex+1;
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Left){ //Left
		if (lvw.HighlightIndex>0){ 
			newIndex = lvw.HighlightIndex-1;
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.PgUp){ //PgUp
		var newIndex = lvw.HighlightIndex;
		var newTd = td;
		var newTr = tr;
		while (newIndex>=0 && tr.offsetTop-newTr.offsetTop<div.offsetHeight){
			newIndex -= lvw.Columns;
			if (newIndex>=0){
				newTd = div.getElementsByTagName("td")[newIndex];
				newTr = newTd.parentNode;
			}				
		}
		if (newIndex<0)
			newIndex = 0;
		if (newIndex!=lvw.HighlightIndex){
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.PgDown){ //PgDown
		var newIndex = lvw.HighlightIndex;
		var newTd = td;
		var newTr = tr;
		while (newIndex<lvw.Items.length && newTr.offsetTop-tr.offsetTop<div.offsetHeight){
			newIndex += lvw.Columns;
			if (newIndex<lvw.Items.length){
				newTd = div.getElementsByTagName("td")[newIndex];
				newTr = newTd.parentNode;
			}
		}
		if (newIndex>=lvw.Items.length)
			newIndex = lvw.Items.length-1;
		if (newIndex!=lvw.HighlightIndex){
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.End){ //End
		var newIndex = lvw.Items.length-1;
		if (newIndex!=lvw.HighlightIndex){
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Home){ //Home
		var newIndex = 0;
		if (newIndex!=lvw.HighlightIndex){
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Tab){ //Tab
		this.ResetSearch();
	}else
	if ((keyCode==JKeyCodes.Space || keyCode==JKeyCodes.Ins) && lvw.MultiSelectMode){ //Space or Ins
		var checkbox = td.getElementsByTagName("input")[0];
		checkbox.checked = !checkbox.checked;	
		if (lvw.HighlightIndex<lvw.Items.length-1){ //Down
			newIndex = lvw.HighlightIndex+1;
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Backspace || keyCode>=32){ 		//Any other char - try to find in the list
		if (keyCode==JKeyCodes.Backspace){ //Backspace
			if (this.SearchPhrase.length>0){
				this.SearchPhrase = this.SearchPhrase.substring(0, this.SearchPhrase.length-1);	
			}
		}else{
			this.SearchPhrase += String.fromCharCode(keyCode);					
		}
		var newIndex = lvw.FindIndexByText(this.SearchPhrase);		
		if (newIndex>-1){
			this.ChangeHighlight(lvw, newIndex, true);
			this.ChangeSelection(lvw, newIndex);
			window.status = "Searching for \""+this.SearchPhrase+"\". Found match: \""+lvw.SelectedItem().Text+"\"...";
		}else{
			window.status = "Searching for \""+this.SearchPhrase+"\". No matches found...";
		}
		if (this.SearchResetInterval!=null) clearInterval(this.SearchResetInterval);
		this.SearchResetInterval = setInterval("_Ilvwc_ResetSearch()", lvw.Config.SearchResetIntervalMillisec);
		JEventHelper.CancelEvent(e);
	}
}

JImageListViewController.prototype.ResetSearch = function (e){
	if (this.SearchResetInterval!=null) clearInterval(this.SearchResetInterval);
	this.SearchPhrase = "";		
	window.status = "";
}
//ResetSearch function wrapper
function _Ilvwc_ResetSearch(e){
	_Ilvwc.ResetSearch(e);
}
JImageListViewController.prototype.ListItemClick = function (lvwId, td, e){
	var lvw = eval(lvwId);
	var val = lvw.GetVal();
	var selectedIndex = Number(td.getElementsByTagName("span")[0].innerHTML);	
	this.ChangeSelection(lvw, selectedIndex);
	this.ChangeHighlight(lvw, selectedIndex, true);
	if (lvw.MultiSelectMode && this.FocusedCheckbox==null){
		var checkbox = td.getElementsByTagName("input")[0];
		checkbox.checked = !checkbox.checked;	
	}
	val.focus();
}
JImageListViewController.prototype.ChangeSelection = function (lvw, newIndex){
	var val = lvw.GetVal();
	lvw.SelectedIndex = newIndex;
	val.value = lvw.SelectedItem().Val;
}
JImageListViewController.prototype.ChangeHighlight = function (lvw, newIndex, scrollIntoView, dontFocus){
	//Turn off the curently selected element
	var div = lvw.GetDiv();
	var td = div.getElementsByTagName("td")[lvw.HighlightIndex];
	if (td){
		td.className = "ilvw_ListItemTd_"+lvw.Config.BrowserTheme;
	}
	//Turn on the new selected element
	lvw.HighlightIndex = newIndex;
	var td = div.getElementsByTagName("td")[lvw.HighlightIndex];
	if (td){
		td.className = lvw.Enabled ?
							(dontFocus ? 
								"ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_"+lvw.Config.BrowserTheme : 
								"ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_Focused_"+lvw.Config.BrowserTheme) : 
							"ilvw_ListItemTd_Disabled_"+lvw.Config.BrowserTheme+" ilvw_On_Disabled_"+lvw.Config.BrowserTheme;
	}
	if (scrollIntoView)
		this.ScrollIntoView(lvw, lvw.HighlightIndex);
}
JImageListViewController.prototype.ScrollIntoView = function (lvw, index){	
	var div = lvw.GetDiv();
	var td = div.getElementsByTagName("td")[index];
	if (td){
		var tr = td.parentNode;
		//Need to scroll up?
		if (div.scrollTop>tr.offsetTop){
			div.scrollTop = tr.offsetTop;
		}
		//Need to scroll down?
		if (div.scrollTop+div.offsetHeight<tr.offsetTop+tr.offsetHeight){
			var scrollTop = tr.offsetTop+tr.offsetHeight-div.offsetHeight;
			div.scrollTop = scrollTop>0 ? scrollTop : 0;
		}
	}
}

JImageListViewController.prototype.TurnOnCell = function(td, varId){
	var lvw = eval(varId);
	if (td.className=="ilvw_ListItemTd_"+lvw.Config.BrowserTheme)
		td.className="ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_Over_"+lvw.Config.BrowserTheme;
	if (td.className=="ilvw_ListItemTdOn_"+lvw.Config.BrowserTheme)
		td.className="ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_Over_"+lvw.Config.BrowserTheme;
}
JImageListViewController.prototype.TurnOffCell = function(td, varId){
	var lvw = eval(varId);
	if (td.className=="ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_Over_"+lvw.Config.BrowserTheme)
		td.className="ilvw_ListItemTd_"+lvw.Config.BrowserTheme;
	if (td.className=="ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_Over_"+lvw.Config.BrowserTheme)
		td.className="ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_"+lvw.Config.BrowserTheme;
}
JImageListViewController.prototype.Focus = function (val){
	var lvw = eval(val.id);
	var div = lvw.GetDiv();
	var td = div.getElementsByTagName("td")[lvw.HighlightIndex];
	td.className = "ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_Focused_"+lvw.Config.BrowserTheme;
}
JImageListViewController.prototype.Blur = function (val){
	var lvw = eval(val.id);
	var div = lvw.GetDiv();
	var td = div.getElementsByTagName("td")[lvw.HighlightIndex];
	td.className = "ilvw_ListItemTd_"+lvw.Config.BrowserTheme+" ilvw_On_"+lvw.Config.BrowserTheme;
}
JImageListViewController.prototype.KeyDown = function (val, e){
	var lvw = eval(val.id); //lvw is a JImageListView
	this.ProcessKeyDown(e, lvw);
}
JImageListViewController.prototype.CheckboxFocus = function (chk){
	this.FocusedCheckbox = chk;
}
JImageListViewController.prototype.CheckboxBlur = function (chk){
	this.FocusedCheckbox = null;
}


JImageListViewController.prototype.AjustListItemDivSize = function (lvw){
	var listDiv = lvw.GetDiv();
	var listTable = listDiv.getElementsByTagName("table")[0];
	
	var listDivNeedsScroller = listDiv.offsetHeight < listTable.clientHeight;
	if (this.IE){		
		var width = parseInt(lvw.Width);
		if (width>0)
			if (listDivNeedsScroller){
				listTable.style.width = width-17-2+"px";
			}else{
				listTable.style.width = width-2+"px";
			}
	}else{
		listTable.style.width = "100%";
	}
}


