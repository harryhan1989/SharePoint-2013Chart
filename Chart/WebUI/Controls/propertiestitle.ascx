<%@ Control language="C#"  EnableViewState="false"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesTitle,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dialogs" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Dialogs" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="ctl" TagName="PositionSelector" Src="PositionSelector.ascx" %>

<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>
    <td class="ms-authoringcontrols" width="40%">
        <asp:Literal id="litShowChartTitle" Text="<%$Resources:mosschart,PropertiesTitle_ascx_litShowChartTitle_Text%>" runat="server" />
    </td>
    <td width="55%">
        <asp:CheckBox id="chkShowChartTitle" runat="server" />
    </td>
</tr>

<tr class="rowTitleDetails">
    <td class="ms-authoringcontrols" style="padding-left: 16px; vertical-align: top">
        <asp:Literal id="litChartTitle" Text="<%$Resources:mosschart,PropertiesTitle_ascx_litChartTitle_Text%>" runat="server" />
    </td>
    <td style="vertical-align: top">
        <asp:TextBox id="txtChartTitle" runat="server" width="200px" cssclass="ms-input" />
    </td>
</tr>

<tr class="rowTitleDetails">
    <td class="ms-authoringcontrols" style="padding-left: 16px; vertical-align: top">
        <asp:Literal id="litChartTitleFont" Text="<%$Resources:mosschart,PropertiesTitle_ascx_litChartTitleFont_Text%>" runat="server" />
    </td>
	<td style="vertical-align:top">
		<dialogs:FontPicker id="fontPickerChartTitle" width="160px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" /><br />
		<dialogs:ColorPicker id="colorPickerChartTitle" width="40px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr class="rowTitleDetails">
    <td class="ms-authoringcontrols" style="padding-left: 16px;">
        <asp:Literal id="litChartTitlePosition" Text="<%$Resources:mosschart,PropertiesTitle_ascx_litChartTitlePosition_Text%>" runat="server" />
    </td>
    <td>
        <ctl:PositionSelector id="ctlPositionSelectorTitle" runat="server" />
    </td>
</tr>

<script type="text/javascript" language="javascript">
	ShowHideClass(document.getElementById('<%=chkShowChartTitle.ClientID%>').checked, 'rowTitleDetails');
</script>
