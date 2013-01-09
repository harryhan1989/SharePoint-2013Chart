<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.FontList,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>

<table >
    <tr>
    <td>
   <div id="divFontName" style="margin-left: 5px;">

    <asp:Label cssclass="ms-input" ID="LabelFontName" runat="server" Text="Font:"></asp:Label>
    <asp:TextBox cssclass="ms-input" ID="textBoxFontName" runat="server" Width="157px" style="display:block"></asp:TextBox>

    <div style="overflow: auto; width: 163px; height: 100px;">
        <asp:Table ID="tableFontName" runat="server"></asp:Table>
    </div>

   </div>
   </td>
   <td style="width: 53px">

   <div id="divFontSize" >

    <asp:Label cssclass="ms-input" ID="LabelFontSize" runat="server" Text="Size:" ></asp:Label>
    <asp:TextBox cssclass="ms-input" ID="textBoxFontSize" runat="server" Width="50px" style="display:block;"></asp:TextBox>

    <div style="overflow: auto; width: 56px; height: 100px;">
        <asp:Table ID="tableFontSize" runat="server">
        </asp:Table>
    </div>

   </div>
   </td>
   </tr>
</table>

<div id="divFontEffect" >
           <asp:Table ID="fontEffectsTable" runat="server">
                    <asp:TableRow cssclass="ms-input" >
                        <asp:TableCell><asp:CheckBox ID="checkBoxBold" runat="server" /></asp:TableCell>
                        <asp:TableCell>Bold</asp:TableCell>
                        <asp:TableCell><asp:CheckBox ID="checkBoxItalic" runat="server" /></asp:TableCell>
                        <asp:TableCell>Italic</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow cssclass="ms-input" >
                        <asp:TableCell><asp:CheckBox ID="checkBoxUnderline" runat="server" /></asp:TableCell>
                        <asp:TableCell>Underline</asp:TableCell>
                        <asp:TableCell><asp:CheckBox ID="checkBoxStrikeout" runat="server" /></asp:TableCell>
                        <asp:TableCell>Strikeout</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

</div>

