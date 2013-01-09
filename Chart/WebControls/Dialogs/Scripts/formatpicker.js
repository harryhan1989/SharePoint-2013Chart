//Constants
var FORMAT_DIALOG_WIDTH = 570;
var FORMAT_DIALOG_HEIGHT = 320;

//JFormatInfo class
function JFormatInfo(controlId, val, format, onChangeJS){
	this.ControlId = controlId;
	this.Val = val;	
	this.Format = format;
	this.OnChangeJS = onChangeJS;
}

//Decalare global variables
var ModalFormatDialogWindow;
var ModalFormatInfo = new JFormatInfo();

//Declare functions		
function ShowFormatModalDialog(controlId, dialogUrl, onChangeJS){
	ModalFormatInfo.ControlId = controlId;
	ModalFormatInfo.Val = document.getElementById(controlId+"_Val").value;
	ModalFormatInfo.Format = document.getElementById(controlId+"_Format").value;				
	ModalFormatInfo.OnChangeJS = onChangeJS;
	
	dialogName = "Chart Format Picker";
	if (window.showModalDialog) { //IE
		var resultFormatInfo = window.showModalDialog(dialogUrl, ModalFormatInfo, 'dialogWidth:'+FORMAT_DIALOG_WIDTH+'px;dialogHeight:'+FORMAT_DIALOG_HEIGHT+'px;status=off; scroll:off');
		if (resultFormatInfo!=null){
			ModalFormatInfo = resultFormatInfo;
			OnFormatModalDialogOK();
		}
	} else { //Firefox
		var left = (screen.width-FORMAT_DIALOG_WIDTH)/2;
		var top  = (screen.height-FORMAT_DIALOG_HEIGHT)/2;				
		ModalFormatDialogWindow = window.open(dialogUrl, dialogName, 'left='+left+',top='+top+',width='+FORMAT_DIALOG_WIDTH+',height='+(FORMAT_DIALOG_HEIGHT-25)+', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes', ModalFormatInfo);
		ModalFormatDialogWindow.ParentWindow = self;								
		ModalFormatDialogWindow.ModalFormatInfo = ModalFormatInfo;
	}			
} 
		
function OnFormatModalDialogOK(){
	var controlId = ModalFormatInfo.ControlId;
	document.getElementById(controlId+"_Format").value = ModalFormatInfo.Format;
	document.getElementById(controlId+"_Val").value = ModalFormatInfo.Val;
	if (ModalFormatInfo.OnChangeJS && ModalFormatInfo.OnChangeJS!=""){
		eval(ModalFormatInfo.OnChangeJS);
	}
}




