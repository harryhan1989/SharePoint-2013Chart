<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesAxis,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dialogs" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Dialogs" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:PlaceHolder id="pnlAxisNotAvailable" visible="false" runat="server" >
<tr>
	<td class="ms-authoringcontrols" colspan="2">
		<asp:Literal id="litAxisNotAvailable" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litAxisNotAvailable_Text%>" runat="server" />	
	</td>
</tr>
</asp:PlaceHolder>
<asp:PlaceHolder id="pnlAxisAvailable" runat="server">
<tr>
	<td class="ms-authoringcontrols" width="30%">
		<asp:Literal id="litEnabled" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litEnabled_Text%>" runat="server" /> 
	</td>
	<td class="ms-authoringcontrols" width="65%" style="padding:1px 0px 1px 0px">
		<asp:DropDownList id="ddlEnabled" runat="server" />
	</td>
</tr>
<%

%>

<tr>
	<td class="ms-authoringcontrols">
		<asp:Literal id="litShowTitle" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litShowTitle_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols"  style="padding:1px 0px 1px 0px; vertical-align:top">
		<asp:CheckBox id="chkShowTitle" meta:resourcekey="chkShowTitle" runat="server" />
	</td>
</tr>
<tr id="trTitleDetails1" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:Literal id="litTitle" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litTitle_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols"  style="padding:1px 0px 1px 0px;vertical-align:top">
		<asp:TextBox id="txtTitle" width="200px" maxlength="255" runat="server" cssclass="ms-input" />
	</td>
</tr>

<tr id="trTitleDetails2" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:Literal id="litAxisTitleFont" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litAxisTitleFont_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FontPicker id="fontPickerAxisTitle" width="160px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" /><br />
		<dialogs:ColorPicker id="colorPickerAxisTitle" width="40px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr id="trTitleDetails3" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:literal id="litTitleAlign" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litTitleAlign_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols"  style="padding:1px 0px 1px 0px;vertical-align:top">
		<asp:DropDownList id="ddlTitleAlign" runat="server" />
	</td>
</tr>

<tr>
	<td class="ms-authoringcontrols">
		<asp:Literal id="litShowAxisLabels" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litShowAxisLabels_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols"  style="padding:1px 0px 1px 0px; vertical-align:top">
		<asp:CheckBox id="chkShowAxisLabels" meta:resourcekey="chkShowAxisLabels" runat="server" />
	</td>
</tr>
<tr id="trAxisLabelsDetails1" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:Literal id="litAxisLabelsFont" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litAxisLabelsFont_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FontPicker id="fontPickerAxisLabels" width="160px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" /><br />
		<dialogs:ColorPicker id="colorPickerAxisLabels" width="40px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>
<tr id="trAxisLabelsDetails2" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:Literal id="litAxisLabelsFormat" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litAxisLabelsFormat_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FormatPicker id="formatPickerAxisLabels" width="180px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr valign="top">
	<td class="ms-authoringcontrols"  style="padding-top:4px;">
		<asp:Literal id="litSettings" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litSettings_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<table cellpadding="0" cellspacing="2" border="0">
			<tr>
				<td class="ms-authoringcontrols"><asp:CheckBox id="chkReversed" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkReversed_Text%>" runat="server" /></td>
				<td class="ms-authoringcontrols"><asp:CheckBox id="chkInterlaced" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkInterlaced_Text%>" runat="server" /></td>
			</tr>
			<tr>
				<td class="ms-authoringcontrols"><asp:CheckBox id="chkStartFromZero" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkStartFromZero_Text%>" runat="server" /></td>
				<td class="ms-authoringcontrols"><asp:CheckBox id="chkLogarithmicScale" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkLogarithmicScale_Text%>" runat="server" /></td>
			</tr>
			<tr>
				<td class="ms-authoringcontrols"><asp:CheckBox id="chkSideMargins" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkSideMargins_Text%>" runat="server" /></td>
				<td class="ms-authoringcontrols"><asp:CheckBox id="chkScaleBreaks" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkScaleBreaks_Text%>" runat="server" /></td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td class="ms-authoringcontrols" style="padding-left:16px">
		<asp:Literal id="litMinimum" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litMinimum_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:TextBox id="txtMinimum" maxlength="16" width="80px" runat="server" cssclass="ms-input" />
		<asp:CustomValidator id="valMinimum" runat="server">(?)</asp:CustomValidator>
	</td>
