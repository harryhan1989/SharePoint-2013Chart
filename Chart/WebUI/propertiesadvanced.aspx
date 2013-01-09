<%@ Assembly Name="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page language="C#" MasterPageFile="~/_layouts/15/seattle.master" EnableSessionState="True" EnableEventValidation="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.PropertiesAdvancedPage,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwuc" TagName="AdvancedProperties" src="PropertiesAdvanced.ascx" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:Content id="Content1" contentplaceholderid="PlaceHolderPageTitle" runat="server">
    <asp:Literal id="litPageTitle" Text="<%$Resources:mosschart,propertiesAdvanced_aspx_litPageTitle_Text%>" runat="server" />
</asp:Content>

<asp:Content id="Content2" contentplaceholderid="PlaceHolderPageTitleInTitleArea" runat="server">
    <asp:Literal id="litPageTitleInTitleArea" Text="<%$Resources:mosschart,propertiesAdvanced_aspx_litPageTitleInTitleArea_Text%>" runat="server" />
</asp:Content>
<%--MWC--%>
<%--<asp:Content ID="ContentMenuIcon" ContentPlaceHolderID="PlaceHolderPageImage" runat="server">
	<script type="text/javascript">displayPNGImage("img1","images/WizardAdvancedPropertiesHeader.png",150,70,"");</script>
</asp:Content>
--%>
<asp:Content id="Content3" contentplaceholderid="PlaceHolderLeftNavBar" runat="server">
    <div class="ms-quicklaunchouter">
        <div class="ms-quickLaunch" style="width: 100%; vertical-align: top;">
            <div>
                <table class="ms-navSubMenu1" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table class="ms-navheader" cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td nowrap="nowrap">
                                        <b>
                                            <asp:Literal id="litNavTitle" Text="<%$Resources:mosschart,propertiesAdvanced_aspx_litNavTitle_Text%>" runat="server" />
                                         </b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="ms-navSubMenu2">
                                <tr>
                                    <td>
                                        <asp:TreeView id="treeViewChartProperties" runat="server" imageset="MSDN">
                                            <SelectedNodeStyle verticalpadding="4px" horizontalpadding="3px" cssclass="ms-navselected" font-bold="True"></SelectedNodeStyle>
                                            <NodeStyle verticalpadding="4px" horizontalpadding="3px" cssclass="ms-navitem"></NodeStyle>
                                            <Nodes>
                                                <asp:TreeNode expanded="True" selected="True" text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart%>" value="Chart">
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_Annotations%>" value="Annotations"></asp:TreeNode>
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_ChartAreas%>" value="ChartAreas"></asp:TreeNode>
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_Legends%>" value="Legends"></asp:TreeNode>
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_Series%>" value="Series"></asp:TreeNode>
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_Titles%>" value="Titles"></asp:TreeNode>
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_Toolbar%>" value="UI.Toolbar"></asp:TreeNode>
                                                    <asp:TreeNode text="<%$Resources:mosschart,propertiesAdvanced_aspx_treeViewChartProperties_Chart_ContextMenu%>" value="UI.ContextMenu"></asp:TreeNode>
                                                </asp:TreeNode>
                                            </Nodes>
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content id="Content4" contentplaceholderid="PlaceHolderMain" runat="server">
    <dwuc:AdvancedProperties id="advancedProperties" runat="server" />
    <!--OK and Cancel buttons-->
    <wssuc:ButtonSection runat="server" showstandardcancelbutton="false">
        <template_buttons>
<%-- MWC: Beta1Fix: HelpLinkRemoved 	        <dsu:ChartHelpButton ID="helpButtonMain" NavigateUrl="<%$Resources:mosschart,propertiesAdvanced_aspx_helpButtonMain_NavigateUrl%>" Value="<%$Resources:mosschart,propertiesAdvanced_aspx_helpButtonMain_Value%>" runat="server" class="ms-ButtonHeightWidth" /> --%>
		    <asp:Button ID="buttonOK" Text="<%$Resources:mosschart,propertiesAdvanced_aspx_buttonOK_Text%>"  UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="buttonOK_Click" />
			<asp:Button id="buttonCancel" Text="<%$Resources:mosschart,propertiesAdvanced_aspx_buttonCancel_Text%>"  UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="buttonCancel_Click" CausesValidation="false" />
        </template_buttons>
    </wssuc:ButtonSection>
</asp:Content>
