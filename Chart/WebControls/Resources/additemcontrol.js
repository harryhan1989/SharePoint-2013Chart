//---------------------------------------
//Class JAddItemControl
//---------------------------------------

// Constructor
function JAddItemControl(frameID, buttonID, dropDownButtonID, buttonImageNormalUrl, buttonImageHighlightedUrl, buttonImagePressedUrl, dropDownButtonImageNormalUrl, dropDownButtonImageHighlightedUrl, dropDownButtonImagePressedUrl)
{
    this.FrameID = frameID;
    this.ButtonID = buttonID;
    this.DropDownButtonID = dropDownButtonID;
    
    this.ButtonImageNormalUrl = buttonImageNormalUrl;
    this.ButtonImageHighlightedUrl = buttonImageHighlightedUrl;
    this.ButtonImagePressedUrl = buttonImagePressedUrl;
    this.DropDownButtonImageNormalUrl = dropDownButtonImageNormalUrl;
    this.DropDownButtonImageHighlightedUrl = dropDownButtonImageHighlightedUrl;
    this.DropDownButtonImagePressedUrl = dropDownButtonImagePressedUrl;
}
// Event handlers
JAddItemControl.prototype.onButtonClicked = function()
{
    var frame = document.getElementById(this.FrameID);
    
    if (frame.style.display == 'none')
        frame.style.display = 'block';
    else
        frame.style.display = 'none';
}

JAddItemControl.prototype.SetImageUrl = function(imageId, imageUrl)
{
    var imageControl = document.getElementById(imageId);
    
    imageControl.src = imageUrl;
}

JAddItemControl.prototype.onButtonMouseEnter = function()
{
    this.SetImageUrl(this.ButtonID, this.ButtonImageHighlightedUrl);
}

JAddItemControl.prototype.onButtonMouseLeave = function()
{
    this.SetImageUrl(this.ButtonID, this.ButtonImageNormalUrl);
}

JAddItemControl.prototype.onButtonMouseDown = function()
{
    this.SetImageUrl(this.ButtonID, this.ButtonImagePressedUrl);
}

JAddItemControl.prototype.onDropDownButtonMouseEnter = function()
{
    this.SetImageUrl(this.DropDownButtonID, this.DropDownButtonImageHighlightedUrl);
}

JAddItemControl.prototype.onDropDownButtonMouseLeave = function()
{
    this.SetImageUrl(this.DropDownButtonID, this.DropDownButtonImageNormalUrl);
}

JAddItemControl.prototype.onDropDownButtonMouseDown = function()
{
    this.SetImageUrl(this.DropDownButtonID, this.DropDownButtonImagePressedUrl);
}