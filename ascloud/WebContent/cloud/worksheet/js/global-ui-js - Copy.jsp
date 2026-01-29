<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Local local = new Local();

int languageCode = Util.safeInt(session.getAttribute("languageCode"));

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle WKGlobal = local.loadPropertiesFileNew("WK_global-ui-js",languageCode);
MyResourceBundle WKGlobalUI = local.loadPropertiesFileNew("WK_global-ui-i_option-js",languageCode);
%>

var cxt,rasiToBhavaConversion , counter , divcounting , arraylength,cookielen,previousdiv,col,counterdiv,first , second;
var toadd = '1';

$(document).ready(function() {
//alert("hii");
    function getcookieContent() {
    //sendparameters = "methodName=getChartCookies,getcookies=1";
      $.ajax(
        {
           'type': 'POST',
           'async': false,
           'global': false,
           'url': 'WorksheetServlet?methodName=getChartCookies',                
           'success': function(data) {
           //alert(data+"mydata");
           MyUrl = data.split("#");
           counter = MyUrl[3];
          // alert(MyUrl[0]);
           if (MyUrl[0] == "1") {
           displaycookieBox(MyUrl[2],MyUrl[1]);
           }
           else 
           {
             counter = 6;
            //alert("cookie not found");
            displayPortletBox(2, 3);
       }}
   });
}


    getcookieContent();
//  displayPortletBox(2, 3);

   $(".column,.addbox").sortable({
  //  $(".column").sortable({
    connectWith: ".column",
   // items: "div:not(#addbox6)",
    cancel: ".newbox",
    start: function (event, ui) {
     start_pos = ui.item.index();
     ui.item.data('start_pos', start_pos);
     first = this.id;
     second = this.id;
     previousdiv = ui.item.index();
      },
      receive: function(e, ui) { 
      var start_pos = ui.item.data('start_pos');
      var end_pos = ui.item.index();
      ui.item.data('end_pos', end_pos);
      second = this.id;
     
      },

      stop: function(event, ui) {
      var divdrag= $(ui.item).attr('id');
      columntodrag= second;
      columnfromdrag = first;
      rowdrag =ui.item.index();
      //alert(divdrag.substring(6,7)+","+columntodrag.substring(6,7)+","+columnfromdrag.substring(7,6)+","+rowdrag+","+previousdiv);
      dragCookies(divdrag.substring(6,7),columntodrag.substring(7,6),columnfromdrag.substring(6,7),rowdrag,previousdiv);
    }
    });
   


    $(".portlet").addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all").find(".portlet-header").addClass("ui-widget-header-custom ui-corner-top")
        .prepend("<span class='ui-icon-custom ui-float-l ui-margin-r ui-margin-t ui-icon-minus ui-icon-shadow ui-icon-corner-all ui-icon-bg'></span>").end().find(".portlet-content");

    $(".portlet-header .ui-icon-custom").click(function() {
        $(this).toggleClass("ui-icon-minus").toggleClass("ui-icon-plus");
        $(this).parents(".portlet:first").find(".portlet-content").toggle();
    });
    
    $(".column").disableSelection();
   $('.sortable').sortable({ cancel: '.addbox1' });
    $("#addbox").click(function() { 
      if(toadd == "1"){
        if (counter > 100) {
            //alert("Add box limit expired");
            alertbox('<%=WKGlobal.getString("ADD_BOX_LIMIT_EXPIRED")%>');
            return false;
        }

        var newAddBox = $(document.createElement('div')).attr("id", 'addbox' + counter).attr("class" ,'newbox')
        //var newAddBox = $(document.createElement('div')).attr("id", 'newaddbox')
        var optbtn = '<div class="ui-float-r" style="margin-top: 1px;"><button id="edituser-'+counter+'" onclick=opendialog("userbox-hdg' + counter + '","usersbox-' + counter + '","addbox' + counter + '",00,00) class="ui-button ui-corner-all ui-button-icon-only ui-widget-button-custom ui-margin-r" title="Options"><span class="ui-button-icon-primary ui-icon ui-icon-gear ui-icon-custom ui-icon-shadow ui-icon-corner-all ui-icon-bg"></span><span class="ui-button-text">Options</span></button><button id="removeBox-'+counter+'" onClick=removeaddBox("addbox' + counter + '"); class="ui-button ui-corner-all ui-button-icon-only ui-widget-button-custom ui-margin-r" title="Remove"><span class="ui-button-icon-primary ui-icon ui-icon-delete ui-icon-custom ui-icon-shadow ui-icon-corner-all ui-icon-bg"></span><span class="ui-button-text">Remove</span></button></div>'
        newAddBox.after().html('<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"><div class="portlet-header ui-widget-header-custom ui-corner-top"><span class="ui-icon-custom ui-float-l ui-margin-r ui-margin-t ui-icon-minus ui-icon-shadow ui-icon-corner-all ui-icon-bg"></span><!--[if IE 7]><table><tr><td style="width:235px;"><![endif]--><span id="userbox-hdg' + counter + '"><%=WKGlobal.getString("BLANK_BOX")%></span> <!--[if IE 7]></td><td><![endif]--> ' + optbtn + '<!--[if IE 7]></td></tr></table><![endif]--></div><div class="portlet-content"><div id="usersbox-' + counter + '"><div class="ui-blankbox"><%=WKGlobal.getString("BLANK_BOX_CONTENT")%></div></div></div>');
        newAddBox.prependTo("#column0");
        newAddBox.appendTo(".addbox");
        counterdiv  = counter;
        toadd = '0' ;
    }
    else
    {
   alertbox("Please fill the new box then you can add another box");
    }
  }
    );
    
    $("#reset").button({ icons: { primary: "ui-icon-stop"} });
    $("#reset").removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom ui-widget-header-custom1');
    $("#feedback").button({ icons: { primary: "ui-icon-stop"} });
    $("#feedback").removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom ui-widget-header-custom1');
    $("#savebox").button({ icons: { primary: "ui-icon-check"} });
    $("#savebox").removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom ui-widget-header-custom');
    $("#addbox").button({ icons: { primary: "ui-icon-plus"} });
    $("#addbox").removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom ui-widget-header-custom');
    $(".ui-button").hover(
                function() { $(this).removeClass('ui-state-hover').addClass("ui-btn-hover"); },
                function() { $(this).removeClass("ui-btn-hover"); });
    $('.ui-button').mousedown(function() { $(this).removeClass('ui-state-active').addClass("ui-btn-active"); });
    $('.ui-button').mouseup(function() { $(this).removeClass('ui-btn-active'); });
    $(".ui-widget-button-custom .ui-icon").addClass('ui-icon-custom ui-icon-shadow ui-icon-corner-all ui-icon-bg');

    for (i = 0; i < 101; i++) {
        $("#edituser-" + i + "").button({ icons: { primary: "ui-icon-gear"}, text: false })
        $("#edituser-" + i + "").removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom ui-margin-r')
       
    }
    
    for (i = 0; i < 101; i++) {
        $("#removeBox-" + i + "").button({ icons: { primary: "ui-icon-delete"}, text: false })
        $("#removeBox-" + i + "").removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom ui-margin-r')

        }

        /* Login------------------------------------------------------*/

    var button = $('#loginButton');
    var box = $('#loginBox');
    var form = $('#loginContent');
    button.removeAttr('href');
    button.mouseup(function(login) {
        box.toggle();
    });
    form.mouseup(function() {
        return false;
    });
    $(this).mouseup(function(login) {
        if (!($(login.target).parent('#loginButton').length > 0)) {
            box.hide();
        }
    });
    
});

