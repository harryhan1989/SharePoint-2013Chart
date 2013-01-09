//---------------------------------------
//Class JErrorSummary
//---------------------------------------

// Constructor
function JErrorSummary(frameID, openCloseButtonID, expandButtonUrl, collapseButtonUrl)
{
    this.FrameID = frameID;
    this.OpenCloseButtonID = openCloseButtonID;
    
    this.ExpandButtonUrl = expandButtonUrl;
    this.CollapseButtonUrl = collapseButtonUrl;
}

JErrorSummary.prototype.ToggleDetails = function(header)
{
    this.ToggleDisplay(header.nextSibling);
}

JErrorSummary.prototype.ToggleFrame = function()
{
    var frameControl = document.getElementById(this.FrameID);
    var buttonControl = document.getElementById(this.OpenCloseButtonID);
    
    buttonControl.src = 
        (this.ToggleDisplay(frameControl) == 'none') ? this.ExpandButtonUrl : this.CollapseButtonUrl;
}

JErrorSummary.prototype.ToggleDisplay = function(control)
{
    if (control.style.display != 'none')
        control.style.display = 'none';
    else
        control.style.display = '';
        
    return control.style.display;
}