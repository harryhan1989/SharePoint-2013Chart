<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardCustomizeChartStep2,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="ctl" TagName="ChartPreview" Src="Controls/ChartPreview.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesTheme" Src="Controls/PropertiesTheme.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesBackground" Src="Controls/PropertiesBackground.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesSizeType" Src="Controls/PropertiesSizeType.ascx" %>
<%@ Register TagPrefix="ctl" TagName="Properties3D" Src="Controls/Properties3D.ascx" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
	<asp:Literal id="litHeader" Text="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_litHeader_Text%>" runat="server" />
</td></tr></table>
<br />
<dwu:ImageTabList id="tablistMain" resourcekey="tablistMain" imageurlformat="Images/Icon{0}.gif" width="100%" divclientidformatstring="tabDivStep2_{0}" runat="server">
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_tablistMain_Themes%>" selected="true" value="1"></dwu:ImageListItem>
	<%%>
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_tablistMain_3DEffects%>" value="3"></dwu:ImageListItem>
</dwu:ImageTabList>

<br />
<table cellpadding="0" border="0" style="width:100%">
<tr style="vertical-align:top;">
	<td style="width:100%;padding-right:40px;">

		<div id="tabDivStep2_1"  style="display:none;">

		<table class=ms-propertysheet border="0" style="width:100%;" cellspacing="0" cellpadding="0">
			<wssuc:InputFormSection id="sectionTheme" Description="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_sectionTheme_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_sectionTheme_Title%>" collapsible="true" runat="server">
				<Template_InputFormControls>				

					<ctl:PropertiesTheme id="ctlThemeProperties" runat="server" />

					<tr>
						<td>&nbsp;</td>
						<td><img alt="" src="images/spacer.gif" width="1" height="20" /></td>
					</tr>

				</Template_InputFormControls>
			</wssuc:InputFormSection>			

			<wssuc:InputFormSection id="sectionSizeType" Description="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_sectionSizeType_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_sectionSizeType_Title%>" collapsible="true" runat="server">
				<Template_InputFormControls>				

					<ctl:PropertiesSizeType id="ctlSizeTypeProperties" runat="server" />

					<tr>
						<td>&nbsp;</td>
						<td><img alt="" src="images/spacer.gif" width="1" height="20" /></td>
					</tr>

				</Template_InputFormControls>
			</wssuc:InputFormSection>			
		</table>			

		</div>		

		<%

%>	

		</div>		

		<div id="tabDivStep2_3" style="display:none;">

		<table class=ms-propertysheet border="0" width="100%" cellspacing="0" cellpadding="0">
			<wssuc:InputFormSection id="section3DProperties" Description="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_section3DProperties_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep2_ascx_section3DProperties_Title%>" collapsible="true" runat="server">
				<Template_InputFormControls>				

					<ctl:Properties3D id="ctl3DProperties" runat="server" />

					<tr>
						<td>&nbsp;</td>
						<td><img alt="" src="images/spacer.gif" width="1" height="100" /></td>
					</tr>

				</Template_InputFormControls>
			</wssuc:InputFormSection>			
			</table>
		</div>		
	</td>
	<td style="width:150px">
		<table class="ms-vh2">
			<tr>
				<td style="padding:10px; text-align:center;" >
					<ctl:ChartPreview id="ctlChartPreview" width="200" height="200" runat="server" />
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>

