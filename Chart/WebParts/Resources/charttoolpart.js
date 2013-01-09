function OnTitleTextChanged( titleTextControlID, fontNameControlID, buttonFontControlID, iFrameControlID, resourcePath)
{
    var titleTextControl = document.getElementById(titleTextControlID);
    
    if( titleTextControl != null )
    {    
        var enabled;
        if( titleTextControl.value == "" )
            disabled = true;
        else
            disabled = false;
        
        if( disabled == true )
        {
            
            var iFrameControl = document.getElementById(iFrameControlID);
            
            if( iFrameControl != null )
               iFrameControl.style.display = "none";
        }   
        var fontNameControl = document.getElementById(fontNameControlID);
        
        if( fontNameControl != null )
            fontNameControl.disabled = disabled;
            
        
        
        var buttonFontControl = document.getElementById(buttonFontControlID);
        
        if( buttonFontControl != null )
        {
            buttonFontControl.disabled = disabled;      
            if( disabled == true )
               buttonFontControl.src = resourcePath+'/Images/Buttons/FontPickerButton_Disabled.png';
            else
               buttonFontControl.src = resourcePath+'/Images/Buttons/FontPickerButton_Unpressed.png';
        }
    
        
        
    
    }
    
}


function OnThemeChange(themeFlagID)
{
    var themeFlag = document.getElementById(themeFlagID);
    
    if( themeFlag != null )
        themeFlag.value = "true";
}        

function OnChartTypeChange(chartTypeFlagID)
{
    var chartTypeFlag = document.getElementById(chartTypeFlagID);
    
    if( chartTypeFlag != null )
        chartTypeFlag.value = "true";
}


function OnLegendEnableChanged(checkedBoxEnabledID, legendStyleControlID, titleTextControlID, titleFontTextBoxControlID, titleFontButtonControlID, divLegendSettingsID)
{
    var disabled;
    
    var checkedBoxEnabled = document.getElementById(checkedBoxEnabledID);     
    
    disabled = ! checkedBoxEnabled.checked;
    
   var legendStyleControl = document.getElementById(legendStyleControlID);
   var titleTextControl = document.getElementById(titleTextControlID);
   var titleFontTextBoxControl = document.getElementById(titleFontTextBoxControlID);
   var titleFontButtonControl = document.getElementById(titleFontButtonControlID);
   var divLegendSettings = document.getElementById(divLegendSettingsID);     

   legendStyleControl.disabled = 
   titleTextControl.disabled = 
   titleFontTextBoxControl.disabled = 
   titleFontButtonControl.disabled = 
   divLegendSettings.disabled = disabled;
}    

function On3DEnableChanged(checkBoxEnabledID, textBoxRotationHorizontalID,
                           textBoxRotationVerticalID, textBoxPerspectiveID,
                           textBoxWallThicknessID, div3DSettingsID)
{
    var disabled;
    
    var checkedBoxEnabled = document.getElementById(checkBoxEnabledID);     
    
    disabled = ! checkedBoxEnabled.checked;
    
   var textBoxRotationHorizontal = document.getElementById(textBoxRotationHorizontalID);
   var textBoxRotationVertical = document.getElementById(textBoxRotationVerticalID);
   var textBoxPerspective = document.getElementById(textBoxPerspectiveID);
   var textBoxWallThickness = document.getElementById(textBoxWallThicknessID);
   var div3DSettings = document.getElementById(div3DSettingsID);     

   textBoxRotationHorizontal.disabled = 
   textBoxRotationVertical.disabled = 
   textBoxPerspective.disabled = 
   textBoxWallThickness.disabled = 
   div3DSettings.disabled = disabled;

}


function ToggleAxesControlsVisibility(control1ID, 
                                      control2ID, axisNameControlID, axisNameX, axisNameY)
{   
    var axisNameControl = document.getElementById(axisNameControlID);
    
    var xVisible;
    var yVisible;
    
    if( axisNameControl.value == axisNameX )
    {
       xVisible = "block";
       yVisible = "none";
    }
    else
    {
       xVisible = "none";
       yVisible = "block";
    }
    
    document.getElementById(control1ID).style.display = xVisible;   
    document.getElementById(control2ID).style.display = yVisible;   
}

function OnAxisEnableChanged(dropDownListID, divID, dropDownListTickMarkID, textBoxTitleID, textBoxFontTitleID, buttonFontTitleID)
{
    document.getElementById(divID).disabled = 
    document.getElementById(dropDownListTickMarkID).disabled = 
    document.getElementById(textBoxTitleID).disabled = 
    document.getElementById(textBoxFontTitleID).disabled = 
    document.getElementById(buttonFontTitleID).disabled = 
    document.getElementById(dropDownListID).value == 'False';
}