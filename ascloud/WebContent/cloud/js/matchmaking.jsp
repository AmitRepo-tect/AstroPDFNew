<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local mlocal = new Local();
int mlanguageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle matchMakingConst = mlocal.loadPropertiesFileNew("matchmaking",mlanguageCode);
MyResourceBundle openChartConstants = mlocal.loadPropertiesFileNew("openchart",mlanguageCode);
%>

<input type="hidden" id="count" value=0 />

<script language="javascript" type="text/javascript">
function formValidation() {
    if (document.getElementById('name').value == '' || ($.trim(document.getElementById('name').value) == '')) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_NAME_FIELD")%>');
            document.getElementById('name').focus();
            return (false);}
    
    if (document.getElementById('day').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_DAY_FIELD")%>');
            document.getElementById('day').focus();
            return (false);}
        else {
            if (isNaN(document.getElementById('day').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_DAY_FIELD")%>');
                document.getElementById('day').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('day').value) || document.getElementById('day').value < 1 || document.getElementById('day').value > 31) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_31")%>');
                    document.getElementById('day').focus();
                    return (false);}
            }
        }
        
    if (document.getElementById('month').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MONTH_FIELD")%>');
            document.getElementById('month').focus();
            return (false);}
        else {
            if (isNaN(document.getElementById('month').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MONTH_FIELD")%>');
                document.getElementById('month').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('month').value) || document.getElementById('month').value < 1 || document.getElementById('month').value > 12) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_MONTH_SHOULD_BE_BETWEEN_1_AND_12")%>');
                    document.getElementById('month').focus();
                    return (false);
                }
            }
        }
       
    if (document.getElementById('year').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_YEAR_FIELD")%>');
            document.getElementById('year').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('year').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_YEAR_FIELD")%>');
                document.getElementById('year').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('year').value) || document.getElementById('year').value < 1 || document.getElementById('year').value > 9999) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_9999")%>');
                    document.getElementById('year').focus();
                    return (false);
                }
            }
        }
       

    if (document.getElementById('hrs').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_HOUR_FIELD")%>');
            document.getElementById('hrs').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('hrs').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_HOUR_FIELD")%>');
                document.getElementById('hrs').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('hrs').value) || document.getElementById('hrs').value < 0 || document.getElementById('hrs').value > 23) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_HOUR_SHOULD_BE_BETWEEN_0_AND_23")%>');
                    document.getElementById('hrs').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('min').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MINUTE_FIELD")%>');
            document.getElementById('min').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('min').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MINUTE_FIELD")%>');
                document.getElementById('min').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('min').value) || document.getElementById('min').value < 0 || document.getElementById('min').value > 59) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('min').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('sec').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_SECOND_FIELD")%>');
            document.getElementById('sec').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('sec').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_SECOND_FIELD")%>');
                document.getElementById('sec').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('sec').value) || document.getElementById('sec').value < 0 || document.getElementById('sec').value > 59) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_SECOND_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('sec').focus();
                    return (false);
                }
            }
        }
                
        if (document.getElementById('place').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_PLACE")%>');
            document.getElementById('place').focus();
            return (false);
        }

        if (document.getElementById('place').value.length < 3) {
            alert('<%=rBConstants.getString("ENTER_AT_LEAST_THREE_FIRST_CHARACTERS_OF_CITY_NAME")%>');
            document.getElementById('place').focus();
            return (false);
        }
        
        if (document.getElementById('LongDeg').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_LONGITUDE_DEGREE_VALUE")%>');
            document.getElementById('LongDeg').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LongDeg').value) || document.getElementById('LongDeg').value < 0 || document.getElementById('LongDeg').value >= 180)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LONGITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_179")%>');
            document.getElementById('LongDeg').focus();
            return (false);
        }

        if (document.getElementById('LongMin').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_LONGITUDE_MINUTE_VALUE")%>');
            document.getElementById('LongMin').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LongMin').value) || document.getElementById('LongMin').value < 0 || document.getElementById('LongMin').value >= 60)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LONGITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LongMin').focus();
            return (false);
        }
        
        if (document.getElementById('LatDeg').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_LATITUDE_DEGREE_VALUE")%>');
            document.getElementById('LatDeg').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LatDeg').value) || document.getElementById('LatDeg').value < 0 || document.getElementById('LatDeg').value >= 90)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LATITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_89")%>');
            document.getElementById('LatDeg').focus();
            return (false);
        }
        if (document.getElementById('LatMin').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_LATITUDE_MINUTE_VALUE")%>');
            document.getElementById('LatMin').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LatMin').value) || document.getElementById('LatMin').value < 0 || document.getElementById('LatMin').value >= 60)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LATITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LatMin').focus();
            return (false);
        }

        if (document.getElementById('timeZone').value == '') {
            alert('<%=rBConstants.getString("PLEASE_ENTER_TIME_ZONE")%>');
            document.getElementById('timeZone').focus();
            return (false);
        }

        if (!isRealNumber(document.getElementById('timeZone').value) || document.getElementById('timeZone').value < -12.0 || document.getElementById('timeZone').value > 13.0) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_TIME_ZONE_SHOULD_BE_BETWEEN_12_00_AND_13_00")%>');
            document.getElementById('timeZone').focus();
            return (false);
        }
