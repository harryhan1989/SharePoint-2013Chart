
Element =
{
extended: true,

visible: function(vis)
{
  if (vis != null)  {
    if (typeof vis == 'boolean')
      vis = vis ? '' : 'none';
    this.style.display = vis;        
  }
  return this.style.display != 'none';
},

kids: function(index)
{
  if (index == null) {
    var c = [];
    for (var i = 0; i < this.childNodes.length; i++)
      if (this.childNodes[i].nodeType != 3)
        c.push($(this.childNodes[i]));
    return c;
  } 
  else 
  {
    for (var i = 0, j = 0; i < this.childNodes.length; i++) {
      if (this.childNodes[i].nodeType != 3) {
        if (j == index)
          return $(this.childNodes[i]);
        j++;
      }
    }
    return null;
  }
},

parent: function()
{
  return $((this.parentNode == 'undefined') ? this.parentElement : this.parentNode);
},

prev: function()
{
  var p = this.previousSibling;
  while (p.nodeType == 3)
    p = p.previousSibling;
  return $(p);
},

next: function()
{
  var p = this.nextSibling;
  while (p.nodeType == 3)
    p = p.nextSibling;
  return $(p);
}
};

function $(e) 
{
  function extend(dst,src) 
  {
    if (!dst.extended) 
      for (var i in src) 
        dst[i] = src[i];
    return dst;
  }
  return extend( (typeof e == 'string') ?  document.getElementById(e) : e , Element);
}


// start PropertyGrid

var oldval = null;
var oldlbl = null;

function PropertyGrid(id, formId, items, selcolor, itembgcolor, cats,
  width, scrollableheight, scrollable, scrollbarwidth, bgcolor, headerfgcolor, lineheight, fgcolor, family, fontsize, interval,
  imageUrlCollapse, imageUrlCollapse2, imageUrlExpand, imageUrlExpand2, 
  imageUrlHelp, imageUrlHelpOff, imageUrlOff, imageUrlOn, imageUrlRefresh, imageUrlUnfresh)
{
  this.id = id;
  this.formId = formId;
  this.items = items;
  this.selcolor = selcolor;
  this.itembgcolor = itembgcolor;
  this.cats = cats;
  this.width = width;
  this.bgcolor = bgcolor;
  this.bordercolor = headerfgcolor;
  this.headerfgcolor = headerfgcolor;
  this.lineheight = lineheight;
  this.padwidth = 18;
  this.scrollable = (scrollable == 'True' && cats.length > 0);
  this.scrollableheight = scrollableheight;
  this.scrollbarwidth = (this.scrollable ? scrollbarwidth : 0);
  this.fgcolor = fgcolor;
  this.family = family;
  this.fontsize = fontsize;
  this.interval = interval;
  
  this.imageUrlCollapse = imageUrlCollapse;
  this.imageUrlCollapse2 = imageUrlCollapse2;
  this.imageUrlExpand = imageUrlExpand;
  this.imageUrlExpand2 = imageUrlExpand2;
  this.imageUrlHelp = imageUrlHelp;
  this.imageUrlHelpOff = imageUrlHelpOff;
  this.imageUrlOff = imageUrlOff;
  this.imageUrlOn = imageUrlOn;
  this.imageUrlRefresh = imageUrlRefresh;
  this.imageUrlUnfresh = imageUrlUnfresh;

  // Constants
  this.TYPE_SELECT_MULTIPLE = 'select-multiple';
}

