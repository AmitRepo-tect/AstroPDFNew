<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
DesktopHoro horoObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
Local local = new Local();
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle newChartConst = local.loadPropertiesFileNew("newchart",languageCode);
MyResourceBundle newChartEditConst = local.loadPropertiesFileNew("newchart-editchart",languageCode);
MyResourceBundle editChartConst = local.loadPropertiesFileNew("editchart",languageCode);
MyResourceBundle newChartEditMatchMakConst = local.loadPropertiesFileNew("newchart-editchart-matchmaking",languageCode);
MyResourceBundle dasNk = local.loadPropertiesFileNew("dhruv", languageCode);

String msg = "";
String chartId = "";
Object reqChartObj = request.getParameter("chartid");
String tags = "";
String chartType = "";
Object chartTypeObj = session.getAttribute("chartType");
if(reqChartObj != null && !reqChartObj.equals(""))
{
	chartId = reqChartObj.toString();
	UserDAO dao = new UserDAO();
	HashMap<String, Object> hm = dao.getChart(chartId);
	horoObject = (DesktopHoro) hm.get("HoroObject");
	chartType = hm.get("Charting").toString();
}
else
{
	Object chartObj = session.getAttribute("ChartId");
	Object sessionObj = session.getAttribute("HoroscopeObj");
	if(sessionObj != null)
	{
		
		horoObject = (DesktopHoro) sessionObj;
		if(chartObj != null && !chartObj.equals(""))
		{
			chartId = chartObj.toString();
			
			//tags = gettagvalue(chartId);
	        if(tags.equals("1") || tags.equals("0")) 
	            tags = "";
		}
	}
	else
	{
		msg = "Sorry your session has been expired. Please <a href='login.asp'>Login</a> again.";
	}
}



Calendar cal = Calendar.getInstance();
int day = cal.get(Calendar.DATE);
int month = cal.get(Calendar.MONTH)+1;
int year = cal.get(Calendar.YEAR);
int hr = cal.get(Calendar.HOUR_OF_DAY);
int min = cal.get(Calendar.MINUTE);
int sec = cal.get(Calendar.SECOND);
String name = "";
String strGenderLowerCase = "",place="",longDeg = "",longMin = "";
String longEW = "",latDeg="",latMin = "",latNS = "",timeZone="";
int AyanamsaType = 0,getKPHorarySeed=0;
Object isDhrubNewKundli = session.getAttribute("dhruvNewKundli");

if(horoObject!=null && (isDhrubNewKundli==null ||  !isDhrubNewKundli.equals("1")) ){
	
	day = horoObject.getDayOfBirth();
	month = horoObject.getMonthOfBirth();
	year = horoObject.getYearOfBirth();
	hr = Integer.parseInt(horoObject.getHourOfBirth());
	min = Integer.parseInt(horoObject.getMinuteOfBirth());
	sec = Integer.parseInt(horoObject.getSecondOfBirth());
	name = horoObject.getName();
	strGenderLowerCase = horoObject.getMaleFemale().toLowerCase();
	place = horoObject.getPlace();
	longDeg = horoObject.getDegreeOfLongitude();
	longMin = horoObject.getMinuteOfLongitude();
	longEW = horoObject.getEastWest();
	latDeg = horoObject.getDegreeOfLattitude();
	latMin = horoObject.getMinuteOfLattitude();
	latNS= horoObject.getNorthSouth();
	timeZone =horoObject.getTimeZone();
	AyanamsaType= Integer.parseInt(SharedFunction.getAyan(horoObject));
	getKPHorarySeed = horoObject.getKPHorarySeed();
}

%>
<%

String getPrashna = request.getParameter("kundli");
String pageUrl = request.getRequestURI().toString()+"?"+request.getQueryString();
String pageDirect = "";

String pageObj = request.getParameter("kundli");;
String pageGet = pageObj!=null && !pageObj.equals("") ? pageObj : "default";