return (true);
        
}

function getsavedcharts(chart_id)
{
	$('#recorddata').html('');
	$('#recorddataloader').html('');
	$('#recorddataloader').append('<div class="progress"><div class="indeterminate"></div></div>');
	
	var chart_id1 = null;
	
	if (chart_id !== undefined && chart_id !== null)
	{
		chart_id1 = chart_id;
	}
	
	$.get('ChartServlet?methodName=getSavedCharts&chartid=' + chart_id1, function(data) {
            if (data == '1'){
                $('#msgsecond').html("<%=matchMakingConst.getString("UNKNOWN_ERROR_OCCURRED") %>");
                $('#msgsecond').show();
                $('.appintrosecond').hide();
                $('#recorddataloader').html('');
                }
            else {
                if (data == '0') {
                    $('#msgsecond').html("<%=matchMakingConst.getString("THERE_IS_NO_SAVED_CHART") %>");
                    $('#msgsecond').show();
                    $('.appintrosecond').hide();
                    $('#recorddataloader').html('');
                    $('#btnMoreChart').hide();
                }
                else {
                    if (data == '2') {
                        $('#msgsecond').html("<%=matchMakingConst.getString("SESSION_TIME_OUT_MSG") %>");
                        $('#msgsecond').show();
                        setTimeout(function(){$('#msgsecond').hide();},7000);
                        $('#recorddataloader').html('');
                    }
                    else {
                        if (data =='3') {
                            $('#msgsecond').html("<%=rBConstants.getString("YOU_ARE_NOT_LOGIN_PLEASE_LOGIN_FIRST") %>");
                            $('#msgsecond').css('display','block');
                            $('.appintrosecond').hide();
                            $('#recorddataloader').html('');
                        }
                        else {
                            allsavedcharts = data.split('#');
                            
                            if (chart_id !== undefined && chart_id !== null)
                        	{
                        		chart_id1 = chart_id;
                        	}
                        	else
                        	{
                        		$('#recorddataloader').html('');
                        		$('#recorddata').append('<table id="savedchart" class="highlight striped bordered ui-table responsive-table"><thead><tr class="amber lighten-5"><th><%=rBConstants.getString("SERIAL_NUMBER") %></th><th><%=rBConstants.getString("NAM") %></th><th><%=rBConstants.getString("DATE_OF_BIRTH") %></th><th><%=rBConstants.getString("TIME_OF_BIRTH") %></th><th><%=rBConstants.getString("PLAC")%></th><th><%=rBConstants.getString("MATCH")%></th></tr></thead><tbody>');
                        	}
                            
                            for (var i = 0; i < allsavedcharts.length; i++)
                            {
								var sn = parseInt(document.getElementById("count").value);
								
								sn = sn + 1;
								
								tempdata = allsavedcharts[i];
                                
								var savedchart = tempdata.split('|');
								
                                $('#savedchart').append('<tr id="ff" class="pseudomatchme"><td class="cellcontent">' + sn + '</td><td class="cellcontent">' + savedchart[0] + '</td><td nowrap class="cellcontent">' + savedchart[1] + '-' + savedchart[2] + '-' + savedchart[3] + '</td><td nowrap class="cellcontent">' + savedchart[4] + ':' + savedchart[5] + ':' + savedchart[6] + '</td><td class="cellcontent">' + savedchart[7] + '</td><td class="cellcontent"><input type="radio" class="with-gap" name="matchwith" id="matchwith' + (i + 1) + '" onclick="matchme();" value="' + savedchart[8] + '" /><label for="matchwith' + (i + 1) + '"></label></td></tr>');
                                
                                document.getElementById("count").value = sn;
                            }
                            
                            $('#recorddataloader').html('');
                            
                            if (parseInt(sn) < 20)
                            {
                            	var elem = document.getElementById("btnMoreChart");
                                elem.parentNode.removeChild(elem);
                            }
                            
                            if (chart_id !== undefined && chart_id !== null)
                        	{
                            	//$('waves-effect waves-light btn amber darken-4 box-shadow').remove();
                            	var elem = document.getElementById("btnMoreChart");
                                elem.parentNode.removeChild(elem);
                        	}

                       		$('#recorddata').append('<button id="btnMoreChart" type="button" onclick="getsavedcharts(' + savedchart[8] + ');" class="waves-effect waves-light btn amber darken-4 box-shadow" style="margin-left:auto;margin-right:auto;display:block;margin-top:3%;margin-bottom:0%"><%=openChartConstants.getString("MORE_CHART") %></button>');

							$('#recorddata').append('</tbody></table>');
                        }
                    }
                }
            }
        });
    } 

    function matchme() {
    	matchmeradio = document.getElementsByName('matchwith')
        
        for (var i = 0; i < matchmeradio.length; i++) {
            if (matchmeradio[i].checked) {
                chartid = matchmeradio[i].value;
            }
        }
       // alert(chartid);
        //passingurl = "chartid = " + chartid;
        $.get('ChartServlet?methodName=getChartDetails', "Chartid=" + chartid, function(data) {
            if (data == '0') {
                $('#msgsecond').html("<%=matchMakingConst.getString("YOU_ARE_NOT_LOGIN_OR_YOUR_SESSION_HAS_BEEN_EXPIRED") %>");
                $('#msgsecond').show();
                $('.appintrosecond').hide();
            }
            else {
                if (data == '1') {
                    $('#msgsecond').html("<%=matchMakingConst.getString("UNKNOWN_ERROR_OCCURRED") %>");
                    $('#msgsecond').show();
                    $('.appintrosecond').hide();
                }
                else {
                    var chartdata = eval('(' + data + ')');
                    //alert(chartdata.name);
                    $('#name3').val(chartdata.name);
                    $('#sex3').val(chartdata.sex);
                    $('#day3').val(chartdata.day);
                    $('#month3').val(chartdata.month);
                    $('#year3').val(chartdata.year);
                    $('#hrs3').val(chartdata.hrs);
                    $('#min3').val(chartdata.min);
                    $('#sec3').val(chartdata.sec);
                    $('#place3').val(chartdata.place);
                    $('#longdeg3').val(chartdata.longdeg);
                    $('#longmin3').val(chartdata.longmin);
                    $('#longew3').val(chartdata.longew);
                    $('#latdeg3').val(chartdata.latdeg);
                    $('#latmin3').val(chartdata.latmin);
                    $('#latns3').val(chartdata.latns);
                    $('#dstsecond').val(chartdata.dst);
                    $('#timezone3').val(chartdata.timezone);                                        
                }
            }
            document.forms['two1'].submit();
            //alert($('#name3').val());
        });
    }
    
    
    function matchmeauto(li) {
        $.get('ChartServlet?methodName=getChartDetails', "Chartid=" + li.extra[0], function(data) {
            if (data == '0') {
                $('#msgsecond').html("<%=matchMakingConst.getString("YOU_ARE_NOT_LOGIN_OR_YOUR_SESSION_HAS_BEEN_EXPIRED") %>");
                $('#msgsecond').show();
                $('.appintrosecond').hide();
            }
            else {
                if (data == '1') {
                    $('#msgsecond').html("<%=matchMakingConst.getString("UNKNOWN_ERROR_OCCURRED") %>");
                    $('#msgsecond').show();
                    $('.appintrosecond').hide();
                }
                else {
                    var chartdata = eval('(' + data + ')');
                    //alert(chartdata.name);
                    $('#name3').val(chartdata.name);
                    $('#sex3').val(chartdata.sex);
                    $('#day3').val(chartdata.day);
                    $('#month3').val(chartdata.month);
                    $('#year3').val(chartdata.year);
                    $('#hrs3').val(chartdata.hrs);
                    $('#min3').val(chartdata.min);
                    $('#sec3').val(chartdata.sec);
                    $('#place3').val(chartdata.place);
                    $('#longdeg3').val(chartdata.longdeg);
                    $('#longmin3').val(chartdata.longmin);
                    $('#longew3').val(chartdata.longew);
                    $('#latdeg3').val(chartdata.latdeg);
                    $('#latmin3').val(chartdata.latmin);
                    $('#latns3').val(chartdata.latns);
                    $('#dstsecond').val(chartdata.dst);
                    $('#timezone3').val(chartdata.timezone);
                }
            }
            document.forms['two1'].submit();       
        });
    }
    
    function checkpublicchartname(){
    
     if(document.getElementById('publicchartname').value=="")
     {
        $('#msgthird').html("<%=matchMakingConst.getString("PLS_ENTER_CHART_NAME") %>");
        //$('#msgthird').css('display','block');
        $('#msgthird').show();
        setTimeout(function(){$('#msgthird').hide();},7000);
        document.getElementById('publicchartname').focus();
        return (false);
     }
     else
     {
      chartname = document.getElementById('publicchartname').value;
      sharedChartId = document.getElementById('publicMatchChartId').value;
      sendurl = "Chartid=" + sharedChartId;
     $.get('ChartServlet?methodName=getChartDetails',sendurl,function(data){

    if(data==<%=ConstantValues.RECORD_NOT_FOUND %>){        
         $('#msgthird').html("<%=matchMakingConst.getString("CHART_NAME_DOES_NOT_EXIST") %>")
         $('#msgthird').show();
         setTimeout(function(){$('#msgthird').hide();},7000);
    }
    else{
        if(data==<%=ConstantValues.GET_CHART_VALUE_ERR %>){            
            $('#msgthird').html("<%=matchMakingConst.getString("DO_NOT_FIND_CHART_NAME") %>")
             $('#msgthird').show();
             setTimeout(function(){$('#msgthird').hide();},7000);
        }
        else{
            if(data==<%=ConstantValues.EXE_QUERY_ERR %>){
                $('#msgthird').html("<%=matchMakingConst.getString("SOME_ERR_OCCRR_IN_PROCESSING_YOUR_QRY_PLS_AGAIN") %>")
                 $('#msgthird').show();
                 setTimeout(function(){$('#msgthird').hide();},7000);
            }
            else{
                if(data==<%=ConstantValues.SESSION_TIME_OUT %>){
                    $('#msgthird').html("<%=matchMakingConst.getString("SESSION_TIME_OUT_MSG") %>")
                    $('#msgthird').show();
                    setTimeout(function(){$('#msgthird').hide();},7000);
                }
                else{
                    var chartreturndata = eval('('+data+')');
                    $('#name4').val(chartreturndata.name);
                    $('#sex4').val(chartreturndata.sex);
                    $('#day4').val(chartreturndata.day);
                    $('#month4').val(chartreturndata.month);
                    $('#year4').val(chartreturndata.year);
                    $('#hrs4').val(chartreturndata.hrs);
                    $('#min4').val(chartreturndata.min);
                    $('#sec4').val(chartreturndata.sec);
                    $('#place4').val(chartreturndata.place);
                    $('#longdeg4').val(chartreturndata.longdeg);
                    $('#longmin4').val(chartreturndata.longmin);
                    $('#longew4').val(chartreturndata.longew);
                    $('#latdeg4').val(chartreturndata.latdeg);
                    $('#latmin4').val(chartreturndata.latmin);
                    $('#latns4').val(chartreturndata.latns);
                    $('#dst4').val(chartreturndata.dst);
                    $('#timezone4').val(chartreturndata.timezone);
                    document.forms['thirdff'].submit();
                }
            }
        }
    }      
    }).fail(function(textStatus) {    	
        if(textStatus=="fail"){
            $('#msgthird').html("<%=matchMakingConst.getString("SOME_ERR_OCCRR_IN_PROCESSING_YOUR_QRY_PLS_AGAIN") %>");
            $('#msgthird').show();
            setTimeout(function(){$('#msgthird').hide();},7000);
        }
        if(textStatus=="timeout"){
            $('#msgthird').html("<%=matchMakingConst.getString("SESSION_TIME_OUT_MSG") %>");
            $('#msgthird').show();
            setTimeout(function(){$('#msgthird').hide();},7000);
        }
    });
      return false;
     }
    }
    
    
    $(document).ready(function() {
    	
    	var hash = window.location.hash;
    	if(hash == "#tab2"){    		
    		getsavedcharts();
    	} 
    	
    	$("#publicchartname").autocomplete(
		    "/cloud/ChartServlet",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        cacheLength: 10,
		        onItemSelect: selectItem2,
		        onFindValue: findValue2,
		        formatItem: formatItem2,
		        autoFill: true
		    }
	    );
	    
	    $("#place").autocomplete(
		    "/HomeServlet",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        cacheLength: 10,
		        onItemSelect: selectItemMM,
		        onFindValue: findValueMM,
		        formatItem: formatItem,
		        autoFill: false
		    }
		   
	    );
	    
	    $("#chartnamematch").autocomplete(
 	           "ChartServlet",
 	        {

 	            delay: 10,
 	            minChars: 3,
 	            matchSubset: 1,
 	            matchContains: 1,
 	            cacheLength: 0,
 	            extraParams: { methodName:'getSavedChartsForAutoComplete',userid: $("#uid").val() },
 	            onItemSelect: selectItem3,
 	            onFindValue: findValue3,
 	            formatItem: formatItem3,
 	            autoFill: false
 	        });
	    
	    
    });
    
    
    function findValue3(li) {
    	matchmeauto(li);
    	if (li == null) return alert("No match!");
    }
    function selectItem3(li) {    	
    	findValue3(li);
    }
    function formatItem3(row) {
    	return row[0] + "," + row[3] + "," + row[4] + "," + row[5];
    }
    
    
    function findValueMM(li) {    	
        if (li == null) return alert("No match!");        
        $('#LatDeg').val(li.extra[3]);
        $('#LatMin').val(li.extra[4]);
        $('#LatNS').val(li.extra[5]);
        $('#LongDeg').val(li.extra[6]);
        $('#LongMin').val(li.extra[7]);
        $('#LongEW').val(li.extra[8]);
        $('#timeZone').val(li.extra[9]);
        $('select').material_select();
        $('label').addClass('active');        
       
    }
    function selectItemMM(li) {
    	
        findValueMM(li);
        $('select').material_select();
    }

    function formatItem(row) {
        return row[0] + " (" + row[2] + " " + row[3] + ")";
    }
    function findValue2(li) {
        if (li == null) return alert("No match!");
        //set the chart id on this id to set user basic birth details for match
        $('#publicMatchChartId').val(li.extra[1]);
    }
    function selectItem2(li) {
        findValue2(li);
    }
    function formatItem2(row) {
        return row[0] + " (" + row[1] + ")";
    }
    
    function lookupAjax() {
        
        var oSuggest = $("#place")[0].autocompleter;
        oSuggest.findValue();
        
        var oSuggest1 = $("#publicchartname")[0].autocompleter;
        oSuggest1.findValue2();
        
        var oSuggest2 = $("#chartnamematch")[0].autocompleter;
        oSuggest2.findValue3();
        
        return false;
    }
    </script>