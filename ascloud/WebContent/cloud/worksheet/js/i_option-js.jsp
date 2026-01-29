<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Local local = new Local();

int languageCode_opJs = Util.safeInt(session.getAttribute("languageCode"));
//System.out.println(languageCode_opJs+"nha");
MyProperties rBConstants_opJs = (MyProperties) session.getAttribute("constants");
MyResourceBundle varshphalAllPages = local.loadPropertiesFileNew("varshphalallpages",languageCode_opJs);
MyResourceBundle WKGlobal = local.loadPropertiesFileNew("WK_global-ui-i_option-js",languageCode_opJs);
MyResourceBundle WKOption = local.loadPropertiesFileNew("WK_i_option-js",languageCode_opJs);
int year  = Calendar.getInstance().get(Calendar.YEAR);
%>

//var columnheading = [false,true,''];
var col,row,checkrow,ck;

 var dialogboxContentarr = [['<%=rBConstants_opJs.getString("LAGNA_KUNDLI")%>', '<%=rBConstants_opJs.getString("PLANETARY_POSITIONS")%>', '<%=rBConstants_opJs.getString("LAGNA")%>'],
                            ['<%=rBConstants_opJs.getString("CHANDRA_KUNDLI")%>', '<%=rBConstants_opJs.getString("VIMSHOTRI_DASHA")%>', '<%=rBConstants_opJs.getString("HORA")%>'],
                            ['<%=rBConstants_opJs.getString("SURYA")%>', '<%=rBConstants_opJs.getString("TRANSIT_TODAY")%>', '<%=rBConstants_opJs.getString("DREKKANA")%>'],
                            ['<%=rBConstants_opJs.getString("HORA")%>', '<%=rBConstants_opJs.getString("ASHTAKVARGA")%>', '<%=rBConstants_opJs.getString("CHATURTHAMSHA")%>'],
                            ['<%=rBConstants_opJs.getString("NAVAMSHA")%>', '<%=rBConstants_opJs.getString("SHADBAL")%>', '<%=rBConstants_opJs.getString("SAPTAMAMSHA")%>'],
                            ['<%=rBConstants_opJs.getString("BHAVA_CHALIT")%>', '<%=rBConstants_opJs.getString("K_P_PLANETS")%>', '<%=rBConstants_opJs.getString("NAVAMSHA")%>'],
                            ['<%=WKOption.getString("KP_NIRAYAN_BHAVA_CHALIT")%>', '<%=rBConstants_opJs.getString("K_P_CUSPS")%>', '<%=rBConstants_opJs.getString("DASHAMAMSHA")%>'],
                            ['<%=rBConstants_opJs.getString("VARSHPHAL_KUNDLI")%>', '<%=rBConstants_opJs.getString("K_P_PLANET_SIGNIFICANCE")%>', '<%=rBConstants_opJs.getString("DWADASHAMAMSHA")%>'],
                            ['<%=rBConstants_opJs.getString("LAL_KITAB_LAGNA")%>', '<%=rBConstants_opJs.getString("K_P_HOUSE_SIGNIFICANCE")%>', '<%=rBConstants_opJs.getString("SHODASHAMAMSHA")%>'],
                            ['<%=rBConstants_opJs.getString("LAL_KITAB_VARSHPHAL_LAGNA")%>', '<%=rBConstants_opJs.getString("RULING_PLANET")%>', '<%=rBConstants_opJs.getString("VIMSHAMSHA")%>'],
                            ['', '<%=rBConstants_opJs.getString("LAL_KITAB_VARSHAPHAL_PLANET")%>', '<%=rBConstants_opJs.getString("CHATURVIMSHAMSHA")%>'],
                            ['', '<%=rBConstants_opJs.getString("LAL_KITAB_VARSHAPHAL_HOUSE")%>', '<%=rBConstants_opJs.getString("SAPTAVIMSHMSHA")%>'],
                            ['', '<%=rBConstants_opJs.getString("ASPECT_ON_KP_CUSP")%>', '<%=rBConstants_opJs.getString("TRIMSHAMSHA")%>'],
                            ['', '<%=varshphalAllPages.getString("PANCHADIKARI")%>', '<%=rBConstants_opJs.getString("KHAVEDAMSHA")%>'],
                            ['', '<%=rBConstants_opJs.getString("LAL_KITAB_PLANET")%>', '<%=rBConstants_opJs.getString("SHASHTIAMSHA")%>'],
                            ['', '<%=rBConstants_opJs.getString("LAL_KITAB_HOUSE")%>', '<%=rBConstants_opJs.getString("AKSHAVEDAMSHA")%>'],
                            ['', '<%=rBConstants_opJs.getString("WESTERN_PLANET")%>', ''],
                            ['', '<%=rBConstants_opJs.getString("WESTERN_CUSP")%>', '']];




        var Headingarr = [['LAGNA_KUNDLI', '<%=rBConstants_opJs.getString("LAGNA_KUNDLI")%>', 'lagna-chart.jsp',true,false],
                          ['PLANETARY_POSITION', '<%=rBConstants_opJs.getString("PLANETARY_POSITIONS")%>', 'planetary-position.jsp',false,''],
                          ['LAGNA_KUNDLI', '<%=rBConstants_opJs.getString("LAGNA")%>', 'lagna-chart.jsp',true,false],

                            ['CHANDRA_KUNDLI', '<%=rBConstants_opJs.getString("CHANDRA_KUNDLI")%>', 'chandra-chart.jsp',true,false],
                            ['VIMSHOTRI_DASHA', '<%=rBConstants_opJs.getString("VIMSHOTRI_DASHA")%>', 'vimshottari-dasha.jsp',false,''],
                            ['HORA', '<%=rBConstants_opJs.getString("HORA")%>', 'hora-chart.jsp',true,false],

                            ['SURYA', '<%=rBConstants_opJs.getString("SURYA")%>', 'surya-chart.jsp',true,false],
                            ['TRANSIT_TODAY', '<%=rBConstants_opJs.getString("TRANSIT_TODAY")%>', 'transit-today.jsp',true,true],
                            ['DREKKANA', '<%=rBConstants_opJs.getString("DREKKANA")%>', 'drekkana.jsp',true,false],

                            ['HORA', '<%=rBConstants_opJs.getString("HORA")%>', 'hora-chart.jsp',true,false],
                            ['ASHTAKVARGA', '<%=rBConstants_opJs.getString("ASHTAKVARGA")%>', 'ashtakvarga.jsp',false,''],
                            ['CHATURTHAMSHA', '<%=rBConstants_opJs.getString("CHATURTHAMSHA")%>', 'chaturthamsha.jsp',true,false],

                            ['NAVAMSHA', '<%=rBConstants_opJs.getString("NAVAMSHA")%>', 'navamsha.jsp',true,false],
                            ['SHADBAL', '<%=rBConstants_opJs.getString("SHADBAL")%>', 'shadbala.jsp',false,''],
                            ['SAPTAMAMSHA', '<%=rBConstants_opJs.getString("SAPTAMAMSHA")%>', 'saptamamsha.jsp',true,false],

                            ['BHAVA_CHALIT', '<%=rBConstants_opJs.getString("BHAVA_CHALIT")%>', 'chalitchart.jsp',true,true],
                            ['K_P_PLANETS', '<%=rBConstants_opJs.getString("K_P_PLANETS")%>', 'kpplanet.jsp',false,''],
                            ['NAVAMSHA', '<%=rBConstants_opJs.getString("NAVAMSHA")%>', 'navamsha.jsp',true,false],
                            
                            ['K_P_CUSPS_CHART', '<%=WKOption.getString("KP_NIRAYAN_BHAVA_CHALIT")%>', 'kpcusp-chart.jsp',true,true],
                            ['K_P_CUSPS', '<%=rBConstants_opJs.getString("K_P_CUSPS")%>', 'kpCuspBhav.jsp',false,''],
                            ['DASHAMAMSHA', '<%=rBConstants_opJs.getString("DASHAMAMSHA")%>', 'dashamamsha.jsp',true,false],
                            
                            ['VARSHPHAL_KUNDLI', '<%=rBConstants_opJs.getString("VARSHPHAL_KUNDLI")%> (<%=rBConstants_opJs.getString("YEA")%>&nbsp;<%=year%>)', 'varshphal-chart.jsp',true,true],
                            ['K_P_PLANET_SIGNIFICANCE', '<%=rBConstants_opJs.getString("K_P_PLANET_SIGNIFICANCE")%>', 'kpplanet-significance.jsp',false,''],
                            ['DWADASHAMAMSHA', '<%=rBConstants_opJs.getString("DWADASHAMAMSHA")%>', 'dwadashamamsha.jsp',true,false],
                            
                            
                            ['LAL_KITAB_LAGNA', '<%=rBConstants_opJs.getString("LAL_KITAB_LAGNA")%>', 'lklagna-chart.jsp',true,true],
                            ['K_P_HOUSE_SIGNIFICANCE', '<%=rBConstants_opJs.getString("K_P_HOUSE_SIGNIFICANCE")%>', 'kphouse-significance.jsp',false,''],
                            ['SHODASHAMAMSHA', '<%=rBConstants_opJs.getString("SHODASHAMAMSHA")%>', 'shodashamamsha.jsp',true,false],
                            
                            
                            ['LAL_KITAB_VARSHPHAL_LAGNA', '<%=rBConstants_opJs.getString("LAL_KITAB_VARSHPHAL_LAGNA")%> (<%=rBConstants_opJs.getString("YEA")%>&nbsp;<%=year%>)', 'lkvarshphal-chart.jsp',true,true],
                            ['RULING_PLANET', '<%=rBConstants_opJs.getString("RULING_PLANET")%>', 'ruling-planet.jsp',false,''],
                            ['VIMSHAMSHA', '<%=rBConstants_opJs.getString("VIMSHAMSHA")%>', 'vimshamsha.jsp',true,false],
                            
                            
                            ['', '', '','',''],
                            ['LAL_KITAB_VARSHPHAL_PLANET', '<%=rBConstants_opJs.getString("LAL_KITAB_VARSHAPHAL_PLANET")%> (<%=rBConstants_opJs.getString("YEA")%>&nbsp;<%=year%>)', 'lalkitab-varshphal-planet.jsp',false,''],
                            ['CHATURVIMSHAMSHA', '<%=rBConstants_opJs.getString("CHATURVIMSHAMSHA")%>', 'chaturvimshamsha.jsp',true,false],
                            
                            
                            ['', '', '','',''],
                            ['LAL_KITAB_VARSHAPHAL_HOUSE', '<%=rBConstants_opJs.getString("LAL_KITAB_VARSHAPHAL_HOUSE")%> (<%=rBConstants_opJs.getString("YEA")%>&nbsp;<%=year%>)', 'lalkitab-varshphal-house.jsp',false,''],
                            ['SAPTAVIMSHMSHA', '<%=rBConstants_opJs.getString("SAPTAVIMSHMSHA")%>', 'saptavimshmsha.jsp',true,false],
                            
                            
                            ['', '', '','',''],
                            ['ASPECT_ON_KP_CUSP', '<%=rBConstants_opJs.getString("ASPECT_ON_KP_CUSP")%>', 'kpcusps.jsp',false,''],
                            ['TRIMSHAMSHA', '<%=rBConstants_opJs.getString("TRIMSHAMSHA")%>', 'trimshamsha.jsp',true,false],
                            
                            ['', '', '','',''],
                            ['PANCHADHIKARI', '<%=varshphalAllPages.getString("PANCHADIKARI")%> (<%=rBConstants_opJs.getString("YEA")%>&nbsp;<%=year%>)', 'panchadhikari.jsp',false,''],
                            ['KHAVEDAMSHA', '<%=rBConstants_opJs.getString("KHAVEDAMSHA")%>', 'khavedamsha.jsp',true,false],
                            
                            
                            ['', '', '','',''],
                            ['LAL_KITAB_PLANET', '<%=rBConstants_opJs.getString("LAL_KITAB_PLANET")%>', 'lalkitab-planet.jsp',false,''],
                            ['SHASHTIAMSHA', '<%=rBConstants_opJs.getString("SHASHTIAMSHA")%>', 'shashtiamsha.jsp',true,false],
                            
                            
                            ['', '', '','',''],
                            ['LAL_KITAB_HOUSE', '<%=rBConstants_opJs.getString("LAL_KITAB_HOUSE")%>', 'lalkitab-house.jsp',false,''],
                            ['AKSHAVEDAMSHA', '<%=rBConstants_opJs.getString("AKSHAVEDAMSHA")%>', 'akshavedamsha.jsp',true,false],
                            
                            
                            ['', '', '','',''],
                            ['WESTERN_PLANET', '<%=rBConstants_opJs.getString("WESTERN_PLANET")%>', 'western-planet.jsp',false,''],
                            ['', '', '','',''],
                            
                            
                            ['', '', '','',''],
                            ['WESTURN_CUSP', '<%=rBConstants_opJs.getString("WESTERN_CUSP")%>', 'western-cusp.jsp',false,''],
                            ['', '', '','','']];




        $(function() {
            tableGrid(18, 3, dialogboxContentarr, Headingarr);
            //alert(Headingarr);
            $("#dialog-edit").dialog({
                autoOpen: false,
                height: 400,
                width: 500,
                modal: true,
                buttons: {
                    '<%=rBConstants_opJs.getString("CANCEL")%>': function() {
                        $(this).dialog("close");
                    }
                }
            });

            $('.ui-dialog-titlebar').removeClass('ui-dialog-titlebar ui-widget-header ui-corner-all').addClass('ui-widget-titlebar-header-custom ui-corner-top');
            $('.ui-dialog-buttonpane').removeClass('ui-widget-content').addClass('ui-widget-content-custom');
            $('.ui-dialog-buttonset button').removeClass('ui-widget ui-state-default').addClass('ui-widget-button-custom');
            $('.ui-dialog-content').removeClass('ui-widget-content').addClass('ui-widget-content-custom RScroll');

            $(".ui-button").hover(
                function() { $(this).removeClass('ui-state-hover').addClass("ui-btn-hover"); },
                function() { $(this).removeClass("ui-btn-hover"); });
            $('.ui-button').mousedown(function() { $(this).removeClass('ui-state-active').addClass("ui-btn-active"); });
            $('.ui-button').mouseup(function() { $(this).removeClass('ui-btn-active'); });
            $(".ui-widget-button-custom .ui-icon").addClass('ui-icon-custom ui-icon-shadow ui-icon-corner-all ui-icon-bg');            
            $(".ui-global-table tr:nth-child(even)").addClass("even");
            $(".ui-global-table tr:nth-child(odd)").addClass("odd");
            $(".ui-global-table-without-hdg tr:nth-child(even)").addClass("even");
            $(".ui-global-table-without-hdg tr:nth-child(odd)").addClass("odd");
        });

        function opendialog(headingid, contentid, divboxid, columnid,rowid) { 
       // alert(rowid=='0');
       // alert(columnid=='0');
       // alert(rowid=='0' && columnid=='0');
            $("#dialog-edit").dialog("open");
            $('#contentid').val(contentid);
            $('#headingid').val(headingid);
            $('#portletboxid').val(divboxid);
            checkrow = rowid;
            ckeckcol = columnid;
            if((rowid=='00' && columnid=='00') || (rowid=='0' && columnid=='0') ) //for addbox
            {
            row = '0';
            col = '0';
            }
        }
        function updateTips(t) {
            tips
        .text(t)
        .addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 500);
        }

        function getContent(Heading, arrlength,columnsection) { 
       // alert("hii");
        ck =  counter ;
        if(toadd=="0"){
        ck = ++ck ;
        $(".newbox").attr("Class", "oldbox");
        var js = "removeBox('addbox"+counter+"');";
       $('#removeBox-'+counter).attr("onclick",js);
       counter ++;
        }

            _gaq.push(['_trackEvent', "Select-Report", Heading]); 
            var loopcounter;
            var contentid = $('#contentid').val();
            var headingid = $('#headingid').val();
            var portletboxid = $('#portletboxid').val();
            var portletdivobj = $('#' + portletboxid);

             getcolid (portletboxid);
             getrowid(portletboxid); 
            if(col=="" && row=="") //neha
             {
             row = '0';
             col = '0';
             }
            
           //alert(col+","+row+"neha");
            $('#dialog-edit').dialog("close");
            $("#" + contentid).html('');
            for (loopcounter = 0; loopcounter < arrlength; loopcounter++) {
                if (Headingarr[loopcounter][0] == Heading) {
                    sendurl = "pagename=" + Headingarr[loopcounter][2];
                    headcontent = Headingarr[loopcounter][1];
                    ischart = Headingarr[loopcounter][3];
                    heading = Headingarr[loopcounter][0];
                    rasiToBhavaConversion = Headingarr[loopcounter][4];
                   var portletboxidnum  = portletboxid.substring(6);
                  // alert(Heading +"@"+Headingarr[loopcounter][2]+"@"+rasiToBhavaConversion+"@"+portletboxidnum+"@"+ischart+"@"+column+","+cookielen);
                 // alert(col+","+row)
                   setchartCookies(Heading +"@"+Headingarr[loopcounter][2]+"@"+rasiToBhavaConversion+"@"+portletboxidnum+"@"+ischart+"@"+col+"@"+row,ck);  
                   
                }
            }
            $("#" + contentid).append("<center><img src='/images/loading.gif' /></center>");
            $("#" + headingid).html('');
            //alert(headcontent);
            $("#" + headingid).append(headcontent);
            //alert(sendurl);
            //$.get(WorksheetServlet?methodName=executepage, sendurl, function(data) {
            $.get('executepage.jsp', sendurl, function(data) {
           // alert(data);
                var str = data.trim();  
                 if (str.indexOf("SESSION") != "0" && str.indexOf("CHKDEF") != "0")
                {
                  if(!ischart){  
                    $("#" + contentid).html('');
                    $("#" + contentid).append(data);                    
                }
                else{  
                    var returndataobj = eval('(' + data + ')');                                                             
                    $("#" + contentid).html('');
                    $("#" + contentid).append("<canvas id='Canvas" + heading + "' width='450' height='270' class='ui-canvas'></canvas>");                                        
                    var arrPlanetsShodashvarga = new Array();  
                    arrPlanetsShodashvarga = returndataobj[0].arrayval;
                    //alert(Object.keys(returndataobj[0]).length);
                    if(Object.keys(returndataobj[0]).length == 4)
                    {
                     arrBhavRashi = returndataobj[0].BhavRashi;
                     arrRashiposition = returndataobj[0].arrayvalofrashi;
                     arrRashipositionforsouth = returndataobj[0].RashiPlanetForSouth;
                    // alert(arrRashipositionforsouth);
                    getChartofKP(arrPlanetsShodashvarga,arrBhavRashi,arrRashiposition,arrRashipositionforsouth, <%=languageCode_opJs %>, "Canvas"+heading,rasiToBhavaConversion);    // Method definition written in global-ui-js.jsp
                    }
                   else if(Object.keys(returndataobj[0]).length == 2)
                   {
                   arrRashipositionforsouth = returndataobj[0].RashiPlanetForSouth;
                   getChartofCommon(arrPlanetsShodashvarga,'','',arrRashipositionforsouth, <%=languageCode_opJs %>, "Canvas"+heading,rasiToBhavaConversion);    // Method definition written in global-ui-js.jsp
                   }
                    else
                   {
                   //alert(arrPlanetsShodashvarga);
                   getChart(arrPlanetsShodashvarga, <%=languageCode_opJs %>, "Canvas"+heading,rasiToBhavaConversion);    // Method definition written in global-ui-js.jsp
                   }
               }
              }
                  else if(str.indexOf("CHK") == "0")
                   {
                   window.location.href ="/cloud/defaultchartlogin.jsp?methodName=fromJSP&referrer=/cloud/worksheet/"
                   }
              
                   else
                   {
                   //alert("cc");
                   $("#" + contentid).html('');
                   $("#" + contentid).append('<div align="center" class="ui-global-table-without-hdg" style="min-height:180px;"><div class="ui-bx"><%=WKGlobal.getString("SESSION_EXPIRED_MSG")%></div></div>');
                   }
            });
           if(checkrow == '0' && toadd=='0') //for call only addbox add cookies
           {
                   
                 // alert("come"+","+portletboxidnum+","+col+","+row);
                  AddCookies(portletboxidnum,col,row);
            }
              toadd = '1';
        }

        function tableGrid(row, column, dialogboxContentarr, Headingarr) {
            var i, j, k, lengthofarr;
            k = 0;
            lengthofarr = Headingarr.length;
            $("#wrapperdiv").append('<table id="tbl"><tbody>');
            $("#tbl").append('<tr><td><%=rBConstants_opJs.getString("CHARTS")%></td><td><%=rBConstants_opJs.getString("TABLES")%></td><td><%=rBConstants_opJs.getString("VARGAS")%></td></tr>');
            for (i = 1; i <= row; i++) {
                $("#tbl").append('<tr id="row' + i + '"></tr>');
                for (j = 1; j <= column; j++) {
                    $("#row" + i).append('<td><a href="#" onclick=getContent("' + Headingarr[k][0] + '","' + lengthofarr + '","' + j + '");>' + dialogboxContentarr[i - 1][j - 1] + '</a></td>');
                    k = k + 1;
                }
            }
            $("#wrapperdiv").append('</tbody></table>');
        }
        
        
 