/* for Option menu  */
$(document).delegate('#btnSaveExtra', 'mouseleave', function() { setTimeout(function() { if (!ItemActionButtons.isHoverMenu) { $('#btnSaveExtraOptions').hide(); } }, 100, 1) });
$(document).delegate('#btnSaveExtraOptions', 'mouseenter', function() { ItemActionButtons.isHoverMenu = true; });
$(document).delegate('#btnSaveExtraOptions', 'mouseleave', function() { $('#btnSaveExtraOptions').hide(); ItemActionButtons.isHoverMenu = false; });

var $IsHoverExtraOptionsFlag = 0;
$(document).ready(function() {
    $('#btnSaveExtraOptions li').mousedown(function() { $(this).addClass('ui-state-active'); });
    $('#btnSaveExtraOptions li').mouseup(function() { $(this).removeClass('ui-state-active'); });
});

var ItemActionButtons = {
    isHoverMenu: false,
    onSaveExtraClick: function() {
        $('#btnSaveExtraOptions').toggle();
    }

}
// for Remove
function removeBox(obj) { 
//alert("kk");
    var div = document.getElementById(obj);  
    cookieln = cookielen;
    getcolid(obj);
    getrowid(obj);
   // alert(obj+","+col+","+row);
    arrangedeletecookie(obj,col,row);
    removechartcookies(obj,cookieln,col,row);
    div.parentNode.removeChild(div);
}

function removeaddBox(obj) { 
    var div = document.getElementById(obj);    
    div.parentNode.removeChild(div);
     toadd = '1' ;
}


