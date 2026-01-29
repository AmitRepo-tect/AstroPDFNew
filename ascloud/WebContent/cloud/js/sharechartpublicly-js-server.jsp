<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<% 
Local local = new Local();
int langCode = Util.safeInt(session.getAttribute("languageCode"));

Hindi hindi = new Hindi();
//int langCode = (Integer)session.getAttribute("languageCode");
Object obj = session.getAttribute("constants");
MyProperties rBConstants = null;
if(obj != null)
{
	rBConstants = (MyProperties) obj;
}
else
{
	rBConstants = new MyProperties(local.loadPropertiesFile("constants", langCode));
	session.setAttribute("constants", rBConstants);
}

MyResourceBundle newShareChartPublicly_js = local.loadPropertiesFileNew("sharechartpublicly-js",langCode);
MyResourceBundle newSaveShareChartPublicly = local.loadPropertiesFileNew("savechart-sharechartpubliclyjs",langCode);

    String sendername=request.getParameter("sendername");
    String loginname=request.getParameter("loginname");
 %>



 $(document).ready(function() {
	//alert("mn");
        $('#emailaddresses').hide();
        $('#shareurlchkbox').click(function() {
            $('#emailadd').val('');
            $('#emailaddresses').toggle();
            $('#emailadd').focus();
            
            if($('#shareurlchkbox').attr('checked'))
            {   
                $("#dialog-form-share").dialog("option", "buttons", false);
                $("#dialog-form-share").dialog("option", "buttons", {
            
                '<%=rBConstants.getString("SHARE_CHART")%>': function() {
                    sharingchart();
                    },
                '<%=rBConstants.getString("CANCEL") %>': function() {
                    $('#emailaddresses').toggle();
                    $("#dialog-form-share").dialog("option", "buttons", false);
                    $("#dialog-form-share").dialog("option", "buttons", {"<%=rBConstants.getString("DONE")%>":function(){sharingchart();}});
                    $('#shareurlchkbox').attr('checked', false);
                }
            });
            }
            else
            {
                $("#dialog-form-share").dialog("option", "buttons", false);
                $("#dialog-form-share").dialog("option", "buttons", {"<%=rBConstants.getString("DONE")%>":function(){sharingchart();}});
            }
            
        });
        
        $("#dialog-form-share").dialog(
            {
                autoOpen: false,
                title: '<span class="fixed"><font size="3.9em"><%=rBConstants.getString("SHARE_CHART")+" "+rBConstants.getString("SETING") %></font></span>',
                height: 515,
                width: 480,
                modal: true,
                open: function(event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '70px');
                    $(event.target).parent().css('center');
                    $('#shareurlchkbox').show();
                },
                buttons:
                {
                   '<%=rBConstants.getString("DONE")%>': function() {
                        sharingchart();
                    }
                },
                close: function() { 
                        $('#emailaddresses').toggle();
                        $("#dialog-form-share").dialog("option", "buttons", false);
                        $("#dialog-form-share").dialog("option", "buttons", {"<%=rBConstants.getString("DONE")%>":function(){sharingchart();}});
                        $('#shareurlchkbox').attr('checked', false);}
            });
    });
       
      function sharingchart(){
        $('#pleasewait').html('<img src="images/pleasewait.png">');
        radiobtnlen = document.frmShareChart.radiobtn.length

        for (i = 0; i < radiobtnlen; i++) {
            if (document.frmShareChart.radiobtn[i].checked) {
                choose = document.frmShareChart.radiobtn[i].value;
            }
        }

        if (choose == "shared") {
        
            if ($('#chartNameshare').val() != "") {
                querystringurl = "chartName=" + $('#chartNameshare').val();
                var ChartNameAvailability = IschartNameExist();
                if (ChartNameAvailability) {
                
                    if ($('#shareurlchkbox').attr('checked')) {
                        if (validateEmailAddresses()) {
                        
                            $("#dialog-form-share").dialog("option", "buttons", false);
                            $('#emailsharedurl').hide();
                            $.get('control/ajax-updatechartsharesettings.jsp', querystringurl, function(data) {
                            //alert(emailshareURL()+","+data);
                                if (data.trim() == "1" && emailshareURL()) {
                                    document.getElementById('chartNameAvailablitypublic').innerHTML = "";
                                    document.getElementById('chartNameAvailablitypublic').style.display = 'none';
                                    $("#dialog-form-share").dialog("option", "buttons", {"<%=rBConstants.getString("DONE")%>":function(){sharingchart();$("#dialog-form-share").dialog('close');}});
                                    $('#emailsharedurl').show();
                                    $('#shareurlchkbox').attr('checked',false);
                                    $('#emailaddresses').hide();
                                    showSuccessMessage('<%=newShareChartPublicly_js.getString("CHANGES_SAVED_SUCCESSFULLY")%>', 'confirmmsg');
                                    //$("#dialog-form-share").dialog('close');
                                }
                                else {
                                    if (data.trim() == "0") {
                                        showWarningMessage('<%=rBConstants.getString("UNKNOWN_ERROR_PLEASE_TRY_AGAIN")%>', 'confirmmsg');
                                    }
                                    else {
                                        if (data.trim() == "2") {
                                            showWarningMessage('<%=newShareChartPublicly_js.getString("CHANGES_NOT_SAVED")%>', 'confirmmsg');
                                        }
                                        else {
                                            showWarningMessage('<%=rBConstants.getString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN_AGAIN") %>', 'confirmmsg');
                                        }
                                    }
                                }
                            });
                        }
                    }
                    else {
                        $("#dialog-form-share").dialog("option", "buttons", false);
                        $('#emailsharedurl').hide();
                        $.get('control/ajax-updatechartsharesettings.jsp', querystringurl, function(data) {
                            if (data.trim() == "1") {
                                $("#dialog-form-share").dialog("option", "buttons", {"<%=rBConstants.getString("DONE")%>":function(){sharingchart();}});
                                $('#emailsharedurl').show();
                                $('#shareurlchkbox').attr('checked',false);
                                $('#emailaddresses').hide();
                                showSuccessMessage('<%=rBConstants.getString("CHANGES_SAVED_SUCCESSFULLY")%>', 'confirmmsg');
                                $("#dialog-form-share").dialog('close');
                            }
                            else {
                                if (data.trim() == "0") {
                                    showWarningMessage('<%=rBConstants.getString("UNKNOWN_ERROR_PLEASE_TRY_AGAIN")%>', 'confirmmsg');
                                }
                                else {
                                    if (data.trim() == "2") {
                                        showWarningMessage('<%=rBConstants.getString("CHANGES_NOT_SAVED")%>', 'confirmmsg');
                                    }
                                    else {
                                        showWarningMessage('<%=rBConstants.getString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN_AGAIN") %>', 'confirmmsg');
                                    }
                                }
                            }
                        });
                        document.getElementById('chartNameAvailablitypublic').innerHTML = "";
                        document.getElementById('chartNameAvailablitypublic').style.display = 'none';
                    }                                    
                }
            }
            else {
                showWarningMessage('<%=newSaveShareChartPublicly.getString("PLEASE_ENTER_CHART_NAME_FIRST") %>', 'confirmmsg');
            }
        }
        if (choose == "private") {
            $('#chartNameshare').val('');
            querystringurl = "chartName=" + $('#chartNameshare').val();
            $.get('control/ajax-updatechartsharesettings.jsp', function(data) {
                if (data == 1) {
                    $('#emailsharedurl').show();
                    $('#shareurlchkbox').attr('checked',false);
                    $('#emailaddresses').hide();
                    showSuccessMessage('<%=rBConstants.getString("CHANGES_SAVED_SUCCESSFULLY")%>', 'confirmmsg');
                    $("#dialog-form-share").dialog('close');
                }
                else {
                    if (data == 0) {
                        showWarningMessage('<%=rBConstants.getString("UNKNOWN_ERROR_PLEASE_TRY_AGAIN")%>', 'confirmmsg');
                    }
                    else {
                        if (data == 2) {
                            showWarningMessage('<%=rBConstants.getString("CHANGES_NOT_SAVED")%>', 'confirmmsg');
                        }
                        else {
                            showWarningMessage('<%=rBConstants.getString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN_AGAIN") %>', 'confirmmsg');
                        }
                    }
                }
            });
            }
            }
            
 function openShareChart() {
            $('#shareurlchkbox').attr('checked', false);
            $('#emailaddresses').hide();
            getreval = getSessionData();
            //alert(getreval)
            if (getreval=="false") {
                openLoginForm();
            }
            else {
                fillSharedChartName();
                $('#pleasewait').html('');
                $("#dialog-form-share").dialog('open');
            }
        }




 function showUrlDiv(status)
{ document.getElementById("ChartNamePublic").style.visibility = status;
} function updateUrlPath() { if
(document.getElementById("chartNameshare").value == "") {
document.getElementById('chartNameAvailablitypublic').style.display =
'none'; } var pathvalpublic =
document.getElementById("chartNameshare").value; pathvalpublic =
pathvalpublic.toLowerCase();
document.getElementById("lblPathpublictext").value =
"http://k.astrosage.com/" + pathvalpublic; }

 function IschartNameExist()
{ if ($("#chartNameshare").val() == "") { showWarningMessage('<%=newSaveShareChartPublicly.getString("PLEASE_ENTER_CHART_NAME_FIRST") %>',
'confirmmsg'); } else { if (checkForValidChartName()) { var value =
(function() { var val = null; $.ajax( { 'async': false, 'global': false,
'url': 'control/ajax-getchartname.jsp', 'data': ({ chartname:
$("#chartNameshare").val(), chartid: '<%=session.getAttribute("ChartId") %>'
}), 'success': function(data) { val = data.trim(); } }); return val;
})(); if (value == "1") { $('#confirmmsg').html('');
document.getElementById('chartNameAvailablitypublic').style.color =
"#5A7B20";
document.getElementById('chartNameAvailablitypublic').style.fontWeight =
"bold";
document.getElementById('chartNameAvailablitypublic').style.fontSize =
"12"; 
document.getElementById('chartNameAvailablitypublic').innerHTML = '<%=newSaveShareChartPublicly.getString("CHART_NAME_IS_AVAILABLE") %>',
document.getElementById('chartNameAvailablitypublic').style.display =
'block'; return true; } else { $('#pleasewait').html('');
$('#confirmmsg').html('');
document.getElementById('chartNameAvailablitypublic').style.color =
"#CC0000";
document.getElementById('chartNameAvailablitypublic').style.fontWeight =
"bold";
document.getElementById('chartNameAvailablitypublic').style.fontSize =
"12"; document.getElementById('chartNameAvailablitypublic').innerHTML = '<%=newSaveShareChartPublicly.getString("CHART_NAME_IS_NOT_AVAILABLE") %>',
document.getElementById('chartNameAvailablitypublic').style.display =
'block'; return false; } } } } function checkForValidChartName() { var
currchartname = $("#chartNameshare").val(); var firstcharcurrchartname =
currchartname.substr(0, 1); var lastcharcurrchartname =
currchartname.substr((currchartname.length)-1, 1); if
((firstcharcurrchartname.charCodeAt() >= 48 &&
firstcharcurrchartname.charCodeAt() <= 57) ||
(firstcharcurrchartname.charCodeAt() == 45)) {
$('#chartNameAvailablitypublic').html(''); showWarningMessage('<%=newShareChartPublicly_js.getString("CHART_NAME_CAN_NOT_BE_START_WITH_DIGIT_HYPHEN") %>',
'confirmmsg'); } else { if (lastcharcurrchartname.charCodeAt() == 45) {
$('#chartNameAvailablitypublic').html(''); showWarningMessage('<%=newShareChartPublicly_js.getString("CHART_NAME_CAN_NOT_BE_END_WITH_HYPHEN") %>',
'confirmmsg'); } else { var rexp = /^[A-Za-z0-9-]*$/; if
(currchartname.search(rexp) == 0) { return true; } else {
$('#chartNameAvailablitypublic').html(''); showWarningMessage('<%=newShareChartPublicly_js.getString("PLEASE_ENTER_VALID_CHARTNAME") %>',
'confirmmsg'); return false; } } } } function fillSharedChartName() {
var value = (function() { var val = null; $.ajax({ 'async': false,
'global': false, 'url': 'control/ajax-publicchartname.jsp', 'data': ({
chartid: '<%=session.getAttribute("ChartId") %>' }), 'success':
function(data) { //alert(data+"neha"); val = data.trim(); 
if((data.trim() != "") && (data!="You are not authorized to view this page.")) { document.getElementById('chartNameshare').value = data;
document.getElementById('radioShared').checked = true;
document.getElementById('ChartNamePublic').style.visibility = 'visible';
} else { // alert("getrandomchartname");
document.getElementById('radioPrivate').checked = true;
document.getElementById('ChartNamePublic').style.visibility = 'hidden';
$.get('control/getrandomchartname.jsp', function(data) { //alert(data);
if (data == "0") { window.location.href = "basicdetails.jsp" } else if
(data == "1") { } else { document.getElementById('chartNameshare').value
= data; } }); } } }); return val; })(); } 


 function getSessionData() {
            var sessionval;
            var useridsession;
            var chartidsession;
            var planid;
            var horoscopesession;
            var returnvalue = (function() {
                var reval = null;
                $.ajax({
                    'async': false,
                    'global': false,
                    'url': 'control/getsession.jsp',
                    'success': function(data) {
                    //alert(data);
                        sessionval = data.split("|");
                        useridsession = sessionval[0];
                        chartidsession = sessionval[1];
                        planid = sessionval[2];
                        horoscopesession = sessionval[3];
                        reval = chartidsession;
                    }
                });
                return reval;
            })();            
            return returnvalue;
        }




 function
