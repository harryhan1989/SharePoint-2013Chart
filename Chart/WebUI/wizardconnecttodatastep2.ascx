<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardConnectToDataStep2,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<!-- MWC: Beta1Fix: BDCEntityPicker -->
<%@ Register Tagprefix="STSWC" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<asp:PlaceHolder id="pnlWebPart" runat="server">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderWebPart" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litHeaderWebPart_Text%>" runat="server" />
	</td></tr></table>
	<br />
	<br />
	<asp:ValidationSummary id="valSummaryWebPart" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;" 
	    displaymode="BulletList" font-bold="true" showsummary="true" />

	<asp:CustomValidator id="valcustNoWebParts" runat="server" ErrorMessage="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valcustNoWebParts_ErrorMessage%>" display="None" />

	<asp:PlaceHolder id="pnlWebPartDetails" runat="server">
	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<wssuc:InputFormSection id="sectionWebPart" Description="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionWebPart_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionWebPart_Title%>" collapsible="true" runat="server">
			<Template_InputFormControls>				
				<tr>
					<td width="40%">
						<img alt="" src="images/spacer.gif" width="150" height="1" />
					</td>
					<td width="55%">
						<img alt="" src="images/spacer.gif" width="300" height="1" />
					</td>
					<td width="5%">
						<img alt="" src="images/spacer.gif" width="20" height="1" />
					</td>
				</tr>
				<tr>
					<td class="ms-authoringcontrols" colspan="3">
						<asp:Literal id="litWebPartList" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litWebPartList_Text%>" runat="server" />
					</td>
				</tr>			
				<tr>
					<td class="ms-authoringcontrols" colspan="2">
						<asp:DropDownList id="ddlDataConnectionWebPart" runat="server" />
					</td>
				</tr>			
				<tr>
					<td>&nbsp;</td>
					<td><img alt="" src="images/spacer.gif" width="1" height="100" /></td>
					<td></td>
				</tr>

			</Template_InputFormControls>
		</wssuc:InputFormSection>			
	</table>			
	</asp:placeholder>	
</asp:placeholder>

<asp:PlaceHolder id="pnlWebList" runat="server">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderWebList" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litHeaderWebList_Text%>" runat="server" />
	</td></tr></table>
	<br />
	<br />
	<asp:ValidationSummary id="valSummaryWebList" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;" 
	    displaymode="BulletList" font-bold="true" showsummary="true" />

	<asp:CustomValidator id="valcustNoWebLists" runat="server" ErrorMessage="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valcustNoWebLists_ErrorMessage%>" display="None" />

	<asp:PlaceHolder id="pnlWebListDetails" runat="server">
	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<wssuc:InputFormSection id="sectionWebList" Description="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionWebList_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionWebList_Title%>" collapsible="true" runat="server">
			<Template_InputFormControls>				
				<tr>
					<td width="40%">
						<img alt="" src="images/spacer.gif" width="150" height="1" />
					</td>
					<td width="55%">
						<img alt="" src="images/spacer.gif" width="300" height="1" />
					</td>
					<td width="5%">
						<img alt="" src="images/spacer.gif" width="20" height="1" />
					</td>
				</tr>
				<tr>
					<td class="ms-authoringcontrols" colspan="3">
						<asp:Literal id="litWebSite" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litWebSite_Text%>" runat="server" />
					</td>
				</tr>			
				<tr>
					<td class="ms-authoringcontrols" colspan="2">
						<asp:DropDownList id="ddlDataWebSite" runat="server" autopostback="true"/>
					</td>
				</tr>			
				<tr>
					<td width="40%">
						<img alt="" src="images/spacer.gif" width="150" height="1" />
					</td>
					<td width="55%">
						<img alt="" src="images/spacer.gif" width="300" height="1" />
					</td>
					<td width="5%">
						<img alt="" src="images/spacer.gif" width="20" height="1" />
					</td>
				</tr>
				<tr>
					<td class="ms-authoringcontrols" colspan="3">
						<asp:Literal id="litWebList" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litWebList_Text%>" runat="server" />
					</td>
				</tr>			
				<tr>
					<td class="ms-authoringcontrols" colspan="2">
						<asp:DropDownList id="ddlDataWebList" runat="server" />
					</td>
				</tr>			
				<tr>
					<td>&nbsp;</td>
					<td><img alt="" src="images/spacer.gif" width="1" height="100" /></td>
					<td></td>
				</tr>
			</Template_InputFormControls>
		</wssuc:InputFormSection>			
	</table>			
	</asp:placeholder>	
