function onButtonColorClick( imageID, divFrameID, iFrameColorID, editBoxColorID, hideFrameFlagID, resourcePath, onUpdateColorHandlerName, onUpdateColorHandlerParameter, styleSheet, cssClass, onColorDialogClosed)
{
    var divFrame  = document.getElementById(divFrameID);
    var iFrameColor  = document.getElementById(iFrameColorID);
    var editBoxColor = document.getElementById(editBoxColorID);
    var hideFrameFlag = document.getElementById(hideFrameFlagID);
    var image = document.getElementById(imageID);
    
    if( divFrame.style.display == "none"  )
    {    
        iFrameColor.style.backgroundColor = "white";
        iFrameColor.src = resourcePath+'/../ColorIFrame.aspx?DivFrameColor='+ divFrameID+'&editBoxColor=' + editBoxColorID +'&image=' + imageID+ '&color=' + editBoxColor.value + '&resourcePath=' + resourcePath + '&onUpdateColorHandlerName=' + onUpdateColorHandlerName + '&onUpdateColorHandlerParameter=' + onUpdateColorHandlerParameter + '&styleSheet=' + styleSheet + '&cssClass=' + cssClass + '&onColorDialogClosed=' + onColorDialogClosed;
        hideFrameFlag.value = "false";
        divFrame.style.display = "block";
        image.src = resourcePath+'/Images/Buttons/ColorPickerDownOver.gif';
        
    }
    else
    {
        hideFrameFlag.value = "true";
        divFrame.style.display = "none";
        image.src = resourcePath+'/Images/Buttons/ColorPickerButtonOver.gif';
    }
}


                                                 

function onButtonFontClick( textBoxID, fontSizeID, fontColorID,       
                            isBoldID, isItalicID, 
                            isUnderlineID, isStrikeoutID, 
                            divFrameID, frameID, imageID,
                            resourcePath, hideFrameFlagID,
                            styleSheet, inputCssClass, labelCssClass,
                            showColor,
                            applyID, 
                            orgFontNameID, orgFontSizeID, orgFontColorID,       
                            orgBoldID, orgItalicID, 
                            orgUnderlineID, orgStrikeoutID)
{      
    var divFrame  = document.getElementById(divFrameID);
    var iFrame  = document.getElementById(frameID);
    var editBox = document.getElementById(textBoxID);
    var hideFrameFlag = document.getElementById(hideFrameFlagID);
    var image = document.getElementById(imageID);
    
    if( divFrame.style.display == "none"  )
    {
        iFrame.style.backgroundColor = "white";
        iFrame.src = resourcePath+'/../FontIFrame.aspx?'+ConstructFontIFrameRequestParamList(textBoxID, fontSizeID, fontColorID, 
                                                                                         isBoldID, isItalicID,
                                                                                         isUnderlineID, isStrikeoutID,
                                                                                         frameID, imageID, resourcePath,
                                                                                         styleSheet, inputCssClass, labelCssClass, showColor, applyID);
                                                                                         
        
        hideFrameFlag.value = "false";
        divFrame.style.display = "block";
        image.src = resourcePath+'/Images/Buttons/FontPickerDownOver.gif';
    }
    else
    {
        hideFrameFlag.value = "true";
        divFrame.style.display = "none";
        image.src = resourcePath+'/Images/Buttons/FontPickerOver.gif';
        
        var apply = document.getElementById(applyID).value;
        
        // if apply was not set to true restore the original values
        if( apply == "false" )
        {
            editBox.value = document.getElementById(orgFontNameID).value;
            document.getElementById(fontSizeID).value = document.getElementById(orgFontSizeID).value;
            document.getElementById(fontColorID).value = document.getElementById(orgFontColorID).value;
            document.getElementById(isBoldID).value = document.getElementById(orgBoldID).value;
            document.getElementById(isItalicID).value = document.getElementById(orgItalicID).value;
            document.getElementById(isUnderlineID).value = document.getElementById(orgUnderlineID).value;
            document.getElementById(isStrikeoutID).value = document.getElementById(orgStrikeoutID).value;
        }
        else
        {
            // refresh the original values to the new ones for next round
            document.getElementById(orgFontNameID).value = editBox.value;
            document.getElementById(orgFontSizeID).value = document.getElementById(fontSizeID).value;
            document.getElementById(orgFontColorID).value = document.getElementById(fontColorID).value;
            document.getElementById(orgBoldID).value = document.getElementById(isBoldID).value;
            document.getElementById(orgItalicID).value = document.getElementById(isItalicID).value;
            document.getElementById(orgUnderlineID).value = document.getElementById(isUnderlineID).value;
            document.getElementById(orgStrikeoutID).value = document.getElementById(isStrikeoutID).value;

        }
        
    }
}

