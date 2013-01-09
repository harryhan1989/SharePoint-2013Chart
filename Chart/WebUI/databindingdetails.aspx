<%@ Assembly Name="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="~/_layouts/15/seattle.master" EnableSessionState="True" EnableEventValidation="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.DataBindingListPage,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="ctl" TagName="Binding" src="Controls/Binding.ascx"%> 

<asp:Content id="Content1" contentplaceholderid="PlaceHolderPageTitle" runat="server">
    <asp:Literal id="litPageTitle" meta:resourcekey="litPageTitle" runat="server" />
</asp:Content>

<asp:Content id="Content2" contentplaceholderid="PlaceHolderPageTitleInTitleArea" runat="server">
    <asp:Literal id="litPageTitleInTitleArea" meta:resourcekey="litPageTitleInTitleArea" runat="server" />
</asp:Content>
<%--MWC--%>
<%--<asp:Content ID="ContentMenuIcon" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
	<script type="text/javascript">displayPNGImage("img1","images/WizardConnectToDataHeader.png",150,70,"");</script>
</asp:Content>--%>

<asp:Content id="Content4" contentplaceholderid="PlaceHolderMain" runat="server">
    <br />
    <asp:Literal id="litDescription" meta:resourcekey="litDescription" runat="server" />
    <br />
    <br />   	  
    <asp:ValidationSummary id="valSummary" runat="server" meta:resourcekey="valSummary"
        displaymode="BulletList" font-bold="true" showsummary="true" />

	<style type="text/css">
		.helpTd { padding-top: 14px;}
	</style>

	<ctl:Binding id="ctlChartBinding" runat="server" />    
</asp:Content>