function setchartCookies(chartvalue,cookienum) {
           $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=setgetcookieschart',
                    'data': ({ chartname: chartvalue, setgetcookies:2 ,cookienum : cookienum}),
                    'success': function(data) {
                     //alert(data);
                        val = data;
                    }
           });
}


function removechartcookies(divid,cookieln,col) {
  $.ajax(
                {
                    'async': true,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=removecookie',
                    'data': ({ div: divid,col :col, setgetcookies:2 ,StoreCookie : cookieln}),
                    'success': function(data) {
                    splitdata = data.split('#');
                    var inc = splitdata[1] ;
                   for(i= parseInt(splitdata[1])+1 ; i<= parseInt(splitdata[0]) ; i++)
                   {
     
    $("#addbox" + i).attr("ID", "addbox" + inc);
    $("#userbox-hdg" + i).attr("ID", "userbox-hdg" + inc);
    $("#edituser-" + i).attr("ID", "edituser-" + inc);
    $("#removeBox-" + i).attr("ID", "removeBox-" + inc);
    $("#usersbox-" + i).attr("ID", "usersbox-" + inc);
    $("#Canvas" + i).attr("ID", "Canvas" + inc);
    var str1 = 'userbox-hdg' + inc;
    var str2 = 'usersbox-'+ inc;
    var str3 = 'addbox'+inc;
    var js = "opendialog('"+str1+"','"+str2+"','"+str3+"',"+'00'+");";
    var js1 = "removeBox('"+str3+"');";
    
   $('#edituser-'+inc).attr("onclick",js);
   $('#removeBox-'+inc).attr("onclick",js1);
 
    inc = parseInt(inc) + 1 ;
     }
     alertbox("<%=WKOption.getString("SUCESSFULLY_DELETE")%>");
     cookielen = splitdata[0];
     counter = splitdata[0];
     //  location.reload();
       if (data == 1) {
            //cookies successfully.");
            }
        }
    });
} 




