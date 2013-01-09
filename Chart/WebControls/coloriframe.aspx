<%@ Page language="C#"  EnableSessionState="False" EnableEventValidation="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.ColorPickerIFrame,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Tagprefix="CL" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><asp:Literal runat="server" Text="<%$Resources:mosschart,ColorIFrame_aspx_Title_Text%>" /></title>
</head>
<body style="margin: 0px; font-size: 12px; font-family: Arial;" >

	<script type="text/javascript">
function ULSVxi(){var o=new Object;o.ULSTeamName="Windows SharePoint Services 4";o.ULSFileName="ColorIFrame.aspx";return o;}

    function changeColorSelection(tableColorID, backColor, foreColor, selectedBackColor, selectedForeColor, color)
    {ULSVxi:;
        var tableColor = document.getElementById(tableColorID);

        if( tableColor )
        {

          for(i = 0; i < tableColor.rows.length; i++)
          {
            var row = tableColor.rows[i];

            if( row.cells[1].firstChild.nodeValue  == color )
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

	</script>

    <form id="form1" runat="server">

        <CL:ColorList id="ColorList1" runat="server" ></CL:ColorList> 

    </form>
</body>
</html>