</tr>
<tr>
	<td class="ms-authoringcontrols" style="padding-left:16px">
		<asp:literal id="litMaximum" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litMaximum_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:TextBox id="txtMaximum" maxlength="16" width="80px" runat="server" cssclass="ms-input" />
		<asp:CustomValidator id="valMaximum" runat="server">(?)</asp:CustomValidator>
	</td>
</tr>

<tr>
	<td class="ms-authoringcontrols" >
		<asp:literal id="litMajorGridlines" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litMajorGridlines_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols"  style="padding:1px 0px 1px 0px">
		<asp:CheckBox id="chkShowMajorGridlines" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkShowMajorGridlines_Text%>" runat="server" />
	</td>
</tr>
<tr id="trMajorGridlinesDetails1" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:16px">
		<asp:Literal id="litMajorGridlinesInterval" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litInterval_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:TextBox id="txtMajorGridlinesInterval" width="80px" runat="server" maxlength="16" cssclass="ms-input" />
		<asp:CustomValidator id="valMajorGridlinesInterval" display="Dynamic" meta:resourcekey="valMajorGridlinesInterval" runat="server" />
		<asp:DropDownList id="ddlMajorGridlinesIntervalType" runat="server" />
		</td>
</tr>
<tr id="trMajorGridlinesDetails2" runat="server">
	<td class="ms-authoringcontrols"  style="padding-left:16px">
		<asp:Literal id="litMajorGridlinesTickmarks" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litTickMarks_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:DropDownList id="ddlMajorGridlinesTickmark" runat="server" />
	</td>						
</tr>

<tr>
	<td class="ms-authoringcontrols" >
		<asp:Literal id="litMinorGridlines" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litMinorGridlines_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:CheckBox id="chkShowMinorGridlines" Text="<%$Resources:mosschart,PropertiesAxis_ascx_chkShowMinorGridlines_Text%>" runat="server" />
	</td>
</tr>
<tr id="trMinorGridlinesDetails1" runat="server">
	<td class="ms-authoringcontrols"  style="padding-left:16px">
		<asp:Literal id="litMinorGridlinesInterval" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litInterval_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:TextBox id="txtMinorGridlinesInterval" width="80px" runat="server" maxlength="16" cssclass="ms-input" />
		<asp:CustomValidator id="valMinorGridlinesInterval" display="Dynamic" meta:resourcekey="valMinorGridlinesInterval" runat="server" />
		<asp:DropDownList id="ddlMinorGridlinesIntervalType" runat="server" />
	</td>
</tr>
<tr id="trMinorGridlinesDetails2" runat="server">
	<td class="ms-authoringcontrols"  style="padding-left:16px">
		<asp:Literal id="litMinorGridlinesTickmarks" Text="<%$Resources:mosschart,PropertiesAxis_ascx_litTickMarks_Text%>" runat="server" />
	</td>
	<td class="ms-authoringcontrols" style="padding:1px 0px 1px 0px">
		<asp:DropDownList id="ddlMinorGridlinesTickmark" runat="server" />
	</td>
</tr>					
<script language="javascript">

	var chkTitle = document.getElementById('<%=chkShowTitle.ClientID%>');
	ShowHideElements(chkTitle.checked, '<%=trTitleDetails1.ClientID%>', '<%=trTitleDetails2.ClientID%>', '<%=trTitleDetails3.ClientID%>' );

	var chkShowAxisLabels = document.getElementById('<%=chkShowAxisLabels.ClientID%>');
	ShowHideElements(chkShowAxisLabels.checked, '<%=trAxisLabelsDetails1.ClientID%>', '<%=trAxisLabelsDetails2.ClientID%>' );

	var chkMajorGrid = document.getElementById('<%=chkShowMajorGridlines.ClientID%>');
	ShowHideElements(chkMajorGrid.checked, '<%=trMajorGridlinesDetails1.ClientID%>', '<%=trMajorGridlinesDetails2.ClientID%>');

	var chkMinorGrid = document.getElementById('<%=chkShowMinorGridlines.ClientID%>');
	ShowHideElements(chkMinorGrid.checked, '<%=trMinorGridlinesDetails1.ClientID%>', '<%=trMinorGridlinesDetails2.ClientID%>');	
</script>
</asp:PlaceHolder>
