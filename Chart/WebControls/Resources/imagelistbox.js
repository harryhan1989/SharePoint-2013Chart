//---------------------------------------
//Class JImageListBox
//---------------------------------------
//Constructor
function JImageListBox(varId, width, height, selectedIndex, imageUrlFormat, spacerImageUrl, multiSelectMode, config, enabled){
	this.Items = [];
	this.VarId = varId;
	this.Width =  width;
	this.Height = height;
	this.SelectedIndex = selectedIndex ? selectedIndex : 0;
	this.HighlightIndex = this.SelectedIndex;
	this.ImageUrlFormat = imageUrlFormat;
	this.SpacerImageUrl = spacerImageUrl;
	this.MultiSelectMode = multiSelectMode;
	this.Config = config;
	this.Enabled = enabled;
}
//Methods
JImageListBox.prototype.Add = function (val, imageUrl, text, layer) {
	var item = new JImageListItem(val, imageUrl, text, layer);
	this.Items[this.Items.length] = item;
}
JImageListBox.prototype.AddItems = function(){
	var args = this.AddItems.arguments;
	var item;
	for(i=0; i<args.length; i+=5){
		this.Items[this.Items.length] = new JImageListItem(args[i], args[i+1], args[i+2], args[i+3], args[i+4]);
	}
}
JImageListBox.prototype.SelectedItem = function (){
	return this.Items[this.SelectedIndex];
}
JImageListBox.prototype.FindIndexByText = function(text) {
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

JImageListBox.prototype.Render = function (autoPostBackJs) {
	if (this.Enabled)
		this.RenderEnabled(autoPostBackJs);
	else
		this.RenderDisabled(autoPostBackJs);
}

JImageListBox.prototype.RenderEnabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	document.write("<tr><td>");
	document.write("	<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"text\" class=\"ilbx_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\" onfocus=\"_Ilbxc.Focus(this);\" onblur=\"_Ilbxc.Blur(this);\" onkeydown=\"_Ilbxc.KeyDown(this, event);\"/>");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"ilbx_Div_"+this.Config.BrowserTheme+"\" style=\"width:"+this.Width+";height:"+this.Height+"\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
	
	for(var i=0; i<this.Items.length; i++){
		var item = this.Items[i];
		document.write("		<tr><td>");
		document.write("			<table class=\"ilbx_ListItemTable_"+this.Config.BrowserTheme+"\" style=\"margin-left:"+(item.Layer*this.Config.HierarchyOffset)+"px;\">");
		document.write("			<tr class=\"ilbx_ListItemTr_"+this.Config.BrowserTheme+"\" onmouseover=\"_Ilbxc.TurnOnRow(this, '"+this.VarId+"');\" onmouseout=\"_Ilbxc.TurnOffRow(this, '"+this.VarId+"');\" onclick=\"_Ilbxc.ListItemClick('"+this.VarId+"', this, event);"+autoPostBackJs+"\">");
		document.write("				<td class=\"ilbx_ListItemTdIcon_"+this.Config.BrowserTheme+"\">");
		document.write("					<span class=\"ilbx_ListItemIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
		document.write("					<span class=\"ilbx_ListItemValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
		document.write("					<img class=\"ilbx_ListItemIcon_"+this.Config.BrowserTheme+"\" src=\""+(item.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}",item.ImageUrl):this.SpacerImageUrl) +"\">");
		document.write("				</td>");
		document.write("				<td class=\"ilbx_ListItemTdText_"+this.Config.BrowserTheme+"\">");
		if (this.MultiSelectMode) 
			document.write("				<input type=\"checkbox\" name=\""+this.VarId+"_M\" value="+item.Val+" "+(item.Selected==1?"checked=\"checked\"":"")+" onfocus=\"_Ilbxc.CheckboxFocus(this);\" onblur=\"_Ilbxc.CheckboxBlur(this);\"/>");
		document.write("					<span>"+item.Text+"</span></td></tr>");
		document.write("			</table>");
		document.write("		</td></tr>");
	}
	
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}

JImageListBox.prototype.RenderDisabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	document.write("<tr><td>");
	document.write("	<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"hidden\" class=\"ilbx_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\" />");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"ilbx_Div_Disabled_"+this.Config.BrowserTheme+"\" style=\"width:"+this.Width+";height:"+this.Height+"\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">");
	
	for(var i=0; i<this.Items.length; i++){
		var item = this.Items[i];
		document.write("		<tr><td>");
		document.write("			<table class=\"ilbx_ListItemTable_"+this.Config.BrowserTheme+"\" style=\"margin-left:"+(item.Layer*this.Config.HierarchyOffset)+"px;\">");
		document.write("			<tr class=\"ilbx_ListItemTr_Disabled_"+this.Config.BrowserTheme+"\" >");
		document.write("				<td class=\"ilbx_ListItemTdIcon_"+this.Config.BrowserTheme+"\">");
		document.write("					<span class=\"ilbx_ListItemIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
		document.write("					<span class=\"ilbx_ListItemValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
		document.write("					<img class=\"ilbx_ListItemIcon_"+this.Config.BrowserTheme+"\" src=\""+(item.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}",item.ImageUrl):this.SpacerImageUrl) +"\">");
		document.write("				</td>");
		document.write("				<td class=\"ilbx_ListItemTdText_"+this.Config.BrowserTheme+"\">");
		if (this.MultiSelectMode) 
			document.write("				<input type=\"checkbox\" disabled=\"disabled\" name=\""+this.VarId+"_M\" value="+item.Val+" "+(item.Selected==1?"checked=\"checked\"":"")+" />");
		document.write("					<span>"+item.Text+"</span></td></tr>");
		document.write("			</table>");
		document.write("		</td></tr>");
	}
	
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}

JImageListBox.prototype.GetVal = function (){
	return document.getElementById(this.VarId);
}
JImageListBox.prototype.GetDiv = function (){
	return document.getElementById(this.VarId+"_listDiv");
}




//---------------------------------------
//JImageListBoxController
//---------------------------------------
//Instance of JImageListBoxController will provide helper functions for image list items and will control modality, focus, keydown handlers
var _Ilbxc = new JImageListBoxController();
//Constructor 
function JImageListBoxController(){
	this.IE = navigator.appVersion.indexOf("MSIE")>-1;
	this.SearchPhrase = "";
	this.SearchResetInterval = null;
	this.FocusedCheckbox = null;
}
//Methods
JImageListBoxController.prototype.ResetSearch = function (){
	this.SearchPhrase = null;
	this.SearchLastKeyDownEventTime = new Date(1);
}
JImageListBoxController.prototype.ProcessKeyDown = function (e, lbx){
	var val = lbx.GetVal();
	var div = lbx.GetDiv();
	var tr = this.IE ? div.getElementsByTagName("table")[lbx.HighlightIndex+1].parentNode.parentNode : div.getElementsByTagName("table")[lbx.HighlightIndex+1].parentNode;
	
	var keyCode;
	if (window.event) //IE
		keyCode = e.keyCode;
	else
		keyCode = e.which;
	
	//Each Panel was rendered by the instance of the JImageListBox class with the same name. So we can use this instance as a model - every time user selects something different we update it's SelectedIndex property.
	var newIndex = -1;

	if (keyCode==JKeyCodes.Enter) {
		__doPostBack('"+lbx.VarId+"', 'selectedIndexChanged');
	}else
	if (keyCode==JKeyCodes.Down){
		if (lbx.HighlightIndex<lbx.Items.length-1){ //Down
			newIndex = lbx.HighlightIndex+1;
			this.ChangeHighlight(lbx, newIndex, true);
			this.ChangeSelection(lbx, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Up){
		if (lbx.HighlightIndex>0){ //Up
			var newIndex = lbx.HighlightIndex-1;
			this.ChangeHighlight(lbx, newIndex, true);
			this.ChangeSelection(lbx, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.PgUp){ //PgUp
		var newIndex = lbx.HighlightIndex;
		var newTr = tr;
		while (newIndex>=0 && tr.offsetTop-newTr.offsetTop<div.offsetHeight){
			newIndex--;
			if (newIndex>=0)
				newTr = this.IE ? div.getElementsByTagName("table")[newIndex+1].parentNode.parentNode :	div.getElementsByTagName("table")[newIndex+1].parentNode;
		}
		if (newIndex!=lbx.HighlightIndex){
			this.ChangeHighlight(lbx, newIndex+1, true);
			this.ChangeSelection(lbx, newIndex+1);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.PgDown){ //PgDown
		var newIndex = lbx.HighlightIndex;
		var newTr = tr;
		while (newIndex<lbx.Items.length && newTr.offsetTop-tr.offsetTop<div.offsetHeight){
			newIndex++;
			if (newIndex<lbx.Items.length)
				newTr = this.IE ? div.getElementsByTagName("table")[newIndex+1].parentNode.parentNode :	div.getElementsByTagName("table")[newIndex+1].parentNode;
		}
		if (newIndex!=lbx.HighlightIndex){
			this.ChangeHighlight(lbx, newIndex-1, true);
			this.ChangeSelection(lbx, newIndex-1);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.End){ //End
		var newIndex = lbx.Items.length-1;
		if (newIndex!=lbx.HighlightIndex){
			this.ChangeHighlight(lbx, newIndex, true);
			this.ChangeSelection(lbx, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Home){ //Home
		var newIndex = 0;
		if (newIndex!=lbx.HighlightIndex){
			this.ChangeHighlight(lbx, newIndex, true);
			this.ChangeSelection(lbx, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Tab){ //Tab
		this.ResetSearch();
	}else
	if ((keyCode==JKeyCodes.Space || keyCode==JKeyCodes.Ins) && lbx.MultiSelectMode){ //Space or Ins
		var checkbox = tr.getElementsByTagName("input")[0];
		checkbox.checked = !checkbox.checked;	
		if (lbx.HighlightIndex<lbx.Items.length-1){ //Down
			newIndex = lbx.HighlightIndex+1;
			this.ChangeHighlight(lbx, newIndex, true);
			this.ChangeSelection(lbx, newIndex);
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
		var newIndex = lbx.FindIndexByText(this.SearchPhrase);		
		if (newIndex>-1){
			this.ChangeHighlight(lbx, newIndex, true);
			this.ChangeSelection(lbx, newIndex);
			window.status = "Searching for \""+this.SearchPhrase+"\". Found match: \""+lbx.SelectedItem().Text+"\"...";
		}else{
			window.status = "Searching for \""+this.SearchPhrase+"\". No matches found...";
		}
		if (this.SearchResetInterval!=null) clearInterval(this.SearchResetInterval);
		this.SearchResetInterval = setInterval("_Ilbxc_ResetSearch()", lbx.Config.SearchResetIntervalMillisec);
		JEventHelper.CancelEvent(e);
	}
}

JImageListBoxController.prototype.ResetSearch = function (e){
	if (this.SearchResetInterval!=null) clearInterval(this.SearchResetInterval);
	this.SearchPhrase = "";		
	window.status = "";
}
//ResetSearch function wrapper
function _Ilbxc_ResetSearch(e){
	_Ilbxc.ResetSearch(e);
}
JImageListBoxController.prototype.ListItemClick = function (lbxId, tr, e){
	var lbx = eval(lbxId);
	var val = lbx.GetVal();
	var selectedIndex = Number(tr.getElementsByTagName("span")[0].innerHTML);	
	this.ChangeSelection(lbx, selectedIndex);
	this.ChangeHighlight(lbx, selectedIndex, true);
	if (lbx.MultiSelectMode && this.FocusedCheckbox==null){
		var checkbox = tr.getElementsByTagName("input")[0];
		checkbox.checked = !checkbox.checked;	
	}
	val.focus();
}
JImageListBoxController.prototype.ChangeSelection = function (lbx, newIndex){
	var val = lbx.GetVal();
	lbx.SelectedIndex = newIndex;
	val.value = lbx.SelectedItem().Val;
}
JImageListBoxController.prototype.ChangeHighlight = function (lbx, newIndex, scrollIntoView, dontFocus){
	//Turn off the currently selected element
	var div = lbx.GetDiv();
	var tr = div.getElementsByTagName("table")[lbx.HighlightIndex+1].getElementsByTagName("tr")[0]
	if (tr){
		tr.className = "ilbx_ListItemTr_"+lbx.Config.BrowserTheme;
	}
	//Turn on the new selected element
	lbx.HighlightIndex = newIndex;
	tr = div.getElementsByTagName("table")[lbx.HighlightIndex+1].getElementsByTagName("tr")[0];
	if (tr){
		tr.className = lbx.Enabled ?
						(dontFocus ? 
							"ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_"+lbx.Config.BrowserTheme : 
							"ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_Focused_"+lbx.Config.BrowserTheme):
						"ilbx_ListItemTr_Disabled_"+lbx.Config.BrowserTheme+" ilbx_On_Disabled_"+lbx.Config.BrowserTheme;
	}
	if (scrollIntoView)
		this.ScrollIntoView(lbx, lbx.HighlightIndex);
}
JImageListBoxController.prototype.ScrollIntoView = function (lbx, index){	
	var div = lbx.GetDiv();
	var tr = this.IE ? div.getElementsByTagName("table")[index+1].parentNode.parentNode : div.getElementsByTagName("table")[index+1].parentNode;
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

JImageListBoxController.prototype.TurnOnRow = function(tr, varId){
	var lbx = eval(varId);
	if (tr.className=="ilbx_ListItemTr_"+lbx.Config.BrowserTheme)
		tr.className="ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_Over_"+lbx.Config.BrowserTheme;
	if (tr.className=="ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_"+lbx.Config.BrowserTheme)
		tr.className="ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_Over_"+lbx.Config.BrowserTheme;
}
JImageListBoxController.prototype.TurnOffRow = function(tr, varId){
	var lbx = eval(varId);
	if (tr.className=="ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_Over_"+lbx.Config.BrowserTheme)
		tr.className="ilbx_ListItemTr_"+lbx.Config.BrowserTheme;
	if (tr.className=="ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_Over_"+lbx.Config.BrowserTheme)
		tr.className="ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_"+lbx.Config.BrowserTheme;
}
JImageListBoxController.prototype.Focus = function (val){
	var lbx = eval(val.id);
	var div = lbx.GetDiv();
	var tr = div.getElementsByTagName("table")[lbx.HighlightIndex+1].getElementsByTagName("tr")[0]
	tr.className = "ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_Focused_"+lbx.Config.BrowserTheme;
}
JImageListBoxController.prototype.Blur = function (val){
	var lbx = eval(val.id);
	var div = lbx.GetDiv();
	var tr = div.getElementsByTagName("table")[lbx.HighlightIndex+1].getElementsByTagName("tr")[0]
	tr.className = "ilbx_ListItemTr_"+lbx.Config.BrowserTheme+" ilbx_On_"+lbx.Config.BrowserTheme;
}
JImageListBoxController.prototype.KeyDown = function (val, e){
	var lbx = eval(val.id); //lbx is a JImageListBox
	this.ProcessKeyDown(e, lbx);
}
JImageListBoxController.prototype.CheckboxFocus = function (chk){
	this.FocusedCheckbox = chk;
}
JImageListBoxController.prototype.CheckboxBlur = function (chk){
	this.FocusedCheckbox = null;
}

JImageListBoxController.prototype.AjustListItemDivSize = function (lbx){
	var listDiv = lbx.GetDiv();
	var listTable = listDiv.getElementsByTagName("table")[0];
	
	var listDivNeedsScroller = listDiv.offsetHeight < listTable.clientHeight;
	if (this.IE){
		var width = listDiv.offsetWidth>0 ? listDiv.offsetWidth : parseInt(lbx.Width);
		if (width>0){
			if (listDivNeedsScroller){
				listTable.style.width = width-17-2+"px";
			}else{
				listTable.style.width = width-2+"px";
			}
		}
	}else{
		listTable.style.width = "100%";
	}
}