validateEmailAddresses(){ if ($('#emailadd').val() == "") {
showWarningMessage('<%=newShareChartPublicly_js.getString("PLEASE_ADD_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return false; } else { emailval =
$('#emailadd').val(); if((emailval.indexOf("<")>-1) ||
(emailval.indexOf(">")>-1)) { 
showWarningMessage('Please remove "<" or ">" from email addresses', 'confirmmsgsecond'); return false; } else{
emailaddress = $('#emailadd').val(); emailaddressarr =
emailaddress.split(","); var sendemailto = ''; for (var i = 0; i <
emailaddressarr.length; i++) { if
(emailcheck($.trim(emailaddressarr[i])) == false) {
$('#emailadd').focus(); return false; } } return true; } } } function
emailshareURL() { var sendemailaddto = ''; emailaddress =
$('#emailadd').val(); emailaddress = emailaddress + ","; emailaddressarr
= emailaddress.split(","); for (var i = 0; i < emailaddressarr.length;
i++) { sendemailaddto = sendemailaddto + $.trim(emailaddressarr[i]) +
','; } sendemailaddto = sendemailaddto.substr(0, (sendemailaddto.length
- 1)) 
sendingurl = "emailadd=" + sendemailaddto + "&sharedurl=" +$('#lblPathpublictext').val() + "&sendername=" + '<%=sendername%>' +"&isuseridsessionexist=" + '<%=session.getAttribute("userid") %>'+"&loginname="+'<%=loginname%>';
var reval = null; $.ajax({ 'async': false, 'global': false, 'url':
'control/shareurlemailsend.jsp', 'data': sendingurl, 'success':
function(data) { reval = data.trim(); } }); if (reval == '<%=ConstantValues.MAIL_SEND_SUCCESSFULLY %>')
return true; else return false; } function emailcheck(str) { 
var at ="@"; var dot = "."; var lat = str.indexOf(at); var lstr = str.length ;varldot = str.indexOf(dot); if (str.indexOf(at) == -1) {
showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } if (str.indexOf(at) == -1 ||
str.indexOf(at) == 0 || str.indexOf(at) == lstr) { showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } if (str.indexOf(dot) == -1 ||
str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } if (str.indexOf(at, (lat + 1)) !=
-1) { showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } if (str.substring(lat - 1, lat)
== dot || str.substring(lat + 1, lat + 2) == dot) { showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } if (str.indexOf(dot, (lat + 2))
== -1) { showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } if (str.indexOf(" ") != -1) {
showWarningMessage('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>',
'confirmmsgsecond'); return (false); } return true } function
showSuccessMessage(msg, divid) { $('#pleasewait').html(''); $('#' +
divid).show(); 
$('#' + divid).html('<img src="images/success.png" style="vertical-align: middle; padding-right: 5px;" /><b>' + msg + '</b>'); 
$('#' + divid).addClass('dialog-msg'); setTimeout(function() { $('#'
+ divid).hide(); }, 5000); } function showWarningMessage(msg, divid) {
$('#pleasewait').html(''); $('#' + divid).show(); 
$('#' + divid).html('<img src="images/warning.png" style="vertical-align: middle;"><b>' + msg + '</b>');
$('#' + divid).addClass('dialog-msg'); setTimeout(function() { 
$('#'+ divid).hide(); }, 5000); }
        




