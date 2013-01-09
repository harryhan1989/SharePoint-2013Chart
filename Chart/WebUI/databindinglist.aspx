<%@ Assembly Name="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="~/_layouts/15/seattle.master" EnableSessionState="True" EnableEventValidation="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.DataBindingListPage,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ID="Content1" ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<asp:literal ID="litPageTitle" Text="<%$Resources:mosschart,DataBindingList_aspx_litPageTitle_Text%>" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
	<asp:literal ID="litPageTitleInTitleArea" Text="<%$Resources:mosschart,DataBindingList_aspx_litPageTitleInTitleArea_Text%>" runat="server" />
</asp:Content>
<%--MWC--%>
<%--<asp:Content ID="ContentMenuIcon" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
	<script type="text/javascript">displayPNGImage("img1","images/WizardConnectToDataHeader.png",150,70,"");</script>
</asp:Content>--%>

<asp:Content ID="Content4" ContentPlaceHolderId="PlaceHolderMain" runat="server">
    <br />
	<asp:literal ID="litDescription" Text="<%$Resources:mosschart,DataBindingList_aspx_litDescription_Text%>" runat="server" />
    <br />
    <br />   	  
	<style type="text/css">
		.wiz_grid_Header td {color: #6c6c6c; background-color:#ebebeb; border-top:solid 1px #ebebeb; border-bottom:solid 1px #d9d9d9; border-left:solid 1px #ebebeb; border-right:solid 1px #ebebeb; font-weight: bold;}
		.wiz_grid_Item td {color: black; background-color:white; border-top:solid 1px #d9d9d9; border-bottom:solid 1px #d9d9d9; border-left:solid 1px white; border-right:solid 1px white; font-weight: normal;}
	</style>
	<div style="height:200; width:100%; background-color:White; overflow:auto;">
		<asp:DataGrid id="dbgDataBindings" runat="server" borderstyle="None" font-size="9pt" backcolor="Silver" width="100%" cellpadding="1" cellspacing="0" autogeneratecolumns="false">
            <HeaderStyle cssclass="ms-authoringcontrols wiz_grid_Header" />
            <ItemStyle cssclass="ms-authoringcontrols wiz_grid_Item" />
            <Columns>
				<asp:HyperLinkColumn datanavigateurlfield="UrlParams" datanavigateurlformatstring="dataBindingDetails.aspx?{0}" 
				    datatextfield="Id" datatextformatstring="<img src='Images/dataBindingIcon.gif' width='16' height='16' border='0'>" headertext="Id" />
				<asp:BoundColumn datafield="BindingType" headertext="Type" />
                <asp:BoundColumn datafield="Series" headertext="Series" />
				<asp:TemplateColumn headertext="Actions">
                    <ItemTemplate>
                        <asp:Button id="btnEdit" text="Edit" runat="server" style="width: 40px; height: 20px; font-size: 8pt" />
                        <asp:Button id="btnDelete" text="Delete" runat="server" style="width: 40px; height: 20px; font-size: 8pt" />
                    </ItemTemplate>
                </asp:TemplateColumn>
			</Columns>
		</asp:DataGrid>
		<br />
		<div style="width:100%; text-align:right;">
			<asp:Button id="btnAdd" text="Add new data binding" runat="server" />
		</div>
	</div>		

</asp:Content>
