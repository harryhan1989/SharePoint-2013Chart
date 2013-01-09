<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.BindingSeriesInfo,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:panel id="pnlSeries" style="display:none; border:solid 1px #d0d0d0" runat="server">
<table cellpadding="0" cellspacing="2" border="0" width="100%">
	<tr>
		<td class="ms-authoringcontrols" width="45%"><asp:Literal id="litSeriesName" Text="<%$Resources:mosschart,BindingSeriesInfo_ascx_litSeriesName_Text%>" runat="server" /></td>
		<td class="ms-authoringcontrols" width="50%"><asp:TextBox id="txtSeriesName" onchange="txtSeriesName_Change(this);" cssclass="ms-input" maxlength="255" width="150px" runat="server" />
			<asp:RequiredFieldValidator id="valreqSeriesName" ErrorMessage="<%$Resources:mosschart,BindingSeriesInfo_ascx_valreqSeriesName_ErrorMessage%>" controltovalidate="txtSeriesName" display="Dynamic" runat="server">(?)</asp:RequiredFieldValidator>
				</td>
	</tr>
	<tr>
		<td class="ms-authoringcontrols"><asp:Literal id="litSeriesType" Text="<%$Resources:mosschart,BindingSeriesInfo_ascx_litSeriesType_Text%>" runat="server" /></td>
		<td class="ms-authoringcontrols"><asp:DropDownList id="ddlSeriesType" onchange="ddlSeriesType_Changed(this);" runat="server" /></td>
	</tr>
	<tr id="trChartArea" runat="server">
		<td class="ms-authoringcontrols"><asp:Literal id="litChartArea" Text="<%$Resources:mosschart,BindingSeriesInfo_ascx_litChartArea_Text%>" runat="server" /></td>
		<td class="ms-authoringcontrols"><asp:DropDownList id="ddlChartArea" runat="server" /></td>
	</tr>
	<tr id="trLegend" runat="server">
		<td class="ms-authoringcontrols"><asp:Literal id="litLegend" Text="<%$Resources:mosschart,BindingSeriesInfo_ascx_litLegend_Text%>" runat="server" /></td>
		<td class="ms-authoringcontrols"><asp:DropDownList id="ddlLegend" runat="server" /></td>
	</tr>
	<tr id="trXAxisType" runat="server">
		<td class="ms-authoringcontrols"><asp:Literal id="litXAxisType" Text="<%$Resources:mosschart,BindingSeriesInfo_ascx_litXAxisType_Text%>" runat="server" /></td>
		<td class="ms-authoringcontrols"><asp:DropDownList id="ddlXAxisType" runat="server" /></td>
	</tr>
	<tr id="trYAxisType" runat="server">
		<td class="ms-authoringcontrols"><asp:Literal id="litYAxisType" Text="<%$Resources:mosschart,BindingSeriesInfo_ascx_litYAxisType_Text%>" runat="server" /></td>
		<td class="ms-authoringcontrols"><asp:DropDownList id="ddlYAxisType" runat="server" /></td>
	</tr>
</table>
</asp:Panel>
