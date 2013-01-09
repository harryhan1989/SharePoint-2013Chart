<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesInteractivitySeries,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr class="rowSeriesChooser">
	<td width="35%">
        <asp:Literal id="litSeries" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litSeries_Text%>" runat="server" />
    </td>
    <td width="60%">
        <asp:DropDownList id="ddlSeries" runat="server" />
    </td>
</tr>
<tr style="padding-top:4px">
	<td>
        <asp:Literal id="litHref" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litHref_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtHref" runat="server" cssclass="ms-input" />
    </td>
</tr>
<tr>
	<td>
        <asp:Literal id="litTooltip" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litTooltip_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtTooltip" runat="server" cssclass="ms-input" />
    </td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
	<td>
        <asp:Literal id="litLegendHref" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litLegendHref_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtLegendHref" runat="server" cssclass="ms-input" />
    </td>
</tr>
<tr>
    <td>
        <asp:Literal id="litLegendTooltip" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litLegendTooltip_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtLegendTooltip" runat="server" cssclass="ms-input" />
    </td>
</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr>
	<td>
        <asp:Literal id="litLabelHref" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litLabelHref_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtLabelHref" runat="server" cssclass="ms-input" />
    </td>
</tr>
<tr>
	<td>
        <asp:Literal id="litLabelTooltip" Text="<%$Resources:mosschart,PropertiesInteractivitySeries_ascx_litLabelTooltip_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtLabelTooltip" runat="server" cssclass="ms-input" />
    </td>
</tr>
<input id="hiddenValueFieldCount" type="hidden" runat="server" />
<asp:Literal id="litClientScript" runat="server">
<{0}>
    var PropertiesInteractivitySeries_SelectedSeries = 0;
    var PropertiesInteractivitySeries_HiddenFields = new Array({1});
    var PropertiesInteractivitySeries_TextBoxes = new Array({2});

    function PropertiesInteractivitySeries_OnValueSet(controlIndex, value)
    {{
        var hiddenField = document.getElementById(PropertiesInteractivitySeries_HiddenFields[PropertiesInteractivitySeries_SelectedSeries * {3} + controlIndex]);

        hiddenField.value = value;
    }}
    function PropertiesInteractivitySeries_OnSeriesSelected(selectedSeriesIndex)
    {{
        PropertiesInteractivitySeries_SelectedSeries = selectedSeriesIndex;

        for (i = 0; i < PropertiesInteractivitySeries_TextBoxes.length; i++)
        {{
            var textBox = document.getElementById(PropertiesInteractivitySeries_TextBoxes[i]);
            var hiddenField = document.getElementById(PropertiesInteractivitySeries_HiddenFields[selectedSeriesIndex * {3} + i]);

            textBox.value = hiddenField.value;
        }}
    }}    
</{0}>
</asp:Literal>
