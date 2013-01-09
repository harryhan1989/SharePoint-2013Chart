<%@ Page language="C#"  EnableSessionState="False" EnableEventValidation="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.FontPickerIFrame,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="FontList.ascx" TagName="FontList" TagPrefix="FL" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:mosschart,FontIFrame_aspx_Title_Text%>" /></title>
</head>
<body style="margin: 0px; font-size: 12px; font-family: Arial;" >
	<script type="text/javascript">
function ULSxd0(){var o=new Object;o.ULSTeamName="Windows SharePoint Services 4";o.ULSFileName="FontIFrame.aspx";return o;}

  	function setFontSize(controlID, size, sizeTextBoxID, sampleTextID, tableSizeID, backColor, foreColor, selectedBackColor, selectedForeColor)
    {ULSxd0:;

      var control  = parent.document.getElementById(controlID);
      var sizeTextBox = document.getElementById(sizeTextBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = size;

      if( sizeTextBox )
          sizeTextBox.value = size;

      if( sampleText )
	      sampleText.style.fontSize = size + "pt"; 

	  changeSizeSelection(tableSizeID, backColor, foreColor, selectedBackColor, selectedForeColor, size);
	}

    function setFontSizeFromEditBox(controlID, sizeTextBoxID, sampleTextID, tableSizeID, backColor, foreColor, selectedBackColor, selectedForeColor)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
      var sizeTextBox = document.getElementById(sizeTextBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = sizeTextBox.value;

      if( sampleText )
	      sampleText.style.fontSize = sizeTextBox.value + "pt"; 

	  changeSizeSelection(tableSizeID, backColor, foreColor, selectedBackColor, selectedForeColor, sizeTextBox.value);
	}

    function changeSizeSelection(tableSizeID, backColor, foreColor, selectedBackColor, selectedForeColor, size)
    {ULSxd0:;

        var tableSize = document.getElementById(tableSizeID);

        if( tableSize )
        {

          for(i = 0; i < tableSize.rows.length; i++)
          {
            var row = tableSize.rows[i];

            if( row.cells[0].firstChild.nodeValue  == size + 'pt' )
            {
                row.style.background = selectedBackColor;
                row.style.color = selectedForeColor;
            }
            else
            {
                row.style.background = backColor;
                row.style.color = foreColor;
            }
          }
        }
    }  

    function setFontName(controlID, name, nameTextBoxID, sampleTextID, tableNameID, backColor, foreColor, selectedBackColor, selectedForeColor)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
      var nameTextBox = document.getElementById(nameTextBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = name;

      if( nameTextBox )
          nameTextBox.value = name;

      if( sampleText )
	      sampleText.style.fontFamily = name; 

	  changeNameSelection(tableNameID, backColor, foreColor, selectedBackColor, selectedForeColor, name);
	}

    function setFontNameFromEditBox(controlID, nameTextBoxID, sampleTextID, tableNameID, backColor, foreColor, selectedBackColor, selectedForeColor)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
      var nameTextBox = document.getElementById(nameTextBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = nameTextBox.value;

      if( sampleText )
	      sampleText.style.fontFamily = nameTextBox.value; 

	  changeNameSelection(tableNameID, backColor, foreColor, selectedBackColor, selectedForeColor, nameTextBox.value);
	}

    function changeNameSelection(tableNameID, backColor, foreColor, selectedBackColor, selectedForeColor, name)
    {ULSxd0:;

        var tableName = document.getElementById(tableNameID);

        if( tableName )
        {

          for(i = 0; i < tableName.rows.length; i++)
          {
            var row = tableName.rows[i];

            if( row.cells[0].firstChild.nodeValue.toUpperCase() == name.toUpperCase() )
            {
                row.style.background = selectedBackColor;
                row.style.color = selectedForeColor;
            }
            else
            {
                row.style.background = backColor;
                row.style.color = foreColor;
            }
          }
        }
    }

	function setFontBold(controlID, checkBoxID, sampleTextID)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
	  var checkBox = document.getElementById(checkBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = checkBox.checked;

      if( sampleText )
	      sampleText.style.fontWeight = checkBox.checked ? "bold": "normal"; 
	}

    function setFontItalic(controlID, checkBoxID, sampleTextID)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
	  var checkBox = document.getElementById(checkBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = checkBox.checked;

      if( sampleText )
	      sampleText.style.fontStyle = checkBox.checked ? "italic": "normal"; 
	}

    function setFontUnderline(controlID, checkBoxID, sampleTextID)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
	  var checkBox = document.getElementById(checkBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = checkBox.checked;

      if( sampleText )
      {
          var s = sampleText.style.textDecoration;

          var ss = s.split(" ");

          s = "";

          for(i = 0; i < ss.length; i++ ) 
          {
              if( ss[i] == "line-through" )
              {
                  s = ss[i];
                  break;
              }
          }

          if( checkBox.checked == true )
              s += " underline"; 

	      sampleText.style.textDecoration = s;
	  }
	}

    function setFontStrikeout(controlID, checkBoxID, sampleTextID)
    {ULSxd0:;
      var control  = parent.document.getElementById(controlID);
	  var checkBox = document.getElementById(checkBoxID);
	  var sampleText = document.getElementById(sampleTextID);

	  if (control)
	      control.value = checkBox.checked;

      if( sampleText )
      {
          var s = sampleText.style.textDecoration;

          var ss = s.split(" ");

          s = "";

          for(i = 0; i < ss.length; i++ ) 
          {
              if( ss[i] == "underline" )
              {
                  s = ss[i];
                  break;
              }
          }

          if( checkBox.checked == true )
              s += " line-through"; 

          sampleText.style.textDecoration = s;
	  }
	}

    function paintRow( rowID, backColor, foreColor )
    {ULSxd0:;
      var row  = document.getElementById(rowID);
      row.style.background = backColor;
      row.style.color = foreColor;
    }

	</script>
    <form id="form1" runat="server">

        <FL:FontList ID="FontList1" runat="server" ></FL:FontList> 

    </form>
</body>
</html>
