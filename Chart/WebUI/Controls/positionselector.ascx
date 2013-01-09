<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.PositionSelector,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>

<table cellpadding="0" cellspacing="0" border="0" >	
	<tr style="height:8px">
		<td>&nbsp;</td>
		<td><asp:RadioButton id="rbtPositionTopNear" groupname="Position" runat="server" /></td>
		<td><asp:RadioButton id="rbtPositionTopCenter" groupname="Position" checked="true" runat="server" /></td>
		<td><asp:RadioButton id="rbtPositionTopFar" groupname="Position" runat="server" /></td>
		<td>&nbsp;</td>
	</tr>
	<tr style="height:8px">
		<td><asp:RadioButton id="rbtPositionLeftNear" groupname="Position" runat="server" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><asp:RadioButton id="rbtPositionRightNear" groupname="Position" runat="server" /></td>
	</tr>
	<tr style="height:8px">
		<td><asp:RadioButton id="rbtPositionLeftCenter" groupname="Position" runat="server" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><asp:RadioButton id="rbtPositionRightCenter" groupname="Position" runat="server" /></td>
	</tr>
	<tr style="height:8px">
		<td><asp:RadioButton id="rbtPositionLeftFar" groupname="Position" runat="server" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><asp:RadioButton id="rbtPositionRightFar" groupname="Position" runat="server" /></td>
	</tr>
	<tr style="height:8px">
		<td>&nbsp;</td>
		<td><asp:RadioButton id="rbtPositionBottomNear" groupname="Position" runat="server" /></td>
		<td><asp:RadioButton id="rbtPositionBottomCenter" groupname="Position" runat="server" /></td>
		<td><asp:RadioButton id="rbtPositionBottomFar" groupname="Position" runat="server" /></td>
		<td>&nbsp;</td>
	</tr>
</table>								

