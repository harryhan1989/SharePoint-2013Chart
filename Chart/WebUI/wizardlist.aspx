<%@ Assembly Name="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="~/_layouts/15/seattle.master"  EnableSessionState="True" EnableEventValidation="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardListPage,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:Content id="Content1" contentplaceholderid="PlaceHolderPageTitle" runat="server"> 
<asp:Literal id="litPageTitle" Text="<%$Resources:mosschart,wizardList_aspx_litPageTitle_Text%>" runat="server" />
   
</asp:Content>

<asp:Content id="Content2" contentplaceholderid="PlaceHolderPageTitleInTitleArea" runat="server">
    <asp:Literal id="litPageTitleInTitleArea" Text="<%$Resources:mosschart,wizardList_aspx_litPageTitleInTitleArea_Text%>" runat="server" />
</asp:Content>

<%--MWC--%>
<%--<asp:Content ID="ContentMenuIcon" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
	<script type="text/javascript">displayPNGImage("imgWizardListHeader","images/WizardListHeader.png",150,70,"");</script>
</asp:Content>--%>



<asp:Content id="Content4" contentplaceholderid="PlaceHolderMain" runat="server">
		<style type="text/css">
			.h3 {font-size:12pt; font-weight: bold;}
			.hr {background-repeat:repeat-x; background-image:url('images/bgHr.gif');}
			a img {border-style:none; }
		</style>
		<asp:Literal id="litDescription" Text="<%$Resources:mosschart,wizardList_aspx_litDescription_Text%>" runat="server" />
		<br /><br />
		<table cellpadding="0" cellspacing="0" border="0" width="600">
		<tr style="vertical-align:top;">
			<td width="80px">
				<a href="WizardCustomizeChart.aspx?skey=<%=SPHttpUtility.UrlKeyValueEncode(this.storageKey)%>&pkey=<%=SPHttpUtility.UrlKeyValueEncode(this.processKey)%>&csk=<%=SPHttpUtility.UrlKeyValueEncode(this.CustomSessionStateKey)%>" class="h3"><script type="text/javascript">displayPNGImage("img1","images/WizardCustomizeChart.png",68,68,"");</script></a>
			</td>
			<td width="*" class="ms-descriptiontext">
				<a href="WizardCustomizeChart.aspx?skey=<%=SPHttpUtility.UrlKeyValueEncode(this.storageKey)%>&pkey=<%=SPHttpUtility.UrlKeyValueEncode(this.processKey)%>&csk=<%=SPHttpUtility.UrlKeyValueEncode(this.CustomSessionStateKey)%>" class="h3"><asp:Literal id="litWizardCustomizeChartHeader" Text="<%$Resources:mosschart,wizardList_aspx_litWizardCustomizeChartHeader_Text%>" runat="server" /></a>
				<br />
				<asp:Literal id="litWizardCustomizeChartDescription" Text="<%$Resources:mosschart,wizardList_aspx_litWizardCustomizeChartDescription_Text%>" runat="server" />
			</td>
        </tr>
        <tr><td colspan="2" class="hr">&nbsp;</td></tr>
		<tr style="vertical-align:top;">
			<td width="80px">
				<a href="WizardConnectToData.aspx?skey=<%=SPHttpUtility.UrlKeyValueEncode(this.storageKey)%>&pkey=<%=SPHttpUtility.UrlKeyValueEncode(this.processKey)%>&csk=<%=SPHttpUtility.UrlKeyValueEncode(this.CustomSessionStateKey)%>" class="h3"><script type="text/javascript">displayPNGImage("img2","images/WizardConnectToData.png",68,68,"");</script></a>
			</td>
			<td width="*" class="ms-descriptiontext">
				<a href="WizardConnectToData.aspx?skey=<%=SPHttpUtility.UrlKeyValueEncode(this.storageKey)%>&pkey=<%=SPHttpUtility.UrlKeyValueEncode(this.processKey)%>&csk=<%=SPHttpUtility.UrlKeyValueEncode(this.CustomSessionStateKey)%>" class="h3"><asp:Literal id="Literal1" Text="<%$Resources:mosschart,wizardList_aspx_litWizardConnectToDataHeader_Text%>" runat="server" /></a>
				<br />
				<asp:Literal id="Literal2" Text="<%$Resources:mosschart,wizardList_aspx_litWizardConnectToDataDescription_Text%>" runat="server" />
			</td>
        </tr>
        <tr><td colspan="2" class="hr">&nbsp;</td></tr>
        </table>
        <br />

</asp:Content>