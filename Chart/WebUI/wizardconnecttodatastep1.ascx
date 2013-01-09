<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WizardConnectToDataStep1,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ms-propertysheet"><tr valign="top"><td class="ms-descriptiontext" width="100%">
	<asp:Literal id="litHeader" Text="<%$Resources:mosschart,wizardConnectToDataStep1_ascx_litHeader_Text%>" runat="server" />
</td></tr></table>
<br/>
<br/>

<asp:ValidationSummary id="valSummary" runat="server" HeaderText="<%$Resources:mosschart,wizardConnectToDataStep1_ascx_valSummary_HeaderText%>" 
    displaymode="BulletList" font-bold="true" showsummary="true" />

<style type="text/css">
	.hr {background-repeat:repeat-x; background-image:url('images/bgHr.gif');}
</style>

<asp:Table cellpadding="0" cellspacing="4" borderwidth="0" width="600" runat="server">
<asp:TableRow runat="server" style="vertical-align:top;">
	<asp:TableCell runat="server" width="16px">
		<asp:RadioButton id="rbtDataSourceWebPart" checked="true" groupname="DataSource" runat="server" />
	</asp:TableCell>
	<asp:TableCell runat="server" width="32px">
		<script type="text/javascript">displayPNGImage("imgDataSourceWebPart","images/DataSourceWebPart.png",32,32,"");</script>
	</asp:TableCell>
	<asp:TableCell runat="server" cssclass="ms-descriptiontext">
		<asp:Literal id="litDataSourceWebPart" Text="<%$Resources:mosschart,wizardConnectToDataStep1_ascx_litDataSourceWebPart_Text%>" runat="server" />
		<br/>&nbsp;
	</asp:TableCell>
</asp:TableRow>
<asp:TableRow runat="server"><asp:TableCell runat="server" columnspan="3" cssclass="hr">&nbsp;</asp:TableCell></asp:TableRow>
<asp:TableRow runat="server" style="vertical-align:top;">
	<asp:TableCell runat="server" width="16px">
		<asp:RadioButton id="rbtDataSourceWebList" checked="false" groupname="DataSource" runat="server" />
	</asp:TableCell>
	<asp:TableCell runat="server" width="32px">
		<script type="text/javascript">displayPNGImage("imgDataSourceWebList","images/DataSourceWebList.png",32,32,"");</script>
	</asp:TableCell>
	<asp:TableCell runat="server" cssclass="ms-descriptiontext">
		<asp:Literal id="litDataSourceWebList" Text="<%$Resources:mosschart,wizardConnectToDataStep1_ascx_litDataSourceWebList_Text%>" runat="server" />
		<br/>&nbsp;
	</asp:TableCell>
</asp:TableRow>
<asp:TableRow runat="server" id="trDataSourceBdcHr" visible="false"><asp:TableCell runat="server" columnspan="3" cssclass="hr">&nbsp;</asp:TableCell></asp:TableRow>
<asp:TableRow runat="server" id="trDataSourceBdc" visible="false" style="vertical-align:top;">
	<asp:TableCell runat="server">
		<asp:RadioButton id="rbtDataSourceBdc" groupname="DataSource" runat="server" />
	</asp:TableCell>
	<asp:TableCell runat="server">
		<script type="text/javascript">displayPNGImage("imgDataSourceBdc","images/DataSourceBdc.png",32,32,"");</script>
	</asp:TableCell>
	<asp:TableCell runat="server" cssclass="ms-descriptiontext">
		<asp:Literal id="litDataSourceBdc" Text="<%$Resources:mosschart,wizardConnectToDataStep1_ascx_litDataSourceBdc_Text%>" runat="server" />
		<br/>&nbsp;
	</asp:TableCell>
</asp:TableRow>
<asp:TableRow runat="server" id="trDataSourceExcelServicesHr" visible="false"><asp:TableCell runat="server" columnspan="3" cssclass="hr">&nbsp;</asp:TableCell></asp:TableRow>
<asp:TableRow runat="server" id="trDataSourceExcelServices" visible="false">
	<asp:TableCell runat="server">
		<asp:RadioButton id="rbtDataSourceExcelServices" groupname="DataSource" runat="server" />
	</asp:TableCell>
	<asp:TableCell runat="server">
		<script type="text/javascript">displayPNGImage("imgDataSourceExcelServices","images/DataSourceExcelServices.png",32,32,"");</script>
	</asp:TableCell>
	<asp:TableCell runat="server" cssclass="ms-descriptiontext">
		<asp:Literal id="litDataSourceExcelServices" Text="<%$Resources:mosschart,wizardConnectToDataStep1_ascx_litDataSourceExcelServices_Text%>" runat="server" />
		<br/>&nbsp;
	</asp:TableCell>
</asp:TableRow>
</asp:Table>