function ConstructFontIFrameRequestParamList(textBoxID, fontSizeID, fontColorID, 
                                             isBoldID, isItalicID,
                                             isUnderlineID, isStrikeoutID,
                                             frameID, imageID, resourcePath,
                                             styleSheet, inputCssClass, labelCssClass,
                                             showColor, apply)
{
        var parameters = "";
        
        var textBox = document.getElementById(textBoxID);
        var fontSize = document.getElementById(fontSizeID);
        
        var fontColor = document.getElementById(fontColorID);
        var isBold = document.getElementById(isBoldID);
        var isItalic = document.getElementById(isItalicID);
        var isUnderline = document.getElementById(isUnderlineID);
        var isStrikeout = document.getElementById(isStrikeoutID);
        
        parameters += "&fontName="+textBox.value;
        parameters += "&fontSize="+fontSize.value;
        parameters += "&fontColor="+fontColor.value;
        parameters += "&bold="+isBold.value;
        parameters += "&italic="+isItalic.value;
        parameters += "&underline="+isUnderline.value;
        parameters += "&strikeout="+isStrikeout.value;
  
        parameters += "&fontNameControl="+textBoxID;
        parameters += "&fontSizeControl="+fontSizeID;
        parameters += "&fontColorControl="+fontColorID;
        parameters += "&boldControl="+isBoldID;
        parameters += "&italicControl="+isItalicID;
        parameters += "&underlineControl="+isUnderlineID;
        parameters += "&strikeoutControl="+isStrikeoutID;
        parameters += "&iFrameFont="+frameID;
        parameters += "&imageID="+imageID;
        parameters += "&resourcePath="+resourcePath;
        
        parameters += "&styleSheet="+styleSheet;
        parameters += "&inputCssClass="+inputCssClass;
        parameters += "&labelCssClass="+labelCssClass;
        parameters += "&showColor="+showColor;
        parameters += "&apply="+ apply;
        
        return parameters;
}



function onIFrameColorBlur( imageID, iFrameColorID , hideFrameFlagID, mouseOnButtonID, resourcePath)
{
    var iFrameColor  = document.getElementById(iFrameColorID);
    var hideFrameFlag = document.getElementById(hideFrameFlagID);
    var mouseOnButton = document.getElementById(mouseOnButtonID);
    var button = document.getElementById(imageID);
    
    
    // when the page is loaded in the iframe it gets onblur event, this flag will prevent it from hiding
    // also dont hide it if the focus goes to the button
    if( hideFrameFlag.value == "true"  &&  mouseOnButton.value == "false" ) 
    {
        button.src = resourcePath+'/Images/Buttons/ColorPicker.gif';
        iFrameColor.style.display = "none";
        
    }
    else  
    {
        hideFrameFlag.value = "true";    
        
        //if( iFrameColor.style.display != "none"  )
        //    iFrameColor.focus();  
    }
}