function setdraggablecookiecookies(divid , Columnid) {
    sendparameters = "div=" +divid+"&setgetcookies=2"+"&column="+Columnid;
    var returnGetObject = $.get('setdraggablecookie.jsp', sendparameters, function(data) {
     //alert(data);
       if (data == 1) {
            //cookies successfully.");
        }
    });
} 




function getcolid(divid) {
           $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=getcolid',
                    'data': ({ div: divid, setgetcookies:2 }),
                    'success': function(data) {
                     //alert("column="+data);
                        col = data;
                    }
           });
}

function arrangedeletecookie(divid,col,row) {
           $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=arrange_cookies',
                    'data': ({ div: divid,col:col,row:row,setgetcookies:2 }),
                    'success': function(data) {
                    // alert(data);
                       col = data;
                    }
           });
}


function getrowid(divid)
{
   $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=getrowid',
                    'data': ({ div: divid,setgetcookies:2 }),
                    'success': function(data) {
                   //  alert("row="+data);
                     row = data;
                      //  col = data;
                    }
           });
}


function AddCookies(divid,col,row)
{
   $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=add_cookies',
                    'data': ({ div: divid,col: col,row: row,setgetcookies:2 }),
                    'success': function(data) {
                     //alert("data="+data);
                    checkrow == '0';
                    col = data;
                    }
           });
}


function dragCookies(divid,tocol,fromcol,row,prerow)
{
   $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=drag_cookies',
                    'data': ({ div: divid,tocol: tocol,fromcol: fromcol,row:row,prerow:prerow,setgetcookies:2 }),
                    'success': function(data) {
                    //alert(data);
                    }
           });
}