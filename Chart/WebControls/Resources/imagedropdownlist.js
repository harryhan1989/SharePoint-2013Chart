//---------------------------------------
//Class JImageDropDownList
//---------------------------------------
//Constructor
function JImageDropDownList(varId, width, visibleListRows, selectedIndex, imageUrlFormat, spacerImageUrl, config, enabled, onChangeJS){
	this.Items = [];
	this.VarId = varId;
	this.Width =  width;
	this.VisibleListRows = visibleListRows; 					
	this.SelectedIndex = selectedIndex ? selectedIndex : 0;
	this.HighlightIndex = this.SelectedIndex;
	this.ImageUrlFormat = imageUrlFormat;
	this.ImageListArray = new Array();	 //Image pair array is used for storing rollover images - for example ArrowButton pairs
	this.SpacerImageUrl = spacerImageUrl;
	this.Config = config;
	this.ArrowImageHeight = this.Config.DefaultArrowImageHeight;			
	this.Enabled = enabled;
	this.OnChangeJS = onChangeJS;
	this.Adjusted = false;
}
//Methods
JImageDropDownList.prototype.Add = function (val, imageUrl, text, layer) {
	var item = new JImageListItem(val, imageUrl, text, layer);
	this.Items[this.Items.length] = item;
}
JImageDropDownList.prototype.AddItems = function(){
	var args = this.AddItems.arguments;
	var item;
	for(i=0; i<args.length; i+=5){
		this.Items[this.Items.length] = new JImageListItem(args[i], args[i+1], args[i+2], args[i+3], args[i+4]);
	}
}

JImageDropDownList.prototype.SelectedItem = function (){
	return this.Items[this.SelectedIndex];
}

JImageDropDownList.prototype.FindIndexByText = function(text) {
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

JImageDropDownList.prototype.Render = function (autoPostBackJs) {	
	if (this.Enabled)
		this.RenderEnabled(autoPostBackJs);
	else
		this.RenderDisabled(autoPostBackJs);
}

JImageDropDownList.prototype.RenderEnabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";
	var selectedImageUrl = selectedItem && selectedItem.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}", selectedItem.ImageUrl) : this.SpacerImageUrl;
	var selectedText = selectedItem ? selectedItem.Text : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width="+this.Width+">");
	document.write("<tr><td>");
	document.write("	<table class=\"iddl_TopTable_"+this.Config.BrowserTheme+"\" id=\""+this.VarId+"_ddlTable\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:100%;\">");
	document.write("	<tr class=\"iddl_Tr_"+this.Config.BrowserTheme+"\" id=\""+this.VarId+"_ddlTr\" onmouseover=\"_Iddlc.TurnOnImg(this);\" onmouseout=\"_Iddlc.TurnOffImg(this);\"");
	document.write("	onclick=\"_Iddlc.ShowHideListDiv('"+this.VarId+"'); _Iddlc.TurnOffImg(this); JEventHelper.CancelEvent(event);\">");
	document.write("		<td class=\"iddl_TdIcon_"+this.Config.BrowserTheme+"\">");
	document.write("			<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"text\" class=\"iddl_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\" onfocus=\"_Iddlc.Focus(this);\" onblur=\"_Iddlc.Blur(this);\" onkeydown=\"_Iddlc.KeyDown(this, event);\"/>");
	document.write("			<img src=\""+selectedImageUrl+"\" class=\"iddl_Icon_"+this.Config.BrowserTheme+"\">");
	document.write("		</td>");
	document.write("		<td class=\"iddl_TdText_"+this.Config.BrowserTheme+"\">");
	document.write("			<div class=\"iddl_Text_"+this.Config.BrowserTheme+"\">"+selectedText+"</div>");
	document.write("		</td>");
	document.write("		<td class=\"iddl_TdArrowDown_"+this.Config.BrowserTheme+"\">");
	document.write("			<img src=\""+this.GetImageList("btnArrow", this.ArrowImageHeight)[1].src+"\"/></td>");
	document.write("	</tr>");
	document.write("	</table></td></tr>");
	document.write("<tr><td>");
	document.write("	<div id=\""+this.VarId+"_listDiv\" class=\"iddl_ListItemDiv_"+this.Config.BrowserTheme+"\" style=\"width:"+(document.all ? "100%" : this.Width)+";\">");
	document.write("		<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	
	for(var i=0; i<this.Items.length; i++){
		var item = this.Items[i];
		document.write("		<tr><td>");
		document.write("			<table class=\"iddl_ListItemTable_"+this.Config.BrowserTheme+"\" style=\"margin-left:"+(item.Layer*this.Config.HierarchyOffset)+"px;\">");
		document.write("			<tr class=\"iddl_ListItemTr_"+this.Config.BrowserTheme+"\" onmouseover=\"_Iddlc.TurnOnRow(this);\" onclick=\"_Iddlc.ListItemClick(this);"+autoPostBackJs+"\">");
		document.write("				<td class=\"iddl_ListItemTdIcon\">");
		document.write("					<span class=\"iddl_ListItemIndex_"+this.Config.BrowserTheme+"\">"+i+"</span>");
		document.write("					<span class=\"iddl_ListItemValue_"+this.Config.BrowserTheme+"\">"+item.Val+"</span>");
		document.write("					<img class=\"iddl_ListItemIcon_"+this.Config.BrowserTheme+"\" src=\""+(item.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}",item.ImageUrl):this.SpacerImageUrl) +"\" >");
		document.write("				</td>");
		document.write("				<td class=\"iddl_ListItemTdText_"+this.Config.BrowserTheme+"\">");
		document.write("					<span class=\"iListItemText_"+this.Config.BrowserTheme+"\">"+item.Text+"</span></td></tr>");
		document.write("			</table>");
		document.write("		</td></tr>");
	}	
	document.write("		</table>");
	document.write("	</div></td></tr>");
	document.write("</table>");
}