function onButtonColorMouseEnter( imageID, iFrameColorID, mouseOnButtonID, resourcePath)
{
    var mouseOnButton = document.getElementById(mouseOnButtonID);
    var iFrameColor  = document.getElementById(iFrameColorID);
    var button = document.getElementById(imageID);
    
    mouseOnButton.value = "true";
    
    if( iFrameColor.style.display == "none" )
       button.src = resourcePath+'/Images/Buttons/ColorPickerOver.gif';
    else
       button.src = resourcePath+'/Images/Buttons/ColorPickerDownOver.gif';
}


function onButtonColorMouseLeave( imageID, iFrameColorID, mouseOnButtonID, resourcePath)
{
    var mouseOnButton = document.getElementById(mouseOnButtonID);
    var iFrameColor  = document.getElementById(iFrameColorID);
    var button = document.getElementById(imageID);
    
    mouseOnButton.value = "false";
    
    if( iFrameColor.style.display == "none" )
       button.src = resourcePath+'/Images/Buttons/ColorPicker.gif';
    else
       button.src = resourcePath+'/Images/Buttons/ColorPickerDown.gif';
}

function onIFrameFontBlur( imageID, iFrameID , hideFrameFlagID, mouseOnButtonID, resourcePath)
{
    var iFrame = document.getElementById(iFrameID);
    var hideFrameFlag = document.getElementById(hideFrameFlagID);
    var mouseOnButton = document.getElementById(mouseOnButtonID);
    var button = document.getElementById(imageID);
       
    // when the page is loaded in the iframe it gets onblur event, this flag will prevent it from hiding
    // also dont hide it if the focus goes to the button
    if( hideFrameFlag.value == "true"  &&  mouseOnButton.value == "false" ) 
    {
        button.src = resourcePath+'/Images/Buttons/FontPicker.gif';
        iFrame.style.display = "none";
        
    }
    else  
    {
        hideFrameFlag.value = "true";    
        
        //if( iFrame.style.display != "none"  )
        //    iFrame.focus();  
    }
}


function onButtonFontMouseEnter( imageID, iFrameID, mouseOnButtonID, resourcePath)
{
    var button = document.getElementById(imageID);
    var mouseOnButton = document.getElementById(mouseOnButtonID);
    var iFrame  = document.getElementById(iFrameID);
    
    mouseOnButton.value = "true";
    
    if( iFrame.style.display == "none" )
       button.src = resourcePath+'/Images/Buttons/FontPickerOver.gif';
    else
       button.src = resourcePath+'/Images/Buttons/FontPickerDownOver.gif';
}

function onButtonFontMouseLeave( imageID, iFrameID, mouseOnButtonID, resourcePath)
{
    var mouseOnButton = document.getElementById(mouseOnButtonID);
    var iFrame  = document.getElementById(iFrameID);
    var button = document.getElementById(imageID);
    
    mouseOnButton.value = "false";
    
    if( iFrame.style.display == "none" )
       button.src = resourcePath+'/Images/Buttons/FontPicker.gif';
    else
       button.src = resourcePath+'/Images/Buttons/FontPickerDown.gif';
}





