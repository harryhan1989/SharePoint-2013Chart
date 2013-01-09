//Constants
var FILL_DIALOG_WIDTH=560;
var FILL_DIALOG_HEIGHT=320;

//JFillInfo class
function JFillInfo(){
	this.ControlId = "";
	this.StartARGB = 0;
	this.EndARGB = 0;
	this.Gradient = 0;
	this.Hatching = 0;	
	this.Name="Black";
	this.OnChangeJS = "";
}	

//Decalare global variables
var ModalFillDialogWindow;
var ModalFillInfo = new JFillInfo();

//Declare functions		
function ShowFillModalDialog(controlId, dialogUrl, onChangeJS){
	ModalFillInfo.ControlId = controlId;
	ModalFillInfo.StartARGB = document.getElementById(controlId+"_startARGB").value;
	ModalFillInfo.EndARGB = document.getElementById(controlId+"_endARGB").value;
	ModalFillInfo.Gradient = document.getElementById(controlId+"_gradient").value;
	ModalFillInfo.Hatching = document.getElementById(controlId+"_hatching").value;
	ModalFillInfo.OnChangeJS = onChangeJS;
	
	dialogName = "Chart Fill Picker";
	if (window.showModalDialog) { //IE
		var resultFillInfo = window.showModalDialog(dialogUrl, ModalFillInfo, 'dialogWidth:'+FILL_DIALOG_WIDTH+'px;dialogHeight:'+FILL_DIALOG_HEIGHT+'px;status=off; scroll:off');
		if (resultFillInfo!=null){
			ModalFillInfo = resultFillInfo;
			OnFillModalDialogOK();
		}
	} else { //Firefox
		var left = (screen.width-FILL_DIALOG_WIDTH)/2;
		var top  = (screen.height-FILL_DIALOG_HEIGHT)/2;				
		ModalFillDialogWindow = window.open(dialogUrl, dialogName, 'left='+left+',top='+top+',width='+FILL_DIALOG_WIDTH+',height='+(FILL_DIALOG_HEIGHT-50)+', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes', ModalFillInfo);
		ModalFillDialogWindow.ParentWindow = self;								
		ModalFillDialogWindow.ModalFillInfo = ModalFillInfo;
	}			
} 
		
function OnFillModalDialogOK(){
	var controlId = ModalFillInfo.ControlId;
	ModalFillInfo.CombineFills();
	document.getElementById(controlId+"_startARGB").value = ModalFillInfo.StartARGB;
	document.getElementById(controlId+"_endARGB").value = ModalFillInfo.EndARGB;
	document.getElementById(controlId+"_gradient").value = ModalFillInfo.Gradient;
	document.getElementById(controlId+"_hatching").value = ModalFillInfo.Hatching;
	
	document.getElementById(controlId+"_Name").style.backgroundFill = ModalFillInfo.Name;
	if (ModalFillInfo.OnChangeJS && ModalFillInfo.OnChangeJS!=""){
		eval(ModalFillInfo.OnChangeJS);
	}
}
