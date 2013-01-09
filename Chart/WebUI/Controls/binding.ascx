<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Binding,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<table class="ms-propertysheet" border="0" style="width:100%;" cellspacing="0" cellpadding="0">
	<wssuc:InputFormSection id="sectionWebPart" Title="<%$Resources:mosschart,Binding_ascx_sectionWebPart_Title%>" collapsible="true" runat="server">
		<Template_Description>
			<asp:literal id="litSectionWebPartDescription" Text="<%$Resources:mosschart,Binding_ascx_litSectionWebPartDescription_Text%>" runat="server" />
			<br /><br />
			<img id="imgExample" src="images/spacer.gif" style="display:none;margin-left:20px;" runat="server"/>
		</Template_Description>				

		<Template_InputFormControls>				

			<asp:PlaceHolder id="pnlNoData" visible="false" runat="server">
			<tr>
				<td class="ms-authoringcontrols" colspan="3">			
					<asp:Label id="litNoData" Text="<%$Resources:mosschart,Binding_ascx_litNoData_Text%>"  font-bold="true" forecolor="red" runat="server" />				
				</td>
			</tr>					
			</asp:PlaceHolder>

			<asp:PlaceHolder id="pnlGotData" runat="server" >
			<tr id="trTable" runat="server" visible="false" valign="top">
				<td class="ms-authoringcontrols" colspan="2">			
					<asp:Literal id="litTable" Text="<%$Resources:mosschart,Binding_ascx_litTable_Text%>" runat="server" /><br />
					<asp:DropDownList id="ddlTable" autopostback="true" runat="server" />
					<br /><br />
				</td>
			</tr>
			<tr>
				<td class="ms-authoringcontrols" colspan="3"><br /></td>
			</tr>

			<tr  valign="top">
				<td class="ms-authoringcontrols" colspan="2">			
					<style type="text/css">
						.squareButton{ width:20px; height:20px; font-bold:true;}
					</style>
					<asp:Literal id="litSeries" Text="<%$Resources:mosschart,Binding_ascx_litSeries_Text%>" runat="server" /><br />
					<asp:DropDownList id="ddlSeries" onchange="ddlSeries_Change(this);" runat="server" />&#160;
					<asp:ImageButton id="btnAdd" style="vertical-align:bottom;" imageurl="../images/buttons/plus_out.gif" 
						onmouseover="this.src = 'Images/Buttons/plus_down.gif';" onmouseout="this.src = 'Images/Buttons/plus_out.gif';" runat="server" />
					<asp:ImageButton id="btnRemove" style="vertical-align:bottom; margin-left:4px" imageurl="../images/buttons/minus_out.gif" 
						onmouseover="this.src = 'Images/Buttons/minus_down.gif';" onmouseout="this.src = 'Images/Buttons/minus_out.gif';" runat="server" />
				</td>
			</tr>

			<tr valign="top">
				<td class="ms-authoringcontrols" colspan="3">
					<a href="javascript:return;" onclick='javascript:btnProperties_Click();return false;'>
						<img id="<%=pnlBindingSeriesInfo.ClientID%>_ImgHideShow" src="/_layouts/15/images/plus.gif?rev=23" border="0" alt="Hide/Show" src="" style="border-width:0px;" />
						<asp:Literal id="litBindingSeriesInfo" Text="<%$Resources:mosschart,Binding_ascx_litBindingSeriesInfo_Text%>" runat="server" />
					</a>										

					<input id="hidSeriesCount" type="hidden" runat="server" />
					<asp:placeholder id="pnlBindingSeriesInfo" runat="server" />
				</td>
			</tr>
			<tr>
				<td class="ms-authoringcontrols" colspan="3"><br /></td>
			</tr>
			<tr>
				<td class="ms-authoringcontrols" colspan="3">
					<table cellpadding="0" cellspacing="2" border="0" width="100%">			
					<asp:placeholder id="pnlBindingFieldInfo" runat="server" />
					</table>
				</td>
			</tr>

            <tr id="trAdvancedProperties" runat="server" valign="top">
	            <td class="ms-authoringcontrols" colspan="3">
		            <img alt="" src="images/spacer.gif" width="1" height="20"/><br />
		            <a href="javascript:return;" onclick='javascript:ShowHideSection("<%=pnlAdvancedProperties.ClientID%>", "<%=pnlAdvancedProperties.ClientID%>_ImgHideShow" );return false;'>
			            <img id="<%=pnlAdvancedProperties.ClientID%>_ImgHideShow" src="/_layouts/15/images/plus.gif?rev=23" border="0" alt="Hide/Show" src="" style="border-width:0px;" />
			            <asp:Literal id="litAdvancedProperties" Text="<%$Resources:mosschart,Binding_ascx_litAdvancedProperties_Text%>" runat="server" />
		            </a>
		            <style type="text/css">
			            .tdAdvancedProperties { padding-left:12px;}
		            </style>
		            <asp:panel id="pnlAdvancedProperties" style="display:none; padding-top:5px;" runat="server">					
			            <table cellpadding="0" cellspacing="2" border="0" width="100%">
				            <tr>
					            <td class="ms-authoringcontrols tdAdvancedProperties" width="45%">
					                <asp:literal id="litRealTimeInterval" Text="<%$Resources:mosschart,Binding_ascx_litRealTimeInterval_Text%>" runat="server"/>
					            </td>
					            <td class="ms-authoringcontrols" width="50%">
		                      <asp:textbox id="txtRealTimeInterval" runat="server" width="60px" cssclass="ms-input"/>
					            </td>
				            </tr>
				            <tr>
											<td></td>
											<td></td>
											<td></td>
				            </tr>
                    <tr>
	                    <td class="ms-authoringcontrols tdAdvancedProperties" width="45%">
	                        <asp:literal id="litAlignField" Text="<%$Resources:mosschart,Binding_ascx_litAlignField_Text%>" runat="server"/>
	                    </td>
	                    <td class="ms-authoringcontrols" width="50%">
                          <asp:checkbox id="chkAlignField" runat="server" />
	                    </td>
                    </tr>
			            </table>
		            </asp:panel>
		            <br /><br />
	            </td>
            </tr>			

			</asp:PlaceHolder>

			<tr>
				<td>&nbsp;</td>
				<td><img alt="" src="images/spacer.gif" width="1" height="20" /></td>
				<td></td>
			</tr>

		</Template_InputFormControls>
	</wssuc:InputFormSection>			