function resizeImage(img) {
    var resizeWidth = screen.width;
    if (resizeWidth <= 1024) {
    img.width = 320;
    }
    else if (resizeWidth <= 1280) {
    img.width = 400;
    }
    else if (resizeWidth <= 1366) {
    img.width = 425;
    img.height = 243;
    }
    else {
        img.width = 450;
    }
}

function displaycookieBox(cookielength,column) {
var arrindex = [];
var initialPages = [] ;
var pageHeadingcommon = [];
var rasiToBhavaConversion = [];
var divid = [];
var ischart = [];
var ColNo = [];
var RowNo = [];
arraydataval = column.split("&");
for (n = 0; n < cookielength; n++)
{
arrindex.push(arraydataval[n+1]);
}

for (k = 0; k < cookielength; k++)
{
 arraydataval2 = arrindex[k].split("@");
 pageHeadingcommon.push(arraydataval2[0]);
 initialPages.push(arraydataval2[1]);
 rasiToBhavaConversion.push(arraydataval2[2]);
 ischart.push(arraydataval2[4]);
 divid.push(arraydataval2[3]);
 ColNo.push(arraydataval2[5]);
 RowNo.push(arraydataval2[6]);
}
for (m = 0; m < cookielength; m++)
{
//alert(pageHeadingcommon[m]);
//alert(initialPages[m]);
//alert(rasiToBhavaConversion[m]);
//alert(rasiToBhavaConversion[m]);
//alert(ischart[m]);
//alert("divid="+divid[m]);
//alert(ColNo[m]);
}

var lenvaldivide = Math.floor(cookielength / 3);
var lenvalmod = cookielength % 3 ;
displayPortletothercookieBox(lenvaldivide , 3 , pageHeadingcommon ,initialPages , lenvalmod,ischart,rasiToBhavaConversion,cookielength,divid,ColNo,RowNo)
}


function displayPortletothercookieBox(row,column,pageHeadingcommon,initialPages,extradiv,ischart,rasiToBhavaConversion,cookielength,divid,ColNo,RowNo) {
//alert("hello");
var i, j, k;   
    k = 0;

    for (i = 0; i < column; i++) {
        ck = 0;
        $('#outerdiv').append('<div class="column" id="column' + i + '">');       
      //  if (i == 0) {
       //     $('#column' + i).append('<div class="addbox"></div>');
      //  }
    for (jk = 0 ; jk < ColNo.length ;jk++){count = 0;
    for (k = 0 ; k < RowNo.length ;k++){
    if (ColNo[k] == i  && RowNo[k] == ck){
    //alert(ck);
        $('#column' + i).append("<div class='portlet' id='addbox" + divid[count] + "'><div class='portlet-header'><!--[if IE 7]><table><tr><td style='width:235px;'><![endif]--><span id='userbox-hdg" +  divid[count] + "'>" + Getcontent(pageHeadingcommon[count],54) + "</span><!--[if IE 7]></td><td><![endif]--><div class='ui-float-r' style='margin-top:1px;'><button id='edituser-" + divid[count] + "' onclick=opendialog('userbox-hdg" +  divid[count] + "','usersbox-" +  divid[count] + "','addbox" +  divid[count]+ "'," +  i +","+ck+")><%=rBConstants.getString("OPTIONS") %></button><button id='removeBox-" +  divid[count] + "'  onClick=removeBox('addbox" + divid[count] + "');><%=rBConstants.getString("REMOVE") %></button></div><!--[if IE 7]></td></tr></table><![endif]--></div><div class='portlet-content'><div id='usersbox-" + divid[count] + "'></div></div></div>");
        var chk = rasiToBhavaConversion[count]; 
        if (chk == 'true'){rshbhav = true;}else{rshbhav = false;}
        getPageContent(initialPages[count],divid[count],ischart[count],rshbhav);
        ck = ck+1;
       count =  count +1;
    } else
    {
    count =  count +1;
    }
       }
     $('#outerdiv').append('</div>');
     }
  }
}


