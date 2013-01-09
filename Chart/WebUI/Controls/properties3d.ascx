<%@ Control language="C#"  EnableViewState="True"     Inherits="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Properties3D,Microsoft.Office.Server.Chart,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="dwu" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="dsu" Namespace="Microsoft.Office.Server.Internal.Charting.Utilities" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 

<tr>
	<td class="ms-authoringcontrols" width="40%"><asp:Literal id="lit3DEnabled" Text="<%$Resources:mosschart,Properties3D_ascx_lit3DEnabled_Text%>" runat="server" /></td>
	<td width="55%">
		<asp:CheckBox id="chk3DEnabled" runat="server" />
	</td>
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols"><asp:Literal id="litClustered" Text="<%$Resources:mosschart,Properties3D_ascx_litClustered_Text%>" runat="server" /></td>
	<td><asp:CheckBox id="chk3DClustered" runat="server" /></td>
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols"><asp:Literal id="litRightAngleAxis" Text="<%$Resources:mosschart,Properties3D_ascx_litRightAngleAxis_Text%>" runat="server" /></td>
	<td><asp:CheckBox id="chk3DRightAngleAxes" runat="server" /></td>
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litXAngle" Text="<%$Resources:mosschart,Properties3D_ascx_litXAngle_Text%>" runat="server" />
	</td>
	<td>
		<asp:TextBox id="txt3DRotationAroundXAxis" width="80px" maxlength="3" runat="server" cssclass="ms-input" /> 
		<asp:Literal id="litDegrees1" Text="<%$Resources:mosschart,Properties3D_ascx_litDegrees_Text%>" runat="server" />
		<asp:RangeValidator id="valrng3DRotationAroundXAxis" controltovalidate="txt3DRotationAroundXAxis" 
		    display="Dynamic" minimumvalue="-90" maximumvalue="90" type="Integer" runat="server" errormessage="3D Effects: Rotation around X axis should be between -90 and 90 degrees">(?)</asp:rangevalidator>
	</td>							
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litYAngle" Text="<%$Resources:mosschart,Properties3D_ascx_litYAngle_Text%>" runat="server" />
	</td>
	<td>
		<asp:TextBox id="txt3DRotationAroundYAxis" width="80px" maxlength="3" runat="server" cssclass="ms-input" /> 
		<asp:Literal id="litDegrees2" Text="<%$Resources:mosschart,Properties3D_ascx_litDegrees_Text%>" runat="server" />
		<asp:RangeValidator id="valrng3DRotationAroundYAxis" controltovalidate="txt3DRotationAroundYAxis" 
		    display="Dynamic" minimumvalue="-90" maximumvalue="90" type="Integer" runat="server" errormessage="3D Effects: Rotation around Y axis should be between -90 and 90 degrees">(?)</asp:rangevalidator>
	</td>
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litPerspective" Text="<%$Resources:mosschart,Properties3D_ascx_litPerspective_Text%>" runat="server" />
	</td>
	<td><asp:TextBox id="txt3DPerspective" width="80px" maxlength="3" runat="server" cssclass="ms-input" /> %
		<asp:RangeValidator id="valrng3DPerspective" controltovalidate="txt3DPerspective" 
		    display="Dynamic" minimumvalue="0" maximumvalue="100" type="Integer" runat="server" errormessage="3D Effects: Perspective should be between 0 and 100 %">(?)</asp:rangevalidator>
	</td>
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litLight" Text="<%$Resources:mosschart,Properties3D_ascx_litLight_Text%>" runat="server" />
	</td>
	<td>
		<asp:RadioButtonList id="rbl3DLight" runat="server" repeatlayout="Flow" repeatcolumns="3" repeatdirection="Horizontal" />
	</td>
</tr>
<tr class="row3dDetails">
	<td class="ms-authoringcontrols">
		<asp:Literal id="litWallThickness" Text="<%$Resources:mosschart,Properties3D_ascx_litWallThickness_Text%>" runat="server" />
	</td>
	<td><asp:TextBox id="txtWallThinkness" width="80px" maxlength="2" runat="server" cssclass="ms-input" /> 
		<asp:Literal id="litPixels" Text="<%$Resources:mosschart,Properties3D_ascx_litPixels_Text%>" runat="server" />
		<asp:RangeValidator id="valrngWallThinkness" controltovalidate="txtWallThinkness" 
		    display="Dynamic" minimumvalue="0" maximumvalue="30" type="Integer" runat="server" errormessage="3D Effects: Wall thinkness should be set within a range of 0 to 30 %">(?)</asp:rangevalidator>
	</td>
</tr>
<script language="javascript" type="text/javascript">
	var chk=document.getElementById('<%=chk3DEnabled.ClientID%>');

	ShowHideClass(chk.checked, 'row3dDetails');
</script>
