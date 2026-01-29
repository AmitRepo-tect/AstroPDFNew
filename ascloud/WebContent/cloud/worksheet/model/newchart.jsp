<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local lc = new Local();
int lcode = (Integer) session.getAttribute("languageCode");
MyResourceBundle newChartConstants = lc.loadPropertiesFileNew("newchart", lcode);
MyProperties newChartRBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle newChartEditConst = lc.loadPropertiesFileNew("newchart-editchart",lcode);
MyResourceBundle newChartEditMatchMakConst = lc.loadPropertiesFileNew("newchart-editchart-matchmaking",lcode);
%>

<script type="text/javascript" src="/kundli/js/kundli.js" charset="utf-8" ></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script type="text/javascript" src="/kundli/js/gpsfill.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#dialog-form-newchart').dialog({
            autoOpen: false,
            title: '<%=newChartRBConstants.getString("NEW_CHART") %>',
            width: 720,
            height: 450,
            modal: true,            
            open: function (event, ui) {
                $(event.target).parent().css('position', 'fixed');
                $(event.target).parent().css('top', '130px');
                $(event.target).parent().css('center');
              //  $(event.target).parent().css('z-index', '1001');
            },
            buttons: {
                '<%=newChartRBConstants.getString("DONE") %>': function () {
                 $("#done").attr('value', 'DONE');
                 document.getElementById('methodName1').value = "newChartDone";
                    if (formValidationnew()) {
                    	
                    	
                    	document.getElementById('methodName').value = "newChartDone";
                    	//alert("hi"+document.getElementById('methodName1').value);
                    	document.forms["newchart"].submit();
                    }
                },
                '<%=newChartRBConstants.getString("DONE_AND_SAVE_CHART")%>': function () {
                 $("#saveandone").attr('value', 'Done And Save');
                 document.getElementById('methodName1').value = "newChartDoneAndSave";
                    if (formValidationnew()) {
                    	
                    	document.getElementById('methodName').value = "newChartDoneAndSave";
                        document.forms["newchart"].submit();
                        $("#dialog-form-newchart").dialog('close');
                    }
                }
            }
        })
    });
   
    function opennewchartform() {
        $("#msgdivv").html('');
        $('#dialog-form-newchart').dialog('open');
    }

    $(document).ready(function () {
   
        $('#dialog-form-confirmdata').dialog({
            autoOpen: false,
            title: '<%="Select Your Birth Place"%>',
            width: 720,
            height: 450,
            modal: true,
            open: function (event, ui) {
                $(event.target).parent().css('position', 'absolute');
                $(event.target).parent().css('top', '120px');
                $(event.target).parent().css('center');
                //$(event.target).parent().css('z-index', '1001');
            },
            buttons: {
                '<%=newChartRBConstants.getString("CANCEL") %>': function () {
                   $('#dialog-form-confirmdata').dialog('close');
                }},
        })
    });

    function openconfirmdata() {
        $('#dialog-form-confirmdata').dialog('open');
    }

   /* function updateMsgNew(t) {
        $('#msgdiv').addClass('ui-state-highlight')
        $('#msgdiv').html(t);
        setTimeout(function () {
            $('#msgdiv').removeClass('ui-state-highlight', 1500);
        }, 500);
    }*/
   
    /*function isIntegerNumber(NumberToTest) {
        var IsFound = /^-?\d+$/.test(NumberToTest);
        return (IsFound);
    }*/

    function formValidationnew() {
    //alert("hii");
        nameval = document.getElementById('Name').value;
        if (document.getElementById('Name').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_NAME_FIELD") %>');
            document.getElementById('Name').focus();
            return (false);
        }
        if (nameval.indexOf("'") != -1 || nameval.indexOf("?") != -1 || nameval.indexOf("&") != -1 || nameval.indexOf("@") != -1) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_SPECIAL_CHARACTERS_SIGN_IN_NAME_FIELD") %>');
            document.getElementById('Name').focus();
            return (false);
        }

        if (nameval.length > 50) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTER_IN_NAME_FIELD") %>');
            document.getElementById('Name').focus();
            return (false);
        }

        if (document.getElementById('Day').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_DAY_FIELD")%>');
            document.getElementById('Day').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Day').value)) {
                $('#msgdivv').css('color', 'Red');
                updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_DAY_FIELD")%>');
                document.getElementById('Day').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('Day').value) || document.getElementById('Day').value < 1 || document.getElementById('Day').value > 31) {
                    $('#msgdivv').css('color', 'Red');
                    updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_31")%>');
                    document.getElementById('Day').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Month').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MONTH_FIELD")%>');
            document.getElementById('Month').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Month').value)) {
                $('#msgdivv').css('color', 'Red');
                updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MONTH_FIELD")%>');
                document.getElementById('Month').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Month').value) || document.getElementById('Month').value < 1 || document.getElementById('Month').value > 12) {
                    $('#msgdivv').css('color', 'Red');
                    updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_MONTH_SHOULD_BE_BETWEEN_1_AND_12")%>');
                    document.getElementById('Month').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Year').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_YEAR_FIELD")%>');
            document.getElementById('Year').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Year').value)) {
                $('#msgdivv').css('color', 'Red');
                updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_YEAR_FIELD")%>');
                document.getElementById('Year').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Year').value) || document.getElementById('Year').value < 1 || document.getElementById('Year').value > 9999) {
                    $('#msgdivv').css('color', 'Red');
                    updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_9999")%>');
                    document.getElementById('Year').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Hrs').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_HOUR_FIELD")%>');
            document.getElementById('Hrs').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Hrs').value)) {
                $('#msgdivv').css('color', 'Red');
                updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_HOUR_FIELD")%>');
                document.getElementById('Hrs').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('Hrs').value) || document.getElementById('Hrs').value < 0 || document.getElementById('Hrs').value > 23) {
                    $('#msgdivv').css('color', 'Red');
                    updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_HOUR_SHOULD_BE_BETWEEN_0_AND_23")%>');
                    document.getElementById('Hrs').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Min').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MINUTE_FIELD")%>');
            document.getElementById('Min').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Min').value)) {
                $('#msgdivv').css('color', 'Red');
                updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MINUTE_FIELD")%>');
                document.getElementById('Min').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Min').value) || document.getElementById('Min').value < 0 || document.getElementById('Min').value > 59) {
                    $('#msgdivv').css('color', 'Red');
                    updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('Min').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Sec').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_SECOND_FIELD")%>');
            document.getElementById('Sec').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Sec').value)) {
                $('#msgdivv').css('color', 'Red');
                updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_SECOND_FIELD")%>');
                document.getElementById('Sec').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Sec').value) || document.getElementById('Sec').value < 0 || document.getElementById('Sec').value > 59) {
                    $('#msgdivv').css('color', 'Red');
                    updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_SECOND_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('Sec').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('place').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_PLACE")%>');
            document.getElementById('place').focus();
            return (false);
        }

        if (document.getElementById('place').value.length < 3) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("ENTER_AT_LEAST_THREE_FIRST_CHARACTERS_OF_CITY_NAME")%>');
            document.getElementById('place').focus();
            return (false);
        }

        if (document.getElementById('place').value.indexOf("'") != -1 || document.getElementById('place').value.indexOf("?") != -1 || document.getElementById('place').value.indexOf("&") != -1) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_SPECIAL_CHARACTERS_SIGN_IN_PLACE_FIELD") %>');
            document.getElementById('place').focus();
            return (false);
        }


        if (document.getElementById('place').value.length > 50) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTERS_IN_PLACE_FIELD") %>');
            document.getElementById('place').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LongDeg').value) || document.getElementById('LongDeg').value < 0 || document.getElementById('LongDeg').value >= 180)) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_LONGITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_179")%>');
            document.getElementById('LongDeg').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LongMin').value) || document.getElementById('LongMin').value < 0 || document.getElementById('LongMin').value >= 60)) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_LONGITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LongMin').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LatDeg').value) || document.getElementById('LatDeg').value < 0 || document.getElementById('LatDeg').value >= 90)) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_LATITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_89")%>');
            document.getElementById('LatDeg').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LatMin').value) || document.getElementById('LatMin').value < 0 || document.getElementById('LatMin').value >= 60)) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_LATITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LatMin').focus();
            return (false);
        }
        if (isNaN(document.getElementById('timeZone').value) || document.getElementById('timeZone').value < -12.0 || document.getElementById('timeZone').value > 16.0) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_TIME_ZONE_SHOULD_BE_BETWEEN_12_00_AND_13_00")%>');
            document.getElementById('timeZone').focus();
            return (false);
        }
      
        if (document.getElementById('LongDeg').value == "" || document.getElementById('LongDeg').value == "LongDegree" || document.getElementById('LongMin').value == "" || document.getElementById('LongMin').value == "LongMinute" || document.getElementById('LongEW').value == "LongEW" || document.getElementById('LatDeg').value == "" || document.getElementById('LatDeg').value == "LatDegree" || document.getElementById('LatMin').value == "" || document.getElementById('LatMin').value == "LatMinute" || document.getElementById('LatNS').value == "LatNS" || document.getElementById('timeZone').value == "" || document.getElementById('timeZone').value == "TimeZone") {
             // form filling for the confirm data page in hidden field
             document.getElementById('cnfName').value = document.getElementById('Name').value;
             document.getElementById('cnfgender').value = document.getElementById('sex').value;
             document.getElementById('cnfDay').value = document.getElementById('Day').value;
             document.getElementById('cnfMonth').value = document.getElementById('Month').value;
             document.getElementById('cnfYear').value = document.getElementById('Year').value;
             document.getElementById('cnfHrs').value = document.getElementById('Hrs').value;
             document.getElementById('cnfMin').value = document.getElementById('Min').value;
             document.getElementById('cnfSec').value = document.getElementById('Sec').value;

             document.getElementById('cnfplace').value = document.getElementById('place').value;
             document.getElementById('cnfLongDeg').value = document.getElementById('LongDeg').value;
             document.getElementById('cnfLongMin').value = document.getElementById('LongMin').value;
             document.getElementById('cnfLongEW').value = document.getElementById('LongEW').value;
             document.getElementById('cnfLatDeg').value = document.getElementById('LatDeg').value;
             document.getElementById('cnfLatMin').value = document.getElementById('LatMin').value;
             document.getElementById('cnfLatNS').value = document.getElementById('LatNS').value;
             document.getElementById('cnftimeZone').value = document.getElementById('timeZone').value;
            document.getElementById('cnfnewchartdone').value = document.getElementById('done').value;
            document.getElementById('cnfnewchartdoneandsave').value = document.getElementById('saveandone').value;
            //alert(document.getElementById('methodName1').value);
           // alert(document.getElementById('place').value);
           var placeval = document.getElementById('place').value ;
           // for place data fetching
            $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': '/cloud/worksheet/control/getplacesdetails.jsp',
                    'data': ({ place: placeval }),
                    'success': function (data) {
                    	//alert(data);
                   if (data!= ""){

                   // heading implementation 
                    var html1 = ""; //declare string inside function

                   html1 += '<tr>';
                   html1 += '<td class="cellhead" style="font-size:18px;text-align:left">City</td>';
                   html1 += '<td class="cellhead" style="font-size:18px;text-align:left">State</td>';
                   html1 += '<td class="cellhead" style="font-size:18px;text-align:left">Longitude</td>';
                   html1 += '<td class="cellhead" style="font-size:18px;text-align:left">Latitude</td>';
                   html1 += '<td class="cellhead" style="font-size:18px;text-align:left">Country</td>';
                   html1 += '</tr>';
                   $('table#conf').html('');
                   $('table#conf').append(html1);

                   splidata = data.split("#");
                   for(i = 0 ;i<splidata.length-1;i++){ 
                   seperatedatawithvalue  = splidata[i].split("|");
                   cityvalue = "'"+seperatedatawithvalue[0]+"'";
                   LongEWval = "'"+seperatedatawithvalue[8]+"'";
                   LatEWval = "'"+seperatedatawithvalue[5]+"'";
                   var html = ""; //declare string inside function
                   html += '<tr class="ui-cnf">';
                   html += '<td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><a style="font-size:16px" href="javascript: submitfrm('+cityvalue+','+seperatedatawithvalue[6]+','+seperatedatawithvalue[7]+','+LongEWval+','+seperatedatawithvalue[3]+','+seperatedatawithvalue[4]+','+LatEWval+','+seperatedatawithvalue[9]+');">'+seperatedatawithvalue[0]+'</a></td>';
                   html += '<td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><a style="font-size:16px" href="javascript: submitfrm('+cityvalue+','+seperatedatawithvalue[6]+','+seperatedatawithvalue[7]+','+LongEWval+','+seperatedatawithvalue[3]+','+seperatedatawithvalue[4]+','+LatEWval+','+seperatedatawithvalue[9]+');">'+seperatedatawithvalue[1]+'</a></td>';
                   html += '<td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><a style="font-size:16px" href="javascript: submitfrm('+cityvalue+','+seperatedatawithvalue[6]+','+seperatedatawithvalue[7]+','+LongEWval+','+seperatedatawithvalue[3]+','+seperatedatawithvalue[4]+','+LatEWval+','+seperatedatawithvalue[9]+');">'+seperatedatawithvalue[6]+seperatedatawithvalue[8]+seperatedatawithvalue[7]+'</a></td>';
                   html += '<td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><a style="font-size:16px" href="javascript: submitfrm('+cityvalue+','+seperatedatawithvalue[6]+','+seperatedatawithvalue[7]+','+LongEWval+','+seperatedatawithvalue[3]+','+seperatedatawithvalue[4]+','+LatEWval+','+seperatedatawithvalue[9]+');">'+seperatedatawithvalue[3]+seperatedatawithvalue[5]+seperatedatawithvalue[4]+'</a></td>';
                   html += '<td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><a style="font-size:16px" href="javascript: submitfrm('+cityvalue+','+seperatedatawithvalue[6]+','+seperatedatawithvalue[7]+','+LongEWval+','+seperatedatawithvalue[3]+','+seperatedatawithvalue[4]+','+LatEWval+','+seperatedatawithvalue[9]+');">'+seperatedatawithvalue[2]+'</a></td>';
                   html += '</tr>';
                   $('table#conf').append(html);
                   }
                   }
                  else
                  {
                  $('table#conf').html('');
                  $('table#conf').append('<p style="margin-top:20px;font-weight:bold; color:#FF0000; text-align:center;">Sorry your city name did not found our database..!<!--<a href="javascript: history.go(-1);">Back</a>--></p>');
                   }
                    }
                });

            openconfirmdata();
            $('#dialog-form-newchart').dialog('close');
            return (false);
        }
        else {
          checklogin();
          document.forms["newchart"].action = "/cloud/newchart-session.asp";
       }


       if (document.getElementById('kphnn').value == "") {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_KP_HORARY_FIELD") %>');
            document.getElementById('kphnn').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('kphnn').value) || document.getElementById('kphnn').value < 0 || document.getElementById('kphnn').value > 249)) {
            $('#msgdivv').css('color', 'Red');
            updateMsgNew('<%=newChartRBConstants.getString("THE_VALUE_FOR_KP_HORARY_SHOULD_BE_BETWEEN_0_AND_249") %>');
            document.getElementById('kphnn').focus();
            return (false);
        }
        return (true);
    }

           function submitfrm(City,LongDeg,LongMin,LongEW,LatDeg,LatMin,LatNS,Timezone) {        
          // alert(City+","+LongDeg+","+LongMin+","+LongEW+","+LatDeg+","+LatMin+","+LatNS+","+Timezone);
           document.getElementById('cnfplace').value = City;
           document.getElementById('cnfLongDeg').value = LongDeg;
           document.getElementById('cnfLongMin').value = LongMin;
           document.getElementById('cnfLongEW').value = LongEW;
           document.getElementById('cnfLatDeg').value = LatDeg;
           document.getElementById('cnfLatMin').value = LatMin;
           document.getElementById('cnfLatNS').value = LatNS;
           document.getElementById('cnftimeZone').value = Timezone;
           document.getElementById('referrer').value = "/cloud/worksheet/";
           submitform();
        }

       

        function submitform() {
            //alert("111 : "+document.getElementById("cnfnewchartdone").value);
            //alert("222 : "+document.getElementById("cnfnewchartdoneandsave").value);
            document.forms["UserCityDetailsFormfreekundali"].submit();
        }  

    function updateMsgNew(t) {
        $('#msgdivv').addClass('ui-state-highlight')
        $('#msgdivv').html(t);
        setTimeout(function () {
            $('#msgdivv').removeClass('ui-state-highlight', 1500);
        }, 500);
    }
    </script>