function displayPortletBox(row,column) {
//alert("hii");
    var i, j, k;    
    var initialPages = new Array("lagna-chart.jsp", "navamsha.jsp", "transit-today.jsp", "chalitchart.jsp", "ashtakvarga.jsp", "vimshottari-dasha.jsp");
    var pageHeading = new Array('<%=rBConstants.getString("LAGNA_KUNDLI")%>', '<%=rBConstants.getString("NAVAMSHA")%>', '<%=rBConstants.getString("TRANSIT_TODAY")%>', '<%=rBConstants.getString("BHAVA_CHALIT")%>', '<%=rBConstants.getString("ASHTAKVARGA")%>', '<%=rBConstants.getString("VIMSHOTRI_DASHA")%>')
    var pageHeadingcommon = new Array('LAGNA_KUNDLI', 'NAVAMSHA', 'TRANSIT_TODAY', 'BHAVA_CHALIT', 'ASHTAKVARGA', 'VIMSHOTRI_DASHA')
    rasiToBhavaConversion = new Array(false,false,true,true,'','')
    ischart = new Array('true','true','true','true','false','false')
    k = 0;
    for (i = 0; i < column; i++) {        
        $('#outerdiv').append('<div class="column" id="column' + i + '">');       
       // if (i == 0) {
       //     $('#column' + i).append('<div class="addbox"></div>');
      //  }
    for (j = 0; j < row; j++) {  
   // alert(i);
        $('#column' + i).append("<div class='portlet' id='addbox" + k + "'><div class='portlet-header'><!--[if IE 7]><table><tr><td style='width:235px;'><![endif]--><span id='userbox-hdg" + k + "'>" + pageHeading[k] + "</span><!--[if IE 7]></td><td><![endif]--><div class='ui-float-r' style='margin-top:1px;'><button id='edituser-" + k + "'   onclick=opendialog('userbox-hdg" + k + "','usersbox-" + k + "','addbox" + k +"',"+i+","+j+")><%=rBConstants.getString("OPTIONS") %></button><button id='removeBox-" + k + "' onClick=removeBox('addbox" + k + "');><%=rBConstants.getString("REMOVE") %></button></div><!--[if IE 7]></td></tr></table><![endif]--></div><div class='portlet-content'><div id='usersbox-" + k + "'></div></div></div>");
        getPageContent(initialPages[k],k,ischart[k],rasiToBhavaConversion[k]);
        var cookiestvalue = pageHeadingcommon[k]+"@"+initialPages[k]+"@"+rasiToBhavaConversion[k]+"@"+k+"@"+ischart[k]+"@"+i+"@"+j;
        //alert(cookiestvalue);
        setchartCookies(cookiestvalue,k+1);
        k = k + 1;    
    }
   $('#outerdiv').append('</div>');
    }   
    cookielen = 6;
}


function getPageContent(pageName,k,ischart,rasiToBhavaConversion) {
//alert("getPageContent="+pageName+rasiToBhavaConversion);
    var val;
    $.ajax(
        {
            'type': 'POST',
            'async': false,
            'global': false,
            'url': pageName,                
            'success': function(data) {
            
           // alert(data);
                if(ischart == 'true'){  
                    $('#usersbox-' + k).html(''); 
                    $('#usersbox-' + k).append("<canvas id='Canvas" + k + "' width='450' height='270' class='ui-canvas'></canvas>");
                    
                    var returndataobj = eval('(' + data + ')'); 
                    //alert(data);
                    var arrPlanetsShodashvarga = new Array();  
                    arrPlanetsShodashvarga = returndataobj[0].arrayval;  
                    if(Object.keys(returndataobj[0]).length == 4)
                    {
                    arrBhavRashi = returndataobj[0].BhavRashi;
                    arrRashiposition= returndataobj[0].arrayvalofrashi;
                    arrRashipositionforsouth = returndataobj[0].RashiPlanetForSouth;
                    //alert(returndataobj[0].BhavRashi);
                    getChartofKP(arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, <%=languageCode%>, "Canvas"+k,rasiToBhavaConversion);  
                    }
                   else if(Object.keys(returndataobj[0]).length == 2)
                   {
                    alert('');
                   arrRashipositionforsouth = returndataobj[0].RashiPlanetForSouth;
                   getChartofCommon(arrPlanetsShodashvarga,'','',arrRashipositionforsouth, <%=languageCode %>, "Canvas"+k,rasiToBhavaConversion);  
                   }
                    else
                   {
                   getChart(arrPlanetsShodashvarga, <%=languageCode%>, "Canvas"+k,rasiToBhavaConversion);   
                    }
                   }        
                else{
                //alert("getdata");
                    <% if(session.getAttribute("HoroscopeObj")==null || session.getAttribute("HoroscopeObj").equals("")){%>
                    //alert("if");
                        //$('#usersbox-' + k).html('');
                        $('#usersbox-' + k).append("<div style=' font-size:larger; font-weight:bold; height:200px; padding:5px;'><%=WKGlobalUI.getString("SESSION_EXPIRED_MSG")%></div>");    
                    <% }else{%>
                     //alert("else");
                        $('#usersbox-' + k).html('');
                        $('#usersbox-' + k).append(data);    
                    <% } %>
                }
            }
        });   
}

