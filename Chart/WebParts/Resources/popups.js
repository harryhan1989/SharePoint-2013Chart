
/********************************************************************
	Contains javascript functions for
	 - Simple DHTML dropdown menu, for a top bar menu
		functions: ShowDropMenu, HideDropMenu, ProcessMouseOver
	 - Simple Delayed popup
		functions: ShowPopup, ShowDynPopup, ShowDynPopupNow, ResetPopup, HidePopup, ProcessMouseOver
	 - Commonly used routines for element positioning
		functions: GetClientWidth, GetClientHeight, GetElementXPos, GetElementYPos, GetElementWidth, 
			GetElementHeight, GetScrollYOffset, GetScrollXOffset
	 - Commonly used dynamic content loading functions
		functions: WriteSyncDynamicData, WriteDynamicData
	
	Last Modified - January 2006
*************************************************************************/
	
	//global variables for tracking the menu and popups
	var dropMenuParent = null;
	var currentDropMenu = null;
	var popupTimerID = -1;
	var popupTimerTimeout = 700;
	var popupLeftPos = null;
	
	function ShowDynDropMenu(url,elementID, parentObj)
	{
		WriteSyncDynamicDataOnce(url, elementID);
		ShowDropMenu(elementID, parentObj);
	}
	
	//called to show a dropdown menu for a horizontal parent menu
	function ShowDropMenu(elementID, parentObj)
	{
		HideDropMenu();
		currentDropMenu = document.getElementById(elementID);
		dropMenuParent = parentObj;
		
		currentDropMenu.style.top = GetElementYPos(parentObj) + 23;
		currentDropMenu.style.left = GetElementXPos(parentObj);
		
		//move the menu if required
		var rEdge = -1;
		while(rEdge < 0)
		{
			if(GetElementXPos(currentDropMenu) < 10)
				break;

			rEdge = ( GetClientWidth()+ GetScrollXOffset() - 20 ) - 
					( GetElementXPos(currentDropMenu) + GetElementWidth(currentDropMenu) );		
			if(rEdge < 0)
				currentDropMenu.style.left = GetElementXPos(currentDropMenu) + rEdge;				
		}	
		
		//show the menu
		if(document.getElementById(elementID).style.visibility != 'visible')
			document.getElementById(elementID).style.visibility = 'visible';				
	}
	
	//called to show a dropdown menu for a vertical parent menu
	function ShowDropMenu2(elementID, parentObj)
	{
		HideDropMenu();
		currentDropMenu = document.getElementById(elementID);
		dropMenuParent = parentObj;
	
		currentDropMenu.style.left = GetElementXPos(parentObj) + GetElementWidth(parentObj) + 1;
		currentDropMenu.style.top = GetElementYPos(parentObj);
		
		//move the menu if required
		var bEdge = -1;
		while(bEdge < 0)
		{
			if(GetElementYPos(currentDropMenu) < 10)
				break;

			bEdge = ( GetClientHeight()+ GetScrollYOffset() - 20 ) - 
					( GetElementYPos(currentDropMenu) + GetElementHeight(currentDropMenu) );		
			if(bEdge < 0)
				currentDropMenu.style.top = GetElementYPos(currentDropMenu) + bEdge;				
		}	
		
		//show the menu
		if(document.getElementById(elementID).style.visibility != 'visible')
			document.getElementById(elementID).style.visibility = 'visible';				
	}

	//called to show a dynamicallly loaded popup, generally called on onmouseover
	function ShowDynPopupNow(url,elementID, parentObj)
	{
		WriteSyncDynamicData(url, elementID);
		ShowPopupIntern(elementID, parentObj,1);
	}
	function ShowDynPopup(url,elementID, parentObj)
	{
		WriteSyncDynamicData(url, elementID);
		ShowPopupIntern(elementID, parentObj,500);
	}

	//called to show a popup, generally called on onmouseover
	function ShowPopup(elementID, parentObj)
	{
		ShowPopupIntern(elementID, parentObj,600);
	}

	function ShowPopupIntern(elementID, parentObj, timeDelay)
	{
		HideDropMenu();
		currentDropMenu = document.getElementById(elementID);
		dropMenuParent = parentObj;
		popupTimerTimeout = timeDelay;

		//move the popup if required
		var rSpace = ( GetClientWidth() + GetScrollXOffset() ) - 
					( GetElementXPos(parentObj) + GetElementWidth(parentObj) );

		if(rSpace <= GetElementWidth(currentDropMenu))
		{
			currentDropMenu.style.left = GetElementXPos(parentObj) - GetElementWidth(currentDropMenu);
		}
		else
		{
			currentDropMenu.style.left = GetMouseX(parentObj) + 10 + "px";
		}

		if(GetElementXPos(currentDropMenu) < 0)
			currentDropMenu.style.left = 0;

		//store the left position for when the popup actually appears
		//then make sure that the popup is positioned off screen
		//so that parts of it will not appear until it is actually visible
		//this is for working around an IE bug
		popupLeftPos = currentDropMenu.style.left;
		currentDropMenu.style.left = -1000;
		
		var bSpace = ( GetClientHeight() + GetScrollYOffset() ) -
					( GetElementYPos(parentObj) + GetElementHeight(parentObj) );
		
		if(bSpace <= GetElementHeight(currentDropMenu))
		{
			currentDropMenu.style.top = GetElementYPos(parentObj) - GetElementHeight(parentObj) - GetElementHeight(currentDropMenu) + "px";
		}
		else
		{
			currentDropMenu.style.top = GetElementYPos(parentObj) + GetElementHeight(parentObj) + "px";
		}

		if(GetElementYPos(currentDropMenu) < 0)
			currentDropMenu.style.top = 0;
			
		//show the menu, use a timer to indirectly call it so Firefox does not flash
		popupTimerID = window.setTimeout("DelayedShowPopup()",popupTimerTimeout);
	}
	
	//resets the popup, generally called on onmousemove
	function ResetPopup()
	{
		if(currentDropMenu != null)
		{
			if(currentDropMenu.style.visibility == 'hidden')
			{
				window.clearTimeout(popupTimerID);
				popupTimerID = window.setTimeout("DelayedShowPopup()",popupTimerTimeout);
			}
		}
	}
	
	//called by the other popup functions
	function DelayedShowPopup()
	{
		if(currentDropMenu != null)
		{
			currentDropMenu.style.left = popupLeftPos;
			currentDropMenu.style.visibility = 'visible';
		}
	}
	
	//hides a drop menu or popup
	function HidePopup()
	{
		if(currentDropMenu == null)
			return;
			
		if(event != null)
		{
    		var targetElement = null;
	    	if(event.srcElement)
		    	targetElement = event.srcElement;
		    else if(event.target)
			    targetElement = event.target;	
			if(targetElement != null)
			{
			    var hideMenu = true;
		        var par = targetElement;
		        while(par != null){
    								
			        if(par == dropMenuParent || par == currentDropMenu)
			        {
				        hideMenu = false;
				        break;
			        }
			        if(par.parentNode != null)
				        par = par.parentNode;
			        else
				        par = par.parentObjment;
		        }
		        if(hideMenu)
		        {
			        HideDropMenu();
		        }
			}
		}
			
		//HideDropMenu();
	}
	function HideDropMenu()
	{	
	    //return; //test
	    
		if(currentDropMenu == null)
			return;
		
		window.clearTimeout(popupTimerID);
			
		if(currentDropMenu.style.visibility != 'hidden')
		{
			currentDropMenu.style.visibility = 'hidden';
			currentDropMenu.style.left = -1000;
		}
					
		currentDropMenu = null;
		dropMenuParent = null;

	}

	//should be called in the Body tag using onmousemove, this function tracks the state of the menu
	//and automatically hides the menu when appropriate
	function ProcessMouseOver(event)
	{
		//get the source element that initiall fired the event, useful for bubbled events
		var targetElement = null;
		if(event.srcElement)
			targetElement = event.srcElement;
		else if(event.target)
			targetElement = event.target;		

		if(currentDropMenu != null)
		{		
		
		    var hideMenu = true;
		    var par = targetElement;
		    while(par != null){
								
			    if(par == dropMenuParent  || par == currentDropMenu)
			    {
				    hideMenu = false;
				    break;
			    }
			    if(par.parentNode != null)
				    par = par.parentNode;
			    else
				    par = par.parentObjment;
		    }
		    if(hideMenu)
		    {
			    HideDropMenu();
		    }
		}
	}

	//retrieves the client width of the browser, works with IE5+, NS6+ and Firefox1+
	function GetClientWidth()
	{
	    if (window.innerWidth!=window.undefined) return window.innerWidth; 
	    if (document.compatMode=='CSS1Compat') return document.documentElement.clientWidth; 
	    if (document.body) return document.body.clientWidth; 
	    
		return screen.x;
	}		
	
	//retrieves the client height of the browser, works with IE5+, NS6+ and Firefox1+
	function GetClientHeight()
	{
	    if (window.innerHeight!=window.undefined) return window.innerHeight;
	    if (document.compatMode=='CSS1Compat') return document.documentElement.clientHeight;
	    if (document.body) return document.body.clientHeight; 
	    
		return screen.y;
	}	
	
	function GetMouseX(parentObj)
	{
	    // Detect if the browser is IE or not.
        // If it is not IE, we assume that the browser is NS.
        var IE = document.all?true:false
        // Temporary variable to hold mouse x pos.
        var tempX = 0

        if (IE)
        {   // grab the x pos if browser is IE
            tempX = event.clientX + document.body.scrollLeft;
        }
        else
        {   // grab the x pos.s if browser is NS
            tempX = GetElementXPos(parentObj) + 20;
        } 
        // catch possible negative values in NS4
        if (tempX < 0) tempX = 0
        
        return tempX
	}
	
	function GetMouseY(parentObj)
	{
		// Detect if the browser is IE or not.
        // If it is not IE, we assume that the browser is NS.
        var IE = document.all?true:false
        // Temporary variable to hold mouse y pos.
        var tempY = 0

        if (IE)
        {   // grab the y pos if browser is IE
            tempY = event.clientY + document.body.scrollTop;
        }
        else
        {   // grab the y pos.s if browser is NS
            tempY = GetElementYPos(parentObj);
        }  
        // catch possible negative values in NS4
        if (tempY < 0) tempY = 0
        
        return tempY
	}
	
	//retrieves the left position of the given element, works with IE5+, NS6+ and Firefox1+
	function GetElementXPos(obj)
	{
		var xPos = 0;
		if (obj.offsetParent)
		{
			while (obj.offsetParent)
			{
				xPos += obj.offsetLeft;
				obj = obj.offsetParent;
			}
		}
		else if (obj.x)
			xPos += obj.x;
		return xPos;
	}

	//retrieves the top position of the given element, works with IE5+, NS6+ and Firefox1+
	function GetElementYPos(obj)
	{
		var yPos = 0;
		if (obj.offsetParent)
		{
			while (obj.offsetParent)
			{
				yPos += obj.offsetTop;
				obj = obj.offsetParent;
			}
		}
		else if (obj.y)
			yPos += obj.y;
		return yPos;
	}
	
	//retrieves the width of the given element, works with IE5+, NS6+ and Firefox1+
	//in NS and firefox, it may only return the visible width of the element
	function GetElementWidth(obj)
	{
	    var width = 0;

        if(obj.scrollWidth)
		    width =  obj.scrollWidth;
	    else if(obj.scrollOffsetWidth)
		    width =  obj.scrollOffsetWidth;
	    else if(obj.offsetWidth)
		    width =  obj.offsetWidth;
	    else if(obj.width)
		    width =  obj.width;

		return width;
	}
	
	//retrieves the height of the given element, works with IE5+, NS6+ and Firefox1+
	//in NS and firefox, it may only return the visible height of the element
	function GetElementHeight(obj)
	{
	    var height = 0;

	    if(obj.scrollHeight)
		    height = obj.scrollHeight;
	    else if(obj.scrollOffsetHeight)
		    height = obj.scrollOffsetHeight;
	    else if(obj.offsetHeight)
		    height = obj.offsetHeight;
	    else if(obj.height)
		    height = obj.height;

		return height;
	}
	
	//retrieves the verticle scrolling position, from the top of the document, works with IE5+, NS6+ and Firefox1+
	function GetScrollYOffset()
	{
	    if (document.compatMode=='CSS1Compat') return document.documentElement.scrollTop; 
		if(document.body.scrollTop) return document.body.scrollTop;
		if(window.pageYOffset) return window.pageYOffset;
		
		return 0;
	}
	
	//retrieves the horizontal scrolling position, from the left side of the document, works with IE5+, NS6+ and Firefox1+
	function GetScrollXOffset()
	{
	    if (document.compatMode=='CSS1Compat') return document.documentElement.scrollLeft; 
		if(document.body.scrollLeft) return document.body.scrollLeft;
		if(window.pageXOffset) return window.pageXOffset;
		
		return 0;
	}


	//sync dynamic loading function
	//*******************************************
	function WriteSyncDynamicDataOnce(url, elementID)
	{
		element = document.getElementById(elementID);
		if(element.innerHTML == null || element.innerHTML =="")
			WriteSyncDynamicData(url, elementID)
	}
	function WriteSyncDynamicData(url, elementID)
	{
		DynamicDataElement = document.getElementById(elementID);
		
		if (window.ActiveXObject)
		{
			DynamicDataRequest = new ActiveXObject("Microsoft.XMLHTTP");
			DynamicDataRequest.open("GET", url, false);
			DynamicDataRequest.send();
			if (DynamicDataRequest.status == 200)
				DynamicDataElement.innerHTML = DynamicDataRequest.responseText;
		}
		else if (window.XMLHttpRequest)
		{
			DynamicDataRequest = new XMLHttpRequest();
			DynamicDataRequest.open("GET", url, false);
			DynamicDataRequest.send(null);
			if (DynamicDataRequest.status == 200)
				DynamicDataElement.innerHTML = DynamicDataRequest.responseText;
		}
	}
		
	
	//AJAX async loading functions
	//**********************************************
	var DynamicDataElement = null;
	var DynamicDataRequest;

	function WriteDynamicData(url, elementID)
	{
		DynamicDataElement = document.getElementById(elementID);
		
		if (window.ActiveXObject)
		{
			DynamicDataRequest = new ActiveXObject("Microsoft.XMLHTTP");
			if (DynamicDataRequest)
			{
				DynamicDataRequest.onreadystatechange = dynamicDataReceived;
				DynamicDataRequest.open("GET", url, true);
				DynamicDataRequest.send();
			}
		}
		else if (window.XMLHttpRequest)
		{
			DynamicDataRequest = new XMLHttpRequest();
			DynamicDataRequest.onreadystatechange = dynamicDataReceived;
			DynamicDataRequest.open("GET", url, true);
			DynamicDataRequest.send(null);
		}	
	}
	//AJAX callback for async loading
	function dynamicDataReceived() 
	{
		// only if req shows "complete"
		if (DynamicDataRequest.readyState == 4)
		{
			if (DynamicDataRequest.status == 200)
			{
				DynamicDataElement.innerHTML = DynamicDataRequest.responseText;
	        }
	        else
	        {
				//error reading data
			}
		}
	}


