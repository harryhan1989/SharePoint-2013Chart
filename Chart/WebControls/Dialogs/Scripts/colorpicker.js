//Constants
var COLOR_DIALOG_WIDTH=560;
var COLOR_DIALOG_HEIGHT=320;

//JColorInfo class
function JColorInfo(){
	this.ControlId = "";
	this.ARGB = 0;
	this.Red=0;
	this.Green=0;
	this.Blue=0;
	this.Alfa=0;
	this.Name="Black";
	this.OnChangeJS = "";
}	
JColorInfo.prototype.CombineColors = function(){
	var argb = this.Alfa;
	argb = argb<<8 | (255 & this.Red);
	argb = argb<<8 | (255 & this.Green);
	argb = argb<<8 | (255 & this.Blue);
	this.ARGB = argb;
}
JColorInfo.prototype.SplitColors = function(){
	var argb = parseInt(this.ARGB);
	this.Blue = argb & 255;
	argb = argb >> 8;	
	this.Green = argb & 255;
	argb = argb >> 8;
	this.Red = argb & 255;
	argb = argb >>8;
	this.Alfa = argb & 255;
}

//Decalare global variables
var ModalColorDialogWindow;
var ModalColorInfo = new JColorInfo();

//Declare functions		
function ShowColorModalDialog(controlId, dialogUrl, onChangeJS){
	ModalColorInfo.ControlId = controlId;
	ModalColorInfo.ARGB = document.getElementById(controlId+"_ARGB").value;
	ModalColorInfo.SplitColors();
	ModalColorInfo.OnChangeJS = onChangeJS;
	
	dialogName = "Chart Color Picker";
	if (window.showModalDialog) { //IE
		var resultColorInfo = window.showModalDialog(dialogUrl, ModalColorInfo, 'dialogWidth:'+COLOR_DIALOG_WIDTH+'px;dialogHeight:'+COLOR_DIALOG_HEIGHT+'px;status=off; scroll:off');
		if (resultColorInfo!=null){
			ModalColorInfo = resultColorInfo;
			OnColorModalDialogOK();
		}
	} else { //Firefox
		var left = (screen.width-COLOR_DIALOG_WIDTH)/2;
		var top  = (screen.height-COLOR_DIALOG_HEIGHT)/2;				
		ModalColorDialogWindow = window.open(dialogUrl, dialogName, 'left='+left+',top='+top+',width='+COLOR_DIALOG_WIDTH+',height='+(COLOR_DIALOG_HEIGHT-50)+', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes', ModalColorInfo);
		ModalColorDialogWindow.ParentWindow = self;								
		ModalColorDialogWindow.ModalColorInfo = ModalColorInfo;
	}			
} 
		
function OnColorModalDialogOK(){
	var controlId = ModalColorInfo.ControlId;
	ModalColorInfo.CombineColors();
	document.getElementById(controlId+"_ARGB").value = ModalColorInfo.ARGB;
	document.getElementById(controlId+"_Name").style.backgroundColor = ModalColorInfo.Name;
	if (ModalColorInfo.OnChangeJS && ModalColorInfo.OnChangeJS!=""){
		eval(ModalColorInfo.OnChangeJS);
	}
}
