<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.BindingValue,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<style type="text/css">
	.squareButton{ width:20px; height:20px; font-bold:true;}
</style>

<asp:DropDownList id="ddlValueField" runat="server" />
<asp:Button id="btnMore" onclientclick="btnMore_Click(this);return false;" text="..." cssclass="squareButton" usesubmitbehavior="false" runat="server" />
<asp:Button id="btnNew" text="+" cssclass="squareButton" runat="server" causesvalidation="false" usesubmitbehavior="false" />
<asp:Button id="btnDelete" text="X" cssclass="squareButton" runat="server" causesvalidation="false" usesubmitbehavior="false" />

<asp:Panel id="pnlFieldValue" runat="server" style="display:none;border:solid 1px #d0d0d0;">
<table cellpadding="0" cellspacing="2" border="0">

<!--Connect to existing series-->
<tr>
	<td class="ms-authoringcontrols" width="45%"><asp:Literal id="litExistingSeries" Text="<%$Resources:mosschart,BindingValue_ascx_litExistingSeries_Text%>" runat="server" /></td>
	<td class="ms-authoringcontrols" width="50%"><asp:DropDownList id="ddlExistingSeries" onchange="ddlExistingSeries_Change(this);" runat="server" /></td>
</tr>	

<!--Connect to new series-->

<tr id="trNew0" style="display:none;" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:20px"><asp:Literal id="litNewSeriesName" Text="<%$Resources:mosschart,BindingValue_ascx_litNewSeriesName_Text%>" runat="server" /></td>
	<td class="ms-authoringcontrols"><asp:TextBox id="txtNewSeriesName" runat="server" width="150px" cssclass="ms-input" />
		<asp:CustomValidator id="valcustNewSeriesName" ErrorMessage="<%$Resources:mosschart,BindingValue_ascx_valcustNewSeriesName_ErrorMessage%>" controltovalidate="txtNewSeriesName" runat="server">(?)</asp:customValidator>
	</td>
</tr>
<tr id="trNew1" style="display:none;" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:20px"><asp:Literal id="litNewChartType" Text="<%$Resources:mosschart,BindingValue_ascx_litNewChartType_Text%>" runat="server" /></td>
	<td class="ms-authoringcontrols"><asp:DropDownList id="ddlNewSeriesChartType" runat="server" cssclass="ms-input" />
		<asp:CustomValidator id="valcustNewSeriesChartType" ErrorMessage="<%$Resources:mosschart,BindingValue_ascx_valcustNewSeriesChartType_ErrorMessage%>" controltovalidate="ddlNewSeriesChartType" runat="server">(?)</asp:customValidator>
	</td>
</tr>
<tr id="trNew2" style="display:none;" runat="server">
	<td class="ms-authoringcontrols" style="padding-left:20px"><asp:Literal id="litNewChartArea" Text="<%$Resources:mosschart,BindingValue_ascx_litNewChartArea_Text%>" runat="server" /></td>
	<td class="ms-authoringcontrols"><asp:DropDownList id="ddlNewSeriesChartArea" runat="server" cssclass="ms-input" /></td>
</tr>

</table>
</asp:Panel>
<script language="javascript">

		function btnMore_Click(btn){
			var div = document.getElementById(btn.id.replace('btnMore', 'pnlFieldValue'));
			div.style.display = div.style.display=="none" ? "block" : "none";
		}

		function ddlExistingSeries_Change(ddl){			
			var val = ddl.options[ddl.selectedIndex].value;			
			var newSeries = val=="_createNewSeries_";

			var trNew0 = document.getElementById(ddl.id.replace('ddlExistingSeries', 'trNew0'));
			var trNew1 = document.getElementById(ddl.id.replace('ddlExistingSeries', 'trNew1'));
			var trNew2 = document.getElementById(ddl.id.replace('ddlExistingSeries', 'trNew2'));

			trNew0.style.display = newSeries ? "" : "none";
			trNew1.style.display = newSeries ? "" : "none";
			trNew2.style.display = newSeries ? "" : "none";
		}

		<%= valcustNewSeriesChartType.IsValid && valcustNewSeriesName.IsValid ? "" : ("btnMore_Click(document.getElementById('"+btnMore.ClientID+"'))") %>		
		ddlExistingSeries_Change(document.getElementById('<%=ddlExistingSeries.ClientID%>'));
</script>

