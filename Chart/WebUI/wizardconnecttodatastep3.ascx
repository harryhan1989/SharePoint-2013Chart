<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardConnectToDataStep3,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="ctl" TagName="DataParameters" src="controls/DataParameters.ascx"%> 

<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<!--WebPart-->
<asp:PlaceHolder id="pnlWebPart" runat="server">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderWebPart" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litHeaderWebPart_Text%>" runat="server" />
	</td></tr></table>
	<br />

	<asp:ValidationSummary id="valSummaryWebPart" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;" 
	    enableclientscript="true" displaymode="BulletList" showsummary="true" />
	<asp:CustomValidator id="valcustDataSourceWebPart" runat="server" display="None" />

	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<wssuc:InputFormSection id="sectionWebPart" Description="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionWebPart_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionWebPart_Title%>" collapsible="true" runat="server">
			<Template_InputFormControls>				
				<tr>
					<td class="ms-authoringcontrols" colspan="3">
						<asp:Literal id="litWebPartInterfaces" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litWebPartInterfaces_Text%>" runat="server" /><br />
					</td>
				</tr>
				<tr>
					<td class="ms-authoringcontrols" colspan="2">
						<asp:DropDownList id="ddlWebPartInterfaces" runat="server" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><img alt="" src="images/spacer.gif" width="1" height="50" /></td>
					<td></td>
				</tr>

			</Template_InputFormControls>
		</wssuc:InputFormSection>			
	</table>
</asp:placeholder>

