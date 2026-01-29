<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local local = new Local();
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
Object obj = session.getAttribute("constants");
MyProperties rBConstants = null;
if(obj != null)
{
	rBConstants = (MyProperties) session.getAttribute("constants");
}
else
{
	rBConstants = new MyProperties(local.loadPropertiesFile("constants", languageCode));
	session.setAttribute("constants", rBConstants);
}
MyResourceBundle newChartConst = local.loadPropertiesFileNew("newchart",languageCode);
MyResourceBundle newChartEditConst = local.loadPropertiesFileNew("newchart-editchart",languageCode);
MyResourceBundle newChartEditMatchMakConst = local.loadPropertiesFileNew("newchart-editchart-matchmaking",languageCode);
%>

<script type="text/javascript" src="/kundli/js/kundli.js" charset="utf-8"></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script type="text/javascript" src="/kundli/js/gpsfill.js"></script>
<script type="text/javascript" src="/dist/js/shared-functions.js"></script>
<script language="javascript" type="text/javascript">

 //---------------------
     function toggleAndChangeText() {
         $('#divToToggle').toggle();
         if ($('#divToToggle').css('display') == 'none') {
             $('#aTag').html('[&#43]  <%=newChartConst.getString("COORDINATES_AND_ADVANCE_SETTINGS") %>');
         }
         else {
             $('#aTag').html('[&#8722] <%=newChartConst.getString("COORDINATES_AND_ADVANCE_SETTINGS") %>');
         }
     }
     function fillkphn() {

         $("#kphn").val(randomMinToMax(1, 249));
     }
     function randomMinToMax(c, a) {
         var b = a - c + 1;
         return Math.floor(Math.random() * b + c)
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
     function findlocation(clickType) {
         $("#dstval").html('');
         autofillgps(clickType);
     }        
    </script>
<%
String msg = "";
 if(session.getAttribute("LoginUser") == null && session.getAttribute("HoroscopeObj") == null) 
    msg = "Sorry your session has been expired. Please <a href=\">Login</a> again.";
 
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("NEW_CHART") %></h1>	
</div>





<div class="row mrt-20">
              <div class="col s12 m12 l12">
              	<% 
if(!msg.equals(""))
{
%>
	
		<div class="card padding-all">
			<%=msg %>
		</div>
	
	<% 
}
%>
                <div class="card-panel head-1">
                  <h4 class="header2"><%=newChartEditConst.getString("ENTER_YOUR_BIRTH_DETAILS")%></h4>
                  <div class="row mr-b-0">
                    <form class="col s12" name="newchart" id="UserLoginForm" action="newchart-session.asp" method="post" onsubmit="return formValidation();">
                      <div class="row">
                        <div class="input-field col s6">
                          <input type="text" placeholder="Name" name="name" id="Name" /> 
                          <label for="Name"><%=rBConstants.getString("NAM") %></label>
                        </div>
                        
                        <div class="input-field col s6">
                          <select name="sex" id="sex">                            
                            <option value="male" selected><%=rBConstants.getString("MALE")%></option>
                            <option value="female"><%=rBConstants.getString("FEMALE")%></option>
                          </select>
                          <label for="sex"><%=rBConstants.getString("GENDR")%></label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="input-field col s4">
                          <%
			                Calendar cal = Calendar.getInstance();
			                int day = cal.get(Calendar.DATE);
			                int month = cal.get(Calendar.MONTH);
			                int year = cal.get(Calendar.YEAR);
			                int hr = cal.get(Calendar.HOUR_OF_DAY);
			                int min = cal.get(Calendar.MINUTE);
			                int sec = cal.get(Calendar.SECOND);
			              %>
			              <input type="text" placeholder="Day" name="day" id="Day" title="Day" value="<%=day%>" />
			              <label for="date"><%=rBConstants.getString("BD_DAY")%></label>
			              </div> 
			              <div class="input-field col s4">
			              <input type="text" placeholder="Month" name="month" id="Month" title="Month" value="<%=month+1%>" />
			              <label for="date"><%=rBConstants.getString("BD_MONTH")%></label>
			              </div>
			              <div class="input-field col s4">
						  <input type="text" placeholder="Year" name="year" id="Year" title="Year" value="<%=year%>" />
                          <label for="date"><%=rBConstants.getString("BD_YEAR")%></label>
                        </div>
                        
                      </div>
                      <div class="row">
                      <div class="input-field col s4">
                          <input type="text" placeholder="Hour" name="hrs" id="Hrs" title="Hour" value="<%=hr%>" />
                          <label for="Hrs"><%=rBConstants.getString("BD_HRS")%></label>
                          </div>
                          <div class="input-field col s4">
			              <input type="text" placeholder="Minute" name="min" id="Min" title="Minute" value="<%=min%>" />
			              <label for="Min"><%=rBConstants.getString("BD_MIN")%></label>
			              </div>
			              <div class="input-field col s4">
			              <input type="text" placeholder="Second" name="sec" id="Sec" title="Second" value="<%=sec%>" />
			              <label for="Sec"><%=rBConstants.getString("BD_SEC")%></label>
                          </div>
                        </div>
                      
                      <div class="row">
                          <div class="input-field col s12">
                          <input type="text" placeholder="Place" name="place" value="<%=Util.safestr(request.getParameter("place")) %>" id="place" maxlength="50" />
                          <label for="place"><%=rBConstants.getString("PLAC")%> (<%=newChartEditMatchMakConst.getString("MIN_3_CHAR") %>)</label>                          
                          <span id="dstval" class="red-text"></span>
                          </div>
                          </div>
                          
                        <div class="row">
                          <div class="col s12 m4">
                          	<a id="aTag" class="btn btn-btm waves-effect amber lighten-4 black-text" href="javascript:toggleAndChangeText();"> [&#43;] <%=newChartConst.getString("COORDINATES_AND_ADVANCE_SETTINGS") %></a>
                          </div>			
			 		<div class="col s12 m8" align="right">                        
                          <a class="btn waves-effect white black-text well-css" href="javaScript:void(0)" onclick="findlocation('CurrentLocation');"> <strong> <%=newChartConst.getString("CURRENT_LOCATION") %></strong></a>
				          <a class="btn waves-effect white black-text well-css" href="javaScript:void(0)" onclick="findlocation('CurrentTime');"><strong> <%=newChartConst.getString("NOW1") %></strong></a>
				    </div>
				    
                        
			 </div>
			 <div id="divToToggle" style="display: none;">
			 <div class="row">
			 
               <div class="input-field col s4">
               
               <input type="text" name="longdeg"
							<%if(request.getParameter("longdeg") != null) {%>
							value="<%=Util.safestr(request.getParameter("longdeg")) %>"
							<% } %> autocomplete="off" title="Longitude Degree" id="LongDeg"
							placeholder="LongDegree" />
							<label for="LongDeg"> <%=rBConstants.getString("LONGITUDE")%></label>
                          
                          </div>
                          
                          <div class="input-field col s4">
                          <input type="text" name="longmin"
							<%if(request.getParameter("longmin") != null) {%>
							value="<%=Util.safestr(request.getParameter("longmin")) %>"
							<% } %> autocomplete="off" title="Longitude Minute" id="LongMin"
							placeholder="LongMinute" />
                          </div>
                          
                          <div class="input-field col s4">
                          <select name="longew" id="LongEW">
								<option value="LongEW">LongEW</option>
								<option value="E"
									<% if(Util.safestr(request.getParameter("longew")).toLowerCase().equals("e")) { %>
									selected <% } %>>E</option>
								<option value="W"
									<% if(Util.safestr(request.getParameter("longew")).toLowerCase().equals("w")) { %>
									selected <% } %>>W</option>
						</select>
                          </div>
                          
                     
                          
                          </div>
                          
                          
			              <div class="row">
                          <div class="input-field col s4">
                          <label for="LatDeg"> <%=rBConstants.getString("LATITUDE")%></label>
				<input type="text" name="latdeg"
					<%if(request.getParameter("latdeg") != null) { %>
					value="<%=Util.safestr(request.getParameter("latdeg")) %>" <% } %>
					autocomplete="off" id="LatDeg" title="Latitude Degree"
					placeholder="LatDegree" />
                          </div>
                          <div class="input-field col s4">
                          <input
					type="text" name="latmin"
					<%if(request.getParameter("latmin") != null) { %>
					value="<%=Util.safestr(request.getParameter("latmin")) %>" <% } %>
					autocomplete="off" id="LatMin" title="Latitude Minute"
					placeholder="LatMinute" />
                          </div>
                          
                          <div class="input-field col s4">
                          <select
					name="latns" id="LatNS">
					<option value="LatNS">LatNS</option>
					<option value="N"
						<% if(Util.safestr(request.getParameter("latns")).toLowerCase().equals("n")) { %>
						selected <% } %>>N</option>
					<option value="S"
						<% if(Util.safestr(request.getParameter("latns")).toLowerCase().equals("s")) { %>
						selected <% } %>>S</option>
				</select>
                          </div>
                          </div>
                          <div class="row">
                          <div class="input-field col s6">
                          
				<input type="text" name="timezone"
					<% if(request.getParameter("timezone") != null) { %>
					value="<%=Util.safestr(request.getParameter("timezone")) %>"
					<% } %> autocomplete="off" id="timeZone" title="Time Zone"
					placeholder="Timezone" />
					<label for="timeZone"> <%=rBConstants.getString("TIME_ZONE") %></label>
                          </div>
                          
                          <div class="input-field col s6">
                           <select
					name="ayanamsa" id="ayanamsa" title="Ayanamsa">
					<option value="0"><%=newChartEditMatchMakConst.getString("N_C_LAHIRI") %></option>
					<option value="1"><%=rBConstants.getString("K_P_NEW") %></option>
					<option value="2"><%=rBConstants.getString("K_P_OLD") %></option>
					<option value="3"><%=newChartEditMatchMakConst.getString("B_V_RAMAN") %></option>
					<option value="4"><%=rBConstants.getString("K_P_KHULLAR") %></option>
					<option value="5"><%=rBConstants.getString("SAYAN") %></option>
				</select>
				<label for="ayanamsa"> <%=rBConstants.getString("AYANAMSA") %></label>
                          </div>
                          </div>
                          
                          <div class="row ui-mg-0">
                          <div class="input-field col s6">
                          
				<select name="charting" title="Chart Style" id="charting">
					<option value="0"><%=rBConstants.getString("NORTH_INDIAN") %></option>
					<option value="1"><%=rBConstants.getString("SOUTH_INDIAN") %></option>
				</select>
				<label for="charting"> <%=rBConstants.getString("CHART_TYPE") %></label>
                          </div>
                          
                          <div class="input-field col s6">
                           <input type="text" name="kphn"
							size="3" value="0" id="kphn" 
							autocomplete="off" title="KP Horary Number" placeholder="kphn" />
							<label for="kphn"> <%=rBConstants.getString("KP_HORARY_NUMBER") %>
								(1-249)</label>
                          </div>
                      
                          </div>
                            <div class="row">
                          <div class="input-field col s12 right">
                          <a href="javascript:void(0)" class="orange-dark-color" onclick="getgpsAccuracy();"><%=newChartConst.getString("GPS_ACCURACY") %></a>
							<input type="hidden" id="accuracy" name="accuracy" /> <input
							type="hidden" id="languageCode" name="languagecode"
							value=<%=languageCode%> /> &nbsp; &nbsp;
                          <a href="javascript:void(0)" class="orange-dark-color right" onclick="fillkphn();"><%=newChartConst.getString("RANDOM_KP_NUMBER") %>
                          </a>
                          </div>
                          </div>
                      </div>
                     
                        
                       
                      
                      <div class="center">
                            <button class="btn amber darken-4 waves-effect waves-light center well-css" name="methodName" value="newChartDone" type="submit"><%=rBConstants.getString("DONE")%></button>                            
                            <button class="btn amber darken-4 waves-effect waves-light center well-css" type="submit" name="methodName" value="newChartDoneAndSave"><%=rBConstants.getString("DONE_AND_SAVE_CHART")%></button>
                          </div>    
                       
                        <input type="hidden" name="timezoneid" id="timezoneid" value="<%=request.getParameter("timezonestring")%>" />
				
				 </form>
                        
                   
                  </div>
                </div>
              </div>
            </div>
          







<script type="text/javascript">
    function formValidation() {
             nameval = document.getElementById('Name').value.trim();
             var day = document.getElementById('Day').value.trim();
             var month = document.getElementById('Month').value.trim();
             var year = document.getElementById('Year').value.trim();
             var getUserBirthDate = day + "/" + month + "/" + year;
             
        if (document.getElementById('Name').value.trim() == "") {
        	alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_NAME_FIELD")%>');            
            document.getElementById('Name').focus();
            return (false);
        }
        if (nameval.indexOf("'") != -1 || nameval.indexOf("?") != -1 || nameval.indexOf("&") != -1 || nameval.indexOf("@") != -1) {
            
        	alert('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_SPECIAL_CHARACTERS_SIGN_IN_NAME_FIELD") %>');document.getElementById('Name').focus();
            return (false);
        }

        if (nameval.length > 50) {
            alert('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTER_IN_NAME_FIELD") %>');
            document.getElementById('Name').focus();
            return (false);
        }

        if (document.getElementById('Day').value == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_DAY_FIELD")%>');
            document.getElementById('Day').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Day').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_DAY_FIELD")%>');
                document.getElementById('Day').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('Day').value) || document.getElementById('Day').value < 1 || document.getElementById('Day').value > 31) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_31")%>');
                    document.getElementById('Day').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Month').value == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MONTH_FIELD")%>');
            document.getElementById('Month').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Month').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MONTH_FIELD")%>');
                document.getElementById('Month').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Month').value) || document.getElementById('Month').value < 1 || document.getElementById('Month').value > 12) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_MONTH_SHOULD_BE_BETWEEN_1_AND_12")%>');
                    document.getElementById('Month').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Year').value == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_YEAR_FIELD")%>');
            document.getElementById('Year').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Year').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_YEAR_FIELD")%>');
                document.getElementById('Year').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Year').value) || document.getElementById('Year').value < 1 || document.getElementById('Year').value > 9999) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_9999")%>');
                    document.getElementById('Year').focus();
                    return (false);
                }
            }
        }
        if (!isUserBirthDateValid(getUserBirthDate)) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_THE_VALID_DATE")%>');
            document.getElementById('Day').focus();
            return (false);
        }
        if (document.getElementById('Hrs').value == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_HOUR_FIELD")%>');
            document.getElementById('Hrs').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Hrs').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_HOUR_FIELD")%>');
                document.getElementById('Hrs').focus();
                return (false);
            } else {
                if (!isIntegerNumber(document.getElementById('Hrs').value) || document.getElementById('Hrs').value < 0 || document.getElementById('Hrs').value > 23) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_HOUR_SHOULD_BE_BETWEEN_0_AND_23")%>');
                    document.getElementById('Hrs').focus();
                    return (false);
                }
            }
        }
         if (document.getElementById('Min').value == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MINUTE_FIELD")%>');
            document.getElementById('Min').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Min').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MINUTE_FIELD")%>');
                document.getElementById('Min').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Min').value) || document.getElementById('Min').value < 0 || document.getElementById('Min').value > 59) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('Min').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('Sec').value == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_SECOND_FIELD")%>');
            document.getElementById('Sec').focus();
            return (false);
        }
        else {
            if (isNaN(document.getElementById('Sec').value)) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_SECOND_FIELD")%>');
                document.getElementById('Sec').focus();
                return (false);
            }
            else {
                if (!isIntegerNumber(document.getElementById('Sec').value) || document.getElementById('Sec').value < 0 || document.getElementById('Sec').value > 59) {
                    alert('<%=rBConstants.getString("THE_VALUE_FOR_SECOND_SHOULD_BE_BETWEEN_0_AND_59")%>');
                    document.getElementById('Sec').focus();
                    return (false);
                }
            }
        }

        if (document.getElementById('place').value.trim() == "") {
            alert('<%=rBConstants.getString("PLEASE_ENTER_PLACE")%>');
            document.getElementById('place').focus();
            return (false);
        }

        if (document.getElementById('place').value.length < 3) {
            alert('<%=rBConstants.getString("ENTER_AT_LEAST_THREE_FIRST_CHARACTERS_OF_CITY_NAME")%>');
            document.getElementById('place').focus();
            return (false);
        }

        if (document.getElementById('place').value.indexOf("'") != -1 || document.getElementById('place').value.indexOf("?") != -1 || document.getElementById('place').value.indexOf("&") != -1) {
           alert('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_SPECIAL_CHARACTERS_SIGN_IN_PLACE_FIELD") %>');
           
            document.getElementById('place').focus();
            return (false);
        }


       
        if ((isNaN(document.getElementById('LongDeg').value) || document.getElementById('LongDeg').value < 0 || document.getElementById('LongDeg').value >= 180)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LONGITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_179")%>');
            document.getElementById('LongDeg').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LongMin').value) || document.getElementById('LongMin').value < 0 || document.getElementById('LongMin').value >= 60)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LONGITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LongMin').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LatDeg').value) || document.getElementById('LatDeg').value < 0 || document.getElementById('LatDeg').value >= 90)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LATITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_89")%>');
            document.getElementById('LatDeg').focus();
            return (false);
        }

        if ((isNaN(document.getElementById('LatMin').value) || document.getElementById('LatMin').value < 0 || document.getElementById('LatMin').value >= 60)) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_LATITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
            document.getElementById('LatMin').focus();
            return (false);
        }
        if (isNaN(document.getElementById('timeZone').value) || document.getElementById('timeZone').value < -12.0 || document.getElementById('timeZone').value > 16.0) {
            alert('<%=rBConstants.getString("THE_VALUE_FOR_TIME_ZONE_SHOULD_BE_BETWEEN_12_00_AND_13_00")%>');
            document.getElementById('timeZone').focus();
            return (false);
        }
        
        if (document.getElementById('kphn').value == "") {
            alert('<%=newChartEditConst.getString("PLEASE_ENTER_A_VALUE_FOR_THE_KP_HORARY_FIELD") %>');
            document.getElementById('kphn').focus();
            return (false);
        }

        if ((!isIntegerNumber(document.getElementById('kphn').value) || document.getElementById('kphn').value < 0 || document.getElementById('kphn').value > 249)) {
            alert('<%=newChartEditConst.getString("THE_VALUE_FOR_KP_HORARY_SHOULD_BE_BETWEEN_0_AND_249") %>');
            document.getElementById('kphn').focus();
            return (false);
        }
        if (document.getElementById('LongDeg').value == "" || document.getElementById('LongDeg').value == "LongDegree" || document.getElementById('LongMin').value == "" || document.getElementById('LongMin').value == "LongMinute" || document.getElementById('LongEW').value == "LongEW" || document.getElementById('LatDeg').value == "" || document.getElementById('LatDeg').value == "LatDegree" || document.getElementById('LatMin').value == "" || document.getElementById('LatMin').value == "LatMinute" || document.getElementById('LatNS').value == "LatNS" || document.getElementById('timeZone').value == "" || document.getElementById('timeZone').value == "TimeZone") {
            document.forms["newchart"].action = "confirmdata.asp";
        }
        else {
        	
            document.forms["newchart"].action = "newchart-session.asp";
        }
        
        return (true);
    }
</script>

