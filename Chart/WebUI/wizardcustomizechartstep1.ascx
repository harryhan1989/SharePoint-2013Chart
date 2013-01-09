<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardCustomizeChartStep1,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="ctl" TagName="ChartPreview" Src="Controls/ChartPreview.ascx" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
    <asp:Literal id="litHeader" Text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_litHeader_Text%>" runat="server" />
</td></tr></table>
<br />

<dwu:ImageTabList id="tablistMain" resourcekey="tablistMain" imageurlformat="Images/Icon{0}.gif" width="100%" divclientidformatstring="tabDivStep1_{0}" runat="server">
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_tablistMain_Standard%>" selected="True" value="1"></dwu:ImageListItem>
	<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_tablistMain_Custom%>" value="2"></dwu:ImageListItem>
</dwu:ImageTabList>

<br />

<div id="tabDivStep1_1">
	<table cellpadding="0" cellspacing="0" border=0>
		<tr align=left valign=middle>
			<td  class="ms-sectionheader">
				<h3 class="ms-standardheader"><asp:Literal id="litCategoriesStandard" Text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_litCategories_Text%>" runat="server" /></h3>
			</td>
			<td>&nbsp;</td>
			<td  class="ms-sectionheader">
				<h3 class="ms-standardheader"><asp:Literal id="litTemplatesStandard" Text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_litTemplates_Text%>" runat="server" /></h3>
			</td>
			<td align="right">
				<dwu:ImageTabList id="tablistStandardDimesions" resourcekey="tablistDimesions" imageurlformat="Images/Icon{0}.gif" divclientidformatstring="tabDivStandardDimension_{0}" runat="server">
					<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_tablistDimesions_All%>" value="1"></dwu:ImageListItem>
					<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_tablistDimesions_2D%>" value="2"></dwu:ImageListItem>
					<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_tablistDimesions_3D%>" value="3"></dwu:ImageListItem>
				</dwu:ImageTabList>				
			</td>
		</tr>
		<tr align=left>
			<td>
				<dwu:ImageListBox id="listboxStandardCategory" runat="server" autopostback="true" 
				    datatextfield="text" datavaluefield="value" dataimageurlfield="value" imageurlformat="Images/Templates/Standard/Category_{0}.gif" width="200px" height="280px" browsertheme="WinXP" />
			</td>
			<td>&nbsp;</td>
			<td colspan=2>
				<div id="tabDivStandardDimension_1" style="display:none;">
					<dwu:ImageListView id="listviewStandardTemplateAll" runat="server" columns="3" 
					    datatextfield="text" datavaluefield="value" dataimageurlfield="value" 
					    imageurlformat="Images/Templates/Standard/Template_{0}.png" 
					    width="490px" height="280px" browsertheme="WinXP" />
				</div>
				<div id="tabDivStandardDimension_2" style="display:none;">
					<dwu:ImageListView id="listviewStandardTemplate2D" runat="server" columns="3" 
					    datatextfield="text" datavaluefield="value" dataimageurlfield="value" 
					    imageurlformat="Images/Templates/Standard/Template_{0}.png" 
					    width="490px" height="280px" browsertheme="WinXP" />
				</div>
				<div id="tabDivStandardDimension_3" style="display:none;">
					<dwu:ImageListView id="listviewStandardTemplate3D" runat="server" columns="3" 
					    datatextfield="text" datavaluefield="value" dataimageurlfield="value" 
					    imageurlformat="Images/Templates/Standard/Template_{0}.png" 
					    width="490px" height="280px" browsertheme="WinXP" />
				</div>
			</td>
		</tr>
	</table>
</div>
<div id="tabDivStep1_2" style="display:none;">
	<table cellpadding="0" cellspacing="0" border=0>
		<tr align=left valign=middle>
			<td  class="ms-sectionheader">
				<h3 class="ms-standardheader"><asp:Literal id="litCategoriesCustom" Text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_litCategories_Text%>" runat="server" /></h3>
			</td>
			<td>&nbsp;</td>
			<td  class="ms-sectionheader">
				<h3 class="ms-standardheader"><asp:Literal id="litTemplatesCustom" Text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_litTemplates_Text%>" runat="server" /></h3>
			</td>
			<td align="right">
				<dwu:ImageTabList id="tablistCustomDimesions" resourcekey="tablistDimesions" imageurlformat="Images/Icon{0}.gif" divclientidformatstring="tabDivCustomDimension_{0}" runat="server">
					<dwu:ImageListItem text="<%$Resources:mosschart,wizardCustomizeChartStep1_ascx_tablistDimesions_All%>" value="1"></dwu:ImageListItem>
				</dwu:ImageTabList>				
			</td>
		</tr>
		<tr align=left>
			<td>
				<dwu:ImageListBox id="listboxCustomCategory" runat="server" autopostback="true" 
				    datatextfield="text" datavaluefield="value" dataimageurlfield="value" 
				    imageurlformat="Images/Templates/Custom/Category_{0}.gif" 
				    width="200px" height="280px" browsertheme="WinXP" />
			</td>
			<td>&nbsp;</td>
			<td colspan="2">
				<ctl:ChartPreview id="ctlChartPreview" width="150" height="90" runat="server" visible="false" />
				<div id="tabDivCustomDimension_1">
					<dwu:ImageListView id="listviewCustomTemplateAll" runat="server" columns="3" 
					    datatextfield="text" datavaluefield="value" dataimageurlfield="value" 
					    imageurlformat="Images/Templates/Custom/Template_{0}.png" 
					    width="490px" height="280px" browsertheme="WinXP" />
				</div>
			</td>
		</tr>
	</table>
</div>		
