<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardCustomizeChartStep3,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="ctl" TagName="ChartPreview" Src="Controls/ChartPreview.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesTitle" Src="Controls/PropertiesTitle.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesLegend" Src="Controls/PropertiesLegend.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesAxis" Src="Controls/PropertiesAxis.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesDataLabel" Src="Controls/PropertiesDataLabel.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesDataMarker" Src="Controls/PropertiesDataMarker.ascx" %>
<%@ Register TagPrefix="ctl" TagName="PropertiesInteractivitySeries" Src="Controls/PropertiesInteractivitySeries.ascx" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
	<asp:Literal id="litHeader" Text="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_litHeader_Text%>" runat="server" />
</td></tr></table>
<br />

<dwu:ImageTabList id="tablistMain" resourcekey="tablistMain" imageurlformat="Images/Icon{0}.gif" width="100%" divclientidformatstring="tabDivStep3_{0}" runat="server">
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_tablistMain_TitlesAndLegend%>" selected="true" value="1"></dwu:ImageListItem>
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_tablistMain_AxesAndGridlines%>" value="2"></dwu:ImageListItem>
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_tablistMain_DataLabelsAndMarkers%>" value="3"></dwu:ImageListItem>
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_tablistMain_InteractivityFeatures%>" value="4"></dwu:ImageListItem>
</dwu:ImageTabList>

<br />

<table cellpadding="0" border="0" style="width:100%">
<tr style="vertical-align:top;">
	<td style="width:100%;padding-right:40px;">

		<div id="tabDivStep3_1"  style="display:none;">

			<table class=ms-propertysheet border="0" style="width:100%;" cellspacing="0" cellpadding="0">
				<wssuc:InputFormSection id="sectionTitles" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionTitles_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionTitles_Title%>" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesTitle id="ctlTitleProperties" runat="server" />							

					</Template_InputFormControls>
				</wssuc:InputFormSection>			
			</table>			
			<table class=ms-propertysheet border="0" style="width:100%;" cellspacing="0" cellpadding="0">
				<wssuc:InputFormSection id="sectionLegend" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionLegend_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionLegend_Title%>" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesLegend id="ctlLegendProperties" runat="server" />

					</Template_InputFormControls>
				</wssuc:InputFormSection>			
			</table>				
		</div>		
		<div id="tabDivStep3_2"  style="display:none;">
			<table class=ms-propertysheet border="0" style="width:100%;" cellspacing="0" cellpadding="0">
				<wssuc:InputFormSection id="sectionXAxis" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionXAxis_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionXAxis_Title%>" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesAxis id="ctlXAxisProperties" runat="server" />

					</Template_InputFormControls>
				</wssuc:InputFormSection>

				<wssuc:InputFormSection id="sectionYAxis" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionYAxis_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionYAxis_Title%>" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesAxis id="ctlYAxisProperties" runat="server" />

					</Template_InputFormControls>
				</wssuc:InputFormSection>

				<wssuc:InputFormSection id="sectionX2Axis" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionX2Axis_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionX2Axis_Title%>" collapsed="true" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesAxis id="ctlX2AxisProperties" runat="server" />

					</Template_InputFormControls>
				</wssuc:InputFormSection>				
				<wssuc:InputFormSection id="sectionY2Axis" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionY2Axis_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionY2Axis_Title%>" collapsed="true" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesAxis id="ctlY2AxisProperties" runat="server" />

					</Template_InputFormControls>
				</wssuc:InputFormSection>
			</table>
		</div>		
		<div id="tabDivStep3_3"  style="display:none;">
			<table class=ms-propertysheet border="0" style="width:100%;" cellspacing="0" cellpadding="0">
				<wssuc:InputFormSection id="sectionDataLabel" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionDataLabel_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionDataLabel_Title%>" Collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesDataLabel id="ctlDataLabelProperties" runat="server" />

						<tr>
							<td>&nbsp;</td>
							<td><img alt="" src="images/spacer.gif" width="250" height="20" /></td>
						</tr>
					</Template_InputFormControls>
				</wssuc:InputFormSection>

				<wssuc:InputFormSection id="sectionDataMarker" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionDataMarker_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionDataMarker_Title%>" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesDataMarker id="ctlDataMarkerProperties" runat="server" />

						<tr>
							<td>&nbsp;</td>
							<td><img alt="" src="images/spacer.gif" width="250" height="20" /></td>
						</tr>
					</Template_InputFormControls>
				</wssuc:InputFormSection>

			</table>
		</div>		
		<div id="tabDivStep3_4"  style="display:none;">
			<table class=ms-propertysheet border="0" style="width:100%;" cellspacing="0" cellpadding="0">
				<wssuc:InputFormSection id="sectionInteractivitySeries" Description="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionInteractivitySeries_Description%>" Title="<%$Resources:mosschart,wizardCustomizeChartStep3_ascx_sectionInteractivitySeries_Title%>" collapsible="true" runat="server">
					<Template_InputFormControls>				

						<ctl:PropertiesInteractivitySeries id="ctlSeriesInteractivityProperties" runat="server" />

						<tr>
							<td>&nbsp;</td>
							<td><img alt="" src="images/spacer.gif" width="250" height="20" /></td>
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
					<ctl:ChartPreview id="ctlChartPreview" Width="200" Height="200" runat="server" />
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