Map<String, String> pageMap = new LinkedHashMap<String, String>();
pageMap.put("default", "");
pageMap.put("kundli", "/cloud/home.asp");
pageMap.put("varshphal", "/cloud/varshphalallpages.asp");
pageMap.put("prashna", "/cloud/home.asp");
pageMap.put("numerology", "/cloud/numerology-report.asp#keydetails");
pageMap.put("prediction", "/cloud/prediction1.asp");
pageMap.put("kp", "/cloud/KPPlanetCusp.asp");
pageMap.put("lalkitab", "/cloud/lalplanethouse.asp");
pageMap.put("jaimini", "/cloud/jaminisystemkarakamsaswamsa.asp");
pageMap.put("sarvatobhadra", "/cloud/j_sarvatobhadradegree.asp");


for (Map.Entry<String, String> entry : pageMap.entrySet())  {
	String key = entry.getKey();
	if(pageGet.equals(key)){
		pageDirect = entry.getValue();
	}
	
}


if(request.getParameter("kn")!= null && request.getParameter("kn").equals("1")){
	response.sendRedirect("/cloud/session-destroy-for-newchart.asp?methodName=newChart&fromDhruv=1&referrer="+pageUrl);
}
if(request.getQueryString()==null){
session.setAttribute("dhruvNewKundli", "0");
}

String isCheckedGTW = "";
if (getPrashna!=null && getPrashna.equals("kundli")){
	isCheckedGTW = "checked";  
}else{
	isCheckedGTW = "";  
}

