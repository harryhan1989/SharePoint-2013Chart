<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta http-equiv="Expires" content="0" />
    <title><asp:Literal runat="server" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_Title_Text%>" /></title>
    <style type="text/css">
		body{
			background: #FFFFFF url(Images/bodyBg.jpg) repeat-x;
			font-family:Verdana,Arial,Helvetica,sans-serif;
			font-size:10px;
			padding:10px
		}
		.dialogInput{ width: 178px; }
		.dialogButton{ width: 100px; }
		a {color:black;font-size:7pt;text-decoration:none;}
		.helpDiv{width:300px; height:92px; overflow:auto; background-color:#ffffe1; border:solid 1px black; padding:5px;}
    </style>
    <base target="_self"/>
</head>
<body>
<form id="form1" runat="server">
    <table cellpadding="5" cellspacing="0" border="0">
    <tr valign="top">
		<td>
			<table cellpadding="3" cellspacing="0" border="0" width="300px">
			<tr>
				<td width="32%"><asp:Literal runat="server" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_FormatType_Text%>" /></td>
				<td width="68%"><select id='ddlFormat' class='input' onchange='ddlFormat_Change();' /></td>
			</tr>										
			<tr id='trPrecision'>
				<td><asp:Literal runat="server" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_Precision_Text%>" /></td>
				<td><input id='txtPrecision' class='input'  onchange='txtPrecision_Change();' maxlength=2/></select></td>
			</tr>										
			<tr id='trFormatString'>
				<td><asp:Literal runat="server" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_FormatString_Text%>" /></td>
				<td><input id='txtFormatString' class='input' onchange='txtFormatString_Change();' maxlength="127"/></td>
			</tr>										
			<tr id='trSample'>
				<td><asp:Literal runat="server" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_Sample_Text%>" /></td>
				<td><input id='txtSample' class='input' style='background-color:#efefef;'/></td>
			</tr>										
			<tr><td colspan="2">
				<asp:Literal runat="server" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_Hints_Text%>" />
				<div id='pnlDescription' class="helpDiv"></div>
			</td></tr>
			</table>    
		</td>
		<td>
			<asp:Button ID="btnOK" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_buttonOK_Text%>" runat="server" class="dialogButton" onclientclick="SaveUI()" /> 
			<br />
			<br />
			<asp:Button ID="btnCancel" Text="<%$Resources:mosschart,FormatPickerDialog_aspx_buttonCancel_Text%>" runat="server" class="dialogButton" onclientclick="window.close();" />
		</td>
		<asp:Button UseSubmitBehavior="false" 
	</tr>
    </table>
</form>
<script language="javascript" type="text/javascript">
function ULScLq(){var o=new Object;o.ULSTeamName="Windows SharePoint Services 4";o.ULSFileName="FormatPickerDialog.aspx";return o;}

	function JFormat(name, val, format, sample, description, hasPrecision, hasCustomFormat){ULScLq:;
		this.Name = name;
		this.Val = val;	
		this.Format = format;
		this.Sample = sample;
		this.Description = description;
		this.HasPrecision = hasPrecision;
		this.HasCustomFormat = hasCustomFormat;
		this.ValHistory = null;
	}

	function JFormatList(){ULScLq:;
		this.Items = [];
		this.Initialize();
	}
	JFormatList.prototype.Initialize = function(){ULScLq:;

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_NotSet%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'', '', '',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_NotSet_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Numeric%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NG_', 'G', '',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Numeric_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_General%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NG', 'G', '12345.6789',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_General_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				true, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Currency%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NC', 'C', '$12,345.68',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Currency_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				true, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Number%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NN', 'N', '12,345.68',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Number_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				true, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_FixedPoint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NF', 'F', '12345.68',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_FixedPoint_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				true, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Percent%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NP', 'P', '12.60 %',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Percent_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				true, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Scientific%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'NE', 'E', '1.234568E+004',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Scientific_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				true, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_DateTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Df_', 'f', 'Wednesday, January 24, 2007 6:27 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_DateTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_ShortDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Dd', 'd', '1/24/2007',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_ShortDate_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_LongDate%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DD', 'D', 'Wednesday, January 24, 2007',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_LongDate_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_ShortTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Dt', 't', '6:27 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_ShortTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_LongTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DT', 'T', '6:27:03 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_LongTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_FullShortTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Df', 'f', 'Wednesday, January 24, 2007 6:27 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_FullShortTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_FullLongTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DF', 'F', 'Wednesday, January 24, 2007 6:27:03 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_FullLongTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_GeneralShortTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
		'Dg', 'g', '1/24/2007 6:27 PM',
		"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_GeneralShortTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
		false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_GeneralLongTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DG', 'G', '1/24/2007 6:27:03 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_GeneralLongTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_MonthDay%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DM', 'M', 'January 24',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_MonthDay_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_RFC%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DR', 'R', 'Wed, 24 Jan 2007 18:27:03 GMT',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_RFC_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_ISO%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Ds', 's', '2007-01-24T18:27:03',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_ISO_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_UniversalSortable%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Du', 'u', '2007-01-24 18:27:03Z',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_UniversalSortable_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_UniversalFull%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DU', 'U', 'Wednesday, January 24, 2007 11:27:03 PM',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_UniversalFull_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_YearMonth%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'DY', 'Y', 'January, 2007',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_YearMonth_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, false);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Custom%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'C-', '', '',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_Custom_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, true);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_CustomNumeric%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Cn ', 'n', '',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_CustomNumeric_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, true);

		this.Add("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_CustomDateTime%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				'Cd', 'd', '',
				"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:mosschart, FormatPickerDialog_aspx_Type_CustomDateTime_Hint%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>",
				false, true);
	}
	JFormatList.prototype.Add = function (name, val, format, sample, description, hasPrecision, hasCustomFormat) {ULScLq:;
		var item = new JFormat(name, val, format, sample, description, hasPrecision, hasCustomFormat);
		this.Items[this.Items.length] = item;
	}
	JFormatList.prototype.Find = function (val) {ULScLq:;
		for( var i=0; i<this.Items.length; i++){
			if (this.Items[i].Val==val)
				return this.Items[i];
		}
		return null;
	}
	JFormatList.prototype.FindByFormat = function (format) {ULScLq:;
		for( var i=this.Items.length-1; i>-1; i--){
			if (this.Items[i].Format==format)
				return this.Items[i];
		}
		return null;
	}

	var FormatInfo;    
	var FormatList = new JFormatList();
	var Format;

	var ddlFormat = document.getElementById('ddlFormat');
	var trPrecision = document.getElementById('trPrecision');
	var txtPrecision = document.getElementById('txtPrecision');
	var trFormatString = document.getElementById('trFormatString');
	var txtFormatString = document.getElementById('txtFormatString');
	var trSample = document.getElementById('trSample');
	var txtSample = document.getElementById('txtSample');
	var pnlDescription = document.getElementById('pnlDescription');

	LoadUI();

	function LoadUI(){ULScLq:;	
		for(var i=0; i<FormatList.Items.length; i++){
			ddlFormat.options[i] = new Option(FormatList.Items[i].Name, FormatList.Items[i].Val);
		}
		if (window.dialogArguments){ 
			FormatInfo = window.dialogArguments;
		}else{
			FormatInfo = ParentWindow.ModalFormatInfo;
		}
		if (FormatInfo){		
			Format = FormatList.Find(FormatInfo.Val);			

			trPrecision.style.display = Format.HasPrecision ? "" : "none";
			txtFormatString.value = FormatInfo.Format;		
			txtFormatString_Change();
		}	
	}

	function SaveUI(){ULScLq:;
		FormatInfo.Val = ddlFormat.value;
		FormatInfo.Format = txtFormatString.value;

		if (window.dialogArguments){ 
			returnValue = FormatInfo;
			window.close();
		}else{ 
			ParentWindow.ModalFormatInfo = FormatInfo;
			ParentWindow.OnFormatModalDialogOK();
			window.close();
		}
	}

	function ddlFormat_Change() {ULScLq:;	
		Format = FormatList.Find(ddlFormat.value);

		if (Format){

			txtFormatString.value = Format.Format+(Format.Val.indexOf('N')==0 ? txtPrecision.value : "");		
			trPrecision.style.display = Format.HasPrecision ? "" : "none";				
			txtSample.value = Format.Sample;
			pnlDescription.innerHTML = Format.Description;
		}
	}
	function txtPrecision_Change(){ULScLq:;
		txtFormatString.value = Format.Format+txtPrecision.value;
	}
	function txtFormatString_Change(){ULScLq:;

		var oldFormat = FormatList.Find(ddlFormat.value);

		var formatString = txtFormatString.value;
		var format="";
		var precision="";
		var digits = "0123456789";
		var stillDigits = true;
		for(var i=formatString.length-1; i>-1; i--){
			if (stillDigits && digits.indexOf(formatString.charAt(i))>-1)
				precision = formatString.charAt(i)+precision;
			else{
				format = formatString.charAt(i)+format;
				stillDigits = false;
			}
		}		
		txtPrecision.value = precision;		
		newFormat = FormatList.FindByFormat(format);
		if (newFormat && (!oldFormat || !oldFormat.Format || (newFormat.Format!=oldFormat.Format))){
			ddlFormat.value = newFormat.Val;
			trPrecision.style.display = newFormat.HasPrecision ? "" : "none";							
			txtSample.value = newFormat.Sample;
			pnlDescription.innerHTML = newFormat.Description;
		}
	}

    </script>
</body>
</html>
