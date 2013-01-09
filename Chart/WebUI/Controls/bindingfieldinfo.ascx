<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.BindingFieldInfo,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr id="trSpacer" style="display:none;" runat="server">
	<td class="ms-authoringcontrols" width="45%"><img alt="" src="images/spacer.gif" width="1" height="1" /></td>
	<td class="ms-authoringcontrols" width="50%"><img alt="" src="images/spacer.gif" width="1" height="1" /></td>
	<td width="5%"><img alt="" src="images/spacer.gif" width="1" height="1" /></td>
</tr>
<tr id="trValue0" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:literal id="litValue0" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litValue0_Text%>" runat="server"/></td>
	<td><asp:DropDownList id="ddlValue0" runat="server" /></td>
</tr>
<tr id="trValue1" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:Literal id="litValue1" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litValue1_Text%>" runat="server" /></td>
	<td><asp:DropDownList id="ddlValue1" runat="server" /></td>
</tr>
<tr id="trValue2" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:literal id="litValue2" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litValue2_Text%>" runat="server"/></td>
	<td><asp:DropDownList id="ddlValue2" runat="server"  /></td>
</tr>
<tr id="trValue3" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:literal id="litValue3" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litValue3_Text%>" runat="server"/></td>
	<td><asp:DropDownList id="ddlValue3" runat="server" /></td>
</tr>
<tr id="trValue4" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:literal id="litValue4" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litValue4_Text%>" runat="server"/></td>
	<td><asp:DropDownList id="ddlValue4" runat="server" /></td>
</tr>
<tr id="trValue5" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:literal id="litValue5" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litValue5_Text%>" runat="server"/></td>
	<td><asp:DropDownList id="ddlValue5" runat="server" /></td>
</tr>
<tr id="trCategory" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:Literal id="litCategoryField" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litCategoryField_Text%>" runat="server" /></td>
	<td><asp:DropDownList id="ddlCategoryField" runat="server" /></td>
</tr>
<tr id="trGroup" style="display:none;" runat="server">
	<td class="ms-authoringcontrols"><asp:Literal id="litLegendField" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litLegendField_Text%>" runat="server" /></td>
	<td><asp:DropDownList id="ddlLegendField" runat="server" /></td>
