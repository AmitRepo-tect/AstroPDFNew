<!--#include virtual='\cloud\util\local.asp'-->
<!--#include virtual='\cloud\util\hindi.asp'-->
<!--#include virtual='/cloud/constantvalues.asp'-->
function formValidation() {
    if (document.getElementById('name').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_NAME_FIELD")%>');
            document.getElementById('name').focus();
            return (false);}
    
    if (document.getElementById('day').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_DAY_FIELD")%>');
            document.getElementById('day').focus();
            return (false);}
        else {
            if (isNaN(document.getElementById('day').value)) {
                alert('<%=GetString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_DAY_FIELD")%>');
                document.getElementById('day').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('day').value) || document.getElementById('day').value < 1 || document.getElementById('day').value > 31) {
                    alert('<%=GetString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_31")%>');
                    document.getElementById('day').focus();
                    return (false);}
            }
        }
        
    if (document.getElementById('month').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_MONTH_FIELD")%>');
            document.getElementById('month').focus();
            return (false);}
        else {
            if (isNaN(document.getElementById('month').value)) {
                alert('<%=GetString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MONTH_FIELD")%>');
                document.getElementById('month').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('month').value) || document.getElementById('month').value < 1 || document.getElementById('month').value > 12) {
                    alert('<%=GetString("THE_VALUE_FOR_MONTH_SHOULD_BE_BETWEEN_1_AND_12")%>');
                    document.getElementById('month').focus();
                    return (false);
                }
            }
        }
       
    if (document.getElementById('year').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_YEAR_FIELD")%>');
            document.getElementById('year').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('year').value)) {
                alert('<%=GetString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_YEAR_FIELD")%>');
                document.getElementById('year').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('year').value) || document.getElementById('year').value < 1 || document.getElementById('year').value > 9999) {
                    alert('<%=GetString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_9999")%>');
                    document.getElementById('year').focus();
                    return (false);
                }
            }
        }
       

    if (document.getElementById('hrs').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_HOUR_FIELD")%>');
            document.getElementById('hrs').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('hrs').value)) {
                alert('<%=GetString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_HOUR_FIELD")%>');
                document.getElementById('hrs').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('hrs').value) || document.getElementById('hrs').value < 0 || document.getElementById('hrs').value > 23) {
                    alert('<%=GetString("THE_VALUE_FOR_HOUR_SHOULD_BE_BETWEEN_0_AND_23")%>');
                    document.getElementById('hrs').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('min').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_MINUTE_FIELD")%>');
            document.getElementById('min').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('min').value)) {
                alert('<%=GetString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MINUTE_FIELD")%>');
                document.getElementById('min').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('min').value) || document.getElementById('min').value < 0 || document.getElementById('min').value > 59) {
                    alert('<%=GetString("THE_VALUE_FOR_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('min').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('sec').value == '') {
            alert('<%=GetString("PLEASE_ENTER_A_VALUE_FOR_THE_SECOND_FIELD")%>');
            document.getElementById('sec').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('sec').value)) {
                alert('<%=GetString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_SECOND_FIELD")%>');
                document.getElementById('sec').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('sec').value) || document.getElementById('sec').value < 0 || document.getElementById('sec').value > 59) {
                    alert('<%=GetString("THE_VALUE_FOR_SECOND_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('sec').focus();
                    return (false);
                }
            }
        }
                
        if (document.getElementById('place').value == '') {
            alert('<%=GetString("PLEASE_ENTER_PLACE")%>');
            document.getElementById('place').focus();
            return (false);
        }

        if (document.getElementById('place').value.length < 3) {
            alert('<%=GetString("ENTER_AT_LEAST_THREE_FIRST_CHARACTERS_OF_CITY_NAME")%>');
            document.getElementById('place').focus();
            return (false);
        }
        
        if (document.getElementById('LongDeg').value == '') {
            alert('<%=GetString("PLEASE_ENTER_LONGITUDE_DEGREE_VALUE")%>');
            document.getElementById('LongDeg').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LongDeg').value) || document.getElementById('LongDeg').value < 0 || document.getElementById('LongDeg').value >= 180)) {
            alert('<%=GetString("THE_VALUE_FOR_LONGITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_179")%>');
            document.getElementById('LongDeg').focus();
            return (false);
        }

        if (document.getElementById('LongMin').value == '') {
            alert('<%=GetString("PLEASE_ENTER_LONGITUDE_MINUTE_VALUE")%>');
            document.getElementById('LongMin').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LongMin').value) || document.getElementById('LongMin').value < 0 || document.getElementById('LongMin').value >= 60)) {
            alert('<%=GetString("THE_VALUE_FOR_LONGITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LongMin').focus();
            return (false);
        }
        
        if (document.getElementById('LatDeg').value == '') {
            alert('<%=GetString("PLEASE_ENTER_LATITUDE_DEGREE_VALUE")%>');
            document.getElementById('LatDeg').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LatDeg').value) || document.getElementById('LatDeg').value < 0 || document.getElementById('LatDeg').value >= 90)) {
            alert('<%=GetString("THE_VALUE_FOR_LATITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_89")%>');
            document.getElementById('LatDeg').focus();
            return (false);
        }
        if (document.getElementById('LatMin').value == '') {
            alert('<%=GetString("PLEASE_ENTER_LATITUDE_MINUTE_VALUE")%>');
            document.getElementById('LatMin').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('LatMin').value) || document.getElementById('LatMin').value < 0 || document.getElementById('LatMin').value >= 60)) {
            alert('<%=GetString("THE_VALUE_FOR_LATITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LatMin').focus();
            return (false);
        }

        if (document.getElementById('timeZone').value == '') {
            alert('<%=GetString("PLEASE_ENTER_TIME_ZONE")%>');
            document.getElementById('timeZone').focus();
            return (false);
        }

        if (!isRealNumber(document.getElementById('timeZone').value) || document.getElementById('timeZone').value < -12.0 || document.getElementById('timeZone').value > 13.0) {
            alert('<%=GetString("THE_VALUE_FOR_TIME_ZONE_SHOULD_BE_BETWEEN_12_00_AND_13_00")%>');
            document.getElementById('timeZone').focus();
            return (false);
        }