<!--WebList-->
<asp:placeholder ID="pnlWebList" runat="server">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderWebList" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litHeaderWebList_Text%>" runat="server" />
	</td></tr></table>
	<br />

	<asp:ValidationSummary id="valSummaryWebList" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;" 
	    enableclientscript="true" displaymode="BulletList" showsummary="true" />
	<asp:CustomValidator id="valcustDataSourceWebList" runat="server" display="None" />

	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<asp:PlaceHolder id="pnlWebListParameters" runat="server">
		<wssuc:InputFormSection id="sectionWebList" Description="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionWebList_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionWebList_Title%>" collapsible="true" collapsed="true" runat="server">
			<Template_InputFormControls>				
				<tr valign="top">
					<td class="ms-authoringcontrols" style="padding-top:5px;">
						<asp:Literal id="litWebListParameters" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litParameters_Text%>" runat="server" /><br />
					</td>
				</tr>
				<tr>
					<td  class="ms-authoringcontrols" colspan="95%">
						<ctl:DataParameters id="ctlWebListParameters" runat="server" />
					</td>
				</tr>
				<tr><td colspan="3">&nbsp;</td></tr>			
				<tr>
					<td>&nbsp;</td>
					<td class="ms-authoringcontrols">
						<asp:button id="btnWebListRun" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_btnWebListRun_Text%>" runat="server" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="35%"><img alt="" src="images/spacer.gif" width="110" height="1" /></td>
					<td width="60%"><img alt="" src="images/spacer.gif" width="200" height="1" /></td>
					<td width="5%"><img alt="" src="images/spacer.gif" width="20" height="1" /></td>
				</tr>					
		</Template_InputFormControls>
		</wssuc:InputFormSection>	
		</asp:PlaceHolder>

		<tr>		
			<td colspan="2">
				<style type="text/css">
					.wiz_grid_Header td {color: #6c6c6c; background-color:#ebebeb; border-top:solid 1px #ebebeb; border-bottom:solid 1px #d9d9d9; border-left:solid 1px #ebebeb; border-right:solid 1px #ebebeb; font-weight: bold;}
					.wiz_grid_Item td {color: black; background-color:white; border-top:solid 1px #d9d9d9; border-bottom:solid 1px #d9d9d9; border-left:solid 1px white; border-right:solid 1px white; font-weight: normal;}
				</style>
				<div style="height:200; width:100%; background-color:White; overflow:auto;">
					<asp:DataGrid id="dbgWebListDataPreview" runat="server" borderstyle="None" font-size="9pt" backcolor="Silver" width="100%" cellpadding="1" cellspacing="0" OnItemDataBound="ColumnGridOnItemDataBound">
                        <HeaderStyle cssclass="ms-authoringcontrols wiz_grid_Header" />
                        <ItemStyle cssclass="ms-authoringcontrols wiz_grid_Item" />
                    </asp:DataGrid>
				</div>		
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-authoringcontrols wiz_grid_Header" style="padding:1px 1px 1px 1px" width="100%">
		<asp:Literal id="litWebListRecordCount" runat="server" />
	</td></tr></table>
</asp:PlaceHolder>

<!--BDC-->
<asp:PlaceHolder id="pnlBdc" runat="server">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderBdc" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litHeaderBdc_Text%>" runat="server" />
	</td></tr></table>
	<br />

	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<asp:PlaceHolder id="pnlBdcParameters" runat="server">
		<wssuc:InputFormSection id="sectionBdc" Description="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionBdc_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionBdc_Title%>" collapsible="true" collapsed="true" runat="server">
			<Template_InputFormControls>				
				<tr valign="top">
					<td class="ms-authoringcontrols" style="padding-top:5px;">
						<asp:Literal id="litBdcParameters" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litParameters_Text%>" runat="server" /><br />
					</td>
				</tr>
				<tr>
					<td  class="ms-authoringcontrols" colspan="95%">
						<ctl:DataParameters id="ctlBdcParameters" runat="server" />
					</td>
				</tr>
				<tr><td colspan="3">&nbsp;</td></tr>			
				<tr>
					<td>&nbsp;</td>
					<td class="ms-authoringcontrols">
						<asp:button id="btnBdcRun" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_btnBdcRun_Text%>" runat="server" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="35%"><img alt="" src="images/spacer.gif" width="110" height="1" /></td>
					<td width="60%"><img alt="" src="images/spacer.gif" width="200" height="1" /></td>
					<td width="5%"><img alt="" src="images/spacer.gif" width="20" height="1" /></td>
				</tr>					
		</Template_InputFormControls>
		</wssuc:InputFormSection>	
		</asp:PlaceHolder>

		<tr><style type="text/css"></style>		
			<td colspan="2">
				<style type="text/css">
					.wiz_grid_Header td {color: #6c6c6c; background-color:#ebebeb; border-top:solid 1px #ebebeb; border-bottom:solid 1px #d9d9d9; border-left:solid 1px #ebebeb; border-right:solid 1px #ebebeb; font-weight: bold;}
					.wiz_grid_Item td {color: black; background-color:white; border-top:solid 1px #d9d9d9; border-bottom:solid 1px #d9d9d9; border-left:solid 1px white; border-right:solid 1px white; font-weight: normal;}
				</style>
				<div style="height:200; width:100%; background-color:White; overflow:auto;">
					<asp:DataGrid id="dbgBdcDataPreview" runat="server" borderstyle="None" font-size="9pt" backcolor="Silver" width="100%" cellpadding="1" cellspacing="0" OnItemDataBound="ColumnGridOnItemDataBound">
						<HeaderStyle CssClass="ms-authoringcontrols wiz_grid_Header"/>
						<ItemStyle CssClass="ms-authoringcontrols wiz_grid_Item"/>
					</asp:DataGrid>
				</div>		
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-authoringcontrols wiz_grid_Header" style="padding:1px 1px 1px 1px" width="100%">
		<asp:Literal id="litBdcRecordCount" runat="server" />
	</td></tr></table>
</asp:PlaceHolder>

<!--Excel services-->
<asp:PlaceHolder id="pnlExcelServices" runat="server">

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderExcelServices" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litHeaderExcelServices_Text%>" runat="server" />
	</td></tr></table>
	<br />

	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<asp:PlaceHolder id="pnlExcelServicesParameters" runat="server">
		<wssuc:InputFormSection id="sectionExcelServices" Description="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionExcelServices_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_sectionExcelServices_Title%>" collapsible="true" collapsed="true" runat="server">
			<Template_InputFormControls>				
				<tr>
					<td class="ms-authoringcontrols" style="padding-top:5px;">
						<asp:Literal id="litExcelServicesParameters" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_litParameters_Text%>" runat="server" /><br />
					</td>
				</tr>
				<tr>
					<td  class="ms-authoringcontrols" colspan="95%">
						<ctl:DataParameters id="ctlExcelServicesParameters" runat="server" />
					</td>
				</tr>
				<tr><td colspan="3">&nbsp;</td></tr>			
				<tr>
					<td>&nbsp;</td>
					<td class="ms-authoringcontrols">
						<asp:button id="btnExcelServicesRun" Text="<%$Resources:mosschart,wizardConnectToDataStep3_ascx_btnExcelServicesRun_Text%>" runat="server" />
					</td>
					<td></td>
				</tr>
				<tr>
					<td width="35%"><img alt="" src="images/spacer.gif" width="110" height="1" /></td>
					<td width="60%"><img alt="" src="images/spacer.gif" width="200" height="1" /></td>
					<td width="5%"><img alt="" src="images/spacer.gif" width="20" height="1" /></td>
				</tr>					
		</Template_InputFormControls>
		</wssuc:InputFormSection>	
		</asp:PlaceHolder>
		<tr>
			<td colspan="2">
				<style type="text/css">
					.wiz_grid_Header td {color: #6c6c6c; background-color:#ebebeb; border-top:solid 1px #ebebeb; border-bottom:solid 1px #d9d9d9; border-left:solid 1px #ebebeb; border-right:solid 1px #ebebeb; font-weight: bold;}
					.wiz_grid_Item td {color: black; background-color:white; border-top:solid 1px #d9d9d9; border-bottom:solid 1px #d9d9d9; border-left:solid 1px white; border-right:solid 1px white; font-weight: normal;}
				</style>
				<div style="height:200; width:100%; background-color:White; overflow:auto;">
					<asp:DataGrid ID="dbgExcelServicesDataPreview" runat="server" BorderStyle="None" Font-Size="9pt" BackColor="Silver" Width="100%" CellPadding="1" CellSpacing="0" OnItemDataBound="ColumnGridOnItemDataBound">
						<HeaderStyle CssClass="ms-authoringcontrols wiz_grid_Header"/>
						<ItemStyle CssClass="ms-authoringcontrols wiz_grid_Item"/>
					</asp:DataGrid>
				</div>		
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-authoringcontrols wiz_grid_Header" style="padding:1px 1px 1px 1px" width="100%">
		<asp:Literal id="litExcelServicesRecordCount" runat="server" />
	</td></tr></table>
</asp:PlaceHolder>

