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

   
    
    
    $(document).ready(function() {    	
	    
	    $("#place").autocomplete(
		    "/HomeServlet",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        cacheLength: 10,
		        onItemSelect: selectItem1,
		        onFindValue: findValue1,
		        formatItem: formatItem1,
		        autoFill: false
		    }		   
	    ); 
	    $("#place1").autocomplete(
			    "/HomeServlet",
			    {
			        delay: 10,
			        minChars: 3,
			        matchSubset: 1,
			        matchContains: 1,
			        cacheLength: 10,
			        onItemSelect: selectItem2,
			        onFindValue: findValue2,
			        formatItem: formatItem2,
			        autoFill: false
			    }		   
		    ); 
    });
    
    function findValue1(li) {    	
        if (li == null) return alert("No match!");        
        $('#LatDeg').val(li.extra[3]);
        $('#LatMin').val(li.extra[4]);
        $('#LatNS').val(li.extra[5]);
        $('#LongDeg').val(li.extra[6]);
        $('#LongMin').val(li.extra[7]);
        $('#LongEW').val(li.extra[8]);
        $('#timeZone').val(li.extra[9]);       
    }
    function selectItem1(li) {    	
        findValue1(li);       
    } 
    function formatItem1(row) {
        return row[0] + " (" + row[2] + " " + row[3] + ")";
    }
    function findValue2(li) {    	
        if (li == null) return alert("No match!");        
        $('#LatDeg1').val(li.extra[3]);
        $('#LatMin1').val(li.extra[4]);
        $('#LatNS1').val(li.extra[5]);
        $('#LongDeg1').val(li.extra[6]);
        $('#LongMin1').val(li.extra[7]);
        $('#LongEW1').val(li.extra[8]);
        $('#timeZone1').val(li.extra[9]);       
    }
    function selectItem2(li) {    	
        findValue2(li);       
    }  
    function formatItem2(row) {
        return row[0] + " (" + row[2] + " " + row[3] + ")";
    }
    
    function lookupAjax() {        
        var oSuggest = $("#place")[0].autocompleter;
        oSuggest.findValue1();
        
        var oSuggest = $("#place1")[0].autocompleter;
        oSuggest.findValue2();
        
        return false;
    }
    </script>