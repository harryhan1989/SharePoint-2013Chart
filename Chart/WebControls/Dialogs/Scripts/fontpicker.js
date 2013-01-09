//Constants
var FONT_DIALOG_WIDTH=530;
var FONT_DIALOG_HEIGHT=280;

//JFontInfo class
function JFontInfo(){
	this.ControlId="";
	this.Name="Arial";
	this.Size=10;
	this.Color="Black";
	this.Style="Normal";
}	

//Declare global variable
var ModalFontDialogWindow;
var ModalFontInfo = new JFontInfo();

//Declare function		
function ShowFontModalDialog(controlId, dialogUrl, onChangeJS){
	ModalFontInfo.ControlId = controlId;
	ModalFontInfo.Name = document.getElementById(controlId+"_Name").value;
	ModalFontInfo.Size = document.getElementById(controlId+"_Size").value;
	ModalFontInfo.Style = document.getElementById(controlId+"_Style").value;
	ModalFontInfo.OnChangeJS = onChangeJS;
	
	dialogName = "Chart Font Picker";
	if (window.showModalDialog) { //IE
		var resultFontInfo = window.showModalDialog(dialogUrl, ModalFontInfo, 'dialogWidth:'+FONT_DIALOG_WIDTH+'px;dialogHeight:'+FONT_DIALOG_HEIGHT+'px;status=off; scroll:off');
		if (resultFontInfo!=null){
			ModalFontInfo = resultFontInfo;
			OnFontModalDialogOK();
		}
	} else { //Firefox
		var left = (screen.width-FONT_DIALOG_WIDTH)/2;
		var top  = (screen.height-FONT_DIALOG_HEIGHT)/2;				
		ModalFontDialogWindow = window.open(dialogUrl, dialogName, 'left='+left+',top='+top+',width='+FONT_DIALOG_WIDTH+',height='+FONT_DIALOG_HEIGHT+', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes', ModalFontInfo);
		ModalFontDialogWindow.ParentWindow = self;								
		ModalFontDialogWindow.ModalFontInfo = ModalFontInfo;
	}			
} 
		
function OnFontModalDialogOK(){
	var controlId = ModalFontInfo.ControlId;
	document.getElementById(controlId+"_Name").value = ModalFontInfo.Name;
	document.getElementById(controlId+"_Size").value = ModalFontInfo.Size
	document.getElementById(controlId+"_Style").value = ModalFontInfo.Style;
	
	document.getElementById(controlId+"_Text").value = ModalFontInfo.Name+", "+ModalFontInfo.Size+"pt";
	
	if (ModalFontInfo.OnChangeJS && ModalFontInfo.OnChangeJS!=""){
		eval(ModalFontInfo.OnChangeJS);
	}
	
}