%>
<div class="row" id="kundli">
<div class="col s12 l2"></div>
	<div class="col s12 l8">
	<div class="card-panel br-radius br-all z-depth-0">

                 <%
                          if (getPrashna!=null && getPrashna.equals("prashna")){
                    %>
                  <h2><%=dasNk.getString("ENTER_DETAILS_H") %></h2>
                  <%}else{ %>
                  
                  <h2><%=newChartEditConst.getString("ENTER_YOUR_BIRTH_DETAILS")%></h2>
                  <%}%>
                   <!-- <a href="javascript:void(0);" onClick="openChart('open');" class="btn btn-small right amber black-text"><i class="material-icons">&#xe315;</i>OPEN CHART</a> -->
                   <a class="btn btn-small right bg-light-purple black-text mi-t" href="javascript:void(0);" onClick="openChart('open');"><%=rBConstants.getString("OPEN_CHART")%></a> 
                 
                    <form class="das-form mrt-30" name="newchart" id="UserLoginForm" action="/cloud/editchart-session.asp" method="post" onsubmit="return formValidation();">
                      <div class="row">
                        <div class="col s6">
                         <label for="Name"><%=rBConstants.getString("NAM") %></label>
                          <input type="text" placeholder="Name" name="name" id=name value="<%=name%>" tabindex="1" /> 
                         
                        </div>
                        <%//String strGenderLowerCase = horoObject.getMaleFemale().toLowerCase(); %>
                        <div class="col s6">
                        <label for="sex"><%=rBConstants.getString("GENDR")%></label>
                        
                          <select name="sex" id="sex" class="browser-default" tabindex="2">  
                            <option
								<%if(strGenderLowerCase.equals("male") || strGenderLowerCase.equals("m")) {%>
								selected <% } %> value="male"><%=rBConstants.getString("MALE")%></option>
							<option
								<%if(strGenderLowerCase.equals("female") || strGenderLowerCase.equals("f")) {%>
								selected <% } %> value="female"><%=rBConstants.getString("FEMALE")%></option>
								                   
                            <%-- <option value="male" selected><%=rBConstants.getString("MALE")%></option>
                            <option value="female"><%=rBConstants.getString("FEMALE")%></option> --%>
                          </select>
                          
                        </div>
                    
                        <div class="col s4">
                         
			              <label for="date"><%=rBConstants.getString("BD_DAY")%></label>
			              <input type="text" placeholder="Day" name="day" id="Day" title="Day" value="<%=day%>" tabindex="3" />
			              
			              </div> 
			              <div class="col s4">
			               <label for="date"><%=rBConstants.getString("BD_MONTH")%></label>
			              <input type="text" placeholder="Month" name="month" id="Month" title="Month" value="<%=month%>" tabindex="4" />
			             
			              </div>
			              <div class="col s4">
			               <label for="date"><%=rBConstants.getString("BD_YEAR")%></label>
						  <input type="text" placeholder="Year" name="year" id="Year" title="Year" value="<%=year%>" tabindex="5" />
                         
                        </div>
                        
                      
                      <div class="col s4">
                       <label for="Hrs"><%=rBConstants.getString("BD_HRS")%></label>
                          <input type="text" placeholder="Hour" name="hrs" id="hrs" title="Hour" value="<%=hr%>" tabindex="6" />
                         
                          </div>
                          <div class="col s4">
                          <label for="Min"><%=rBConstants.getString("BD_MIN")%></label>
			              <input type="text" placeholder="Minute" name="min" id="min" title="Minute" value="<%=min%>" tabindex="7"/>
			              
			              </div>
			              <div class="col s4">
			              <label for="Sec"><%=rBConstants.getString("BD_SEC")%></label>
			              <input type="text" placeholder="Second" name="sec" id="sec" title="Second" value="<%=sec%>" tabindex="8"/>
			              
                          </div>
                      
                          <div class="col s12">
                           <label for="place"><%=rBConstants.getString("PLAC")%> (<%=newChartEditMatchMakConst.getString("MIN_3_CHAR") %>)</label>   
                          <input type="text" placeholder="Place" name="place" value="<%=place%>" tabindex="9" id="place" maxlength="50" />
                          <span id="dstval" class="red-text"></span>
                          </div>
                         
              			<%
                          if (getPrashna!=null && getPrashna.equals("prashna")){
                          %>
                         
                           <div class="col s6">
                            <label for="kphn"> <%=rBConstants.getString("KP_HORARY_NUMBER") %>(1-249)</label>
                            <input type="text" name="kphn" size="3" value="0" id="kphn" autocomplete="off" title="KP Horary Number" placeholder="kphn" />
						   </div>
						   <%
                          }
						   %>
                          </div>
                          
                          
                        <div class="row">
                        
                        
                          <div class="col s6 m3">
                          	<a id="aTag" class="btn waves-effect btn-small bg-light-purple black-text" href="javascript:toggleAndChangeText();"> [&#43;] <%=rBConstants.getString("SETING") %></a>
                          </div>
                         
                           <div class="col s6 m3"> 
                            
                            <div class="cntrl-cb">  
                            <label for="gtw">                                    
        					<input type="checkbox" class="filled-in" id="gtw" onclick="isChecked('<%=pageDirect%>');" <%=isCheckedGTW %> name="gtw"/>
        						<span>Go To Worksheet</span>
        					</label>
        					</div>
                         </div>
                                                 
                        			
			 		<div class="col s8 m6" align="right">                        
                          <a class="btn waves-effect btn-small bg-light-orange black-text well-css" href="javaScript:void(0)" onclick="findlocation('CurrentLocation');"> <strong> <%=newChartConst.getString("CURRENT_LOCATION") %></strong></a>
				          <a class="btn waves-effect btn-small bg-light-orange black-text well-css" href="javaScript:void(0)" onclick="findlocation('CurrentTime');"><strong> <%=newChartConst.getString("NOW1") %></strong></a>
				    </div>
				   
				    
                        
			 </div>
			 <div id="divToToggle" style="display: none;">
			 <div class="row">
			 
               <div class="col s4">
               <label for="LongDeg"> <%=rBConstants.getString("LONGITUDE")%></label>
                          
               <input type="text" name="longdeg"	
							value='<%=longDeg%>'
							 autocomplete="off" title="Longitude Degree" id="LongDeg"
							placeholder="LongDegree" tabindex="10" />
							
                          </div>
                          
                          <div class="col s4">
                          <label for="lat" style="visibility:hidden">Lat </label>
                          <input type="text" name="longmin"
							
							value='<%=longMin%>'
							 autocomplete="off" title="Longitude Minute" id="LongMin"
							placeholder="LongMinute"  tabindex="11"/>
                          </div>
                          
                          <div class="col s4">
                          <label for="lat" style="visibility:hidden">Lat </label>
                          <select name="longew" id="LongEW" class="browser-default" tabindex="12" size="1">
								<option value="LongEW">LongEW</option>
								<option value="E"
								<% if(longEW.toLowerCase().equals("e")) { %>
								selected <% } %>>E</option>
							<option value="W"
								<% if(longEW.toLowerCase().equals("w")) { %>
								selected <% } %>>W</option>
						</select>
                          </div>  
                          </div>
                          
                          
			              <div class="row">
                          <div class="col s4">
                          <label for="LatDeg"> <%=rBConstants.getString("LATITUDE")%></label>
				<input type="text" name="latdeg" size="3" tabindex="13"
					value='<%=latDeg%>'
					autocomplete="off" id="LatDeg" title="Latitude Degree"
					placeholder="LatDegree" />
                          </div>
                          <div class="col s4">
                          <label for="lat" style="visibility:hidden">Lat </label>	
                          <input
					type="text" name="latmin"	 size="2" tabindex="14"
					value='<%=latMin%>'
					autocomplete="off" id="LatMin" title="Latitude Minute"
					placeholder="LatMinute" />
                          </div>
                          
                          <div class="col s4">
                          <label for="lat" style="visibility:hidden">Lat </label>
                          <select size="1" tabindex="15"
					name="latns" id="LatNS" class="browser-default">
					<option value="LatNS">LatNS</option>
					<option value="N"
								<% if(latNS.toLowerCase().equals("n")) { %>
								selected <% } %>>N</option>
							<option value="S"
								<% if(latNS.toLowerCase().equals("s")) { %>
								selected <% } %>>S</option>
				</select>
                          </div>
                        
                          <div class="col s6">
                          <label for="timeZone"> <%=rBConstants.getString("TIME_ZONE") %></label>
				<input type="text" name="timezone"	
					value='<%=timeZone%>'  tabindex="16"
					 autocomplete="off" id="timeZone" title="Time Zone"
					placeholder="Timezone" />
					
                          </div>
                         <%//int AyanamsaType = Integer.parseInt(SharedFunction.getAyan(horoObject));%> 
                          <div class="col s6">
                          <label for="ayanamsa"> <%=rBConstants.getString("AYANAMSA") %></label>
                           <select size="1" tabindex="17"
					name="ayanamsa" id="ayanamsa" title="Ayanamsa" class="browser-default">
					            <option value="1" <%if( AyanamsaType == 1) {%> selected <%}%>><%=rBConstants.getString("K_P_NEW") %></option>
								<option value="2" <%if( AyanamsaType == 2) {%> selected <%}%>><%=rBConstants.getString("K_P_OLD") %></option>
								<option value="0" <%if( AyanamsaType == 0) {%> selected <%}%>><%=newChartEditMatchMakConst.getString("N_C_LAHIRI") %></option>
								<option value="3" <%if( AyanamsaType == 3) {%> selected <%}%>><%=newChartEditMatchMakConst.getString("B_V_RAMAN") %></option>
								<option value="4" <%if( AyanamsaType == 4) {%> selected <%}%>><%=rBConstants.getString("K_P_KHULLAR") %></option>
								<option value="5" <%if( AyanamsaType == 5) {%> selected <%}%>><%=rBConstants.getString("SAYAN") %></option>
				</select>
				
                          </div>
                        
                          <div class="col s6">
                          <label for="charting"> <%=rBConstants.getString("CHART_TYPE") %></label>
				<select name="charting" title="Chart Style" id="charting" class="browser-default" size="1" tabindex="18">
					<option value="0" <%if( chartType.equals("0")) {%> selected
									<%}%>><%=rBConstants.getString("NORTH_INDIAN") %></option>
								<option value="1" <%if( chartType.equals("1")) {%> selected
									<%}%>><%=rBConstants.getString("SOUTH_INDIAN") %></option>
				</select>
				
                          </div>
                          
                          <div class="col s6">
                           <label for="kphn"> <%=rBConstants.getString("KP_HORARY_NUMBER") %>(1-249)</label>
                           <input type="text" name="kphn" size="3" value="<%=getKPHorarySeed%>" tabindex="20" id="kphn" autocomplete="off" title="KP Horary Number" placeholder="kphn" />
						  </div>
                      
                        
                        <div class="col s12 right">
                       
                        
                          <a href="javascript:void(0)" class="orange-dark-color" onclick="getgpsAccuracy();"><%=newChartConst.getString("GPS_ACCURACY") %></a>
							<input type="hidden" id="accuracy" name="accuracy" /> 
							<input	type="hidden" id="languageCode" name="languagecode"	value=<%=languageCode%> />
                          <a href="javascript:void(0)" class="orange-dark-color right" onclick="fillkphn();"><%=newChartConst.getString("RANDOM_KP_NUMBER") %></a>
                       </div>
                          </div>
                      </div>
                      <input type="hidden" name="chartid" value="<%=chartId %>" />
                      <%
                      //String url = request.getRequestURL().toString();
                      //String queryString = request.getQueryString();
                      //String pageInfo = url+"?"+queryString;
                      %>
                       <input type="hidden" name="referrer" value="<%=pageDirect%>" id="pageid"/>
                      <div class="center">
                      <%
                      Object isNew =  session.getAttribute("dhruvNewKundli");
                      if(isNew!=null && isNew.equals("1")){
                      %>
                            <button class="btn btn-large waves-effect bg-dark-purple center well-css" name="methodName" value="newChartDone" type="submit"><%=rBConstants.getString("DONE")%></button>                            
                            <button class="btn btn-large waves-effect bg-dark-blue center well-css" type="submit" name="methodName" value="newChartDoneAndSave"><%=rBConstants.getString("DONE_AND_SAVE_CHART")%></button>
                            <%}else{ %>
                             <button class="btn btn-large waves-effect bg-dark-purple center well-css" name="methodName" value="editChartDone" type="submit"><%=rBConstants.getString("DONE")%></button>                            
                            <button class="btn btn-large waves-effect bg-dark-blue center well-css" type="submit" name="methodName" value="editChartDoneAndSave"><%=rBConstants.getString("DONE_AND_SAVE_CHART")%></button>
                            <%} %>
                     </div>    
                       
                        <input type="hidden" name="timezoneid" id="timezoneid" value="<%=request.getParameter("timezonestring")%>" />
						
						
				 </form>
</div>
</div>
</div>







<script type="text/javascript">
$(document).ready(function () {
/* $("#gtw").click(function () {
    if ($(this).is(":checked")) {
    	 window.location.href = '/cloud/worksheet/';    	 
    } 
}); */
});
function formValidation() {
	
	var day = document.getElementById('Day').value;
    var month = document.getElementById('Month').value;
    var year = document.getElementById('Year').value;
    var getUserBirthDate = day + "/" + month + "/" + year;
   
    nameval = document.getElementById('name').value;
    if (document.getElementById('name').value == "") {
        alert('<%=rBConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_NAME_FIELD")%>');
        document.getElementById('name').focus();
        return (false);
    }
  //  alert(nameval);
    if (nameval.indexOf("'") != -1 || nameval.indexOf("?") != -1 || nameval.indexOf("&") != -1 || nameval.indexOf("@") != -1) {
        alert('<%=editChartConst.getString("PLEASE_DO_NOT_ENTER_SIGN_IN_NAME_FIELD") %>');
        document.getElementById('name').focus();
        return (false);
    }     
    if (nameval.length > 50) {
        alert('<%=newChartEditConst.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTER_IN_NAME_FIELD") %>');
        document.getElementById('name').focus();
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
            	alert(document.getElementById('Day').value+"3");
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
    if (document.getElementById('hrs').value == "") {
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

    if (document.getElementById('min').value == "") {
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

    if (document.getElementById('sec').value == "") {
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

    if (document.getElementById('place').value == "") {
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

    if (document.getElementById('place').value.length > 50) {
        alert('<%=rBConstants.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTERS_IN_PLACE_FIELD") %>');
        document.getElementById('place').focus();
        return (false);
    }
    if (document.getElementById('LongDeg').value == "") {
        alert('<%=rBConstants.getString("PLEASE_ENTER_LONGITUDE_DEGREE_VALUE")%>');
        document.getElementById('LongDeg').focus();
        return (false);
    }

    if ((!isIntegerNumber(document.getElementById('LongDeg').value) || document.getElementById('LongDeg').value < 0 || document.getElementById('LongDeg').value >= 180)) {
        alert('<%=rBConstants.getString("THE_VALUE_FOR_LONGITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_179")%>');
        document.getElementById('LongDeg').focus();
        return (false);
    }

    if (document.getElementById('LongMin').value == "") {
        alert('<%=rBConstants.getString("PLEASE_ENTER_LONGITUDE_MINUTE_VALUE")%>');
        document.getElementById('LongMin').focus();
        return (false);
    }


    if ((!isIntegerNumber(document.getElementById('LongMin').value) || document.getElementById('LongMin').value < 0 || document.getElementById('LongMin').value >= 60)) {
        alert('<%=rBConstants.getString("THE_VALUE_FOR_LONGITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
        document.getElementById('LongMin').focus();
        return (false);
    }

    if (document.getElementById('LatDeg').value == "") {
        alert('<%=rBConstants.getString("PLEASE_ENTER_LATITUDE_DEGREE_VALUE")%>');
        document.getElementById('LatDeg').focus();
        return (false);
    }

    if ((!isIntegerNumber(document.getElementById('LatDeg').value) || document.getElementById('LatDeg').value < 0 || document.getElementById('LatDeg').value >= 90)) {
        alert('<%=rBConstants.getString("THE_VALUE_FOR_LATITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_89")%>');
        document.getElementById('LatDeg').focus();
        return (false);
    }
    if (document.getElementById('LatMin').value == "") {
        alert('<%=rBConstants.getString("PLEASE_ENTER_LATITUDE_MINUTE_VALUE")%>');
        document.getElementById('LatMin').focus();
        return (false);
    }

    if ((!isIntegerNumber(document.getElementById('LatMin').value) || document.getElementById('LatMin').value < 0 || document.getElementById('LatMin').value >= 60)) {
        alert('<%=rBConstants.getString("THE_VALUE_FOR_LATITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
        document.getElementById('LatMin').focus();
        return (false);
    }

    if (document.getElementById('timeZone').value == "") {
        alert('<%=rBConstants.getString("PLEASE_ENTER_TIME_ZONE")%>');
        document.getElementById('timeZone').focus();
        return (false);
    }

    if (!isRealNumber(document.getElementById('timeZone').value) || document.getElementById('timeZone').value < -12.0 || document.getElementById('timeZone').value > 16.0) {
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
    
    return (true);
}

function isIntegerNumber(NumberToTest) 
{
    var IsFound = /^-?\d+$/.test(NumberToTest);
    return (IsFound);
}

$(document).ready(function() {
    //set initial state.
    if ($("#gtw").is(":checked")) {
       document.getElementById("pageid").value = "/cloud/worksheet/";           
    }    
   
});

function isChecked(pgurl){
	 if ($(this).is(":checked")) {
	    document.getElementById("pageid").value = "/cloud/worksheet/";
	}else{		
		document.getElementById("pageid").value = pgurl;
	} 	   
}
</script>

