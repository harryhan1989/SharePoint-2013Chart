<%@ Control language="C#" AutoEventWireup="false" EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PropertiesSizeType,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>
    <td class="ms-authoringcontrols">
        <asp:Literal id="litWidth" Text="<%$Resources:mosschart,PropertiesSizeType_ascx_litWidth_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtWidth" maxlength="10" runat="server" width="100px" />
        <asp:RequiredFieldValidator id="valreqWidth" meta:resourcekey="valreqWidth" controltovalidate="txtWidth" display="Dynamic" runat="server">(?)</asp:RequiredFieldValidator>
        <asp:CustomValidator id="valcustWidth" meta:resourcekey="valcustWidth" controltovalidate="txtWidth" display="Dynamic" runat="server">(?)</asp:CustomValidator>
    </td>
</tr>
<tr>
    <td class="ms-authoringcontrols">
        <asp:Literal id="litHeight" Text="<%$Resources:mosschart,PropertiesSizeType_ascx_litHeight_Text%>" runat="server" />
    </td>
    <td>
        <asp:TextBox id="txtHeight" maxlength="10" runat="server" width="100px" />
        <asp:RequiredFieldValidator id="valreqHeight" meta:resourcekey="valreqHeight" controltovalidate="txtHeight" display="Dynamic" runat="server">(?)</asp:RequiredFieldValidator>
        <asp:CustomValidator id="valcustHeight" meta:resourcekey="valcustHeight" controltovalidate="txtHeight" display="Dynamic" runat="server">(?)</asp:CustomValidator>
    </td>
</tr>
<tr>
    <td class="ms-authoringcontrols">
        <asp:Literal id="litImageType" Text="<%$Resources:mosschart,PropertiesSizeType_ascx_litImageType_Text%>" runat="server" />
    </td>
    <td>
        <dwu:imagedropdownlist id="ddlImageType" onchangejs="ddlImageType_Change();" visiblelistrows="10" imageurlformat="Images/ImageFormats/all.gif" runat="server" width="200px" />
    </td>
</tr>