PropertyGrid.prototype =
{
currentedit : null,
currentpicker : null,
endeditlock : null,
timerid     : null,
livemode    : false,
expanded    : true,

ApplyStyles: function(stylesheet)
{
  var self = this;
  function rule(sel,val)
  {
    var sels = sel.split(',');
    for (var i = 0; i < sels.length; i++)
    {
      var s = sels[i];
      var re = /\s/;
      var res = re.exec(s);
      if (res)
        s = s.replace(re, '_' + self.id + ' ');
      else
        s = s + '_' + self.id;
      if (stylesheet.addRule) //IE
        stylesheet.addRule(s, val);
      else if (stylesheet.insertRule) // Moz
        stylesheet.insertRule(s + '{' + val + '}', stylesheet.cssRules.length);
      else
        return; //opera
    }
  }
  rule('.PG'                                        ,'width:' + this.width + 'px' + ';background-color:' + this.bgcolor);
  rule('.PG *'                                      ,'color:' + this.fgcolor + ';font-family:' + this.family + ';font-size:' + this.fontsize);
  rule('.PGH,.PGF,.PGC,.PGF2,.PGS'                  ,'border-color:' + this.headerfgcolor + ';background-color:' + this.bgcolor);
  rule('.PGC *'                                     ,'line-height:' + this.lineheight + 'px;height:' + this.lineheight +'px');
  rule('.PGC a,.PGC_OPEN,.PGC_CLOSED'               ,'width:' + this.padwidth + 'px');
  rule('.PGC_HEAD span'                             ,'color:' + this.headerfgcolor);
  rule('.PGI_NONE,.PGI_OPEN,.PGI_CLOSED'            ,'width:' + this.padwidth + 'px;height:' + this.LineHeightMargin() + 'px');
  rule('.PGI_NAME,.PGI_VALUE,.PGI_NAME_SUB'         ,'width:' + this.HalfWidth() + 'px;background-color:' + this.itembgcolor);
  rule('.PGI_MS_VALUE,.PGI_PK_VALUE'                ,'width:' + this.HalfWidth() + 'px;background-color:' + this.itembgcolor);
  rule('.PGI_VALUE a,.PGI_VALUE select'             ,'width:100%');
  rule('.PGI_MS_VALUE a,.PGI_PK_VALUE a'            ,'width:100%');
  rule('.PGI_MS_VALUE select'                       ,'width:' + this.HalfWidth() + 'px');
  rule('.PGI_NAME_SUB span'                         ,'margin-left:' + this.padwidth + 'px');
  rule('.PGI_VALUE a:hover,.PGI_MS_VALUE a:hover'   ,'background-color:' + this.selcolor);
  rule('.PGI_PK_VALUE a:hover'                      ,'background-color:' + this.selcolor);
  rule('.PGI_PK_VALUE_div'                          ,'border-color:' + this.headerfgcolor + 
    ';background-color:' + this.itembgcolor + ';width:' + this.HalfWidth() + 'px;height:240px;');
  rule('.PGI_VALUE input,.PGI_PK_VALUE input'       ,'width:' + this.HalfWidthLess3() + 
    'px;line-height:' + this.InputLineHeight() + 'px;height:' + this.InputLineHeight() + 'px');

  if (!this.scrollable)
    rule('.PGC'             ,'border-left:1px solid; border-right:1px solid;border-color:' + this.headerfgcolor);
  else
    rule('.PGS'             ,'height:' + this.scrollableheight + 'px');
},

WidthInner:       function(){return this.width - 4 - (this.scrollable ? 2 : 0);},
LineHeightMargin: function(){return this.lineheight + 1;},
WidthLessPad:     function(){return this.WidthInner() - this.padwidth - this.scrollbarwidth;},
HalfWidth:        function(){return this.WidthLessPad()/2;},
HalfWidthLess3:   function(){return this.HalfWidth() - 5;},
InputLineHeight:  function(){return this.lineheight - 4;},

ShowHelp: function(sender)
{
  if (this.currentedit)
    this.EndEdit(this.currentedit);

  if (this.currentpicker)
    this.ClosePicker(this.currentpicker);
  
  var s = $(sender).next().firstChild.firstChild;
  this.ToggleActivity(true);
  
  var self = this;
  
  PropertyGridCallback.Send(this.id, 'GetDescription', [s.id.substr(this.id.length + 1)], 
    function(a) { self.UpdateDescription(eval("(" + a + ")")); }, null);
},

HandleKey: function(sender,e)
{
  if (e.keyCode == 13) //enter
  {
    if(sender.type == this.TYPE_SELECT_MULTIPLE)
	this.FinishEdit(sender);
    else
	this.EndEdit(sender);
    return false;
  }
  if (e.keyCode == 27) //escape
  {
    this.CancelEdit(sender);
    return false;
  }
  return true;
},

OpenPicker: function(sender)
{
  if (this.currentpicker)
    this.ClosePicker(this.currentpicker);

  var parentDiv = $(sender.parentNode);
  var pickerDiv = parentDiv.kids(3);

  pickerDiv.visible(true);
  pickerDiv.prev().visible(true);

  parentDiv.style.overflow = 'visible';
  this.currentpicker = sender;

  // Need to adjust the div offset only for browser following IE 8 standards 
  if (document.documentMode == 8)
  {
     var scrollDiv = document.getElementById(this.id + "_scr");
     pickerDiv.style.top = pickerDiv.offsetTop - scrollDiv.scrollTop;
  }
},

ClosePicker: function(sender,value)
{
  var parentDiv = $(sender.parentNode);
  var pickerInput = parentDiv.kids(1);

  // reset the offsetTop 
  var pickerDiv = parentDiv.kids(3);
  pickerDiv.style.top = "";	

  pickerInput.next().visible(false);
  pickerInput.next().next().visible(false);

  parentDiv.style.overflow = 'hidden';
  this.currentpicker = null;

  if (value != null)
  {
    pickerInput.value = value;
    this.EndEdit(pickerInput);
  }
},

BeginEdit: function(sender)
{
  if (this.currentedit)
    this.EndEdit(this.currentedit);
  
  if (this.currentpicker)
    this.ClosePicker(this.currentpicker);

  sender = $(sender);
  this.endeditlock = null;
  var s = sender.firstChild;
  this.ToggleActivity(true);
  
  var self = this;

  PropertyGridCallback.Send(this.id, 'GetDescription', [s.id.substr(this.id.length + 1)], 
    function(a) { self.UpdateDescription(eval("(" + a + ")")); }, null);
  
  sender.visible(false);
  sender.parent().prev().style.backgroundColor = this.selcolor;
  var edit = sender.next();
  edit.visible(true);
  
  if (edit.nodeName == 'SELECT')
  {
    var kids = edit.kids();

    if (edit.multiple)
    {
         // Need to adjust the div offset only for browser following IE 8 standards 
         if (document.documentMode == 8)
         {
                var parentDiv = $(sender.parentNode);
                var picker = parentDiv.kids(1);

                var scrollDiv = document.getElementById(this.id + "_scr");
                picker.style.top = picker.offsetTop - scrollDiv.scrollTop;
         }

      var selitems = ',' + s.innerHTML.replace(/ /g,'') + ',';
      for (var i = 0; i < kids.length; i++)
        kids[i].selected = selitems.indexOf(',' + kids[i].text + ',') != -1;
    }
    else
    {
      var seltext = s.innerHTML;
      for (var i = 0; i < kids.length; i++)
        kids[i].selected = kids[i].value == seltext;
    }
  }
  else
    edit.value = s.innerHTML;
  
  if (edit.disabled)
    edit.disabled = false;
    
  edit.focus();
  if (edit.nodeName == 'INPUT')
    edit.select();
  
  this.currentedit = edit;
},

EndEdit: function(sender)
{
  if (this.endeditlock)
    return;
  
  sender = $(sender);
  this.ToggleActivity(true);
  this.endeditlock = sender;
  this.currentedit = null;
  sender.parent().prev().style.backgroundColor = this.itembgcolor;
  sender.visible(false);

  var label = sender.prev();
  label.visible(true);

  var newval = (sender.nodeName == 'SELECT') ?
    sender.kids(sender.selectedIndex).innerHTML :
    sender.value;

  var firstchild = label.firstChild;
  oldlbl = firstchild;
  oldlbl.disabled = true;
  oldval = firstchild.innerHTML;
  //MWC: TODO: DevFixCodeReview: AjaxFix firstchild.innerHTML = newval;
  firstchild.innerText = newval;
  if (this.Callback)
  {
    this.Callback(firstchild.id.substr(this.id.length + 1), newval);
  }

  var self = this;
    
  PropertyGridCallback.Send(this.id, 'SetValueForClientSide', [firstchild.id.substr(this.id.length + 1), newval], 
    function(a) { self.SetValue(eval("(" + a + ")")); }, null);

},

CancelEdit: function(sender)
{
  if (this.currentedit == null)
    return;
  
  sender = $(sender);
  this.currentedit = null;
  this.endeditlock = sender;

  sender.parent().prev().style.backgroundColor = this.itembgcolor;
  sender.visible(false);
  var label = sender.prev();
  
  label.visible(true);
  this.UpdateDescription();
},

FinishEdit: function(sender)
{
  if (this.endeditlock)
    return;
  
  sender = $(sender);
  this.ToggleActivity(true);
  this.endeditlock = sender;
  this.currentedit = null;
  sender.parent().prev().style.backgroundColor = this.itembgcolor;
  sender.visible(false);


  if (sender.nodeName == 'SELECT')
  {
    if (sender.multiple)
    {
         // Need to adjust the div offset only for browser following IE 8 standards 
         if (document.documentMode == 8)
         {
                // reset the offsetTop 
                sender.style.top = "";
         }
     }
  }

  var label = sender.prev();
  label.visible(true);

  var newval = '';
  
  var kids = sender.kids();
  for (var i = 0; i < kids.length; i++)
    if (kids[i].selected)
      newval += kids[i].text + ',';
    
  newval = newval.substr(0, newval.length - 1);

  var firstchild = label.firstChild;
  oldlbl = firstchild;
  oldlbl.disabled = true;
  oldval = firstchild.innerHTML;
  //MWC: TODO: AlphaFixReview: PropertyGridHtmlEncode: firstchild.innerHTML = newval;
  firstchild.innerHTML = newval;
  
  if (this.Callback)
  {
    this.Callback(firstchild.id.substr(this.id.length + 1), newval);
  }

  var self = this;
    
  PropertyGridCallback.Send(this.id, 'SetValueForClientSide', [firstchild.id.substr(this.id.length + 1), newval], 
    function(a) { self.SetValue(eval("(" + a + ")")); }, null);

  this.UpdateDescription();
},

ToggleActivity: function(active)
{
  if (this.endeditlock)
    return;

  var ae = $(this.id + '_active');
  //MWC:alert(active + " " + ae.outerHTML);
  ae.visible(active);
},

UpdateDescription: function(result)
{
  if (result && result.error)
  {
    this.ToggleActivity(false);
    return;
  }
  var ft = $(this.id + '_foot');

  if (result != null)
    ft.innerHTML = '<span style="font-weight:bold;display:block">' + result.value[0] + '</span>' + result.value[1];

  this.ToggleActivity(false);
},

GetValues: function(sender)
{
  if (oldlbl == null && this.currentedit == null)
  {
    if (sender != null)
    {
      sender.src = this.imageUrlUnfresh;
      sender.disabled = true;
    }
    if (this.livemode ^ sender != null)
    {
      this.ToggleActivity(true);
      var self = this;

      PropertyGridCallback.Send(this.id, 'GetValues', [], 
        function(a,b) { self.UpdateValues(eval("(" + a + ")"), b); }, sender);
    }
  }
},

UpdateValues: function(result,sender)
{
  var vals = result.value;
  if (vals.length != this.items.length)
  {
    document.forms[this.formId].submit();
    return;
  }
  for (var i = 0; i < vals.length; i++)
  {
    var lbl = $(this.id + '_' + this.items[i]);
    var val = vals[i];
    if (lbl.innerHTML != val)
    {
      //MWC: TODO: AlphaFixReview: PropertyGridHtmlEncode: lbl.innerHTML = val;
      lbl.innerHTML = val;
      var par = lbl.parent();
      par.title = val;
    }
  }
  if (sender != null && !this.livemode)
  {
    sender.src = this.imageUrlRefresh;
    sender.disabled = false;
  }
  else if (this.livemode && sender == null)
  {
    var self = this;
    this.timerid = setTimeout(function() { self.GetValues(); }, this.interval);
  }
  this.ToggleActivity(false);
  //MWC: TODO: AlphaFixReview: PropertyGridHtmlEncode: 
  // propertyGridCallbackCompleted() should be implemented by the Page/Control 
  // which needs to perform functionalities immediately after the completion the call back.
  if(propertyGridCallbackCompleted)
    propertyGridCallbackCompleted();
    
  this.UpdateDescription();
},

SetValue: function(result)
{
  this.endeditlock = null;
  if (result.error != null)
  {
    this.ToggleActivity(false);
    alert(result.error);
    //MWC: TODO: AlphaFixReview: PropertyGridHtmlEncode:  oldlbl.innerHTML = oldval;
    oldlbl.innerText = oldval;
    oldlbl.disabled = false;
    oldlbl = oldval = null;
    this.UpdateDescription();
    return;
  }
  oldlbl.disabled = false;
  oldlbl = oldval = null;
  this.UpdateValues(result, "FAKE");
  if (this.CallbackComplete)
  {
    this.CallbackComplete();
  }
},

LiveMode: function(sender)
{
  sender = $(sender);
  this.livemode = !this.livemode;
  if (this.livemode)
  {
    var rf = sender.next();
    rf.src = this.imageUrlUnfresh;
    rf.disabled = true;
    sender.src = this.imageUrlOn;
    var self = this;
    this.timerid = setTimeout(function() { self.GetValues(); }, this.interval);
  }
  else
  {
    clearTimeout(this.timerid);
    sender.src = this.imageUrlOff;
    var rf = sender.next();
    rf.src = this.imageUrlRefresh;
    rf.disabled = false;
  }
},

SetViewLevel: function()
{
  this.ToggleAll(this.expanded);
},

ExpandAll: function(sender)
{
  if (!this.expanded)
  {
    this.expanded = true;

    sender.src = this.imageUrlExpand2;
    sender = $(sender).next();
    sender.src = this.imageUrlCollapse;
    this.SetViewLevel();
  }
},

CollapseAll: function(sender)
{
  if (this.expanded)
  {
    this.expanded = false;

    sender.src = this.imageUrlCollapse2;
    sender = $(sender).prev();
    sender.src = this.imageUrlExpand;
    this.SetViewLevel();
  }
},

ToggleAll: function(open)
{
  for (var i = 0; i < this.cats.length; i++)
  {
    var el = $(this.id + '_cat' + this.cats[i]);
    var sender = el.prev().prev();
    PGCatToggle2(sender,el,open);
  }
},

ToggleHelp: function(sender)
{
  sender = $(sender);
  var ft = $(this.id + '_foot').parent();
  var vis = ft.visible();
  sender.src = vis ? this.imageUrlHelpOff : this.imageUrlHelp;
  ft.visible(!vis);
}
};

function PGCatToggle(sender) 
{
  var el = $(sender).next().next();
  var open = !el.visible();
  PGCatToggle2(sender,el, open);
}

function PGCatToggle2(sender,el,open) 
{
  el.visible(open);
  sender.className = open ? 'PGC_OPEN' : 'PGC_CLOSED';
}

function PGSubToggle(sender) 
{
  var el = $(sender).parent().next();
  var open = !el.visible();
  PGSubToggle2(sender, el, open);
}

function PGSubToggle2(sender,el,open) 
{
  el.visible(open);
  sender.className = open ? 'PGI_OPEN' : 'PGI_CLOSED';
}