JImageDropDownList.prototype.RenderDisabled = function (autoPostBackJs) {	
	var selectedItem = this.SelectedItem();	
	var selectedVal = selectedItem ? selectedItem.Val : "";
	var selectedImageUrl = selectedItem && selectedItem.ImageUrl!="" ? this.ImageUrlFormat.replace("{0}", selectedItem.ImageUrl) : this.SpacerImageUrl;
	var selectedText = selectedItem ? selectedItem.Text : "";

	document.write("<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">");
	document.write("<tr><td>");
	document.write("	<table class=\"iddl_TopTable_Disabled_"+this.Config.BrowserTheme+"\" id=\""+this.VarId+"_ddlTable\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:"+this.Width+";\">");
	document.write("	<tr class=\"iddl_Tr_Disabled_"+this.Config.BrowserTheme+"\" id=\""+this.VarId+"_ddlTr\" >");
	document.write("		<td class=\"iddl_TdIcon_"+this.Config.BrowserTheme+"\">");
	document.write("			<input name=\""+this.VarId+"\" id=\""+this.VarId+"\" type=\"hidden\" class=\"iddl_Input_"+this.Config.BrowserTheme+"\" value=\""+selectedVal+"\";\"/>");
	document.write("			<img src=\""+selectedImageUrl+"\" class=\"iddl_Icon_"+this.Config.BrowserTheme+"\">");
	document.write("		</td>");
	document.write("		<td class=\"iddl_TdText_"+this.Config.BrowserTheme+"\">");
	document.write("			<div class=\"iddl_Text_"+this.Config.BrowserTheme+"\">"+selectedText+"</div>");
	document.write("		</td>");
	document.write("		<td class=\"iddl_TdArrowDown_"+this.Config.BrowserTheme+"\">");
	document.write("			<img src=\""+this.GetImageList("btnArrow", this.ArrowImageHeight)[3].src+"\"/></td>");
	document.write("	</tr>");
	document.write("	</table></td></tr>");
	document.write("<tr><td>");
	document.write("</table>");
}
JImageDropDownList.prototype.GetTable = function (){
	return document.getElementById(this.VarId+"_ddlTable");
}
JImageDropDownList.prototype.GetTr = function (){
	return document.getElementById(this.VarId+"_ddlTr");
}
JImageDropDownList.prototype.GetVal = function (){
	return this.GetTr().getElementsByTagName("input")[0];
}
JImageDropDownList.prototype.GetIconImg = function (){
	return this.GetTr().getElementsByTagName("img")[0];
}
JImageDropDownList.prototype.GetTextDiv = function (){
	return this.GetTr().getElementsByTagName("div")[0];
}
JImageDropDownList.prototype.GetDiv = function (){
	return document.getElementById(this.VarId+"_listDiv");
}

JImageDropDownList.prototype.AddImageList = function (key, srcOff, srcOn, srcDisabled, width, height){
	var imageList = Array()
	imageList[0] = key;
	imageList[1] = new Image(width, height);
	imageList[1].src = srcOff;
	imageList[2] = new Image(width, height);
	imageList[2].src = srcOn;	
	imageList[3] = new Image(width, height);
	imageList[3].src = srcDisabled;	
	
	this.ImageListArray[this.ImageListArray.length] = imageList;
}
JImageDropDownList.prototype.GetImageList = function (key, height){
	for(i=0; i<this.ImageListArray.length; i++){
		var imageList = this.ImageListArray[i];
		if (imageList[0]==key && imageList[1].height==height)
			return imageList;
	}	
	return null;
}




//---------------------------------------
//JImageDropDownListController
//---------------------------------------
//Instance of JImageDropDownListController will provide helper functions for image list items and will control modality, focus, keydown handlers
var _Iddlc = new JImageDropDownListController();
//Constructor 
function JImageDropDownListController(){
	this.IE = navigator.appVersion.indexOf("MSIE")>-1;
	this.ModalDdl = null;
	this.ModalVal = null;
	this.ModalTable = null;
	this.ModalDiv = null;
	this.SearchPhrase = "";
	this.SearchResetInterval = null;
}
//Methods
JImageDropDownListController.prototype.SetModal = function (ddl){
	this.ModalDdl = ddl;
	this.ModalVal = ddl.GetVal();
	this.ModalTable = ddl.GetTable();
	this.ModalDiv = ddl.GetDiv();
}
JImageDropDownListController.prototype.ResetModal = function (){
	this.ModalDdl = null;
	this.ModalVal = null;
	this.ModalTable = null;
	this.ModalDiv = null;
}
JImageDropDownListController.prototype.ResetSearch = function (){
	this.SearchPhrase = null;
	this.SearchLastKeyDownEventTime = new Date(1);
}
JImageDropDownListController.prototype.ShowHideListDiv = function (varId){	
	var ddl = eval(varId);
	var val = ddl.GetVal();
	var table = ddl.GetTable();
	var div = ddl.GetDiv();
	if (div.style.display!="block"){
		this.ShowListDiv(ddl, div, table);			
	}else{
		this.HideListDiv(ddl, div, table);
		val.focus();			
	}		
}
JImageDropDownListController.prototype.ShowListDiv = function (ddl, div, table){
	if (this.ModalDdl!=null){
		this.HideListDiv(this.ModalDdl, this.ModalDiv, this.ModalTable);
	}			
	div.style.display = "block";
	this.AjustListItemDivSize(ddl);
	this.SetModal(ddl);
	this.ChangeHighlight(ddl, ddl.SelectedIndex, true);
	this.AttachDocumentEvents();
}
JImageDropDownListController.prototype.HideListDiv = function (ddl, div, table){
	if (div){
		div.style.display = "none";
		this.ResetModal();
		this.DetachDocumentEvents();
	}
}
JImageDropDownListController.prototype.AttachDocumentEvents = function (){
	JEventHelper.AttachEvent(document, "click", _Iddlc_DocumentClick);				
	JEventHelper.AttachEvent(document, "keydown", _Iddlc_DocumentKeyDown);				
}
JImageDropDownListController.prototype.DetachDocumentEvents = function (){
	JEventHelper.DetachEvent(document, "click", _Iddlc_DocumentClick);				
	JEventHelper.DetachEvent(document, "keydown", _Iddlc_DocumentKeyDown);				
}
//Document event wrapper functions - overcome the JS Problem: "this" stops pointing on the instance inside of the document event handler but points to a document
function _Iddlc_DocumentClick(e){
	_Iddlc.DocumentClick(e);
}
function _Iddlc_DocumentKeyDown(e){
	_Iddlc.DocumentKeyDown(e);
}
JImageDropDownListController.prototype.DocumentClick = function (e){
	this.HideListDiv(this.ModalDdl, this.ModalDiv, this.ModalTable);	
	this.ResetSearch();
}
JImageDropDownListController.prototype.DocumentKeyDown = function (e){			
	var ddl = this.ModalDdl;
	this.ProcessKeyDown(e, ddl);
}
JImageDropDownListController.prototype.ProcessKeyDown = function (e, ddl){
	var val = ddl.GetVal();
	var div = ddl.GetDiv();
	var tr = this.IE ? div.getElementsByTagName("table")[ddl.HighlightIndex+1].parentNode.parentNode : div.getElementsByTagName("table")[ddl.HighlightIndex+1].parentNode;
	
	var keyCode;
	if (window.event) //IE
		keyCode = e.keyCode;
	else
		keyCode = e.which;
	
	//Each dropdown was rendered by the instance of the JImageDropDownList class with the same name. So we can use this instance as a model - every time user selects something different we update it's SelectedIndex property.
	var newIndex = -1;
	if (keyCode==JKeyCodes.Down){
		if (ddl.HighlightIndex<ddl.Items.length-1){ //Down
			newIndex = ddl.HighlightIndex+1;
			this.ChangeHighlight(ddl, newIndex, true);
			this.ChangeSelection(ddl, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Up){
		if (ddl.HighlightIndex>0){ //Up
			var newIndex = ddl.HighlightIndex-1;
			this.ChangeHighlight(ddl, newIndex, true);
			this.ChangeSelection(ddl, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.PgUp){ //PgUp
		var newIndex = ddl.HighlightIndex;
		var newTr = tr;
		while (newIndex>=0 && tr.offsetTop-newTr.offsetTop<div.offsetHeight){
			newIndex--;
			if (newIndex<ddl.Items.length)
				newTr = this.IE ? div.getElementsByTagName("table")[newIndex+1].parentNode.parentNode :	div.getElementsByTagName("table")[newIndex+1].parentNode;
		}
		if (newIndex!=ddl.HighlightIndex){
			this.ChangeHighlight(ddl, newIndex+1, true);
			this.ChangeSelection(ddl, newIndex+1);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.PgDown){ //PgDown
		var newIndex = ddl.HighlightIndex;
		var newTr = tr;
		while (newIndex<ddl.Items.length && newTr.offsetTop-tr.offsetTop<div.offsetHeight){
			newIndex++;
			if (newIndex<ddl.Items.length)
				newTr = this.IE ? div.getElementsByTagName("table")[newIndex+1].parentNode.parentNode :	div.getElementsByTagName("table")[newIndex+1].parentNode;
		}
		if (newIndex!=ddl.HighlightIndex){
			this.ChangeHighlight(ddl, newIndex-1, true);
			this.ChangeSelection(ddl, newIndex-1);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.End){ //End
		var newIndex = ddl.Items.length-1;
		if (newIndex!=ddl.HighlightIndex){
			this.ChangeHighlight(ddl, newIndex, true);
			this.ChangeSelection(ddl, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Home){ //Home
		var newIndex = 0;
		if (newIndex!=ddl.HighlightIndex){
			this.ChangeHighlight(ddl, newIndex, true);
			this.ChangeSelection(ddl, newIndex);
		}
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Enter){ //Enter
		this.ChangeSelection(ddl, ddl.HighlightIndex);
		this.HideListDiv(this.ModalDdl, this.ModalDiv, this.ModalTable);
		val.focus();			
		this.ResetSearch();
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Esc){ //ESC
		this.HideListDiv(this.ModalDdl, this.ModalDiv, this.ModalTable);
		val.focus();			
		this.ResetSearch();
		JEventHelper.CancelEvent(e);
	}else
	if (keyCode==JKeyCodes.Tab){ //Tab
		if (this.ModalDdl)
			this.HideListDiv(this.ModalDdl, this.ModalDiv, this.ModalTable);				
		this.ResetSearch();
	}else
	if (keyCode==JKeyCodes.Backspace || keyCode>=32){	//Any other char - try to find in the list
		if (keyCode==JKeyCodes.Backspace){ //Backspace
			if (this.SearchPhrase.length>0){
				this.SearchPhrase = this.SearchPhrase.substring(0, this.SearchPhrase.length-1);	
			}
		}else{
			this.SearchPhrase += String.fromCharCode(keyCode);					
		}
		var newIndex = ddl.FindIndexByText(this.SearchPhrase);		
		if (newIndex>-1){
			this.ChangeHighlight(ddl, newIndex, true);
			this.ChangeSelection(ddl, newIndex);
			window.status = "Searching for \""+this.SearchPhrase+"\". Found match: \""+ddl.SelectedItem().Text+"\"...";
		}else{
			window.status = "Searching for \""+this.SearchPhrase+"\". No matches found...";
		}
		if (this.SearchResetInterval!=null) clearInterval(this.SearchResetInterval);
		this.SearchResetInterval = setInterval("_Iddlc_ResetSearch()", ddl.Config.SearchResetIntervalMillisec);
		JEventHelper.CancelEvent(e);
	}
}

JImageDropDownListController.prototype.ResetSearch = function (e){
	if (this.SearchResetInterval!=null) clearInterval(this.SearchResetInterval);
	this.SearchPhrase = "";		
	window.status = "";
}
//ResetSearch function wrapper
function _Iddlc_ResetSearch(e){
	_Iddlc.ResetSearch(e);
}
JImageDropDownListController.prototype.ListItemClick = function (tr){
	var val = this.ModalVal;
	var selectedIndex = Number(tr.getElementsByTagName("span")[0].innerHTML);	
	this.ChangeSelection(this.ModalDdl, selectedIndex);		
	val.focus();
}
JImageDropDownListController.prototype.ChangeSelection = function (ddl, newIndex){
	var tr = ddl.GetTr();
	var val = ddl.GetVal();
	var img = ddl.GetIconImg();
	var text = ddl.GetTextDiv();

	ddl.SelectedIndex = newIndex;
	
	val.value = ddl.SelectedItem().Val;		
	var newSrc = ddl.SelectedItem().ImageUrl ? ddl.ImageUrlFormat.replace("{0}", ddl.SelectedItem().ImageUrl) : ddl.SpacerImageUrl;
	if (img.src.indexOf(newSrc)<0){
		img.src = newSrc;
	}
	text.innerHTML = ddl.SelectedItem().Text;
	if (ddl.OnChangeJS) {
		eval(ddl.OnChangeJS);
	}
}
JImageDropDownListController.prototype.ChangeHighlight = function (ddl, newIndex, scrollIntoView){
	//Turn off the curently selected element
	var div = ddl.GetDiv();
	var tr = div.getElementsByTagName("table")[ddl.HighlightIndex+1].getElementsByTagName("tr")[0]
	if (tr){
		tr.className = "iddl_ListItemTr_"+ddl.Config.BrowserTheme;
	}
	//Turn on the new selected element
	ddl.HighlightIndex = newIndex;
	tr = div.getElementsByTagName("table")[ddl.HighlightIndex+1].getElementsByTagName("tr")[0];
	if (tr){
		tr.className = "iddl_ListItemTr_"+ddl.Config.BrowserTheme+" iddl_ListItem_Focused_"+ddl.Config.BrowserTheme;
	}
	if (scrollIntoView)
		this.ScrollIntoView(ddl, ddl.HighlightIndex);
}
JImageDropDownListController.prototype.ScrollIntoView = function (ddl, index){	
	var div = ddl.GetDiv();
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

JImageDropDownListController.prototype.TurnOnRow = function (tr){
	var selectedIndex = Number(tr.getElementsByTagName("span")[0].innerHTML);
	this.ChangeHighlight(this.ModalDdl, selectedIndex);
}
JImageDropDownListController.prototype.TurnOffRow = function (tr){
}
JImageDropDownListController.prototype.TurnOnImg = function (tr){					
	var img = tr.getElementsByTagName("img")[1];
	var ddl = eval(tr.id.substr(0, tr.id.lastIndexOf("_ddlTr")));
	img.src = ddl.GetImageList("btnArrow", ddl.ArrowImageHeight)[2].src;
}
JImageDropDownListController.prototype.TurnOffImg = function (tr){
	var img = tr.getElementsByTagName("img")[1];
	var ddl = eval(tr.id.substr(0, tr.id.lastIndexOf("_ddlTr")));
	img.src = ddl.GetImageList("btnArrow", ddl.ArrowImageHeight)[1].src;
}
JImageDropDownListController.prototype.Focus = function (val){
	var ddl = eval(val.id);
	var tr = document.getElementById(val.id+"_ddlTr");
	tr.className = "iddl_Tr_"+ddl.Config.BrowserTheme+" iddl_Focused_"+ddl.Config.BrowserTheme;
}
JImageDropDownListController.prototype.Blur = function (val){
	var ddl = eval(val.id);
	var tr = document.getElementById(val.id+"_ddlTr");
	tr.className = "iddl_Tr_"+ddl.Config.BrowserTheme;
}
JImageDropDownListController.prototype.KeyDown = function (val, e){
	var ddl = eval(val.id); //ddl is a JImageDropDownList
	this.ProcessKeyDown(e, ddl);
}

JImageDropDownListController.prototype.AjustListItemDivSize = function (ddl){
	if (ddl.Enabled){
		var ddlTable = ddl.GetTable();
		var listDiv = ddl.GetDiv();
		var listTable = listDiv.getElementsByTagName("table")[0];
		var listTd = listDiv.getElementsByTagName("td")[0];

		var rows = Math.min(ddl.VisibleListRows, ddl.Items.length);
		
		if (document.all){	//IE
			listDiv.style.height = rows*(listTd.clientHeight)+2+"px";
			listDiv.style.width = ddlTable.clientWidth;
			listTable.style.width = listDiv.clientWidth; //This is not an error this line must be used twice... Essentially once we assign it first time the clientWidth changes because scrollbar disappers
			listTable.style.width = listDiv.clientWidth; //So we repeat the operation so the table size is going to change to adjust to a div without scroller
		}else{				//Firefox
			listDiv.style.height = rows*(listTd.clientHeight)+"px";
			listDiv.style.width = ddlTable.clientWidth+"px";
			listTable.style.width = "100%";
		}
	}
}

JImageDropDownListController.prototype.AjustArrowImageHeight = function (ddl){
	var table = ddl.GetTable();
	var img = table.getElementsByTagName("img")[1];
	
	var arrowHeight = 0;
	var lastArrowIndex = 0;
	for (var i=0; i<ddl.ImageListArray.length; i++){
		var imageList = ddl.ImageListArray[i];
		if (imageList[0]=="btnArrow"){
			lastArrowIndex = i;
			if (table.clientHeight<=imageList[1].height){
				arrowHeight = imageList[1].height;
				break;
			}
		}
	}
	if (arrowHeight==0)
		arrowHeight = ddl.ImageListArray[lastArrowIndex][1].height;	
	img.src = ddl.GetImageList("btnArrow", arrowHeight)[ddl.Enabled ? 1 : 3].src;
	ddl.ArrowImageHeight = arrowHeight;
}
