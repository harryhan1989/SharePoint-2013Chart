<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.PropertiesAdvanced,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%--MWC: TODO: REGDIRECTIVE: (dcwc, System.Web.UI.DataVisualization.Charting, System.Web.DataVisualization) --%>
<%@ Register Tagprefix="dcwc" Namespace="System.Web.UI.DataVisualization.Charting" Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %> 
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="mcwc" Namespace="Microsoft.Office.Server.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<script type="text/javascript">
  function propertyGridCallbackCompleted()
  {
  __doPostBack('<%= btnUpdatePanelTrigger.ClientID %>','');

  }
</script>
<!-- MWC: Beta1Fix: AjaxWebForm_CallbackCompleteError -->
<script type="text/javascript">

    var theWindowOnLoad = window.onload;
    window.onload = function Onload(){
        if (typeof (WebForm_CallbackComplete) == "function")
            WebForm_CallbackComplete = WebForm_CallbackComplete_SyncFixed;

        if (theWindowOnLoad!=null) theWindowOnLoad();
    }

    function WebForm_CallbackComplete_SyncFixed() {

        for (var i = 0; i < __pendingCallbacks.length; i++) {
            callbackObject = __pendingCallbacks[i];
            if (callbackObject && callbackObject.xmlRequest && (callbackObject.xmlRequest.readyState == 4)) {

                if (!__pendingCallbacks[i].async) { 
                    __synchronousCallBackIndex = -1;
                }
                __pendingCallbacks[i] = null;
                var callbackFrameID = "__CALLBACKFRAME" + i;
                var xmlRequestFrame = document.getElementById(callbackFrameID);
                if (xmlRequestFrame) {
                    xmlRequestFrame.parentNode.removeChild(xmlRequestFrame);
                }

                WebForm_ExecuteCallback(callbackObject);
            }
        }
    }

</script>

<table cellpadding="0" cellspacing="7" border="0" class="ms-propertysheet">
	<tr>
		<td colspan="2" class="ms-descriptiontext">
			<asp:Literal id="litHeader" runat="server" />
		</td> 
	</tr>
    <tr>
        <td style="width:360px">
            <asp:DropDownList style="float: left" id="dropDownListCollectionItems" runat="server" width="280px" autopostback="True" />
            <asp:ImageButton style="margin-left: 2px" imageurl="Images/Buttons/minus_out.gif" id="imageButtonDelete" runat="server" onclick="imageButtonDelete_Click" />
            <asp:ImageButton style="float: right" imageurl="Images/Buttons/plus_out.gif" id="imageButtonNew" runat="server" onclick="imageButtonNew_Click" />
            <div style="float: right">
                <dwu:AddItemControl id="addItemControl" runat="server" onitemselected="addItemControl_ItemSelected" ondefaultitemadded="addItemControl_DefaultItemAdded" visible="false" />
            </div>            
        </td>
    </tr>
    <tr>
        <td valign="top">
            <dwu:PropertyGrid id="chartPropertyGrid" runat="server" showhelp="True" livemodeenabled="false" backgroundcolor="#F0F0F0" width="600">
            </dwu:PropertyGrid>
        </td>
        <td valign="top" >
            <!-- MWC: AdvanPropPreviewChartMadeVisible  <table class="ms-vh2"> -->
			<table>
				<tr>
					<td style="padding:10px; text-align:center;" >        
						<h3 class="ms-standardheader"><asp:Label id="litChartPreview" Text="<%$Resources:mosschart,propertiesAdvanced_ascx_litChartPreview_Text%>" forecolor="Black" runat="server" /></h3> 
						<br />
						<input id="hidProcessKey" type="hidden" runat="server" />
						<%--MWC: DevFixComment: Moved from below line. MWC: RETIREDAPI: TODEL: 'Callback': oncallback="chartPreview_Callback"--%>
						<!-- MWC: TODO: FixToReview: AjaxFix -->
            <asp:Button ID="btnUpdatePanelTrigger" runat="server" style="display:none" />
            <asp:UpdatePanel id="chartPreviewUpdatePanel" runat="server" UpdateMode="Always">
              <ContentTemplate>
                <mcwc:Chart id="chartPreview" runat="server" oninit="chartPreview_Init" ></mcwc:Chart>
              </ContentTemplate>
              <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpdatePanelTrigger" EventName="Click" />
              </Triggers>
            </asp:UpdatePanel>
					</td>
				</tr>
			</table>
        </td>
    </tr>
</table> 
