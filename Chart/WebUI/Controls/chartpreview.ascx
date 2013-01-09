<%@ Control language="C#" AutoEventWireup="false" EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.ChartPreview,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<asp:Literal id="litImageTag" runat="server" />
<br />
<asp:PlaceHolder id="pnlButtons" runat="server">
<asp:CheckBox id="chkAutoPreview" checked="true" forecolor="black" text="<%$Resources:mosschart,ChartPreview_ascx_AutoPreview%>" onclick="chkAutoPreview_Click();" runat="server" />
<br />
<asp:Button id="btnPreview" text="<%$Resources:mosschart,propertiesAdvanced_ascx_litChartPreview_Text%>" runat="server" />
<script language="javascript" type="text/javascript">	

	function Control_ServerCallbackDone(result, context){
		var img = document.getElementById('<%=litImageTag.ClientID%>');
		img.src = result;
	}		

	function Control_ServerCallbackError(result, context){
		alert('Auto preview error: '+result);
	}

	function chkAutoPreview_Click(){
		var chk = document.getElementById('<%=chkAutoPreview.ClientID%>');
		var btn = document.getElementById('<%=btnPreview.ClientID%>');
		btn.disabled = chk.checked;	
	}		
	chkAutoPreview_Click();

	function GetRadioButtonListValue(name){
		var radioButtons = document.forms[0][name];
		for( i=0; i<radioButtons.length; i++){
			if (radioButtons[i].checked)
				return radioButtons[i].value;
		}
		return "";
	}
</script>
</asp:PlaceHolder>

