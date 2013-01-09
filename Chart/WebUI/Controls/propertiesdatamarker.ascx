<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesDataMarker,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:PlaceHolder id="pnlMarkersNotAvailable" runat="server" >
<tr>
	<td class="ms-authoringcontrols" colspan="2">
		<asp:Literal id="litMarkersNotAvailable" Text="<%$Resources:mosschart,PropertiesDataMarker_ascx_litMarkersNotAvailable_Text%>" runat="server" />	
	</td>
</tr>
</asp:PlaceHolder>
<asp:PlaceHolder id="pnlMarkersAvailable" runat="server" >
<tr>
	<td class="ms-authoringcontrols" width="40%">
		<asp:Literal id="litVisible" Text="<%$Resources:mosschart,PropertiesDataMarker_ascx_litVisible_Text%>" runat="server" />
	</td>
	<td width="55%">
		<asp:CheckBox id="chkVisible" runat="server" />
	</td>
</tr>
<tr class="rowDataMarkerDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litStyle" Text="<%$Resources:mosschart,PropertiesDataMarker_ascx_litStyle_Text%>" runat="server" />
	</td>
	<td>
		<asp:DropDownList id="ddlStyle" runat="server" />
	</td>
</tr>
<tr class="rowDataMarkerDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litSize" Text="<%$Resources:mosschart,PropertiesDataMarker_ascx_litSize_Text%>" runat="server" />
	</td>
	<td>
		<asp:TextBox id="txtSize" runat="server" width="80px" cssclass="ms-input" />
		<asp:RangeValidator id="valrngSize" controltovalidate="txtSize" runat="server" ErrorMessage="<%$Resources:mosschart,PropertiesDataMarker_ascx_valrngSize_ErrorMessage%>" Text="<%$Resources:mosschart,PropertiesDataMarker_ascx_valrngSize_Text%>" 
		    type="integer" minimumvalue="0" maximumvalue="100" />
		<asp:Literal id="litPixels" Text="<%$Resources:mosschart,PropertiesDataMarker_ascx_litPixels_Text%>" runat="server" />
	</td>
</tr>
<script language="javascript" type="text/javascript"> 
	var chk = document.getElementById('<%=chkVisible.ClientID%>');
	ShowHideClass(chk.checked, 'rowDataMarkerDetails');
</script>
</asp:PlaceHolder>