<script type="text/javascript">
        function toggleAndChangeText() {
            $('#divToToggle').toggle();
            if ($('#divToToggle').css('display') == 'none') {
                $('#aTag').html('[&#43]  <%=newChartConstants.getString("COORDINATES_AND_ADVANCE_SETTINGS") %>');
            }
            else {
                $('#aTag').html('[&#8722] <%=newChartConstants.getString("COORDINATES_AND_ADVANCE_SETTINGS") %>');
            }
        }

        function findlocation(clickType) {
            $("#dstval").html('');
            autofillgps(clickType);
        }

        function getgpsAccuracy() {
            msg = 'Estimated GPS Accuracy is ' + $("#accuracy").val() + ' meters'
            alert(msg);
        }

        function setCurrDatTim() {
            var currentTime = new Date();
            $("#Day").val(currentTime.getDate());
            $("#Month").val(currentTime.getMonth() + 1);
            $("#Year").val(currentTime.getFullYear());
            $("#Hrs").val(currentTime.getHours());
            $("#Min").val(currentTime.getMinutes());
            $("#Sec").val(currentTime.getSeconds());
            $("#Name").val($("#Day").val() + "/" + $("#Month").val() + "/" + $("#Year").val() + " " + currentTime.getHours() + ":" + currentTime.getMinutes() + ":" + currentTime.getSeconds());

        }

        function fillkphn() {
            $("#kphnn").val(randomMinToMax(1, 249));
        }

        function randomMinToMax(c, a) {
            var b = a - c + 1;
            return Math.floor(Math.random() * b + c)
        }
    </script>


 <div class="ui-form-container" style="display:none;" id="dialog-form-newchart">
  <div class="form-controls">        
           
                <form name="newchart" id="UserLoginForm" action="/cloud/newchart-session.asp" method="post" onsubmit="return formValidationnew();">               
                <div id="msgdivv" style="height:20px; width:85%; margin-bottom:10px; padding-left:5px; margin-left:6px;">
                </div>
				<input type="hidden" name="methodName" id="methodName" />
               <label><%=newChartRBConstants.getString("NAM") %></label>
               <input type="text" placeholder="Name" name="name" id="Name" maxlength="100"/>
                
                <label>
                    <%=newChartRBConstants.getString("GENDR")%>
                </label>
              
                <select title="Gender" name="sex" id="sex" class="Lbox">
                    <option value="male"><%=newChartRBConstants.getString("MALE")%></option>
                    <option value="female"><%=newChartRBConstants.getString("FEMALE")%></option>
                </select>
                <div class="clearfix"></div>
             <%
                Calendar cal = Calendar.getInstance();
                int day = cal.get(Calendar.DATE);
                int month = cal.get(Calendar.MONTH)+1;
                int year = cal.get(Calendar.YEAR);
                int hr = cal.get(Calendar.HOUR_OF_DAY);
                int min = cal.get(Calendar.MINUTE);
                int sec = cal.get(Calendar.SECOND);
                %>
                <label><%=newChartRBConstants.getString("DATAM")%><font color="red">(DD/MM/YYYY)</font>
                </label>
                <input type="text" placeholder="Day" name="day" id="Day" title="Day"maxlength="2" style="width:99px" value="<%=day%>" />
                <input type="text"  placeholder="Month" name="month" id="Month" title="Month"style="width:99px" maxlength="2" value="<%=month%>" />
                <input type="text"  placeholder="Year" name="year" id="Year" title="Year"style="width:99px" maxlength="4" value="<%=year%>" />
                <div class="clearfix"></div>
                <label>
                <%=newChartRBConstants.getString("TIMAR")%> <font color="red">(<%=newChartEditMatchMakConst.getString("T_24_HOUR_FORMAT") %>)</font>
                </label>

                
                <input type="text"  placeholder="Hour" name="hrs" id="Hrs" title="Hour" maxlength="2"style="width:99px" value="<%=hr%>" />
                <input type="text"  placeholder="Minute" name="min" id="Min" title="Minute" maxlength="2"style="width:99px" value="<%=min%>" />
                <input type="text"  placeholder="Second" name="sec" id="Sec" title="Second" maxlength="2"style="width:99px" value="<%=sec%>" />
                <div class="clearfix"></div>
               <label>
                   <%=newChartRBConstants.getString("PLAC")%><font color="red">(<%=newChartEditMatchMakConst.getString("MIN_3_CHAR") %>)</font>
                </label>
                <input type="text" placeholder="Please enter place and wait for few seconds" name="place" value="<%=Util.safestr(request.getParameter("place")) %>" id="place" maxlength="50" />

                <div id="dstval" class="dst-cntrol"></div> 
             <label></label>   
             <div class="gps-cntrol">         
                 <a href="javaScript:void(0)" onclick="findlocation('CurrentLocation');"><strong> <%=newChartConstants.getString("CURRENT_LOCATION") %></strong></a> &nbsp;&nbsp
                 <a href="javaScript:void(0)" onclick="findlocation('CurrentTime');"><strong> <%=newChartConstants.getString("NOW1") %></strong></a>
             </div>
          <div class="clearfix"></div>

          <div class="adv-cntrol">
              <a id="aTag" href="javascript:toggleAndChangeText();">[&#43;]  <%=newChartConstants.getString("COORDINATES_AND_ADVANCE_SETTINGS") %></a>
          </div>
                
               <div class="clearfix"></div>
               <div id="divToToggle" style="display: none;"> 
                          <label><%=newChartRBConstants.getString("LONGITUDE")%></label>
                          <input type="text" style="width:99px" name="longdeg" <%if(request.getParameter("longdeg") != null) { %> value="<%=Util.safestr(request.getParameter("longdeg")) %>" <% } %> autocomplete="off" title="Longitude Degree" id="LongDeg" placeholder="LongDegree" maxlength="3" />
                          <input type="text" style="width:99px" name="longmin" <%if(request.getParameter("longmin") != null) { %> value="<%=Util.safestr(request.getParameter("longmin")) %>"
                             <% } %> autocomplete="off" title="Longitude Minute" id="LongMin" placeholder="LongMinute" maxlength="2" />
                          <select name="longew" id="LongEW" title="Longitude EW" class="Sbox">
                                    <option value="LongEW">LongEW</option>
                                    <option value="E" <% if("e".equalsIgnoreCase(Util.safestr(request.getParameter("longew")))) { %> selected<% } %>>E</option>
                                    <option value="W" <% if("w".equalsIgnoreCase(Util.safestr(request.getParameter("longew")))) { %> selected<% } %>>W</option>
                           </select>
                           <a href="javascript:void(0)" onclick="getgpsAccuracy();"><%=newChartConstants.getString("GPS_ACCURACY") %></a>
                             <input type="hidden" id="accuracy" name="accuracy" />
                    
              
                  <label><%=newChartRBConstants.getString("LATITUDE")%> </label>
               
                   <input type="text" style="width:99px" name="latdeg" <%if(request.getParameter("latdeg") != null) { %> value="<%=Util.safestr(request.getParameter("latdeg")) %>"
                        <% } %> autocomplete="off" id="LatDeg" title="Latitude Degree" placeholder="LatDegree" maxlength="2" />
                       

                    <input type="text" style="width:99px" name="latmin" <%if(request.getParameter("latmin")!= null) { %> value="<%=Util.safestr(request.getParameter("latmin")) %>"
                        <% } %> autocomplete="off" id="LatMin" title="Latitude Minute" placeholder="LatMinute" maxlength="2" />

                    <select name="latns" id="LatNS" title="Latitude NS" class="Sbox">
                        <option value="LatNS">LatNS</option>
                        <option value="N" <% if("n".equalsIgnoreCase(Util.safestr(request.getParameter("latns")))) { %> selected<% } %>>
                            N</option>
                        <option value="S" <% if("s".equalsIgnoreCase(Util.safestr(request.getParameter("latns")))) { %> selected<% } %>>
                            S</option>
                    </select>

                 
                 <label>
                 <%=newChartRBConstants.getString("TIME_ZONE") %> </label>
                    <input type="text" name="timezone" <%if(request.getParameter("timezone")!= null) { %> value="<%=Util.safestr(request.getParameter("timezone")) %>"
                        <% } %> autocomplete="off" id="timeZone" title="Time Zone" placeholder="Timezone" maxlength="8" /></td>
                <label>
                        <%=newChartRBConstants.getString("AYANAMSA") %></label>
                       
                    <select name="ayanamsa" id="ayanamsa" title="Ayanamsa" class="Lbox">
                        <option value="0"><%=newChartEditMatchMakConst.getString("N_C_LAHIRI") %></option>
                        <option value="1"><%=newChartRBConstants.getString("K_P_NEW") %></option>
                        <option value="2"><%=newChartRBConstants.getString("K_P_OLD") %></option>
                        <option value="3"><%=newChartEditMatchMakConst.getString("B_V_RAMAN") %></option>
                        <option value="4"><%=newChartRBConstants.getString("K_P_KHULLAR") %></option>
                        <option value="5"><%=newChartRBConstants.getString("SAYAN") %></option>
                    </select>
                   
                  <label>
                        <%=newChartRBConstants.getString("CHART_TYPE") %>
                        </label>
                    <select name="charting" title="Chart Style" id="charting" class="Lbox">
                        <option value="0"><%=newChartRBConstants.getString("NORTH_INDIAN") %></option>
                        <option value="1"><%=newChartRBConstants.getString("SOUTH_INDIAN") %></option>
                    </select>
                  
                            <label>
                             <%=newChartRBConstants.getString("KP_HORARY_NUMBER") %> <font color="red">(1-249)</font>
                            </label>
                             
                             <input type="text" name="kphn" size="3" value="0" id="kphnn" maxlength="3" autocomplete="off" title="KP Horary Number" placeholder="kphn" />
                             <div class="clearfix"></div>
                             <label></label>
                             <b><a href="javascript:void(0)" onclick="fillkphn();"><%=newChartConstants.getString("RANDOM_KP_NUMBER") %></a></b>

                             <input type="hidden" name="timezoneid" id="timezoneid" value="<%=request.getParameter("timezonestring")%>" />

                            <input type="hidden" name="newchartdone" id="done"/>
                            <input type="hidden" name="newchartdoneandsave"  id = "saveandone"/>
                            <input type="hidden" name="catchupgrade" id="newcatchupgrade" value="catchupgrade"/>
                            <input type="hidden" name="referrer"  value="/cloud/worksheet"/>
               </div>
                </form>
             </div>
 </div>


 <div class="ui-form-container" id="dialog-form-confirmdata" style="display:none;">
  <input type="hidden" name="placefromnew" id="placefromnew" />
        <h1 align="center">Select Your Birth Place</h1>
                 <form name="UserCityDetailsFormfreekundali" id="UserCityDetailsForm" method="post" action="/cloud/newchart-session.asp">
                
               <table id="conf" cellspacing="0" cellpadding="0" style="margin-left:5px; margin-right:0px; margin-bottom:10px; border-collapse: collapse;" width="99%" border="1" bordercolor="#f96d06">
               </table>
				<input type="hidden" name="methodName" id="methodName1" />
                <input type="hidden" name="name" id="cnfName" />
                <input type="hidden" name="sex" id="cnfgender" />
                <input type="hidden" name="day" id="cnfDay" />
                <input type="hidden" name="month" id="cnfMonth" />
                <input type="hidden" name="year" id="cnfYear" />
                <input type="hidden" name="hrs" id="cnfHrs" />
                <input type="hidden" name="min" id="cnfMin"  />
                <input type="hidden" name="sec" id="cnfSec" />
                <input type="hidden" name="place" id="cnfplace" />
                 
                
                <input type="hidden" name="longdeg" id="cnfLongDeg"/>
                <input type="hidden" name="longmin" id="cnfLongMin" />
                <input type="hidden" name="longew" id="cnfLongEW" />
                <input type="hidden" name="latdeg" id="cnfLatDeg" />
                <input type="hidden" name="latmin" id="cnfLatMin" />
                <input type="hidden" name="latns"  id="cnfLatNS"/>
                <input type="hidden" name="timezone" id="cnftimeZone" />
                <input type="hidden" name="kphn" id="cnfkphn" />
                <input type="hidden" name="dst" id="dst" />
                <input type="hidden" name="ayanamsa" id="cnfayanamsa" value="0" />
                <input type="hidden" name="charting" id="cnfcharting" value="0" />
                <input type="hidden" name="referrer" id="referrer"/>                    
                <input type="hidden" name="newchartdone" id="cnfnewchartdone" />
                <input type="hidden" name="newchartdoneandsave" id="cnfnewchartdoneandsave"/>
                <input type="hidden" name="catchupgrade" id="editcatchupgrade" value="catchupgrade"/>
                </form>
    </div>    


