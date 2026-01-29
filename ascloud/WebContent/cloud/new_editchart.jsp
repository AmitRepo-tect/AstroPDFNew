<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript" src="/kundli/js/Editkundli-js.jsp" charset="utf-8"></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script type="text/javascript" src="/kundli/js/gpsfill.js"></script>
<script type="text/javascript" src="/dist/js/shared-functions.js"></script>

<%
String msg = "";
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
	MyResourceBundle editChartConst = local.loadPropertiesFileNew("editchart",languageCode);
	MyResourceBundle newChartEditConst = local.loadPropertiesFileNew("newchart-editchart",languageCode);
	MyResourceBundle newChartEditMatchMakConst = local.loadPropertiesFileNew("newchart-editchart-matchmaking",languageCode);
	MyResourceBundle editChartMatchMakConst = local.loadPropertiesFileNew("editchart-matchmaking",languageCode);
	MyResourceBundle editChartSessionConst = local.loadPropertiesFileNew("editchart-session",languageCode);
	
	String chartId = "";
 	Object reqChartObj = request.getParameter("chartid");
	DesktopHoro horoObject	 = new DesktopHoro();
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
	String dst = "0";
 %>
 
<script type="text/javascript">
 function toggleAndChangeText() {
     $('#divToToggle').toggle();
     if ($('#divToToggle').css('display') == 'none') {
         $('#aTag').html('[&#43]  <%=editChartConst.getString("ADV_SETTINGS")%>');
     }
     else {
         $('#aTag').html('[&#8722] <%=editChartConst.getString("ADV_SETTINGS")%>');
     }
 }

 </script>
 

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("EDIT_CHART") %></h1>	
</div>


<div class="row mrt-20">
              <div class="col s12 m12 l12">
              	<% 
if(!msg.equals("")){
%>
	
		<div class="card padding-all center">
			<%=msg %>
		</div>
	
	<% 
}
%>
              <div class="card-panel head-1">
              
                  <h4 class="header2"><%=newChartEditConst.getString("ENTER_YOUR_BIRTH_DETAILS")%></h4>
                  <div class="row mr-b-0">
                  <form id="three" name="editchart" class="asholder" onsubmit="return formValidation();" action="editchart-session.asp" method="post">
                  <div class="row">
                        <div class="input-field col s6">
                        <input type="hidden" name="chartid" value="<%=chartId %>" />
                         
						<input name="name" id="name" type="text"  value="<%=horoObject.getName()%>" tabindex="1" />
						<label> <%=rBConstants.getString("NAM") %> </label>
					     
                        </div>
                        
                        <div class="input-field col s6">
<%
						String strGenderLowerCase = horoObject.getMaleFemale().toLowerCase();
