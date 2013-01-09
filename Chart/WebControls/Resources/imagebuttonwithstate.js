//---------------------------------------
//Class JImageButton
//---------------------------------------
//Constructor
function JImageButtonWithState(imgButtonId, hidStateId, imageOff, imageOn, imageOffOver, imageOnOver, imageDisabled, divId, onStateChangeJS, autoPostBackJS, enabled){
	this.imgButton = document.getElementById(imgButtonId);
	this.hidState = document.getElementById(hidStateId);
	this.imageOff = imageOff;
	this.imageOn = imageOn;
	this.imageOffOver = imageOffOver;
	this.imageOnOver = imageOnOver;
	this.imageDisabled = imageDisabled;
	this.divId = divId;
	this.div = null;
	this.onStateChangeJS = onStateChangeJS;
	this.autoPostBackJS = autoPostBackJS;
	this.enabled = enabled;	
}

//Routines
JImageButtonWithState.prototype.IsOn = function(){
	return this.hidState.value=="On";
}
JImageButtonWithState.prototype.GetDiv = function(){
	if (this.divId!=null && this.divId!="" && this.div==null){
		this.div = document.getElementById(this.divId);
	}
	return this.div;
}
JImageButtonWithState.prototype.ChangeState = function(newState){
	if (this.enabled && newState!=this.hidState.value){
		//Switch into new state
		this.hidState.value = newState;
		this.imgButton.src = this.IsOn() ? this.imageOn : this.imageOff;
		var div = this.GetDiv();
		if (div!=null){
			div.style.display = this.IsOn() ? "block" : "none";
		}
		//Execute onStateChange JavaScript
		if (this.onStateChangeJS && this.onStateChangeJS!=""){
			eval(this.onStateChangeJS);
		}
		//Execute 
		if (this.autoPostBackJS && this.autoPostBackJS!=""){
			eval(this.autoPostBackJS);
		}
	}	
}
//Event handlers
JImageButtonWithState.prototype.Click = function () {
	this.ChangeState(this.IsOn() ? "Off" : "On");
}
JImageButtonWithState.prototype.MouseOver = function () {
	if (this.enabled){
		this.imgButton.src = this.IsOn() ? this.imageOnOver : this.imageOffOver;
	}
}
JImageButtonWithState.prototype.MouseOut = function () {
	if (this.enabled){
		this.imgButton.src = this.IsOn() ? this.imageOn : this.imageOff;
	}
}
JImageButtonWithState.prototype.TurnOn = function () {
	this.ChangeState("On");
}
JImageButtonWithState.prototype.TurnOff = function () {
	this.ChangeState("Off");
}
JImageButtonWithState.prototype.Initialize = function () {
	var div = this.GetDiv();
	if (div!=null){
		div.style.display = this.IsOn() ? "block" : "none";
	}
}