return (true);
        
}

function getsavedcharts() {
        $.get('control/getsavedcharts.asp', function(data) {
            if (data == '1'){
                $('#msgsecond').html("<%=GetString("UNKNOWN_ERROR_OCCURRED") %>");
                $('#msgsecond').show();
                $('.appintrosecond').hide();
                }
            else {
                if (data == '0') {
                    $('#msgsecond').html("<%=GetString("THERE_IS_NO_SAVED_CHART") %>");
                    $('#msgsecond').show();
                    $('.appintrosecond').hide();
                }
                else {
                    if (data == '2') {
                        $('#msgsecond').html("<%=GetString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN_AGAIN") %>");
                        $('#msgsecond').show();
                        setTimeout(function(){$('#msgsecond').hide();},7000);
                    }
                    else {
                        if (data =='3') {
                            $('#msgsecond').html("<%=GetString("YOU_ARE_NOT_LOGIN_PLEASE_LOGIN_FIRST") %>");
                            $('#msgsecond').css('display','block');
                            $('.appintrosecond').hide();
                        }
                        else {                            
                            allsavedcharts = data.split('#');
                            $('#recorddata').html('');
                            $('#recorddata').append('<table border="1" id="savedchart" style=" border-collapse:collapse;" bordercolor="#F96D06" width="100%"><tr><td class="cellhead" style=" background-color:#F7CC77;"><%=GetString("SERIAL_NUMBER") %></td><td class="cellhead" style=" background-color:#F7CC77;"><%=GetString("NAM") %></td><td class="cellhead" style=" background-color:#F7CC77;"><%=GetString("DATE_OF_BIRTH") %></td><td class="cellhead" style=" background-color:#F7CC77;"><%=GetString("TIME_OF_BIRTH") %></td><td class="cellhead" style=" background-color:#F7CC77;"><%=GetString("PLAC")%></td><td class="cellhead" style=" background-color:#F7CC77;"><%=GetString("MATCH")%></td></tr>');
                                                        
                            for (var i = 0; i < allsavedcharts.length; i++) {
                               
                                tempdata = allsavedcharts[i];
                                
                                var savedchart = tempdata.split('|');
                                
                                $('#savedchart').append('<tr id="ff" class="pseudomatchme"><td class="cellcontent">' + (i + 1) + '</td><td class="cellcontent">' + savedchart[0] + '</td><td nowrap class="cellcontent">' + savedchart[1] + '-' + savedchart[2] + '-' + savedchart[3] + '</td><td nowrap class="cellcontent">' + savedchart[4] + ':' + savedchart[5] + ':' + savedchart[6] + '</td><td class="cellcontent">' + savedchart[7] + '</td><td class="cellcontent"><input type="radio" name="matchwith" id="matchwith"' + (i + 1) + ' onclick="matchme();" value="' + savedchart[8] + '" /></td></tr>');
                            }                            
                            
                             $('#recorddata').append('</table>');
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
        $.get('control/getchartdetails.asp', "Chartid=" + chartid, function(data) {
            if (data == '0') {
                $('#msgsecond').html("<%=GetString("YOU_ARE_NOT_LOGIN_OR_YOUR_SESSION_HAS_BEEN_EXPIRED") %>");
                $('#msgsecond').show();
                $('.appintrosecond').hide();
            }
            else {
                if (data == '1') {
                    $('#msgsecond').html("<%=GetString("UNKNOWN_ERROR_OCCURRED") %>");
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
    
    function checkpublicchartname(){
    
     if(document.getElementById('publicchartname').value=="")
     {
        $('#msgthird').html("<%=GetString("PLS_ENTER_CHART_NAME") %>");
        //$('#msgthird').css('display','block');
        $('#msgthird').show();
        setTimeout(function(){$('#msgthird').hide();},7000);
        document.getElementById('publicchartname').focus();
        return (false);
     }
     else
     {
      chartname = document.getElementById('publicchartname').value;
      sendurl = "chartname="+chartname;
      var getObject = $.get('control/getpublicchartdetails.asp',sendurl,function(data){

    if(data==<%=RECORD_NOT_FOUND %>){        
         $('#msgthird').html("<%=GetString("CHART_NAME_DOES_NOT_EXIST") %>")
         $('#msgthird').show();
         setTimeout(function(){$('#msgthird').hide();},7000);
    }
    else{
        if(data==<%=GET_CHART_VALUE_ERR %>){            
            $('#msgthird').html("<%=GetString("DO_NOT_FIND_CHART_NAME") %>")
             $('#msgthird').show();
             setTimeout(function(){$('#msgthird').hide();},7000);
        }
        else{
            if(data==<%=EXE_QUERY_ERR %>){
                $('#msgthird').html("<%=GetString("SOME_ERR_OCCRR_IN_PROCESSING_YOUR_QRY_PLS_AGAIN") %>")
                 $('#msgthird').show();
                 setTimeout(function(){$('#msgthird').hide();},7000);
            }
            else{
                if(data==<%=SESSION_TIME_OUT %>){
                    $('#msgthird').html("<%=GetString("SESSION_TIME_OUT_MSG") %>")
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
    });
    
    getObject.error(function(jqxhr,textStatus,errorThrown){
        if(textStatus=="error"){
            $('#msgthird').html("<%=GetString("SOME_ERR_OCCRR_IN_PROCESSING_YOUR_QRY_PLS_AGAIN") %>");
            $('#msgthird').show();
            setTimeout(function(){$('#msgthird').hide();},7000);
        }
        if(textStatus=="timeout"){
            $('#msgthird').html("<%=GetString("SESSION_TIME_OUT") %>");
            $('#msgthird').show();
            setTimeout(function(){$('#msgthird').hide();},7000);
        }
    });
      return false;
     }
    }
    
    
    $(document).ready(function() {
        $("#publicchartname").autocomplete(
		    "findchartname.asp",
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
		    "FindPlaces.asp",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        cacheLength: 10,
		        onItemSelect: selectItem,
		        onFindValue: findValue,
		        formatItem: formatItem,
		        autoFill: true
		    }
	    );
    });
    
    
    function findValue(li) {
        if (li == null) return alert("No match!");
        $('#LatDeg').val(li.extra[3]);
        $('#LatMin').val(li.extra[4]);
        $('#LatNS').val(li.extra[5]);
        $('#LongDeg').val(li.extra[6]);
        $('#LongMin').val(li.extra[7]);
        $('#LongEW').val(li.extra[8]);
        $('#timeZone').val(li.extra[9]);
    }
    function selectItem(li) {
        findValue(li);
    }

    function formatItem(row) {
        return row[0] + " (" + row[2] + " " + row[3] + ")";
    }
    function findValue2(li) {
        if (li == null) return alert("No match!");
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
        
        return false;
    }