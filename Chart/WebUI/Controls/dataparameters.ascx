<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.DataParameters,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<style type="text/css">
	.wiz_grid_Header td {color: #6c6c6c; background-color:#ebebeb; border-top:solid 1px #ebebeb; border-bottom:solid 1px #d9d9d9; border-left:solid 1px #ebebeb; border-right:solid 1px #ebebeb; font-weight: bold;}
	.wiz_grid_Item td {color: black; background-color:white; border-top:solid 1px #d9d9d9; border-bottom:solid 1px #d9d9d9; border-left:solid 1px white; border-right:solid 1px white; font-weight: normal;}
</style>
<div style="width:100%;height:65px; overflow:auto;">
<input type="hidden" id="hidParameters" value="10" runat="server" />
    <asp:DataGrid id="dtgParameters" autogeneratecolumns="false" runat="server" width="100%" cellpadding="1" cellspacing="0" borderwidth="0">
	<HeaderStyle cssclass="wiz_grid_Header ms-authoringcontrols" />
	<ItemStyle cssclass="wiz_grid_Item ms-authoringcontrols" />
	<Columns>
		<asp:TemplateColumn headertext="<%$Resources:mosschart,DataParameters_ascx_ParameterName_HeaderText%>">
			<ItemTemplate>
				<asp:TextBox id="txtName" cssclass="ms-input" maxlength="127" width="100px" runat="server" />
				<asp:DropDownList id="ddlDisplayName" runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn headertext="<%$Resources:mosschart,DataParameters_ascx_Type_HeaderText%>">
			<ItemTemplate>
				<asp:DropDownList id="ddlDataType" runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn headertext="<%$Resources:mosschart,DataParameters_ascx_DefaultValue_HeaderText%>">
			<ItemTemplate>
				<asp:TextBox id="txtDefaultValue" cssclass="ms-input" maxlength="127" width="100px" runat="server" />
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:DataGrid>
</div>
