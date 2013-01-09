<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" %>
<script language="c#" runat="server">

	protected void Page_Load(object sender, EventArgs e)
	{
		BindNames();
	}
	private void BindNames()
	{
		foreach (System.Drawing.FontFamily fontFamily in System.Drawing.FontFamily.Families)
			ddlName.Items.Add(fontFamily.Name);
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Expires" content="0" />
    <title><asp:Literal runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_Title_Text%>" /></title>
    <style type="text/css">
		body{
			background: #FFFFFF url(Images/bodyBg.jpg) repeat-x;
			font-family:Verdana,Arial,Helvetica,sans-serif;
			font-size:10px;
			padding:10px
		}
		.dialog_input{ width: 178px; }
		.dialog_button{ width: 100px; }
		a {color:black;font-size:7pt;text-decoration:none;}	
    </style>
    <base target="_self"/>
</head>
<body>	
    <form id="form1" runat="server">

		<table cellpadding="0" cellspacing="2" width="100%">
			<tr>
				<td><asp:Literal runat="server" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litAxisLabelsFont_Text%>" /></td>
				<td><asp:Literal runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_Size_Text%>" /></td>
				<td>&nbsp;<td>
			</tr>
			<tr>
				<td >
					<asp:DropDownList id="ddlName" OnChange="ddlName_Change();" class="dialog_input" tabIndex="1" runat="server" ></asp:DropDownList>
				</td>
				<td>
					<nobr><asp:TextBox ID="txtSize" onkeydown="setTimeout('txtSize_Change()', 50);" Width="70px" tabIndex="2" runat="server" /> 
					<asp:Literal runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_Pt_Text%>" /></nobr>
				</td>
				<td rowspan="3" align="right" >
					<asp:Button ID="btnOK" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_buttonOK_Text%>" runat="server" class="dialog_button" onclientclick="SaveUI()" /> 
					<br>
					<br>
					<asp:Button ID="btnCancel" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_buttonCancel_Text%>" runat="server" class="dialog_button" onclientclick="window.close();" />
				</td>
			</tr>
			<tr>
				<td><asp:Literal runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_Style_Text%>" /></td>
				<td>&nbsp;</td>	
			</tr>
			<tr>
				<td colspan="2">
					<asp:checkbox ID="chkBold" onclick="chkBold_Click();" tabIndex="3" runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_StyleBold_Text%>" />
					<asp:checkbox ID="chkItalic" onclick="chkItalic_Click();" tabIndex="4" runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_StyleItalic_Text%>" />
					<asp:checkbox ID="chkUnderline" onclick="chkUnderline_Click();" tabIndex="5" runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_StyleUnderline_Text%>" />
					<asp:checkbox ID="chkStrikeout" onclick="chkStrikeout_Click();" tabIndex="6" runat="server" Text="<%$Resources:mosschart,FontPickerDialog_aspx_StyleStrikeOut_Text%>" />
				</td>
			</tr>
			<tr><td colspan="2" style="height:10px;">&nbsp;</td></tr>
			<tr>
				<td id="trPreview" colspan="2" style="height:100px; border: solid 1px gray; background-color:White; vertical-align:middle;  text-align:center; overflow:auto; " ><SharePoint:EncodedLiteral runat="server" text="<%$Resources:mosschart,FontPickerDialog_aspx_SampleText_Text%>" EncodeMethod='HtmlEncode'/></td>
				<td valign="bottom" align="center">
				&nbsp;
				</td>
			</tr>
		</table>
    <script language="javascript">
function ULSjgj(){var o=new Object;o.ULSTeamName="Windows SharePoint Services 4";o.ULSFileName="FontPickerDialog.aspx";return o;}

		var MASK_BOLD = 1;
		var MASK_ITALIC = 2;
		var MASK_UNDERLINE = 4;
		var MASK_STRIKEOUT = 8;

		var FontInfo; 

		var trPreview = document.getElementById("trPreview");
		var ddlName = document.getElementById("ddlName");
		var txtSize = document.getElementById("txtSize");
		var chkBold = document.getElementById("chkBold");
		var chkItalic = document.getElementById("chkItalic");
		var chkStrikeout = document.getElementById("chkStrikeout");
		var chkUnderline = document.getElementById("chkUnderline");

		LoadUI();

		function LoadUI(){ULSjgj:;		
			if (window.dialogArguments){ 
				FontInfo = window.dialogArguments;
			}else{
				FontInfo = ParentWindow.ModalFontInfo;
			}				
			ddlName.value = FontInfo.Name;
			txtSize.value = FontInfo.Size;
			chkBold.checked = (FontInfo.Style & MASK_BOLD)>0;
			chkItalic.checked = (FontInfo.Style & MASK_ITALIC)>0;
			chkStrikeout.checked = (FontInfo.Style & MASK_STRIKEOUT)>0;
			chkUnderline.checked = (FontInfo.Style & MASK_UNDERLINE)>0;

			UpdatePreview();
		}

		function SaveUI(){ULSjgj:;
			FontInfo.Name = ddlName.value;
			FontInfo.Size = txtSize.value;
			FontInfo.Style = chkBold.checked ? MASK_BOLD : 0;
			FontInfo.Style = FontInfo.Style | (chkItalic.checked ? MASK_ITALIC : 0);
			FontInfo.Style = FontInfo.Style | (chkStrikeout.checked ? MASK_STRIKEOUT : 0);
			FontInfo.Style = FontInfo.Style | (chkUnderline.checked ? MASK_UNDERLINE : 0);
			if (window.dialogArguments){ 
				returnValue = FontInfo;
				window.close();
			}else{ 
				ParentWindow.ModalFontInfo = FontInfo;
				ParentWindow.OnFontModalDialogOK();
				window.close();
			}
		}

		function UpdatePreview(){ULSjgj:;
			try{		
				trPreview.style.fontFamily = ddlName.value;
				trPreview.style.fontSize = txtSize.value+"pt";
				trPreview.style.fontWeight = chkBold.checked ? "bold" : "normal";
				trPreview.style.fontStyle = chkItalic.checked ? "italic" : "normal";
				chkUnderline_Click();
				chkStrikeout_Click();
			}catch(err){}
		}
		function ddlName_Change(){ULSjgj:;
			try{		
				trPreview.style.fontFamily = ddlName.value;
			}catch(err){}
		}
		function txtSize_Change(){ULSjgj:;
			try{		
				trPreview.style.fontSize = txtSize.value+"pt";
			}catch(err){}
		}
		function chkBold_Click(){ULSjgj:;
			trPreview.style.fontWeight = chkBold.checked ? "bold" : "normal";
		}
		function chkItalic_Click(){ULSjgj:;
			trPreview.style.fontStyle = chkItalic.checked ? "italic" : "normal";
		}
		function chkUnderline_Click(){ULSjgj:;
			var decoration = trPreview.style.textDecoration;
			decoration = decoration ? decoration.toLowerCase() : "";

			if (!chkUnderline.checked && decoration.indexOf("underline")>-1)
				decoration = decoration.replace("underline", "").replace("  ", " ");

			if (chkUnderline.checked && decoration.indexOf("underline")<0)
				decoration += " underline";
			trPreview.style.textDecoration = decoration;						
		}
		function chkStrikeout_Click(){ULSjgj:;
			var decoration = trPreview.style.textDecoration;
			decoration = decoration ? decoration.toLowerCase() : "";

			if (!chkStrikeout.checked && decoration.indexOf("line-through")>-1)
				decoration = decoration.replace("line-through", "").replace("  ", " ");

			if (chkStrikeout.checked && decoration.indexOf("line-through")<0)
				decoration += " line-through";
			trPreview.style.textDecoration = decoration;						
		}

    </script>    
</form>
</body>
</html>