function onChangeColorFromEditBox( editBoxID, sampleTextID, fontColorControlID )
{
        var sampleText = document.getElementById(sampleTextID);
           
        if( sampleText )
        {
            var editBox = document.getElementById(editBoxID);
            
            if( editBox )
                sampleText.style.color = getHTMLColor(editBox.value);
        }
        
        var fontColorControl = parent.document.getElementById(fontColorControlID);
    
        if( fontColorControl )
            fontColorControl.value = editBox.value;
      
    }

    function onChangeColorFromComboBox( color, sampleTextID, colorControlID )
    {
        var sampleText = parent.document.getElementById(sampleTextID);
           
        if( sampleText )
            sampleText.style.color = color;
        
        var colorControl = parent.parent.document.getElementById(colorControlID);
        
        if( colorControl )
            colorControl.value = color;
    }


    function getHTMLColor(color)
    {
       var split = color.split(",");

       if( split.length == 1 )
           return color;
       
       if( split.length == 3 )
           return "rgb(" + split[0] + "," + split[1] + "," + split[2] + ")";
       
       if( slpit.length == 4 )
           return "rgb(" + split[1] + "," + split[2] + "," + split[3] + ")";
       
       
       return "";
       
    }

 

    function paintRow( rowID, backColor, foreColor )
    {
      var row  = document.getElementById(rowID);
      row.style.background = backColor;
      row.style.color = foreColor;
    }

	function updateColor(editBoxColorID, divFrameColorID, color, imageID, resourcePath)
    {
          var editBoxColor  = parent.document.getElementById(editBoxColorID);
	      var divFrameColor = parent.document.getElementById(divFrameColorID);
	      var image = parent.document.getElementById(imageID);
    	
	      if (editBoxColor && divFrameColor)
	      {
	          editBoxColor.value = color;
	          editBoxColor.onblur();
	          image.src = resourcePath+'/Images/Buttons/ColorPicker.gif';
	          divFrameColor.style.display = "none";
          }
    }
    
    

    function paintRow( rowID, backColor, foreColor )
    {
      var row  = document.getElementById(rowID);
      row.style.background = backColor;
      row.style.color = foreColor;
    }
    
    
    
    function SetFontPicker(textBoxID, fontSizeID, 
                           isBoldID, isItalicID, 
                           isUnderlineID, isStrikeoutID, fontString)
    {
      var textBox = document.getElementById(textBoxID);
      var fontSize = document.getElementById(fontSizeID);
        
      var isBold = document.getElementById(isBoldID);
      var isItalic = document.getElementById(isItalicID);
      var isUnderline = document.getElementById(isUnderlineID);
      var isStrikeout = document.getElementById(isStrikeoutID);


      var parameters = fontString.split(",");
      
      textBox.value = parameters[0];
      if(parameters[1].indexOf('pt'))
        fontSize.value = parameters[1].substring(0, parameters[1].length - 2);
        
      isBold.value = false;
      isItalic.value = false;
      isUnderline.value = false;
      isStrikeout.value = false;
      
      var stylePrefix = 'style=';
      var index = fontString.indexOf(stylePrefix);
      
      if (index > -1)
      {
        var styleParams = fontString.substring(index + stylePrefix.length - 1);
        
        if (styleParams.indexOf('Bold') != -1)
          isBold.value = true;
          
        if (styleParams.indexOf('Italic') != -1)
          isItalic.value = true;
          
        if (styleParams.indexOf('Underline') != -1)
          isUnderline.value = true;
          
        if (styleParams.indexOf('Strikeout') != -1)
          isStrikeout.value = true;
      }
    }
    
    
    function GetFontString(textBoxID, fontSizeID, 
                           isBoldID, isItalicID,
                           isUnderlineID, isStrikeoutID)
    {
        var textBox = document.getElementById(textBoxID);
        var fontSize = document.getElementById(fontSizeID);
        
        var isBold = document.getElementById(isBoldID);
        var isItalic = document.getElementById(isItalicID);
        var isUnderline = document.getElementById(isUnderlineID);
        var isStrikeout = document.getElementById(isStrikeoutID);
        
        var fontString = textBox.value;
        fontString += ", " + fontSize.value + "pt";
        
        if (isBold.value == 'true' || isItalic.value == 'true' || isUnderline.value == 'true' || isStrikeout.value == 'true')
        {
          fontString += ", style=";
          
          if (isBold.value == 'true')
            fontString += "Bold, ";
          
          if (isItalic.value == 'true')
            fontString += "Italic, ";
            
          if (isUnderline.value == 'true')
            fontString += "Underline, ";
          
          if (isStrikeout.value == 'true')
            fontString += "Strikeout, ";
            
          return fontString.substring(0, fontString.length - 2);
        }
        
        return fontString;
    }