</tr>
<tr id="trOther" style="display:none;" runat="server"  valign="top">
	<td class="ms-authoringcontrols" colspan="3">
		<img alt="" src="images/spacer.gif" width="1" height="20"/><br />
		<a href="javascript:return;" onclick='javascript:ShowHideSection("<%=pnlOtherFields.ClientID%>", "<%=pnlOtherFields.ClientID%>_ImgHideShow" );return false;'>
			<img id="<%=pnlOtherFields.ClientID%>_ImgHideShow" src="/_layouts/15/images/plus.gif?rev=23" border="0" alt="Hide/Show" src="" style="border-width:0px;" />
			<asp:Literal id="litOtherFields" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litOtherFields_Text%>" runat="server" />
		</a>
		<style type="text/css">
			.tdOtherFields { padding-left:12px;}
		</style>
		<asp:Panel id="pnlOtherFields" style="display: none; padding-top: 5px;" runat="server">					
			<table cellpadding="0" cellspacing="2" border="0" width="100%">
				<tr>
					<td class="ms-authoringcontrols tdOtherFields" width="45%"><asp:literal id="litSeriesTooltip" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litSeriesTooltip_Text%>" runat="server"/></td>
					<td class="ms-authoringcontrols" width="50%"><asp:dropdownlist id="ddlSeriesTooltipField" runat="server" /></td>
				</tr>
				<tr>
					<td class="ms-authoringcontrols tdOtherFields"><asp:literal id="litSeriesHref" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litSeriesHref_Text%>" runat="server"/></td>
					<td class="ms-authoringcontrols"><asp:dropdownlist id="ddlSeriesHrefField" runat="server" /></td>
				</tr>		
				<tr>
					<td class="ms-authoringcontrols tdOtherFields"><asp:literal id="litDataLabel" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litDataLabel_Text%>" runat="server"/></td>
					<td class="ms-authoringcontrols"><asp:dropdownlist id="ddlDataLabelField" runat="server" /></td>
				</tr>		
				<tr>
					<td class="ms-authoringcontrols tdOtherFields" colspan="2"><asp:literal id="litCustomFields" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litCustomFields_Text%>" runat="server"/></td>
				</tr>		
				<tr>
					<td class="ms-authoringcontrols tdOtherFields" colspan="2">					
						<style type="text/css">
							.wiz_grid_Header td {color: #6c6c6c; background-color:#ebebeb; border-top:solid 1px #ebebeb; border-bottom:solid 1px #d9d9d9; border-left:solid 1px #ebebeb; border-right:solid 1px #ebebeb; font-weight: bold;}
							.wiz_grid_Item td {color: black; background-color:white; border-top:solid 1px #d9d9d9; border-bottom:solid 1px #d9d9d9; border-left:solid 1px white; border-right:solid 1px white; font-weight: normal;}
						</style>
						<div style="width:100%;height:90px; overflow:auto;">
						<input type="hidden" id="hidCustomFields" value="10" runat="server" />
						<asp:DataGrid id="dtgCustomFields" autogeneratecolumns="false" runat="server" width="100%" cellpadding="1" cellspacing="0" borderwidth="0">
							<HeaderStyle CssClass="wiz_grid_Header ms-authoringcontrols"/>
							<ItemStyle CssClass="wiz_grid_Item ms-authoringcontrols"/>
							<Columns>
								<asp:TemplateColumn headertext="Field Name">
									<ItemTemplate>
										<asp:TextBox id="txtCustom" cssclass="ms-input" maxlength="127" width="120px" runat="server" /><asp:RegularExpressionValidator id="valrexCustom" meta:resourcekey="valrexCustom"
											controltovalidate="txtCustom" 
											validationexpression="^[a-zA-Z_][a-zA-Z0-9_]*$" runat="server" >(?)</asp:RegularExpressionValidator>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn headertext="Field Value">
									<ItemTemplate>
										<asp:dropdownlist id="ddlCustom" runat="server" />
									</ItemTemplate>
								</asp:TemplateColumn>
							</Columns>
						</asp:DataGrid>
						</div>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</asp:Panel>
		<br /><br />
	</td>
</tr>
<tr id="trFormulas" style="display:none;" runat="server"  valign="top">
	<td class="ms-authoringcontrols" colspan="3">
		<img alt="" src="images/spacer.gif" width="1" height="20"/><br />
		<a href="javascript:return;" onclick='ShowHideSection("<%=pnlFormulas.ClientID%>", "<%=pnlFormulas.ClientID%>_ImgHideShow" ); ddlFormulaType_Change(<%=ddlFormulaType.ClientID%>); return false;'>
			<img id="<%=pnlFormulas.ClientID%>_ImgHideShow" src="/_layouts/15/images/plus.gif?rev=23" border="0" alt="Hide/Show" src="" style="border-width:0px;" />
			<asp:Literal id="litFormulas" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litFormulas_Text%>" runat="server" />
		</a>
		<style type="text/css">
			.tdFormulas { padding-left:12px;}
		</style>
		<asp:Panel id="pnlFormulas" style="display:none; padding-top:5px;" runat="server">					
			<table cellpadding="0" cellspacing="2" border="0" width="100%">
				<tr>
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litFormulaType" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litFormulaType_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
					    <asp:dropdownlist id="ddlFormulaType" onchange="ddlFormulaType_Change(this);" runat="server" />
					</td>
				</tr>
				<tr id="trNewChartArea" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litNewChartArea" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litNewChartArea_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkNewChartArea" runat="server" />
					</td>
				</tr>

                <tr id="trSeparator1" runat="server" class="rowFormulasProperties" style="display:none;">
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

                <tr id="trFormulaTypeFullName" runat="server" class="rowFormulasProperties" style="display:none;">
                    <td class="ms-authoringcontrols tdFormulas" align="center" colspan="3">
					    <asp:Label id="labFormulaTypeFullName" text="Text3" runat="server"/>
                    </td>
                </tr>

				<tr id="trErrorBarStyle" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litErrorBarStyle" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litErrorBarStyle_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
					    <asp:dropdownlist id="ddlErrorBarStyle" runat="server" />
					</td>
				</tr>
				<tr id="trErrorBarCalculationMethod" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litErrorBarCalculationMethod" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litErrorBarCalculationMethod_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
					    <asp:dropdownlist id="ddlErrorBarCalculationMethod" onchange="ddlErrorBarCalculationMethod_Change(this);" runat="server" />
					</td>
				</tr>
				<tr id="trRegressionType" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litRegressionType" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litRegressionType_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
					    <asp:dropdownlist id="ddlRegressionType" onchange="ddlRegressionType_Change(this);" runat="server" />
					</td>
				</tr>
				<tr id="trTxtParameter1" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:Label id="litTxtParameter1" text="Text1" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:textbox id="txtParameter1" runat="server" cssclass="ms-input"/>
					</td>
<%-- MWC: Beta1Fix: HelpLinkRemoved 					<td width="5%">
					    <dsu:charthelplink id="helpTxtParameter1" runat="server" />
					</td> --%>
				</tr>
				<tr id="trTxtParameter2" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:Label id="litTxtParameter2" text="Text2" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:textbox id="txtParameter2" runat="server" CssClass="ms-input"/>
					</td>
<%-- MWC: Beta1Fix: HelpLinkRemoved 					<td width="5%">
					    <dsu:charthelplink id="helpTxtParameter2" runat="server" />
					</td> --%>
				</tr>
				<tr id="trStartFirstColumn" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litStartFirstColumn" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litStartFirstColumn_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkStartFirstColumn" runat="server" />
					</td>
				</tr>
				<tr id="trBoxPlotShowAverage" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litBoxPlotShowAverage" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litBoxPlotShowAverage_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkBoxPlotShowAverage" runat="server" />
					</td>
				</tr>
				<tr id="trBoxPlotShowMedian" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litBoxPlotShowMedian" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litBoxPlotShowMedian_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkBoxPlotShowMedian" runat="server" />
					</td>
				</tr>
				<tr id="trBoxPlotShowUnusualValues" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litBoxPlotShowUnusualValues" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litBoxPlotShowUnusualValues_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkBoxPlotShowUnusualValues" runat="server" />
					</td>
				</tr>
				<tr id="trError" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litError" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litError_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkError" runat="server" />
					</td>
				</tr>
				<tr id="trForecastingError" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litForecastingError" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litForecastingError_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkForecastingError" runat="server" />
					</td>
				</tr>

                <tr id="trSeparator2" runat="server" class="rowFormulasProperties" style="display:none;">
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>

				<tr id="trShowLegend" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litShowLegend" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litShowLegend_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:checkbox id="chkShowLegend" onclick="chkShowLegend_Click(this);" runat="server" />
					</td>
				</tr>
				<tr id="trLegendText" runat="server" class="rowFormulasProperties" style="display:none;">
					<td class="ms-authoringcontrols tdFormulas" width="45%">
					    <asp:literal id="litLegendText" Text="<%$Resources:mosschart,BindingFieldInfo_ascx_litLegendText_Text%>" runat="server"/>
					</td>
					<td class="ms-authoringcontrols" width="50%">
		                <asp:textbox id="txtLegendText" runat="server" CssClass="ms-input"/>
					</td>
				</tr>
			</table>
		</asp:Panel>
		<br /><br />
	</td>
</tr>
