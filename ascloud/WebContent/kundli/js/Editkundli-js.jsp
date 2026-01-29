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

MyResourceBundle editchart = local.loadPropertiesFileNew("editchart",langCode);
%>

var flag,latNS, standardTimezone;
flag = false;
//var full_URL_30_Dec_2015_Js = "http://www.astrosage.com/cloud/createsession.asp";
var full_URL_30_Dec_2015_Js = "http://"+location.host+"/cloud/createsession.jsp";


function showAdvanced() {
    $('#advancedDiv').toggle('slow');
}
  
$(document).ready(function() {
	
    $("#advancedDiv").hide();
    $('#Year').blur(function() {
    	
        yearval = $('#Year').val();
        monthval = $('#Month').val();
        dayval = $('#Day').val();
        placeval = $('#place').val();
        timezoneid = $('#timezoneid').val();
        timeZone = $('#timeZone').val();
        latNS = $('#LatNS').val();
        var today = new Date();
      if(timezoneid!=null && timezoneid!="" && timezoneid!="null"){
       if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "" && placeval != "GPS Coordinate")) {
        	//alert(timezoneid);
            if (timezoneid == "Asia/Kolkata") {
                if (isWarTimeCorrectionInIndia(dayval, monthval, yearval)) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {
                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);
                    }
                }
            }
            else {
                if (today.isDst()) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {
                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);

                    }
                }
                
                //Handing some countries timezone correction
                correctTimezone = timezoneCorrectionInSomeCountries(timezoneid, timeZone, placeval, dayval, monthval, yearval);
                if (correctTimezone != "") {
                    $('#timeZone').val(correctTimezone);
                }
            }
        }
        else {
            $('#dstval').html('');
        }
       }
       else if(timeZone != 5.5){
       alert("<%=editchart.getString("DST_NOT_CALCULATED")%>");
       }
    });
    $('#Month').blur(function() {      
        yearval = $('#Year').val();
        monthval = $('#Month').val();
        dayval = $('#Day').val();
        placeval = $('#place').val();
        timezoneid = $('#timezoneid').val();
        timeZone = $('#timeZone').val();
        latNS = $('#LatNS').val();
        var today = new Date();
        if(timezoneid!=null && timezoneid!="" && timezoneid!="null"){
        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "" && placeval != "GPS Coordinate")) {
            if (timezoneid == "Asia/Kolkata") {
                if (isWarTimeCorrectionInIndia(dayval, monthval, yearval)) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {
                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);
                    }
                }
            }
            else {
                if (today.isDst()) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {

                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);

                    }
                }
                //Handing some countries timezone correction
                correctTimezone = timezoneCorrectionInSomeCountries(timezoneid, timeZone, placeval, dayval, monthval, yearval);
                if (correctTimezone != "") {
                    $('#timeZone').val(correctTimezone);
                }
            }
        }
        else {
            $('#dstval').html('');
        }
        }
       else if(timeZone != 5.5){
          alert("<%=editchart.getString("DST_NOT_CALCULATED")%>");
        }
    });
    $('#Day').blur(function() {
        yearval = $('#Year').val();
        monthval = $('#Month').val();
        dayval = $('#Day').val();
        placeval = $('#place').val();
        timezoneid = $('#timezoneid').val();
        timeZone = $('#timeZone').val();
        latNS = $('#LatNS').val();
        var today = new Date();
        if(timezoneid!=null && timezoneid!="" && timezoneid!="null"){
        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "" && placeval != "GPS Coordinate")) {
            if (timezoneid == "Asia/Kolkata") {
                if (isWarTimeCorrectionInIndia(dayval, monthval, yearval)) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {
                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);
                    }
                }
            }
            else {
                if (today.isDst()) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {

                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);

                    }
                }
                //Handing some countries timezone correction
                correctTimezone = timezoneCorrectionInSomeCountries(timezoneid, timeZone, placeval, dayval, monthval, yearval);
                if (correctTimezone != "") {
                    $('#timeZone').val(correctTimezone);
                }
            }
        }
        else {
            $('#dstval').html('');
        }
    }
   else if(timeZone != 5.5){
      alert("<%=editchart.getString("DST_NOT_CALCULATED")%>");
    }
    });

    $("#place").autocomplete(
		    "/cloud/FindPlaces.jsp",
		    {
		        delay: 0,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 0,
		        cacheLength: 10,
		        onItemSelect: selectItem,
		        onFindValue: findValue,
		        formatItem: formatItem,
		        autoFill: false
		    }
	    );

});

/*$(function() {
    $("form div :input").tooltip({
        position: "left top",
        offset: [-10, -30],
        effect: "fade"
    });
});*/