/******************************************************************

                   	open popup in new window

******************************************************************/

function MM_openBrWindow(theURL,winName,features) { //v2.0

  window.open(theURL,winName,features);
	
}






 

/********************************************************************

                            leftNav

*********************************************************************/
function expandLeftMenuItem(parentEle)
{
    if ( parentEle == null )
        return;

	//find the first child IMG element
	SwapImage(parentEle,"/Common/Menu/expand.png","/Common/Menu/collapse.png");

    var nextTR = getNextSibling( parentEle.parentNode.parentNode, "tr" );
    
    if ( nextTR != null )
    {
	    nextTR.style.display = (nextTR.style.display == "none" ) ? "" : "none";
	}
}

/********************************************************************
Returns the specified child element, or null if not found
Params:
  parentEle - the parent element to start searching from
  tagName - the tag name of the child element to retrieve (ie. A, P, IMG, etc)
*********************************************************************/
function getChildElement(parentEle, tagName)
{
    if ( parentEle == null )
        return null;
        
	var tag = new String();
	var childEle = parentEle.firstChild;
	while(childEle != null)
	{
		if(childEle.tagName != null)
		{
			tag = childEle.tagName.toLowerCase();
			tag = tag.toLowerCase();
			if(tag == tagName.toLowerCase())
			{
				break;
			}
		}
		childEle = childEle.nextSibling;
	}
	return childEle;
}
/********************************************************************
Returns the specified child element, or null if not found
Params:
  parentEle - the parent element to start searching from
  tagName - the tag name of the child element to retrieve (ie. A, P, IMG, etc)
*********************************************************************/
function getNextElement(currentEle, tagName)
{
    if ( currentEle == null )
        return null;

	var tag = new String();
	var foundEle = null;

	var childEle = currentEle.firstChild;

	do{
		while(childEle != null)
		{
			if(childEle.tagName != null)
			{
				tag = childEle.tagName.toLowerCase();
				tag = tag.toLowerCase();
				if(tag == tagName.toLowerCase()){
					foundEle = childEle;
					break;
				}
			}
			childEle = childEle.nextSibling;
		}
		if(foundEle != null)
			break;
	
	    if ( childEle.parentNode == null )
	        return null;
	        
		childEle = childEle.parentNode.nextSibling;	
	}while(childEle != null);

	return foundEle;
}

