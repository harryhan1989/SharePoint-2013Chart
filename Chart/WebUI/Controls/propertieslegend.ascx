<%@ Control language="C#" AutoEventWireup="false" EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesLegend,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dialogs" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Dialogs" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="ctl" TagName="PositionSelector" Src="PositionSelector.ascx" %>

<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>
    <td class="ms-authoringcontrols" width="40%">
        <asp:Literal id="litShowLegend" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litShowLegend_Text%>" runat="server" />
    </td>
    <td width="55%">
        <asp:CheckBox id="chkShowLegend" runat="server" />
    </td>
</tr>

<tr class="rowLegendDetails">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:Literal id="litLegendFont" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litLegendFont_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FontPicker id="fontPickerLegend" width="160px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" /><br />
		<dialogs:ColorPicker id="colorPickerLegend" width="40px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr class="rowLegendDetails">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:Literal id="litLegendTitle" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litLegendTitle_Text%>" runat="server" />
	</td>
	<td style="vertical-align: top">
        <asp:TextBox id="txtLegendTitle" runat="server" width="200px" cssclass="ms-input" />
    </td>
</tr>

<tr class="rowLegendDetails">
	<td class="ms-authoringcontrols" style="padding-left:16px;vertical-align:top">
		<asp:literal id="litLegendTitleFont" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litLegendTitleFont_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dialogs:FontPicker id="fontPickerLegendTitle" width="160px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" /><br />
		<dialogs:ColorPicker id="colorPickerLegendTitle" width="40px" inputcssclass="ms-input" buttonsize="18px" 
		    path="~/_layouts/15/chart/webcontrols/" runat="server" />
	</td>
</tr>

<tr class="rowLegendDetails">
    <td class="ms-authoringcontrols" style="padding-left:16px;">
        <asp:Literal id="litDockLegendToChartArea" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litDockLegendToChartArea_Text%>" runat="server" />
    </td>
    <td>
        <asp:CheckBox id="chkDockLegendToChartArea" runat="server" />
    </td>
</tr>
<tr class="rowLegendDockToAreaDdl">
	<td class="ms-authoringcontrols" style="padding-left: 16px;">
        <asp:Literal id="litChartArea" meta:resourcekey="litChartArea" runat="server" />
    </td>
    <td>
        <asp:DropDownList id="ddlChartArea" runat="server" />
    </td>
</tr>
<tr class="rowLegendDockToArea">
	<td class="ms-authoringcontrols" style="padding-left: 16px;">
        <asp:Literal id="litShowLegendInsideChartArea" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litShowLegendInsideChartArea_Text%>" runat="server" />
    </td>
    <td>
        <asp:CheckBox id="chkShowLegendInsideChartArea" runat="server" />
    </td>
</tr>
<tr class="rowLegendDetails">
	<td class="ms-authoringcontrols" style="padding-left: 16px;">
        <asp:Literal id="litLegendStyle" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litLegendStyle_Text%>" runat="server" />
    </td>
    <td>
        <asp:DropDownList id="ddlLegendStyle" runat="server" />
    </td>
</tr>
<tr class="rowLegendDetails">
	<td class="ms-authoringcontrols" style="padding-left: 16px;">
        <asp:Literal id="litLegendPosition" Text="<%$Resources:mosschart,PropertiesLegend_ascx_litLegendPosition_Text%>" runat="server" />
    </td>
    <td>
        <ctl:PositionSelector id="ctlPositionSelectorLegend" runat="server" />
    </td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td><img alt="" src="images/spacer.gif" width="200" height="20" /></td>
</tr>
<script type="text/javascript" language="javascript">
	function ShowHideClasses()
	{
		var showLegendChk = document.getElementById('<%=chkShowLegend.ClientID%>');
    	var dockLegendChk = document.getElementById('<%=chkDockLegendToChartArea.ClientID%>');
	    var dockLegendDdl = document.getElementById('<%=ddlChartArea.ClientID%>');

	    ShowHideClass(showLegendChk.checked, 'rowLegendDetails');
	    ShowHideClass(showLegendChk.checked && dockLegendChk.checked, 'rowLegendDockToArea');
	    ShowHideClass(showLegendChk.checked && dockLegendChk.checked && dockLegendDdl.length > 1, 'rowLegendDockToAreaDdl');
	}

	ShowHideClasses();
</script>