</table>			
<script language="javascript">

	var MAX_YFIELD_COUNT = 6;

	var seriesInfo;
	var seriesInfoImg;
	var fieldsInfo = new Array();
	var spacerTr;
	var categoryTr;
	var groupTr;

	var otherTr;
	var formulasTr;
	var xAxisTypeTr;
	var yAxisTypeTr;	
	var seriesPropertiesVisible = <%=this.seriesPropertiesVisible.ToString().ToLower()%>;

	ddlSeries_Change(document.getElementById('<%=ddlSeries.ClientID%>'));

	function ddlSeries_Change(ddlSeries){				

		if (!ddlSeries || ddlSeries.options.length==0) 
			return;

		if (seriesInfo) 
			seriesInfo.style.display='none';
		for(var i=0; i<MAX_YFIELD_COUNT; i++){
			if (fieldsInfo[i])
				fieldsInfo[i].style.display="none";
		}
		if (spacerTr) spacerTr.style.display='none';
		if (categoryTr) categoryTr.style.display='none';
		if (groupTr) groupTr.style.display='none';

		if (otherTr) otherTr.style.display='none';		
		if (formulasTr) formulasTr.style.display='none';		

		seriesInfo = document.getElementById(ddlSeries.id.replace("ddlSeries", "SeriesInfo"+ddlSeries.selectedIndex+"_pnlSeries"));
		seriesInfo.style.display = seriesPropertiesVisible ? "block" : "none";		
		seriesInfoImg = document.getElementById("<%=pnlBindingSeriesInfo.ClientID%>_ImgHideShow");
		seriesInfoImg.src = seriesPropertiesVisible ? "/_layouts/15/images/minus.gif?rev=23" : "/_layouts/15/images/plus.gif?rev=23";		

		var ddlSeriesType = document.getElementById(ddlSeries.id.replace("ddlSeries", "SeriesInfo"+ddlSeries.selectedIndex+"_ddlSeriesType"));

		var yfieldCount = GetYValueCountBySeriesType(ddlSeriesType.options[ddlSeriesType.selectedIndex].value);

		for(var i=0; i<MAX_YFIELD_COUNT; i++){
			fieldsInfo[i] = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trValue"+i));
			if (fieldsInfo[i])
				fieldsInfo[i].style.display= i<yfieldCount ? "" : "none";
		}

		spacerTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trSpacer"));
		spacerTr.style.display = "";		
		categoryTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trCategory"));
		categoryTr.style.display = "";		
		groupTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trGroup"));
		if(ddlSeries.selectedIndex == 0)
		{
		    groupTr.style.display = ""; 
		}

		otherTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trOther"));
		otherTr.style.display = "";	
		formulasTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trFormulas"));
		formulasTr.style.display = "";	

		xAxisTypeTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "SeriesInfo"+ddlSeries.selectedIndex+"_trXAxisType"));		
		yAxisTypeTr = document.getElementById(ddlSeries.id.replace("ddlSeries", "SeriesInfo"+ddlSeries.selectedIndex+"_trYAxisType"));
		xAxisTypeTr.style.display = 
		yAxisTypeTr.style.display = GetHasSecondaryAxis(ddlSeriesType.value) ? "" : "none";

		var imgExample = document.getElementById('<%=imgExample.ClientID%>');
		imgExample.src = "images/DataBinding/chart"+ddlSeriesType.value+".png";
		imgExample.style.display = "";
	}

	function ddlSeriesType_Changed(ddlSeriesType){

		var yfieldCount = GetYValueCountBySeriesType(ddlSeriesType.value);
		for(var i=0; i<MAX_YFIELD_COUNT; i++){
			if (fieldsInfo[i])
				fieldsInfo[i].style.display= i<yfieldCount ? "" : "none";
		}

		groupTr.style.display = GetHasGroupFieldBySeriesType(ddlSeriesType.value) ? "" : "none";		

		xAxisTypeTr.style.display = 
		yAxisTypeTr.style.display = GetHasSecondaryAxis(ddlSeriesType.value) ? "" : "none";

		var imgExample = document.getElementById('<%=imgExample.ClientID%>');
		imgExample.src = "images/DataBinding/chart"+ddlSeriesType.value+".png";
		imgExample.style.display = "";
	}

	function btnProperties_Click(){

		seriesPropertiesVisible = !seriesPropertiesVisible;
		if (seriesInfo){
			seriesInfo.style.display = seriesPropertiesVisible? "block" : "none";
			seriesInfoImg.src = seriesPropertiesVisible ? "/_layouts/15/images/minus.gif?rev=23" : "/_layouts/15/images/plus.gif?rev=23";			
		}
	}

	function txtSeriesName_Change(txt){

		var seriesInfoPattern = "_SeriesInfo";
		var ddlId = txt.id.substring(0, txt.id.indexOf(seriesInfoPattern))+"_ddlSeries";
		var ddl = document.getElementById(ddlId);

		var index = parseInt(txt.id.substring(txt.id.indexOf(seriesInfoPattern)+seriesInfoPattern.length));

		for(var i=0; i<ddl.options.length; i++){
			if (i!=index && ddl.options[i].text==txt.value){
				alert('<%=GetResourceEncodedForEcmaScript("JavaScript", "SeriesNameDuplicate")%>');
				txt.value = ddl.options[index].text;
				return;
			}
		}		

		ddl.options[index].text = txt.value;
	}

	function GetYValueCountBySeriesType(seriesType){
		if (seriesType=="Point") return 1;
		if (seriesType=="FastPoint") return 1;
		if (seriesType=="Bubble") return 2; 
		if (seriesType=="Line") return 1;
		if (seriesType=="Spline") return 1;
		if (seriesType=="StepLine") return 1;
		if (seriesType=="FastLine") return 1;
		if (seriesType=="Bar") return 1;
		if (seriesType=="StackedBar") return 1;
		if (seriesType=="StackedBar100") return 1;
		if (seriesType=="Column") return 1;
		if (seriesType=="StackedColumn") return 1;
		if (seriesType=="StackedColumn100") return 1;
		if (seriesType=="Area") return 1;
		if (seriesType=="SplineArea") return 1;
		if (seriesType=="StackedArea") return 1;
		if (seriesType=="StackedArea100") return 1;
		if (seriesType=="Pie") return 1;
		if (seriesType=="Doughnut") return 1;
		if (seriesType=="Stock") return 4; 
		if (seriesType=="CandleStick") return 4; 
		if (seriesType=="Range") return 2;
		if (seriesType=="SplineRange") return 2;
		if (seriesType=="Gantt") return 2;
		if (seriesType=="RangeColumn") return 2;
		if (seriesType=="Radar") return 1;
		if (seriesType=="Rose") return 1;
		if (seriesType=="Polar") return 1;
		if (seriesType=="ErrorBar") return 3; 
		if (seriesType=="BoxPlot") return 6; 
		if (seriesType=="Renko") return 1;
		if (seriesType=="ThreeLineBreak") return 1;
		if (seriesType=="Kagi") return 1;
		if (seriesType=="PointAndFigure") return 2;
		if (seriesType=="Funnel") return 1;
		if (seriesType=="Pyramid") return 1;
		return 1;
	}	

	function GetHasGroupFieldBySeriesType(seriesType){
		if (seriesType=="Pie") return false;
		if (seriesType=="Doughnut") return false;
		if (seriesType=="Funnel") return false;
		if (seriesType=="Pyramid") return false;		
		return true;
	}		

	function GetHasSecondaryAxis(seriesType){
		if (seriesType=="Pie") return false;
		if (seriesType=="Doughnut") return false;
		if (seriesType=="Funnel") return false;
		if (seriesType=="Pyramid") return false;		
		if (seriesType=="Radar") return false;
		if (seriesType=="Rose") return false;
		if (seriesType=="Polar") return false;
		return true;
	}

	function ddlFormulaType_Change(ddlFormulaType)
	{
	    var ddlSeries = document.getElementById('<%=ddlSeries.ClientID%>')
	    var trNewChartArea = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trNewChartArea"));
	    var trShowLegend = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trShowLegend"));
	    var trLegendText = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trLegendText"));
	    var trSeparator1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trSeparator1"));

	    trNewChartArea.style.display = ddlFormulaType.value != "None" ? "" : "none";
	    trShowLegend.style.display = ddlFormulaType.value != "None" ? "" : "none";
	    trLegendText.style.display = ddlFormulaType.value != "None" ? "" : "none";
	    trSeparator1.style.display = ddlFormulaType.value != "None" ? "" : "none";

	    var trSeparator2 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trSeparator2"));
	    var trTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trTxtParameter1"));
	    var trTxtParameter2 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trTxtParameter2"));
	    var trFormulaTypeFullName = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trFormulaTypeFullName"));
        var trStartFirstColumn = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trStartFirstColumn"));

	    if(ddlFormulaType.value == "None")
	    {
	        trSeparator2.style.display = "none";
 	        trFormulaTypeFullName.style.display = "none";
            trTxtParameter1.style.display = "none";
            trTxtParameter2.style.display = "none";
            trStartFirstColumn.style.display = "none";

	        var trErrorBarStyle = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trErrorBarStyle"));
	        var trErrorBarCalculationMethod = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trErrorBarCalculationMethod"));

	        trErrorBarStyle.style.display = "none";
	        trErrorBarCalculationMethod.style.display = "none";

	        var trBoxPlotShowAverage = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trBoxPlotShowAverage"));
	        var trBoxPlotShowMedian = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trBoxPlotShowMedian"));
	        var trBoxPlotShowUnusualValues = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trBoxPlotShowUnusualValues"));

	        trBoxPlotShowAverage.style.display = "none";
	        trBoxPlotShowMedian.style.display = "none";
	        trBoxPlotShowUnusualValues.style.display = "none";

	        var trRegressionType = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trRegressionType"));
	        var trError = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trError"));
	        var trForecastingError = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trForecastingError"));

	        trRegressionType.style.display = "none";
	        trError.style.display = "none";
	        trForecastingError.style.display = "none";

	        return;
	    }

	    trSeparator2.style.display = !IsNoParametrs(ddlFormulaType.value) ? "" : "none";

	    trFormulaTypeFullName.style.display = !IsNoParametrs(ddlFormulaType.value) ? "" : "none";

	    var chkNewChartArea = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkNewChartArea"));
	    chkNewChartArea.checked = SetNewChartAreaFlag(ddlFormulaType.value);

	    var chkShowLegend = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkShowLegend"));
	    chkShowLegend.checked = true;

	    var txtLegendText = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtLegendText"));  
	    txtLegendText.value = ddlFormulaType.options[ddlFormulaType.selectedIndex].text;
	    txtLegendText.disabled = !chkShowLegend.checked;

        trTxtParameter1.style.display = ShowTxtParameter1(ddlFormulaType.value) ? "" : "none";

        trTxtParameter2.style.display = ShowTxtParameter2(ddlFormulaType.value) ? "" : "none";

        trStartFirstColumn.style.display = ShowStartFirstColumn(ddlFormulaType.value) ? "" : "none";

	    var chkStartFirstColumn = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkStartFirstColumn"));
        chkStartFirstColumn.checked = false;

	    ErrorBarType(ddlFormulaType, ddlSeries);

        BoxPlotType(ddlFormulaType, ddlSeries);

        ForecastingType(ddlFormulaType, ddlSeries);

        OtherTypes(ddlFormulaType, ddlSeries);
	}	

	function ErrorBarType(ddlFormulaType, ddlSeries)
	{
	    var trErrorBarStyle = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trErrorBarStyle"));
	    var trErrorBarCalculationMethod = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trErrorBarCalculationMethod"));

	    trErrorBarStyle.style.display = ddlFormulaType.value == "Error" ? "" : "none";
	    trErrorBarCalculationMethod.style.display = ddlFormulaType.value == "Error" ? "" : "none";

	    var ddlErrorBarStyle = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_ddlErrorBarStyle"));
	    ddlErrorBarStyle.value = "Both";

	    var ddlErrorBarCalculationMethod = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_ddlErrorBarCalculationMethod"));
	    ddlErrorBarCalculationMethod.value = "Percentage";

	    var litTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter1"));
	    litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ErrorBar_Percentage")%>');

	    var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));
	    txtParameter1.value = "10";
	}

	function BoxPlotType(ddlFormulaType, ddlSeries)
	{
	    var trBoxPlotShowAverage = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trBoxPlotShowAverage"));
	    var trBoxPlotShowMedian = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trBoxPlotShowMedian"));
	    var trBoxPlotShowUnusualValues = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trBoxPlotShowUnusualValues"));

	    trBoxPlotShowAverage.style.display = ddlFormulaType.value == "BoxPlot" ? "" : "none";
	    trBoxPlotShowMedian.style.display = ddlFormulaType.value == "BoxPlot" ? "" : "none";
	    trBoxPlotShowUnusualValues.style.display = ddlFormulaType.value == "BoxPlot" ? "" : "none";

	    var chkBoxPlotShowAverage = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkBoxPlotShowAverage"));
        chkBoxPlotShowAverage.checked = true;

	    var chkBoxPlotShowMedian = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkBoxPlotShowMedian"));
        chkBoxPlotShowMedian.checked = true;

	    var chkBoxPlotShowUnusualValues = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkBoxPlotShowUnusualValues"));
        chkBoxPlotShowUnusualValues.checked = false;
	}

	function ForecastingType(ddlFormulaType, ddlSeries)
	{
	    var trRegressionType = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trRegressionType"));
	    var trError = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trError"));
	    var trForecastingError = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_trForecastingError"));

	    trRegressionType.style.display = ddlFormulaType.value == "Forecasting" ? "" : "none";
	    trError.style.display = ddlFormulaType.value == "Forecasting" ? "" : "none";
	    trForecastingError.style.display = ddlFormulaType.value == "Forecasting" ? "" : "none";

	    var ddlRegressionType = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_ddlRegressionType"));
        ddlRegressionType.value = "Linear";

	    var chkError = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkError"));
        chkError.checked = true;

	    var chkForecastingError = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_chkForecastingError"));
        chkForecastingError.checked = true;
	}

	function OtherTypes(ddlFormulaType, ddlSeries)
	{
	    if(IsNoParametrs(ddlFormulaType.value))
	        return;

	    var litTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter1"));
	    var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));
	    var litTxtParameter2 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter2"));
	    var txtParameter2 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter2"));
	    var labFormulaTypeFullName = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_labFormulaTypeFullName"));

        if(ddlFormulaType.value == "BollingerBands")
        {  
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "BollingerBands")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "BollingerBands")%>');
            txtParameter1.value = "2";

            litTxtParameter2.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter2", "BollingerBands")%>');
            txtParameter2.value = "2";        	    
        }
        else if(ddlFormulaType.value == "MovingAverage")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "MovingAverage")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "MovingAverage")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "ExponentialMovingAverage")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "ExponentialMovingAverage")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ExponentialMovingAverage")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "TriangularMovingAverage")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "TriangularMovingAverage")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "TriangularMovingAverage")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "WeightedMovingAverage")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "WeightedMovingAverage")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "WeightedMovingAverage")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "Forecasting")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "Forecasting")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "Forecasting")%>');
            txtParameter1.value = "3";
            txtParameter1.disabled = true;

            litTxtParameter2.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter2", "Forecasting")%>');
            txtParameter2.value = "4";        	    
        }
        else if(ddlFormulaType.value == "MACD")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "MACD")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "MACD")%>');
            txtParameter1.value = "12";

            litTxtParameter2.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter2", "MACD")%>');
            txtParameter2.value = "26";        	    
        }
        else if(ddlFormulaType.value == "DetrendedPriceOscillator")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "DetrendedPriceOscillator")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "DetrendedPriceOscillator")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "Envelopes")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "Envelopes")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "Envelopes")%>');
            txtParameter1.value = "2";

            litTxtParameter2.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter2", "Envelopes")%>');
            txtParameter2.value = "7.0";        	    
        }
        else if(ddlFormulaType.value == "RateOfChange")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "RateOfChange")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "RateOfChange")%>');
            txtParameter1.value = "10";
        }
        else if(ddlFormulaType.value == "RelativeStrengthIndex")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "RelativeStrengthIndex")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "RelativeStrengthIndex")%>');
            txtParameter1.value = "10";
        }
        else if(ddlFormulaType.value == "StandardDeviation")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "StandardDeviation")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "StandardDeviation")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "TRIX")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "TRIX")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "TRIX")%>');
            txtParameter1.value = "2";
        }
        else if(ddlFormulaType.value == "Error")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "Error")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ErrorBar_Percentage")%>');
            txtParameter1.value = "10";
        }
        else if(ddlFormulaType.value == "BoxPlot")
        {
	        labFormulaTypeFullName.innerHTML = ('<%=GetResourceEncodedForHtml("labFormulaTypeFullName", "BoxPlot")%>');

            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "BoxPlot")%>');
            txtParameter1.value = "5";

            litTxtParameter2.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter2", "BoxPlot")%>');
            txtParameter2.value = "30";        	    
        }
	}

	function IsNoParametrs(formulaType)
	{
	    if(formulaType == "Performance" ||
	       formulaType == "Mean" ||
	       formulaType == "Median")
	    {
	       return true;
	    }

	    return false;
	}

	function SetNewChartAreaFlag(formulaType)
	{
	    if(formulaType == "MACD" ||
	       formulaType == "Performance" ||
	       formulaType == "RateOfChange" ||
	       formulaType == "RelativeStrengthIndex" ||
	       formulaType == "StandardDeviation" ||
	       formulaType == "TRIX" ||
	       formulaType == "BoxPlot")
	    {
	       return true;
	    }

	    return false;
	}

	function ShowTxtParameter1(formulaType)
	{
	    if(formulaType == "BollingerBands" ||
	       formulaType == "MovingAverage" ||
	       formulaType == "ExponentialMovingAverage" ||
	       formulaType == "TriangularMovingAverage" ||
	       formulaType == "WeightedMovingAverage" ||
	       formulaType == "Forecasting" ||
	       formulaType == "MACD" ||
	       formulaType == "DetrendedPriceOscillator" ||
	       formulaType == "Envelopes" ||
	       formulaType == "RateOfChange" ||
	       formulaType == "RelativeStrengthIndex" ||
	       formulaType == "StandardDeviation" ||
	       formulaType == "TRIX" ||
	       formulaType == "Error" ||
	       formulaType == "BoxPlot")
	    {
	       return true;
	    }

	    return false;
	}

	function ShowTxtParameter2(formulaType)
	{
	    if(formulaType == "BollingerBands" ||
	       formulaType == "MACD" ||
	       formulaType == "Envelopes" ||
	       formulaType == "Forecasting" ||
	       formulaType == "BoxPlot")
	    {
	       return true;
	    }

	    return false;
	}

	function ShowStartFirstColumn(formulaType)
	{
	    if(formulaType == "MovingAverage" ||
	       formulaType == "ExponentialMovingAverage" ||
	       formulaType == "TriangularMovingAverage" ||
	       formulaType == "WeightedMovingAverage")
	    {
	       return true;
	    }

	    return false;
	}

	function chkShowLegend_Click(chkShowLegend)
	{
	    var ddlSeries = document.getElementById('<%=ddlSeries.ClientID%>')
	    var txtLegendText = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtLegendText"));  

	    txtLegendText.disabled = !chkShowLegend.checked;
	}

	function ddlErrorBarCalculationMethod_Change(ddlErrorBarCalculationMethod)
	{
	    var ddlSeries = document.getElementById('<%=ddlSeries.ClientID%>')

	    switch(ddlErrorBarCalculationMethod.value)
	    {
	        case "StandardError":
	            var litTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter1"));
	            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ErrorBar_StandardError")%>');

	            var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));
	            txtParameter1.value = "1";
	            break;
	        case "StandardDeviation":
	            var litTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter1"));
	            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ErrorBar_StandardDeviation")%>');

	            var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));
	            txtParameter1.value = "1";
	            break;
	        case "Percentage":
	            var litTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter1"));
	            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ErrorBar_Percentage")%>');

	            var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));
	            txtParameter1.value = "10";
	            break;
	        case "FixedValue":
	            var litTxtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_litTxtParameter1"));
	            litTxtParameter1.innerHTML = ('<%=GetResourceEncodedForHtml("litTxtParameter1", "ErrorBar_FixedValue")%>');

	            var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));
	            txtParameter1.value = "1.00";
	            break;
	    }
	}

	function ddlRegressionType_Change(ddlRegressionType)
	{
	    var ddlSeries = document.getElementById('<%=ddlSeries.ClientID%>')
	    var txtParameter1 = document.getElementById(ddlSeries.id.replace("ddlSeries", "FieldInfo"+ddlSeries.selectedIndex+"_txtParameter1"));  

	    txtParameter1.disabled = ddlRegressionType.value != "Polynomial";
	}
</script>