/********************************************************************
The getNextSibling method will enumerate through all sibling objects
starting at the current element untill it finds element with specified
tag name.
*********************************************************************/
function getNextSibling(currentEle, tagName)
{
    if ( currentEle == null )
        return null;
        
	var tag = new String();
	var foundEle = null;
	var tempEle = currentEle.nextSibling;

	do
	{
		if(tempEle != null)
		{
			if(tempEle.tagName != null)
			{
				tag = tempEle.tagName.toLowerCase();

				if(tag == tagName.toLowerCase())
				{
					foundEle = tempEle;
					break;
				}
			}
			
		}
		if( foundEle != null )
			break;
	
	    if( tempEle == null )
	        return null;
	
		tempEle = tempEle.nextSibling;
	}while(tempEle != null);

	return foundEle;
}

/********************************************************************
The getNextSibling method will enumerate through all sibling objects
starting at the current element untill it finds element with specified
tag name.
*********************************************************************/
function getPrevSibling(currentEle, tagName)
{
    if ( currentEle == null )
        return null;
        
	var tag = new String();
	var foundEle = null;
	var tempEle = currentEle.previousSibling;

	do
	{
		if(tempEle != null)
		{
			if(tempEle.tagName != null)
			{
				tag = tempEle.tagName.toLowerCase();

				if(tag == tagName.toLowerCase())
				{
					foundEle = tempEle;
					break;
				}
			}
			
		}
		if(foundEle != null)
			break;
	
	    if( tempEle == null )
	        return null;
	
		tempEle = tempEle.previousSibling;
	}while(tempEle != null);

	return foundEle;
}