function getChartofKP(arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Lcode, canvasid,rasiToBhavaConversion){
//alert(arrPlanetsShodashvarga+","+ Lcode+","+ canvasid+","+rasiToBhavaConversion+","+typeof(rasiToBhavaConversion));
//alert(Lcode+"KP");


//for tamil languade code check


LanguageCode = Lcode;
textcolor = COLOR_INFO;
if(window.HTMLCanvasElement) {  
 
    var c = document.getElementById(canvasid);
    cxt = c.getContext("2d");
    cxt.strokeStyle = "#ff0000";
    Chart_Type = <%=session.getAttribute("chartType") %>;

    SetFontSize(12);  
       
        if (window.innerWidth <= 1024) {
           PrintChartofKP(0, 0, 450, 270, arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Chart_Type, LanguageCode,rasiToBhavaConversion); 
        }
        else if (window.innerWidth <= 1152) {
		     PrintChartofKP(0, 0, 450, 270, arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Chart_Type, LanguageCode,rasiToBhavaConversion);
	    }
	    else {
		    PrintChartofKP(0, 0, 450, 270, arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Chart_Type, LanguageCode,rasiToBhavaConversion)
	    }  
}    
else {

$("#chart").append('<img src=lagna-navamsa-chart.asp?Chart_type=LagnaKundli&LanguageCode=' + LanguageCode + '&textcolor=' + textcolor + '&planetstyle=0>');
}
}

function getChart(arrPlanetsShodashvarga, Lcode, canvasid,rasiToBhavaConversion){
//alert(arrPlanetsShodashvarga+","+ Lcode+","+ canvasid+","+rasiToBhavaConversion+","+typeof(rasiToBhavaConversion));

//for tamil languade code check



LanguageCode = Lcode;
textcolor = COLOR_INFO;
if(window.HTMLCanvasElement) {  
 
    var c = document.getElementById(canvasid);
    cxt = c.getContext("2d");
    cxt.strokeStyle = "#ff0000";
    Chart_Type = <%=session.getAttribute("chartType")%>;

    SetFontSize(12);  
       
        if (window.innerWidth <= 1024) {
           PrintChart(0, 0, 450, 270, arrPlanetsShodashvarga, Chart_Type, LanguageCode,rasiToBhavaConversion); 
        }
        else if (window.innerWidth <= 1152) {
		     PrintChart(0, 0, 450, 270, arrPlanetsShodashvarga, Chart_Type, LanguageCode,rasiToBhavaConversion);
	    }
	    else {
		    PrintChart(0, 0, 450, 270, arrPlanetsShodashvarga, Chart_Type, LanguageCode,rasiToBhavaConversion)
	    }  
}    
else {

$("#chart").append('<img src=lagna-navamsa-chart.asp?Chart_type=LagnaKundli&LanguageCode=' + LanguageCode + '&textcolor=' + textcolor + '&planetstyle=0>');
}
}



function Getcontent(Heading , arrlength) { 
  for (loopcounter = 0; loopcounter < arrlength; loopcounter++) {
   if (Headingarr[loopcounter][0] == Heading) {
    headingval = Headingarr[loopcounter][1];
    }
    }
    return headingval;
}



function getChartofCommon(arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Lcode, canvasid,rasiToBhavaConversion){
//alert(arrRashipositionforsouth+","+ Lcode+","+ canvasid+","+rasiToBhavaConversion+","+typeof(rasiToBhavaConversion));
//alert(Lcode);

LanguageCode = Lcode;
textcolor = COLOR_INFO;
if(window.HTMLCanvasElement) {  
 
    var c = document.getElementById(canvasid);
    cxt = c.getContext("2d");
    cxt.strokeStyle = "#ff0000";
    Chart_Type = <%=session.getAttribute("chartType") %>;

    SetFontSize(12);  
       
        if (window.innerWidth <= 1024) {
           PrintChartofCommon(0, 0, 450, 270, arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Chart_Type, LanguageCode,rasiToBhavaConversion); 
        }
        else if (window.innerWidth <= 1152) {
		     PrintChartofCommon(0, 0, 450, 270, arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Chart_Type, LanguageCode,rasiToBhavaConversion);
	    }
	    else {
		    PrintChartofCommon(0, 0, 450, 270, arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, Chart_Type, LanguageCode,rasiToBhavaConversion)
	    }  
}    
else {

$("#chart").append('<img src=lagna-navamsa-chart.asp?Chart_type=LagnaKundli&LanguageCode=' + LanguageCode + '&textcolor=' + textcolor + '&planetstyle=0>');
}
}

