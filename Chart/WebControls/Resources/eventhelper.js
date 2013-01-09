//---------------------------------------
//Array JEventHelper
//---------------------------------------
var JEventHelper = {
	//Event related routines
	AttachEvent : function(ctl, evnt, handler){
		if (document.addEventListener)
			//Firefox
			ctl.addEventListener(evnt, handler, false);
		else
			//IE
			ctl.attachEvent("on"+evnt, handler);
	},
	DetachEvent : function(ctl, evnt, handler){
		if (document.removeEventListener)
			//Firefox
			ctl.addEventListener(evnt, handler, false);
		else
			//IE
			ctl.detachEvent("on"+evnt, handler);
	},
	CancelEvent : function(e){
		if (!e) 
			e = window.event;
		if ( e )
		{
			e.cancelBubble = true;
			if (e.stopPropagation) e.stopPropagation();    
			e.returnValue = false;
			e.donotClick  = true;
			if (e.cancelable && e.preventDefault)
			{
				e.preventDefault();
			}
		}
		return false;
	}
}	

//---------------------------------------
//Array JKeyCodes
//---------------------------------------
var JKeyCodes = {
	Backspace	:8, 
	Tab			:9, 
	Enter		:13, 
	Shift		:16,
	Ctrl		:17, 
	CapsLock	:20, 
	Esc			:27, 
	Space		:32, 
	PgUp		:33, 
	PgDown		:34, 
	End			:35, 
	Home		:36, 
	Left		:37, 
	Right		:39, 
	Up			:38, 
	Down		:40, 
	Ins			:45, 
	Delete		:46
}

