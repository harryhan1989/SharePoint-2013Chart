<%@ Assembly Name="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="~/_layouts/15/seattle.master" EnableSessionState="True" EnableEventValidation="False"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardConnectToDataPage,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dwuc" TagName="Step1" src="WizardConnectToDataStep1.ascx" %>
<%@ Register Tagprefix="dwuc" TagName="Step2" src="WizardConnectToDataStep2.ascx" %>
<%@ Register Tagprefix="dwuc" TagName="Step3" src="WizardConnectToDataStep3.ascx" %>
<%@ Register Tagprefix="dwuc" TagName="Step4" src="WizardConnectToDataStep4.ascx" %>
<%--MWC: TODO: REGDIRECTIVE: (dcwc, System.Web.UI.DataVisualization.Charting, System.Web.DataVisualization) --%>
<%@ Register Tagprefix="dcwc" Namespace="System.Web.UI.DataVisualization.Charting" Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %> 

<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:Content id="Content1" contentplaceholderid="PlaceHolderPageTitle" runat="server">
    <asp:Literal id="litPageTitle" Text="<%$Resources:mosschart,wizardConnectToData_aspx_litPageTitle_Text%>" runat="server" />
</asp:Content>

<asp:Content id="Content2" contentplaceholderid="PlaceHolderPageTitleInTitleArea" runat="server">
    <asp:Literal id="litPageTitleInTitleArea" Text="<%$Resources:mosschart,wizardConnectToData_aspx_litPageTitleInTitleArea_Text%>" runat="server" />
</asp:Content>
<%--MWC--%>
<%--<asp:Content ID="ContentMenuIcon" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
	<script type="text/javascript">displayPNGImage("WizardConnectToDataHeader","images/WizardConnectToDataHeader.png",150,70,"");</script>
</asp:Content>--%>

<asp:Content id="Content3" contentplaceholderid="PlaceHolderLeftNavBar" runat="server">
<div class="ms-quicklaunchouter">
<div class="ms-quickLaunch" style="width:100%;vertical-align:top;">
<div>
	<table class="ms-navSubMenu1" cellpadding="0" cellspacing="0" border="0">
	<tr><td>
        <table class="ms-navheader" cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr><td>
				<b><asp:literal ID="litNavTitle" Text="<%$Resources:mosschart,wizardConnectToData_aspx_litNavTitle_Text%>" runat="server" /></b>
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
				<asp:TreeNode value="1-0" selected="true" text="<%$Resources:mosschart,wizardConnectToData_aspx_treeNavigation_Step1%>">
				</asp:TreeNode>
				<asp:TreeNode value="2-0" expanded="false" text="<%$Resources:mosschart,wizardConnectToData_aspx_treeNavigation_Step2%>">
				</asp:TreeNode>
				<asp:TreeNode value="3-0" expanded="false" text="<%$Resources:mosschart,wizardConnectToData_aspx_treeNavigation_Step3%>">
				</asp:TreeNode>
				<asp:TreeNode value="4-0" expanded="false" text="<%$Resources:mosschart,wizardConnectToData_aspx_treeNavigation_Step4%>">
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

		<asp:panel id="pnlSteps" runat="server">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<tr style="vertical-align:top;">
				<td style="width:100%">
					<dwuc:Step1 id="step1" runat="server" />
                    <dwuc:Step2 id="step2" runat="server" />
                    <dwuc:Step3 id="step3" runat="server" />
                    <dwuc:Step4 id="step4" runat="server" />
                </td>
			</tr>
			</table>

			<!--OK and Cancel buttons-->	    
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<wssuc:ButtonSection runat="server" showstandardcancelbutton="false">
				<Template_Buttons>
<%-- MWC: Beta1Fix: HelpLinkRemoved                     <dsu:ChartHelpButton id="helpButtonMain" NavigateUrl="<%$Resources:mosschart,wizardConnectToData_aspx_helpButtonMain_NavigateUrl%>" Value="<%$Resources:mosschart,wizardConnectToData_aspx_helpButtonMain_Value%>" runat="server" class="ms-ButtonHeightWidth" /> --%>
					<asp:Button id="buttonPrevious" Text="<%$Resources:mosschart,wizardConnectToData_aspx_buttonPrevious_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth" causesvalidation="false"/>
					<asp:Button id="buttonNext" Text="<%$Resources:mosschart,wizardConnectToData_aspx_buttonNext_Text%>" usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth"  />
					<asp:Button id="buttonOK" Text="<%$Resources:mosschart,wizardConnectToData_aspx_buttonOK_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth"  />
					<asp:Button id="buttonCancel" Text="<%$Resources:mosschart,wizardConnectToData_aspx_buttonCancel_Text%>"  usesubmitbehavior="false" runat="server" class="ms-ButtonHeightWidth" causesvalidation="false" />
				</Template_Buttons>
			</wssuc:ButtonSection>
			</table>
		</asp:panel>

	    <asp:panel id="pnlProgress" runat="server">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet">
			<tr valign="top"><td class="ms-descriptiontext" width="100%">
                <asp:Literal id="litHeader" Text="<%$Resources:mosschart,wizardConnectToData_aspx_litHeader_Text%>" runat="server" />
				<br/><br/>
				<iframe id="" src="progress.htm" frameborder="0" style="border-style:none;width:100px;height:100px"></iframe>			
			</td></tr></table>
		</asp:panel>

	    <script type="text/javascript" language="javascript">
function ULSFVj(){var o=new Object;o.ULSTeamName="Windows SharePoint Services 4";o.ULSFileName="wizardConnectToData.aspx";return o;}
			function ShowProgress(){ULSFVj:;
				var divSteps = document.getElementById('<%=pnlSteps.ClientID%>');
				var divProgress = document.getElementById('<%=pnlProgress.ClientID%>');
				divSteps.style.display = "none";
				divProgress.style.display = "block";				
			}
	    </script>
	    <asp:Literal id="litJScript" runat="server" enableviewstate="false" />

</asp:Content>