/********************************************************************
*********************************************************************/
function SwapClass(ele, class1, class2)
{
    if ( ele == null )
        return;
        
	if(ele.className == class1)
		ele.className = class2;
	else
		ele.className = class1;
}

/********************************************************************
*********************************************************************/
function SwapImage(ele, image1Src, image2Src)
{
    if ( ele == null )
        return;
        
	image1Src = image1Src.toLowerCase();
	image2Src = image2Src.toLowerCase();
	imgSrc = ele.src.toLowerCase();

	if(imgSrc.indexOf(image1Src,0) >0)
		ele.src = image2Src;
	else
		ele.src = image1Src;
}

/********************************************************************
 SelectLeftMenuItem("menuID");
*********************************************************************/
function SelectLeftMenuItem(eleId)
{
    if ( eleId != null && eleId != "{{PageID}}" )
    {
	    //find the menu to open
	    var ele = document.getElementById(eleId);
    	
	    if ( ele != null )
	    {
	        ele.className = "Selected";
	        
	        // loop through all parent elements and change the display style
	        // for all TR tags that are not visible
	        parentEle = ele;
	        
	        // make sure that all parent nodes are expanded to show this item
	        while( parentEle != null )
	        {
	            if ( parentEle.tagName != null )
	            {
	                if ( parentEle.tagName.toLowerCase() == "tr" && parentEle.style.display == "none" )
	                {
                        var expTR = getPrevSibling( parentEle, "tr" );
                        var expTD = getChildElement( expTR, "td" );
                        var expImg = getChildElement( expTD, "img" );
                        expandLeftMenuItem( expImg );
	                }
	            }
	        
	            parentEle = parentEle.parentNode;
	        }
	        
	        // if this menu item is expandable, show its child items
            var nextTR = getNextSibling( ele, "tr" );
            
            if ( nextTR != null )
            {
                if ( nextTR.style.display == "none" )
	            {
                    var expTD = getChildElement( ele, "td" );
                    var expImg = getChildElement( expTD, "img" );
                    expandLeftMenuItem( expImg );
	            }
	        }	        
	    }
	}
}

var menuClass = "Normal";
/********************************************************************
*********************************************************************/
function menuHover(ele)
{
    if ( ele == null )
        return;
        
	menuClass = ele.className;
	ele.className = "Hover";
}
/********************************************************************
*********************************************************************/
function menuOut(ele)
{
    if ( ele == null )
        return;
        
	ele.className = menuClass;
	menuClass = "Normal";
}
/********************************************************************
*********************************************************************/
function gotoPage(url)
{
    if ( url != null && url != "" )
    {
	    document.location.href = url;
	}
}