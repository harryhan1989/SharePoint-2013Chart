<%@ Control language="C#" AutoEventWireup="false" EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesDataLabel,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dialogs" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Dialogs" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>
	<td class="ms-authoringcontrols" width="40%">
		<asp:Literal id="litVisible" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litVisible_Text%>" runat="server" />
	</td>
	<td width="55%">
		<asp:CheckBox id="chkVisible" runat="server" />
	</td>
</tr>
<tr class="rowDataLabelDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litValue" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litValue_Text%>" runat="server" />
	</td>
	<td>
		<asp:DropDownList id="ddlValue" runat="server" />
	</td>
</tr>

<tr id="trDataLabelOtherValue" class="rowDataLabelDetails">
	<td class="ms-authoringcontrols" style="padding-left:16px;">
		<asp:Literal id="litOtherValue" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litOtherValue_Text%>" runat="server" />
	</td>
	<td>
		<asp:TextBox id="txtOtherValue" runat="server" width="240px" cssclass="ms-input" />
	</td>
</tr>

<tr class="rowDataLabelDetails">
	<td class="ms-authoringcontrols" style="vertical-align:top">
		<asp:Literal id="litFont" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litFont_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FontPicker id="fontPickerLabel" width="160px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" /><br />
		<dialogs:ColorPicker id="colorPickerLabel" width="40px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr class="rowDataLabelDetails">
	<td class="ms-authoringcontrols" style="vertical-align:top">
		<asp:Literal id="litFormat" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litFormat_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FormatPicker id="formatPickerLabel" width="180px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr id="trDataLabelDetails" class="rowDataLabelDetails" runat="server">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litAutoPositioning" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litAutoPositioning_Text%>" runat="server" />
	</td>
	<td>
		<asp:CheckBox id="chkAutoPositioning" runat="server" />
	</td>
</tr>
<tr class="rowDataLabelPositionDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litAngle" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litAngle_Text%>" runat="server" />
	</td>
	<td>
		<asp:TextBox id="txtAngle" runat="server" width="100px" cssclass="ms-input" />
		<asp:RangeValidator id="valrngAngle" controltovalidate="txtAngle" type="Integer" minimumvalue="-90" maximumvalue="90" ErrorMessage="<%$Resources:mosschart,PropertiesDataLabel_ascx_valrngAngle_ErrorMessage%>" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_valrngAngle_Text%>" runat="server" />
	</td>
</tr>
<tr class="rowDataLabelDetails" id="trPosition" runat="server">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litPosition" Text="<%$Resources:mosschart,PropertiesDataLabel_ascx_litPosition_Text%>" runat="server" />
	</td>
	<td>
		<asp:DropDownList id="ddlPosition" runat="server" /> 
	</td>
</tr>
<script type="text/javascript" language="javascript">
	PropertiesDataLabel_ShowHide();

	function PropertiesDataLabel_ShowHide(){
		var chk = document.getElementById('<%=chkVisible.ClientID%>');
		var chkAutoPosition = document.getElementById('<%=chkAutoPositioning.ClientID%>');
		var ddlValue = document.getElementById('<%=ddlValue.ClientID%>');
		ShowHideClass(chk.checked, 'rowDataLabelDetails');

		ShowHideClass(chk.checked , 'rowDataLabelPositionDetails');
		ShowHideElements(ddlValue.value=='Other', 'trDataLabelOtherValue');
	}
</script>
