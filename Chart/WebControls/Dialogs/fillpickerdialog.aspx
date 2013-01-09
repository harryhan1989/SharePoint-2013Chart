<%@ Page Language="C#" %>
<%@ Register Tagprefix="dialogs" Namespace="Microsoft.Office.Server.Internal.Charting.UI.WebControls.Dialogs" Assembly="Microsoft.Office.Server.Chart, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta http-equiv="Expires" content="0" />
    <title><asp:Literal runat="server" Text="<%$Resources:mosschart,FillPickerDialog_aspx_Title_Text%>" /></title>
    <style type="text/css">
		body{
			background: #FFFFFF url(Images/bodyBg.jpg) repeat-x;
			font-family:Verdana,Arial,Helvetica,sans-serif;
			font-size:10px;
			padding:10px
		}
		a {color:black;font-size:7pt;text-decoration:none;}
		.dialogButton{ width: 80px; font-size:10pt }
		.pickerDiv {border:solid 1px black; }
		.inputColor {width:50px; font-size:9pt;}
		.frameIn{border-color:#ccccc #ffffff #fffff #cccccc;}
    </style>
    <base target="_self"/>
</head>

<body>
<form id="form1" runat="server">
<table cellpadding="0" cellspacing="5" border="0">
	<tr>
		<td>Start color:</td>
		<td>
			<dialogs:colorPicker id="colorPickerStart" Path="..\" runat="server" width="80px" />
		</td>
	</tr>
	<tr>
		<td>End color:</td>
		<td>
			<dialogs:colorPicker id="colorPickerEnd" Path="..\" runat="server" width="80px" />
		</td>
	</tr>
	<tr>
		<td>Gradient:</td>
		<td>
			<asp:DropDownList ID="ddl"
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table cellpadding="0" cellspacing="0" border="0" class="pickerDiv">
			<tr>
				<td><div id="colorBox"><img src="images/ColorPickerRgb.jpg" width="180" height="180" style="cursor:crosshair;" onmousedown="colorBox_MouseDown(event, 'colorBox', 'trPreviewNew');"/></div></td>
				<td><div id="grayBox"><img src="images/ColorPickerGrayscale.jpg" width="30" height="180" style="cursor:crosshair;" onmousedown="grayBox_MouseDown(event, 'grayBox', 'trPreviewNew');"/></div></td>
			</tr>
			</table>
		</td>
		<td align="center" style="padding:0px 10px 0px 10px">			
			<table cellpadding="0" cellspacing="1" border="0" width="100px">
			<tr>
				<td colspan="2" style="padding-bottom:10px;">
					<table cellpadding="0" cellspacing="0" border="0" width="100%" class="pickerDiv">
					<tr>
						<td id="trPreviewOld"><img src="images/spacer.gif" height="38" width="94"/></td>
					</tr>
					<tr>
						<td id="trPreviewNew"><img src="images/spacer.gif" height="38" width="94"/></td>
					</tr>
					</table>					
				</td>
			</tr>
			<tr>
				<td align="left">Red:</td>
				<td><input id="txtR" class="inputColor" onchange="rgba_Change();"/></td>
			</tr>
			<tr>	
				<td align="left">Green:</td>
				<td><input id="txtG" class="inputColor" onchange="rgba_Change();" /></td>
			</tr>
			<tr>
				<td align="left">Blue:</td>
				<td><input id="txtB" class="inputColor" onchange="rgba_Change();" /></td>
			</tr>
			<tr>
				<td align="left">Opacity:</td>
				<td><input id="txtA" class="inputColor" onchange="rgba_Change();" /></td>
			</tr>
			<tr>
				<td align="left">#</td>
				<td><input id="txtHex" class="inputColor" onchange="hex_Change();" /></td>
			</tr>
			</table>
		</td>
		<td>
			<input id="btnOK" type="button" value="OK" OnClick="SaveUI();" class="dialogButton" /><br>
			<br>
			<input id="btnCancel" type="button" value="Cancel" OnClick="window.close();" class="dialogButton" /><br>			
			<img src="images/spacer.gif" width="1" height="100">
			<br>
		</td>
	</tr>
</table>
</form>
<script>   

	var COLOR_WIDTH = 180;
	var COLOR_HEIGHT = 180;
	var GRAY_WIDTH = 30;
	var GRAY_HEIGHT = 180;

	var ColorInfo;

	var colorBox = document.getElementById("colorBox");
	var grayBox = document.getElementById("grayBox");
	var previewOld = document.getElementById("trPreviewOld");
	var previewNew = document.getElementById("trPreviewNew");
	var txtR = document.getElementById('txtR');	
	var txtG = document.getElementById('txtG');
	var txtB = document.getElementById('txtB');
	var txtA = document.getElementById('txtA');
	var txtHex = document.getElementById('txtHex');

	LoadUI();

	function LoadUI(){		
		if (window.dialogArguments){ 
			ColorInfo = window.dialogArguments;
		}else{
			ColorInfo = ParentWindow.ModalColorInfo;
		}
		if (ColorInfo){		
			txtR.value = ColorInfo.Red;
			txtG.value = ColorInfo.Green;
			txtB.value = ColorInfo.Blue;
			txtA.value = ColorInfo.Alfa;		
			previewOld.style.backgroundColor=
			previewNew.style.backgroundColor=
				"#"+Hex(ColorInfo.Red)+Hex(ColorInfo.Green)+Hex(ColorInfo.Blue);
			txtHex.value=Hex(ColorInfo.Red)+Hex(ColorInfo.Green)+Hex(ColorInfo.Blue)+(ColorInfo.Alfa==255 ? "" : "+"+Hex(ColorInfo.Alfa));
		}
	}

	function SaveUI(){		
		ColorInfo.Red = txtR.value;
		ColorInfo.Green = txtG.value;
		ColorInfo.Blue = txtB.value;
		ColorInfo.Alfa = txtA.value;
		ColorInfo.Name = "#"+Hex(ColorInfo.Red)+Hex(ColorInfo.Green)+Hex(ColorInfo.Blue);

		if (window.dialogArguments){ 
			returnValue = ColorInfo;
			window.close();
		}else{ 
			ParentWindow.ModalColorInfo = ColorInfo;
			ParentWindow.OnColorModalDialogOK();
			window.close();
		}
	}

	function colorBox_MouseDown(ev, colorBoxId, previewBoxId){
		var mouseCoord = MouseCoordinates(ev);
		var imgCoord = GetElementAbsolutePosition(colorBox);
		var color = GetRgbColor(mouseCoord.x-imgCoord.x, mouseCoord.y-imgCoord.y, COLOR_WIDTH, COLOR_HEIGHT);
		txtR.value = color.red;
		txtG.value = color.green;
		txtB.value = color.blue;
		rgba_Change();
	}

	function grayBox_MouseDown(ev, colorBoxId, previewBoxId){
		var mouseCoord = MouseCoordinates(ev);
		var imgCoord = GetElementAbsolutePosition(colorBox);
		var color = GetGrayscaleColor(mouseCoord.x-imgCoord.x, mouseCoord.y-imgCoord.y, GRAY_WIDTH, GRAY_HEIGHT);
		txtR.value = color.red;
		txtG.value = color.green;
		txtB.value = color.blue;
		rgba_Change();
	}

	function rgba_Change(){
		var r = parseInt(txtR.value);
		var g = parseInt(txtG.value);
		var b = parseInt(txtB.value);
		var a = parseInt(txtA.value);
		previewNew.style.backgroundColor = "#"+Hex(r)+Hex(g)+Hex(b);
		txtHex.value=Hex(r)+Hex(g)+Hex(b)+(a==255 ? "" : "+"+Hex(a));
	}

	function hex_Change(){		
		var hex = txtHex.value.replace("#", "");	
		if (hex.length==6){ 
			txtR.value = parseInt(hex.substr(0,2), 16); 
			txtG.value = parseInt(hex.substr(2,2), 16); 
			txtB.value = parseInt(hex.substr(4,2), 16); 
			txtA.value = 255;						
			rgba_Change();
		}
		if (hex.length==9){ 
			txtR.value = parseInt(hex.substr(0,2), 16); 
			txtG.value = parseInt(hex.substr(2,2), 16); 
			txtB.value = parseInt(hex.substr(4,2), 16); 
			txtA.value = parseInt(hex.substr(7,2), 16); 						
			rgba_Change();
		}

	}

	function GetRgbColor(x, y, width, height){   
		var xrange = width/6;						
		var r, g, b;								
		var i = (x%xrange)*255/xrange;	

		if (x<xrange){r=255; g=i; b=0;}				
		else if (x<(xrange*2)){r=255-i; g=255; b=0;}
		else if (x<(xrange*3)){r=0; g=255; b=i;}	
		else if (x<(xrange*4)){r=0; g=255-i; b=255;}
		else if (x<(xrange*5)){r=i; g=0; b=255;}	
		else {r=255; g=0; b=255-i;}					

		var yrange = height/2;
		if (y<yrange){
			var light = 255-(255*y/yrange);   
			r = light+(r*y/yrange);   
			g = light+(g*y/yrange);   
			b = light+(b*y/yrange);   
		}else{   
			var light = ((height-y)/yrange);      
			r=r*light;   
			g=g*light;   
			b=b*light;   
		 }      
		 return {red:Math.round(r), green:Math.round(g), blue:Math.round(b)};
	} 

	function GetGrayscaleColor(x, y, width, height) {
		var light=255-y*255/height;
		return {red:Math.round(light), green:Math.round(light), blue:Math.round(light)};
	}

	function Hex(byteVar){
		var digits = "0123456789ABCDEF";
		var digit1 = digits.charAt(byteVar/16);
		var digit0 = digits.charAt(byteVar%16);
		return digit1+digit0;
	}

	function HexColor(color){
		return "#"+Hex(color.red)+Hex(color.green)+Hex(color.blue);
	}

	function MouseCoordinates(ev){
	   ev = ev || window.event;
	   if(ev.pageX || ev.pageY)
		  return {x:ev.pageX, y:ev.pageY};
	   return {x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
			   y:ev.clientY + document.body.scrollTop  - document.body.clientTop};
	}

	function GetElementAbsolutePosition(obj){
		var left = 0;
		var top  = 0;
		while (obj.offsetParent){
			left += obj.offsetLeft;
			top  += obj.offsetTop;
			obj   = obj.offsetParent;
		}
		left += obj.offsetLeft;
		top  += obj.offsetTop;
		return {x:left, y:top};
	}

	function CreateColorDivArray(width, height, div){ 
		div.style.cssText = "width:"+width+"px; height:"+height+"px;";

		for(var iy=0; iy<height; iy++){ 
			for(var ix=0; ix<width; ix++){   
				var box    = document.createElement('div');   
				var img    = document.createElement('div');   
				img.src    = "images/spacer.gif";   
				img.width  = "1";   
				img.height = "1";   
				var color = GetRgbColor(ix, iy, width, height);
				box.style.cssText = 'width:1px;height:1px;float:left;background-color:' + HexColor(color);   
				box.appendChild(img);   
				div.appendChild(box);   
			}
		}   
	}

	function CreateGrayDivArray(width, height, div){
		div.style.cssText = "width:"+width+"px; height:"+height+"px;";

		for(var iy=0; iy<height; iy++){ 
			for(var ix=0; ix<width; ix++){   
				var box    = document.createElement('div');   
				var img    = document.createElement('div');   
				img.src    = "images/spacer.gif";   
				img.width  = "1";   
				img.height = "1";   
				box.style.cssText = 'width:1px;height:1px;float:left;background-color:' + HexColor(GetGrayscaleColor(ix, iy, width, height));   
				box.appendChild(img);   
				div.appendChild(box);   
			}
		}   
	}

 </script>   

</body>
</html>
