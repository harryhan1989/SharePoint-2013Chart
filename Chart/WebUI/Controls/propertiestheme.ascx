<%@ Control language="C#" AutoEventWireup="false" EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesTheme,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>
    <td class="ms-authoringcontrols">
        <asp:Literal id="litTheme" Text="<%$Resources:mosschart,PropertiesTheme_ascx_litTheme_Text%>" runat="server" />
    </td>
    <td>
        <dwu:imagedropdownlist id="ddlChartTheme" visiblelistrows="12" imageurlformat="Images/ChartThemes/{0}.gif" runat="server" width="200px" />
    </td>
</tr>
<tr id="trChartDrawingStyleColumnRow" runat="server">
    <td class="ms-authoringcontrols">
        <asp:Literal id="litDrawingStyleColumnRow" Text="<%$Resources:mosschart,PropertiesTheme_ascx_litDrawingStyle_Text%>" runat="server" />
    </td>
    <td>
        <dwu:imagedropdownlist id="ddlChartDrawingStyleColumnRow" visiblelistrows="10" imageurlformat="Images/ChartDrawingStyles/drawingStyle{0}.gif" runat="server" width="200px" />
    </td>
</tr>
<tr id="trChartDrawingStylePie" runat="server">
    <td class="ms-authoringcontrols">
        <asp:Literal id="litDrawingStylePie" Text="<%$Resources:mosschart,PropertiesTheme_ascx_litDrawingStyle_Text%>" runat="server" />
    </td>
    <td>
        <dwu:imagedropdownlist id="ddlChartDrawingStylePie" visiblelistrows="10" imageurlformat="Images/ChartDrawingStyles/drawingStylePie{0}.gif" runat="server" width="200px" />
    </td>
</tr>
<tr>
    <td class="ms-authoringcontrols">
        <asp:Literal id="litTransparency" Text="<%$Resources:mosschart,PropertiesTheme_ascx_litTransparency_Text%>" runat="server" />
    </td>
    <td>
        <dwu:imagedropdownlist id="ddlTransparency" visiblelistrows="12" imageurlformat="Images/ChartTransparency/{0}.gif" runat="server" width="200px" />
    </td>
</tr>
