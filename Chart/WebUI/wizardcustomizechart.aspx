<%@ Assembly Name="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="~/_layouts/15/seattle.master" EnableSessionState="True" EnableEventValidation="False"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardCustomizeChartPage,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dwuc" TagName="Step1" src="WizardCustomizeChartStep1.ascx" %>
<%@ Register Tagprefix="dwuc" TagName="Step2" src="WizardCustomizeChartStep2.ascx" %>
<%@ Register Tagprefix="dwuc" TagName="Step3" src="WizardCustomizeChartStep3.ascx" %>
<%--MWC: TODO: REGDIRECTIVE: (dcwc, System.Web.UI.DataVisualization.Charting, System.Web.DataVisualization) --%>
<%@ Register Tagprefix="dcwc" Namespace="System.Web.UI.DataVisualization.Charting" Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>

<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:Content id="Content1" contentplaceholderid="PlaceHolderPageTitle" runat="server">
    <asp:Literal id="litPageTitle" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_litPageTitle_Text%>" runat="server" />
</asp:Content>

<asp:Content id="Content2" contentplaceholderid="PlaceHolderPageTitleInTitleArea" runat="server">
    <asp:Literal id="litPageTitleInTitleArea" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_litPageTitleInTitleArea_Text%>" runat="server" />
</asp:Content>
<%--MWC--%>
<%--<asp:Content ID="ContentMenuIcon" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
	<script type="text/javascript">displayPNGImage("img1","images/WizardCustomizeChartHeader.png",150,70,"");</script>
</asp:Content>--%>

<asp:Content id="Content3" contentplaceholderid="PlaceHolderLeftNavBar" runat="server">

<div class="ms-quicklaunchouter">
<div class="ms-quickLaunch" style="width:100%;vertical-align:top;">
<div>
	<table class="ms-navSubMenu1" cellpadding="0" cellspacing="0" border="0">
	<tr><td>
		<table class="ms-navheader" cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr><td>
				<b><asp:Literal id="litNavTitle" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_litNavTitle_Text%>" runat="server" /></b>
		</td></tr>
		</table>
	</td></tr>
	<tr><td>
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="ms-navSubMenu2">
		<tr><td>
			<asp:TreeView id="treeNavigation" runat="server" imageset="MSDN" NodeWrap="true">
			<SelectedNodeStyle verticalpadding="4" horizontalpadding="3" cssclass="ms-navselected" font-bold="true"></SelectedNodeStyle>
			<NodeStyle verticalpadding="4" horizontalpadding="3" cssclass="ms-navitem"></NodeStyle>
			<Nodes>
				<asp:TreeNode value="1-0" selected="true" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step1%>">
					<asp:TreeNode value="1-1" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step11%>"></asp:TreeNode>
					<asp:TreeNode value="1-2" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step12%>"></asp:TreeNode>
				</asp:TreeNode>
				<asp:TreeNode value="2-0" expanded="false" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step2%>">
					<asp:TreeNode value="2-1" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step21%>"></asp:TreeNode>
					<asp:TreeNode value="2-3" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step23%>"></asp:TreeNode>
				</asp:TreeNode>
				<asp:TreeNode value="3-0" expanded="false" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step3%>">
					<asp:TreeNode value="3-1" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step31%>"></asp:TreeNode>
					<asp:TreeNode value="3-2" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step32%>"></asp:TreeNode>
					<asp:TreeNode value="3-3" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step33%>"></asp:TreeNode>
					<asp:TreeNode value="3-4" text="<%$Resources:mosschart,wizardCustomizeChart_aspx_treeNavigation_Step34%>"></asp:TreeNode>
				</asp:TreeNode>
			</Nodes>
			</asp:TreeView>
		</td></tr>
		</table>
	</td></tr>
	</table>
</div>
</div>
</div>
</asp:Content>

<asp:Content id="Content4" contentplaceholderid="PlaceHolderMain" runat="server">

		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr style="vertical-align:top;">
			<td style="width:100%">
				<dwuc:Step1 id="step1" runat="server" />
				<dwuc:Step2 id="step2" runat="server" />
				<dwuc:Step3 id="step3" runat="server" />        
			</td>
        </tr>
        </table>
        <br />

	    <!--OK and Cancel buttons-->	    
	    <wssuc:ButtonSection runat="server" showstandardcancelbutton="false">
		    <Template_Buttons>
<%-- MWC: Beta1Fix: HelpLinkRemoved                 <dsu:ChartHelpButton id="helpButtonMain" NavigateUrl="<%$Resources:mosschart,wizardCustomizeChart_aspx_helpButtonMain_NavigateUrl%>" Value="<%$Resources:mosschart,wizardCustomizeChart_aspx_helpButtonMain_Value%>" runat="server" class="ms-ButtonHeightWidth" /> --%>
			    <asp:Button id="buttonPrevious" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_buttonPrevious_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth" CausesValidation="false"/>
			    <asp:Button id="buttonNext" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_buttonNext_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth" />
			    <asp:Button id="buttonOK" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_buttonOK_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth" />
			    <asp:Button id="buttonCancel" Text="<%$Resources:mosschart,wizardCustomizeChart_aspx_buttonCancel_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth" CausesValidation="false" />
		    </Template_Buttons>
	    </wssuc:ButtonSection>

</asp:Content>
