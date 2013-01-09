<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardConnectToDataStep4,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="ctl" TagName="Binding" src="Controls/Binding.ascx"%> 

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
	<asp:Literal id="litHeader" Text="<%$Resources:mosschart,wizardConnectToDataStep4_ascx_litHeader_Text%>" runat="server" />	
	<asp:Literal id="litHeaderJump" Text="<%$Resources:mosschart,wizardConnectToDataStep4_ascx_litHeaderJump_Text%>" runat="server" visible="false" />	
</td></tr></table>
<br />

<asp:ValidationSummary id="valSummary" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep4_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;"
    displaymode="BulletList" font-bold="true" showsummary="true" />

<style type="text/css">
	.helpTd { padding-top: 14px;}
</style>

<ctl:Binding id="ctlChartBinding" runat="server" />

