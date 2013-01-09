<%@ Control language="C#" AutoEventWireup="false" EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesBackground,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>	
	<td class="ms-authoringcontrols">
		<asp:Literal id="litBorderSkinStyle" Text="<%$Resources:mosschart,PropertiesBackground_ascx_litBorderSkinStyle_Text%>" runat="server" />
	</td>
	<td>
		<dwu:imagedropdownlist id="ddlBorderSkinStyle" visiblelistrows="12" imageurlformat="Images/ChartBorderSkinStyle/skin{0}.gif" runat="server" width="200px" />
	</td>
</tr>

<tr>
	<td class="ms-authoringcontrols" style="vertical-align:top">
		<asp:Literal id="litChartFill" Text="<%$Resources:mosschart,PropertiesBackground_ascx_litChartFill_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dwu:FillPicker id="fillPickerChart" runat="server" />
	</td>
</tr>

<tr>
	<td class="ms-authoringcontrols" style="vertical-align:top">
		<asp:Literal id="litChartBorder" Text="<%$Resources:mosschart,PropertiesBackground_ascx_litChartBorder_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dwu:BorderPicker id="borderPickerChart" runat="server" />
	</td>
</tr>

<tr>
	<td class="ms-authoringcontrols" style="vertical-align:top">
		<asp:Literal id="litChartAreaFill" Text="<%$Resources:mosschart,PropertiesBackground_ascx_litChartAreaFill_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dwu:FillPicker id="fillPickerChartArea" runat="server" />
	</td>
</tr>

<tr>
	<td class="ms-authoringcontrols" style="vertical-align:top">
		<asp:Literal id="litChartAreaBorder" Text="<%$Resources:mosschart,PropertiesBackground_ascx_litChartAreaBorder_Text%>" runat="server" />
	</td>
	<td style="vertical-align:top">
		<dwu:BorderPicker id="borderPickerChartArea" runat="server" />
	</td>
</tr>