</asp:placeholder>
<asp:PlaceHolder id="pnlBdc" visible="false" runat="server">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderBdc" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litHeaderBdc_Text%>" runat="server" />
	</td></tr></table>
	<br/><br/>
	<asp:ValidationSummary id="valSummaryBdc" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;" 
	    displaymode="BulletList" font-bold="true" showsummary="true" />

	<asp:CustomValidator id="valcustBdcException" runat="server" display="None" />
	<asp:CustomValidator id="valcustBdcIsEmpty" runat="server" ErrorMessage="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valcustBdcIsEmpty_ErrorMessage%>" display="None" />

	<asp:PlaceHolder id="pnlBdcDetails" runat="server">	
	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<wssuc:InputFormSection id="sectionBdc" Description="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionBdc_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionBdc_Title%>" collapsible="true" runat="server">
			<Template_InputFormControls>				
				<!--Entity-->
				<tr>
					<td class="ms-authoringcontrols">
						<asp:Literal id="litEntity" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litEntity_Text%>" runat="server" />
					</td>
					<td class="ms-authoringcontrols">
						<!-- MWC: Beta1Fix: BDCEntityPicker -->
						<!-- set the ValidatorEnabled property here, not in the code behind as it needs to be set before the base picker's OnInit() is called -->
                        <STSWC:EntityPicker id="entpick" ValidatorEnabled="true" AllowEmpty="false" Width="100%" runat="server"/>
					</td>
				</tr>	

				<!--Spacer-->
				<tr>
					<td colspan="3"><img src="images/spacer.gif" width="1" height="80" alt="" /></td>
				</tr>				

			</Template_InputFormControls>
		</wssuc:InputFormSection>			
	</table>	
	<script language="javascript" type="text/javascript">

    </script>
	</asp:PlaceHolder>		

</asp:PlaceHolder>

<asp:PlaceHolder id="pnlExcelServices" visible="false" runat="server">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
		<asp:Literal id="litHeaderExcelServices" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litHeaderExcelServices_Text%>" runat="server" />
	</td></tr></table>
	<br/><br/>
	<asp:ValidationSummary id="valSummaryExcelServices" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_valSummary_HeaderText%>" style="font-size: 10px; font-weight: bold; line-height: 10px;" 
	    displaymode="BulletList" font-bold="true" showsummary="true" />

	<asp:CustomValidator id="valcustExcelServices" runat="server" display="None" />

	<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
		<wssuc:InputFormSection id="sectionExcelServices" Description="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionExcelServices_Description%>" Title="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_sectionExcelServices_Title%>" collapsible="true" runat="server">
			<Template_InputFormControls>				
				<!--WebServiceUrl-->		
				<tr>
					<td class="ms-authoringcontrols">
						<asp:Literal id="litWebServiceUrl" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litWebServiceUrl_Text%>" runat="server" />
					</td>
					<td class="ms-authoringcontrols">
						<asp:textbox id="txtWebServiceUrl" runat="server" />
					</td>
				</tr>			
				<!--WorkbookUrl-->		
				<tr>
					<td class="ms-authoringcontrols">
						<asp:Literal id="litWorkbookUrl" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litWorkbookUrl_Text%>" runat="server" />
					</td>
					<td class="ms-authoringcontrols">
						<asp:TextBox id="txtWorkbookUrl" runat="server" />
					</td>
				</tr>			
				<!--RangeName-->		
				<tr>
					<td class="ms-authoringcontrols">
						<asp:Literal id="litRangeName" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litRangeName_Text%>" runat="server" />
					</td>
					<td class="ms-authoringcontrols">
						<asp:TextBox id="txtRangeName" runat="server" />
					</td>
				</tr>								
				<!--UseFirstRowAsColumnNames-->		
				<tr>
					<td class="ms-authoringcontrols">
						<asp:Literal id="litUseFirstRowAsColumnNames" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litUseFirstRowAsColumnNames_Text%>" runat="server" />
					</td>
					<td class="ms-authoringcontrols">
						<asp:Checkbox id="chkUseFirstRowAsColumnNames" runat="server" />
					</td>
				</tr>				
				<!--Formatting-->		
				<tr style="display:none">
					<td class="ms-authoringcontrols">
						<asp:Literal id="litUseExcelFormatting" Text="<%$Resources:mosschart,wizardConnectToDataStep2_ascx_litUseExcelFormatting_Text%>" runat="server" />
					</td>
					<td class="ms-authoringcontrols">
						<asp:CheckBox id="chkUseExcelFormatting" runat="server" />
					</td>
<%-- MWC: Beta1Fix: HelpLinkRemoved 					<td>
						<dsu:charthelplink id="helpUseExcelFormatting" meta:resourcekey="helpUseExcelFormatting" runat="server" />
					</td> --%>
				</tr>								
				<!--Spacer-->
				<tr>
					<td colspan="3"><img src="images/spacer.gif" width="1" height="80" alt="" /></td>
				</tr>				

			</Template_InputFormControls>
		</wssuc:InputFormSection>			
	</table>	

</asp:PlaceHolder>