%>
						<select size="1" name="sex" id="sex" tabindex="2">
							<option
								<%if(strGenderLowerCase.equals("male") || strGenderLowerCase.equals("m")) {%>
								selected <% } %> value="male"><%=rBConstants.getString("MALE")%></option>
							<option
								<%if(strGenderLowerCase.equals("female") || strGenderLowerCase.equals("f")) {%>
								selected <% } %> value="female"><%=rBConstants.getString("FEMALE")%></option>
						</select>
					    <label> <%=rBConstants.getString("GENDR")%> </label>
                        </div>
                    </div>
                    
                   
                        
                        <div class="row">
                        <div class="input-field col s4">
					   <input type="text" name="day" id="Day" 
							value='<%=horoObject.getDayOfBirth()%>' size="2" 
							tabindex="3" autocomplete="off" />
							<label for="day"> <%=rBConstants.getString("BD_DAY")%></label>
                        </div>
                        
                         <div class="input-field col s4">
                         <input
							type="text" name="month" id="Month" 
							value='<%=horoObject.getMonthOfBirth()%>' size="2" tabindex="4"  autocomplete="off" /> 
							<label for="month"> <%=rBConstants.getString("BD_MONTH")%></label>
							
                         </div>
                         
                          <div class="input-field col s4">
                          <input type="text" name='year' size='4' value='<%=horoObject.getYearOfBirth()%>' id='Year' tabindex='5' autocomplete="off" />
                          <label for="year"> <%=rBConstants.getString("BD_YEAR")%></label>
                          </div>
                        
                        </div>
                        
                         <div class="row">
                        <div class="input-field col s4">
                        <input type="text" name="hrs" id="hrs" 
							value="<%=horoObject.getHourOfBirth()%>" size="2"
							tabindex="6" />
                        <label for="hrs"> <%=rBConstants.getString("BD_HRS")%></label>
                        </div>
                        <div class="input-field col s4">
                        <input type="text" name="min"
							id="min" 
							value="<%=horoObject.getMinuteOfBirth()%>" size="2"
							tabindex="7" />
							 <label for="min"> <%=rBConstants.getString("BD_MIN")%></label>
                        </div>
                        <div class="input-field col s4">
                        <input type="text" name="sec"
							size="2" 
							value="<%=horoObject.getSecondOfBirth()%>" id="sec" tabindex="8" />
							 <label for="sec"> <%=rBConstants.getString("BD_SEC")%></label>
                        </div>
                        
                        </div>
                        
                        <div class="row">
                        <div class="input-field col s12">
                        <input type="text" id="place" name="place" 
							value="<%=horoObject.getPlace() %>" tabindex="9" />
                        <label for="place"> <%=rBConstants.getString("PLAC")%>(<%=newChartEditMatchMakConst.getString("MIN_3_CHAR") %>)</label>
                        
                        <span id="dstval" class="red-text"></span>
                        
                        </div>
                        </div>
                        
                          <div class="row" >
                          <div class="col s12">
                         	 <a href="javascript:toggleAndChangeText();" class="btn amber lighten-4 waves-effect black-text" id="aTag">[&#43;] <%=editChartConst.getString("ADV_SETTINGS")%></a>
                          </div>
                          </div>
                        
                          <div id="divToToggle" style="display:none;">
                        
                         
                         <div id="advanced"> 
                        
                        <div class="row">
                        <div class="input-field col s4">
                        <input name="longdeg" id="LongDeg" type="text"  size="3" value='<%=horoObject.getDegreeOfLongitude()%>' autocomplete="off"
							tabindex="10" />
                        <label> <%=rBConstants.getString("LONGITUDE")%></label>
                        </div>
                        <div class="input-field col s4">
                        <input name="longmin" id="LongMin"
							 size="2"
							value='<%=horoObject.getMinuteOfLongitude()%>' autocomplete="off"
							tabindex="11" />
                        </div>
                        
                        <div class="input-field col s4">
                        <select size="1" name="longew" id="LongEW"
							tabindex="12">
							<option value="E"
								<% if(horoObject.getEastWest().toLowerCase().equals("e")) { %>
								selected <% } %>>E</option>
							<option value="W"
								<% if(horoObject.getEastWest().toLowerCase().equals("w")) { %>
								selected <% } %>>W</option>
						</select>
                        </div>
                        </div>
                        
                        <div class="row">
                        <div class="input-field col s4">
                        <input name="latdeg" type="text" id="LatDeg"  size="3" 
							value='<%=horoObject.getDegreeOfLattitude()%>' autocomplete="off"
							tabindex="10" />
                        <label> <%=rBConstants.getString("LATITUDE")%></label>
                        </div>
                        
                        <div class="input-field col s4">
                        <input name="latmin" id="LatMin"
							 size="2" 
							value='<%=horoObject.getMinuteOfLattitude()%>' autocomplete="off"
							tabindex="11" />
                        </div>
                        
                        <div class="input-field col s4">
                        <select size="1" name="latns" id="LatNS"
							tabindex="15">
							<option value="N"
								<% if(horoObject.getNorthSouth().toLowerCase().equals("n")) { %>
								selected <% } %>>N</option>
							<option value="S"
								<% if(horoObject.getNorthSouth().toLowerCase().equals("s")) { %>
								selected <% } %>>S</option>
						</select>
                        </div>
                        
                        </div>
                        
                         <div class="row">
                         <div class="input-field col s12">
                         <input type="text" name="timezone" id="timeZone" value='<%=horoObject.getTimeZone()%>'  tabindex="16" /> 
						<input type="hidden" type="text" name="tags" value="<%=tags %>" />
                         <label><%=rBConstants.getString("TIME_ZONE") %></label>
                         </div>
                         
                         </div>
                         
                         
                       
                         
                          <div class="row" >
                         <div class="input-field col s12 l6">
                         
						  <div class="RecommendationHeading largefont">
							<%=editChartMatchMakConst.getString("DST_CORRECTION") %></div>
						 <div class="RecommendationContent">
							<select size="1" name="dst" id="dst" tabindex="17">
								<option value="0" <%if(dst.equals("0")) {%> selected <%}%>>0</option>
								<option value="1" <%if(dst.equals("1")) {%> selected <%}%>>1</option>
								<option value="2" <%if(dst.equals("2")) {%> selected <%}%>>2</option>
							</select>
						</div>
						<%int AyanamsaType = Integer.parseInt(SharedFunction.getAyan(horoObject));%>
                         </div>
                         
                         <div class="input-field col s12 l6">
                         <div class="RecommendationHeading">
							<%=rBConstants.getString("AYANAMSA") %></div>
						<div class="RecommendationContent">
							<select size="1" name="ayanamsa" id="ayanamsa" tabindex="18">
								<option value="1" <%if( AyanamsaType == 1) {%> selected <%}%>><%=rBConstants.getString("K_P_NEW") %></option>
								<option value="2" <%if( AyanamsaType == 2) {%> selected <%}%>><%=rBConstants.getString("K_P_OLD") %></option>
								<option value="0" <%if( AyanamsaType == 0) {%> selected <%}%>><%=newChartEditMatchMakConst.getString("N_C_LAHIRI") %></option>
								<option value="3" <%if( AyanamsaType == 3) {%> selected <%}%>><%=newChartEditMatchMakConst.getString("B_V_RAMAN") %></option>
								<option value="4" <%if( AyanamsaType == 4) {%> selected <%}%>><%=rBConstants.getString("K_P_KHULLAR") %></option>
								<option value="5" <%if( AyanamsaType == 5) {%> selected <%}%>><%=rBConstants.getString("SAYAN") %></option>
							</select>
						</div>
                         </div>
                          </div>
                          
                          <div class="row" >
                          <div class="input-field col s12 l6">
                          <div class="RecommendationHeading">
							<%=rBConstants.getString("CHART_TYPE") %></div>
						<div class="RecommendationContent">
							<select size="1" name="charting" id="charting" tabindex="19">
								<option value="0" <%if( chartType.equals("0")) {%> selected
									<%}%>><%=rBConstants.getString("NORTH_INDIAN") %></option>
								<option value="1" <%if( chartType.equals("1")) {%> selected
									<%}%>><%=rBConstants.getString("SOUTH_INDIAN") %></option>
							</select>
						</div>
                          </div>
                          
                          <div class="input-field col s12 l6">
                          <div class="RecommendationHeading">
							<%=rBConstants.getString("KP_HORARY_NUMBER") %>
							<font size="1">(1-249)</font>
						</div>
						<div class="RecommendationContent"">
							<input type="text" name="kphn" size="3" id="kphn"
								
								value="<%=horoObject.getKPHorarySeed() %>" tabindex="20"
								maxlength="3" />
						</div>
                          </div>
                          
                          </div>
                      
                          
                          
                          
                          
                          
                          
                          
                          
                          
                         </div>
                         
                         
                         </div>
                        
                        
                 
                      
                        
                          
                        
					
				<div class="row mr-b-0">
				<div class="col s12 center">
						<button type="submit" name="methodName" value="editChartDone" class="btn amber darken-4 waves-effect waves-light center"><%=rBConstants.getString("DONE")%></button>
						<button type="submit" name="methodName" value="editChartDoneAndSave" class="btn amber darken-4 waves-effect waves-light center"><%=rBConstants.getString("DONE_AND_SAVE_CHART")%></button>
				</div>
					</div>
					
					<input type="hidden" name="timezoneid" id="timezoneid" value="<%=request.getParameter("timezonestring")%>" />
					
					 </form>
				
                  </div>
              </div>
              </div>
              </div>
              
              
              

<script type="text/javascript">
    /* $(document).ready(function() {
        $("div#advancedDiv").hide();

        $("#place").autocomplete(
		    "/HomeServlet",
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
    }); */
    function openedit() {
        if (formValidation())
        document['editchart'].submit();
    }

    /* function findValue(li) {
        if (li == null) return alert("No match!");
        //alert(li.extra);
        $('#latDeg').val(li.extra[3]);
        $('#latMin').val(li.extra[4]);
        $('#latNS').val(li.extra[5]);
        $('#longDeg').val(li.extra[6]);
        $('#longMin').val(li.extra[7]);
        $('#longEW').val(li.extra[8]);
        $('#timeZone').val(li.extra[9]);
        $('#timezoneid').val(li.extra[0]);
    }
    function selectItem(li) {
        findValue(li);
    }

    function formatItem(row) {
        return row[0] + " (" + row[2] + " " + row[3] + ")";
    }

    function lookupAjax() {
        var oSuggest = $("#place")[0].autocompleter;
        oSuggest.findValue();
        return false;
    } */
    function showAdvanced() {
        $('div#advancedDiv').toggle('slow');
    }  

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

</script>