function findValue(li) {
    if (li == null) return alert("No match!");
   
    $('#LatDeg').val(li.extra[2]);
    $('#LatMin').val(li.extra[3]);
    $('#LatNS').val(li.extra[4]);
    $('#LongDeg').val(li.extra[5]);
    $('#LongMin').val(li.extra[6]);
    $('#LongEW').val(li.extra[7]);
    $('#timeZone').val(li.extra[8]);
    $('#timezoneid').val(li.extra[9]);    
    $('select').material_select();
    standardTimezone = li.extra[8];    
}

function selectItem(li) {
    flag = false;
    findValue(li);
    
    yearval = $('#Year').val();
    monthval = $('#Month').val();
    dayval = $('#Day').val();
    placeval = $('#place').val();
    timezoneid = $('#timezoneid').val();
    timeZone = $('#timeZone').val();
    latNS = $('#LatNS').val();
    var today = new Date();
    if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "" && placeval != "GPS Coordinate")) {

        if (timezoneid == "Asia/Kolkata") {
            if (isWarTimeCorrectionInIndia(dayval, monthval, yearval)) {
                $('#dstval').html('Day light saving time');
                if (!flag) {
                    $('#timeZone').val(parseFloat(timeZone) + 1);
                    flag = true;
                }
            }
            else {
                $('#dstval').html('Standard time');
                if (flag) {
                    flag = false;
                    $('#timeZone').val(parseFloat(timeZone) - 1);
                }
            }
        }
        else {

            if (today.isDst()) {

                $('#dstval').html('Day light saving time');
                if (!flag) {
                    $('#timeZone').val(parseFloat(timeZone) + 1);
                    flag = true;
                }
            }
            else {

                $('#dstval').html('Standard time');
                if (flag) {
                    flag = false;
                    $('#timeZone').val(parseFloat(timeZone) - 1);

                }
            }
            //Handing some countries timezone correction
                correctTimezone = timezoneCorrectionInSomeCountries(timezoneid, timeZone, placeval, dayval, monthval, yearval);
                if (correctTimezone != "") {
                    $('#timeZone').val(correctTimezone);
                }
        }
    }
    else {
        $('#dstval').html('');
    }
}

function formatItem(row) {
    return row[0] + ", " + row[1] + " (" + row[2] + ")";
}

function lookupAjax() {
    var oSuggest = $("#place")[0].autocompleter;
    oSuggest.findValue();
    return false;
}

Date.prototype.isDst = function() {
var tempTimezone;
 timezoneJS.timezone.zoneFileBasePath = '/atlas/js/tz';
    timezoneJS.timezone.init();
    if ((yearval != "") && (monthval != "") && (dayval != "")) {
        birthdatval = yearval + "/" + monthval + "/" + dayval;
        birthdatval = birthdatval.toString();
        //alert(latNS);
        if (latNS == "N" || latNS == "n") {
            decidedstval = yearval + "/1/1";
        }
        else {
            decidedstval = yearval + "/6/1"
        }
        tempTimezone = standardTimezone * (-60);
        var birthdate = new timezoneJS.Date(birthdatval, timezoneid);
        var decidedate = new timezoneJS.Date(decidedstval, timezoneid);
       
        if (decidedate.getTimezoneOffset() > birthdate.getTimezoneOffset()) {
            return true;
        }
        else if (decidedate.getTimezoneOffset() == birthdate.getTimezoneOffset() && tempTimezone == 0 ? Math.abs(decidedate.getTimezoneOffset()) > tempTimezone : decidedate.getTimezoneOffset() > tempTimezone)
            return true;
        else {
            return false;
        }


    }
}

function isWarTimeCorrectionInIndia(dayval, monthval, yearval) {

    if (yearval >= 1942 && yearval <= 1945) {
        if ((yearval == 1942 && monthval < 9) || (yearval == 1945 && monthval >= 10)) {

            if (yearval == 1945 && monthval == 10 && dayval <= 15) {
                return true;
            }
            else {
                return false;
            }
        }
        else {
            return true;
        }
    }
    else {
        return false;
    }
}

function timezoneCorrectionInSomeCountries(timezoneString, timezoneVal, placeVal, dayVal, monthVal, yearVal) {    
    correctTimezoneValue = ""
    switch (timezoneString) {
        case "America/Paramaribo":
            if (yearVal <= 1984) {
                if (yearVal == 1984 && monthVal > 9) {
                    correctTimezoneValue = "-3.0";
                }
                else {
                    correctTimezoneValue = "-3.5";
                }
            }
            else {
                correctTimezoneValue = "-3.0";
            }            
            $('#dstval').html('Standard time');
            break;
         case "Asia/Kathmandu": 
        	if (yearVal <= 1985) 
        	{ 
        		correctTimezoneValue = "5.5"; 
        	} 
        	else 
        	{ 
        		correctTimezoneValue = "5.75";
        	} 
        	$('#dstval').html('Standard time'); 
        	break;
    }    
    return correctTimezoneValue;
}



