<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%

 Local local = new Local(); 
int languageCode = (Integer) session.getAttribute("languageCode");
MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
 MyResourceBundle matchMakingConstants = (MyResourceBundle) local.loadPropertiesFileNew("matchmaking", languageCode); 
 MyResourceBundle editChartConstants = (MyResourceBundle) local.loadPropertiesFileNew("editchart-matchmaking", languageCode);
 MyResourceBundle newEditChartConstants = (MyResourceBundle) local.loadPropertiesFileNew("newchart-editchart-matchmaking", languageCode);
 %>
<%@include file="js/matchmaking.jsp"%>

<div class="hdg-lg card">
	<h1><%=matchMakingConstants.getString("MATCH_ME")%></h1>	
</div>

<%
 Calendar cal = Calendar.getInstance();
 DesktopHoro Objhoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
 String name1 = Objhoro.getName();
 String sex1 = Objhoro.getMaleFemale();
 int day1 = Objhoro.getDayOfBirth();
 int month1 = Objhoro.getMonthOfBirth();
 int year1 = Objhoro.getYearOfBirth();
 String hrs1= Objhoro.getHourOfBirth();
 String min1 = Objhoro.getMinuteOfBirth();
 String sec1 = Objhoro.getSecondOfBirth();
 String place1 = Objhoro.getPlace();
 String longdeg1 = Objhoro.getDegreeOfLongitude();
 String longmin1 = Objhoro.getMinuteOfLongitude();
 String longew1 = Objhoro.getEastWest();
 String latdeg1 = Objhoro.getDegreeOfLattitude();
 String latmin1 = Objhoro.getMinuteOfLattitude();
 String latns1 = Objhoro.getNorthSouth();
 String timezone1 = Objhoro.getTimeZone();
 String dst1 = Objhoro.getDST();
  
%>
           
            <div id="multi-color-tab" class="section tabing-form mrt-30 mrb-30">
                <div class="card">
                  <div class="row">
                    <div class="col s12">
                      <ul class="tabs">
                        <li class="tab col s4"><a class="black-text waves-effect amber lighten-4 waves-light" href="#tab1"><%String gender = sex1.toLowerCase();if(gender.equals("male") ||  gender.equals("m")) { %><% out.println(matchMakingConstants.getString("ENTER_GIRLS_BIRTH_DETAILS")); %>	<% } else { %> <%  out.println(matchMakingConstants.getString("ENTER_BOYS_BIRTH_DETAILS")); %>	<% } %></a></li>
                        <li class="tab col s4"><a class="black-text waves-effect amber lighten-4 waves-light" onclick="getsavedcharts();" href="#tab2"><%=baseConstants.getString("MATCH_WITH_SAVED_CHART") %></a></li>
                        <li class="tab col s4"><a class="black-text waves-effect amber lighten-4 waves-light" href="#tab3"><%=matchMakingConstants.getString("MATCH_WITH_PUBLIC_CHART") %></a></li>
                      </ul>
                    </div>
                    <div class="col s12">
                      <div id="tab1" class="col s12">
                        <form method="post" action="/cloud/matchmakingoutput.asp" id="first" name="first" onsubmit="return formValidation();" class="ui-tab-para">
							<div id="personal">
											
												<input type="hidden" type="text" name="formfirst" value="1" />
												<h5 class="padding-all"> 
													<%if(gender.equals("male") ||  gender.equals("m")) {  %>
													<%=matchMakingConstants.getString("ENTER_GIRLS_DETAILS") %>
													<% } else { %>
													<%=matchMakingConstants.getString("ENTER_BOYS_DETAILS") %>
													<% } %>
												</h5>
												<div class="row"> 
												<div class="input-field col s12"> 
												<input id="name" type="text" name="name2" />
												<label for="name"> <%=baseConstants.getString("NAM") %></label>
												
												<% if(gender.equals("male") ||  gender.equals("m")) { %>
												<input type="hidden" name="sex2" value="male" />
												<% } else { %>
												<input type="hidden" name="sex2" value="female" />
												<% } %>
												</div>
												</div>
												
												<div class="row"> 
												<div class="input-field col s4 l4"> 

												
													<input type="text" name="day2" id="day" value='<%=cal.get(Calendar.DAY_OF_MONTH)%>'/> 
													<label for="day"> <%=rBConstants.getString("BD_DAY")%></label> 
													</div>
													<div class="input-field col s4 l4"> 
													<input type="text" name="month2" id="month" value='<%=cal.get(Calendar.MONTH)+1%>'/> 
													<label for="month"><%=rBConstants.getString("BD_MONTH")%></label>
													</div>
													<div class="input-field col s4 l4"> 
													<input name="year2" type="text"  size="4" maxlength="4" value='<%=cal.get(Calendar.YEAR)%>' id="year" /> 
													<label for="year"><%=rBConstants.getString("BD_YEAR")%></label>
													</div>
												</div>
												
												<div class="row"> 
												<div class="input-field col s4 l4"> 
													<input type="text" name="hrs2" id="hrs" value="<%=cal.get(Calendar.HOUR_OF_DAY)%>" /> 
													 <label for="hrs"><%=rBConstants.getString("BD_HRS")%></label>
													</div>
													<div class="input-field col s4 l4"> 
													<input type="text" name="min2" id="min" value="<%=cal.get(Calendar.MINUTE)%>" /> 
													<label for="min"><%=rBConstants.getString("BD_MIN")%></label>
													</div>
													<div class="input-field col s4 l4"> 
													<input type="text" name="sec2" size="4" value="<%=cal.get(Calendar.SECOND)%>" id="sec" />
													<label for="sec"><%=rBConstants.getString("BD_SEC")%></label>
											       </div>
											       </div>
											       
												
												
												<div class="row"> 
												<div class="input-field col s12 l12">
												 <label for="place"> <%=baseConstants.getString("PLAC")%> (<%=newEditChartConstants.getString("MIN_3_CHAR") %>)</label> 
												 <input type="text" name="place2" id="place" value=''/> 
													</div>
													</div>
													
													<div class="row"> 
												    <div class="input-field col s4 l4">
													<label for="LongDeg"> <%=baseConstants.getString("LONGITUDE")%></label> 
													<input type="text" name="longdeg2" id="LongDeg" value='' /> 
													</div>
													
													
													
													
												     <div class="input-field col s4 l4">
													<input type="text" name="longmin2" id="LongMin" value=''/> 
													</div>
												
													
													
												    <div class="input-field col s4 l4">
													<select id="LongEW" name="longew2">
													<option value="E" selected="selected">E</option>
													<option value="W">W</option>
												</select> 

												</div>
													</div>
													
													<div class="row"> 
												    <div class="input-field col s4 l4">
												
												
												<input type="text" name="latdeg2" id="LatDeg" value=''  /> 
												
												<label for="LatDeg"> <%=baseConstants.getString("LATITUDE")%></label>
													
													</div>
													 <div class="input-field col s4 l4">
													<input type="text" name="latmin2" id="LatMin" value=''/> 
													</div>
													
													 <div class="input-field col s4 l4">
													<select id="LatNS" name="latns2">
													<option value="N" selected="selected">N</option>
													<option value="S">S</option>
													</select>
													</div>
													</div>
												
												<div class="row"> 
												<div class="input-field col s6 l6">  
												
												<select id="dst3" name="dst2">
												
													<option value="0">0</option>
													<option value="1">1</option>
													<option value="2">2</option>
												</select> 
												<label for="dst"> <%=editChartConstants.getString("DST_CORRECTION") %></label>
												</div>
												    <div class="input-field col s6 l6">
													<input type="text" name="timezone2" id="timeZone"/>
													<label for="timeZone"> <%=baseConstants.getString("TIME_ZONE") %></label>
													</div>
													
													</div>
											</div>
											<div class="advancedDiv">
												<div id="advanced">
													<h5 class="mrb-20"><%=editChartConstants.getString("ADV_SETTINGS_HEAD") %></h5>
													<div class="row"> 
												    <div class="input-field col s6 l6">
													
													<select size="1" name="ayanamsa" id="ayanamsa">
														<option value="1"><%=baseConstants.getString("K_P_NEW") %></option>
														<option value="2"><%=baseConstants.getString("K_P_OLD") %></option>
														<option value="0" selected="selected"><%=newEditChartConstants.getString("N_C_LAHIRI") %></option>
														<option value="3"><%=newEditChartConstants.getString("B_V_RAMAN") %></option>
														<option value="4"><%=baseConstants.getString("K_P_KHULLAR") %></option>
														<option value="5"><%=baseConstants.getString("SAYAN") %></option>
													</select>
													<label for="ayanamsa"> <%=baseConstants.getString("AYANAMSA") %></label>
													</div>
																										
												    <div class="input-field col s6 l6">
													
													<select size="1" name="charting" id="charting">
														<option selected="selected" value="0"><%=baseConstants.getString("NORTH_INDIAN") %></option>
														<option value="1"><%=baseConstants.getString("SOUTH_INDIAN") %></option>
													</select>
													<label for="charting"> <%=baseConstants.getString("CHART_TYPE") %></label>
													</div>
													
													</div>
												</div>
											</div>

											<div align="center">
												<input type="submit" class="waves-effect waves-light btn amber darken-4 box-shadow" value="<%=matchMakingConstants.getString("MATCH_ME") %>" name="match" />
											</div>
											<!--<input type="hidden" name="referrer" value="/freekundli/basicdetails.asp">-->
											<input type="hidden" name="referrer"
												value="/freekundli/home.asp"> <input type="hidden"
												name="kphn" value="0"> <input type="hidden"
												value="<%=name1 %>" name="name1" /> <input type="hidden"
												value="<%=sex1 %>" name="sex1" /> <input type="hidden"
												value="<%=place1 %>" name="place1" /> <input type="hidden"
												value="<%=day1 %>" name="day1" /> <input type="hidden"
												value="<%=month1 %>" name="month1" /> <input type="hidden"
												value="<%=year1 %>" name="year1" /> <input type="hidden"
												value="<%=hrs1 %>" name="hrs1" /> <input type="hidden"
												value="<%=min1 %>" name="min1" /> <input type="hidden"
												value="<%=sec1 %>" name="sec1" /> <input type="hidden"
												value="<%=longdeg1 %>" name="longdeg1" /> <input
												type="hidden" value="<%=longmin1 %>" name="longmin1" /> <input
												type="hidden" value="<%=longew1 %>" name="longew1" /> <input
												type="hidden" value="<%=latdeg1 %>" name="latdeg1" /> <input
												type="hidden" value="<%=latmin1 %>" name="latmin1" /> <input
												type="hidden" value="<%=latns1 %>" name="latns1" /> <input
												type="hidden" value="<%=timezone1 %>" name="timezone1" /> <input
												type="hidden" value="<%=dst1 %>" name="dst1" />
										</form>
                      </div>
                      <div id="tab2">
                      
                        <form method="post" action="/cloud/matchmakingoutput.asp" id="two1" name="two1" class="ui-paragraph-head mrt-30">
											<div class="padl10 padr10">
												<div id="msgsecond" class="alert d-none alert-danger"></div>
											</div>
											<p class="padding-all"> 
											<%=matchMakingConstants.getString("CLICK_RADIO_MATCH_DETAILS") %> </p>
											<div class="row padding-all"> 
												    <div class="input-field col s12 l12">
											<input type="text" value="" id="chartnamematch" name="chartnamematch" /> 
											 <label for="charting"> <%if(gender.equals("male") ||  gender.equals("m")) { %>
													<%=matchMakingConstants.getString("ENTER_GIRLS_CHART_NAME") %>
												<% } else { %>

												<%=matchMakingConstants.getString("ENTER_BOYS_CHART_NAME") %>
												<% } %></label>	
											</div>
											</div>
											
										     <div id="recorddataloader"></div>
										     <div id="recorddata" class="table-panel rt-custom"></div>
											    <input type="hidden" name="referrer" value="/freekundli/basicdetails.asp" /> 
												<input type="hidden" name="kphn1" value="0" /> 
												<input type="hidden" value="<%=name1 %>" name="name1" /> 
												<input type="hidden" value="<%=sex1 %>" name="sex1" /> 
												<input type="hidden" value="<%=place1 %>" name="place1" /> 
												<input type="hidden"
												value="<%=day1 %>" name="day1" /> <input type="hidden"
												value="<%=month1 %>" name="month1" /> <input type="hidden"
												value="<%=year1 %>" name="year1" /> <input type="hidden"
												value="<%=hrs1 %>" name="hrs1" /> <input type="hidden"
												value="<%=min1 %>" name="min1" /> <input type="hidden"
												value="<%=sec1 %>" name="sec1" /> <input type="hidden"
												value="<%=longdeg1 %>" name="longdeg1" /> <input
												type="hidden" value="<%=longmin1 %>" name="longmin1" /> <input
												type="hidden" value="<%=longew1 %>" name="longew1" /> <input
												type="hidden" value="<%=latdeg1 %>" name="latdeg1" /> <input
												type="hidden" value="<%=latmin1 %>" name="latmin1" /> <input
												type="hidden" value="<%=latns1 %>" name="latns1" /> <input
												type="hidden" value="<%=timezone1 %>" name="timezone1" /> <input
												type="hidden" value="<%=dst1 %>" name="dst1" /> <input
												type="hidden" name="kphn2" value="0" id="kphn3"> <input
												type="hidden" value="" id="name3" name="name2" /> <input
												type="hidden" value="" id="sex3" name="sex2" /> <input
												type="hidden" value="" id="place3" name="place2" /> <input
												type="hidden" value="" id="day3" name="day2" /> <input
												type="hidden" value="" id="month3" name="month2" /> <input
												type="hidden" value="" id="year3" name="year2" /> <input
												type="hidden" value="" id="hrs3" name="hrs2" /> <input
												type="hidden" value="" id="min3" name="min2" /> <input
												type="hidden" value="" id="sec3" name="sec2" /> <input
												type="hidden" value="" id="longdeg3" name="longdeg2" /> <input
												type="hidden" value="" id="longmin3" name="longmin2" /> <input
												type="hidden" value="" id="longew3" name="longew2" /> <input
												type="hidden" value="" id="latdeg3" name="latdeg2" /> <input
												type="hidden" value="" id="latmin3" name="latmin2" /> <input
												type="hidden" value="" id="latns3" name="latns2" /> <input
												type="hidden" value="" id="timezone3" name="timezone2" /> <input
												type="hidden" value="" id="dstsecond" name="dst2" />
										 </form>
                      					</div>
                      
                      <div id="tab3" class="col s12 ui-paragraph-head">
                      <form method="post" class="mrt-30" action="/cloud/matchmakingoutput.asp" id="third" name="thirdff" onsubmit="return checkpublicchartname();">
											<div id="msgthird" class="alert d-none alert-danger"></div>
											<p><%=matchMakingConstants.getString("MATCH_HOROSCOPE_SHARED_CHART") %></p>
                                            <div class="row"> 
												    <div class="input-field col s12 l12">
												    <div class="divcontent">												    
												    <label for="charting"> <%if(gender.equals("male") ||  gender.equals("m")) { %>
													<%=matchMakingConstants.getString("ENTER_GIRLS_CHART_NAME") %>
												<% } else { %>

												<%=matchMakingConstants.getString("ENTER_BOYS_CHART_NAME") %>
												<% } %></label>											

												<input type="text" value="" id="publicchartname" name="publicchartname" />
												<input type="hidden" name="publicMatchChartId" id="publicMatchChartId" value="">  
												<input type="hidden" name="kphn" value="0"> 
												<input type="hidden" value="<%=name1 %>" name="name1" /> 
												<input type="hidden" value="<%=sex1 %>"	name="sex1" id="sex1" /> 
												<input type="hidden" value="<%=place1 %>" name="place1" /> 
												<input type="hidden" value="<%=day1 %>" name="day1" /> 
												<input type="hidden" value="<%=month1 %>" name="month1" /> 
												<input type="hidden" value="<%=year1 %>" name="year1" /> 
												<input type="hidden" value="<%=hrs1 %>" name="hrs1" /> 
												<input type="hidden" value="<%=min1 %>" name="min1" /> 
												<input type="hidden" value="<%=sec1 %>" name="sec1" /> 
												<input type="hidden" value="<%=longdeg1 %>" name="longdeg1" /> 
												<input type="hidden" value="<%=longmin1 %>" name="longmin1" /> 
												<input type="hidden" value="<%=longew1 %>" name="longew1" /> 
												<input type="hidden" value="<%=latdeg1 %>" name="latdeg1" /> 
												<input type="hidden" value="<%=latmin1 %>" name="latmin1" /> 
												<input type="hidden" value="<%=latns1 %>" name="latns1" /> 
												<input type="hidden" value="<%=timezone1 %>" name="timezone1" />
												<input type="hidden" value="<%=dst1 %>" name="dst1" /> 
												<input type="hidden" name="kphn2" value="0" id="kphn4"> 
												<input type="hidden" value="" id="name4" name="name2" /> 
												<input type="hidden" value="" id="sex4" name="sex2" /> 
												<input type="hidden" value="" id="place4" name="place2" /> 
												<input type="hidden" value="" id="day4" name="day2" /> 
												<input type="hidden" value="" id="month4" name="month2" /> 
												<input type="hidden" value="" id="year4" name="year2" /> 
												<input type="hidden" value="" id="hrs4" name="hrs2" /> 
												<input type="hidden" value="" id="min4" name="min2" /> 
												<input type="hidden" value="" id="sec4" name="sec2" /> 
												<input type="hidden" value="" id="longdeg4" name="longdeg2" /> 
												<input type="hidden" value="" id="longmin4" name="longmin2" /> 
												<input type="hidden" value="" id="longew4" name="longew2" /> 
												<input type="hidden" value="" id="latdeg4" name="latdeg2" /> 
												<input type="hidden" value="" id="latmin4" name="latmin2" /> 
												<input type="hidden" value="" id="latns4" name="latns2" /> 
												<input type="hidden" value="" id="timezone4" name="timezone2" />
												<input type="hidden" value="" id="dst4" name="dst2" />
											</div>
												    </div>
												    </div>
											
											<div align="center">
												<input type="submit" class="waves-effect waves-light btn amber darken-4 box-shadow" value="<%=matchMakingConstants.getString("MATCH_ME") %>" name="match" />
											</div>
										</form>
										<input type="hidden" name="" value="" />
	                                     <input type="hidden" name="" value="" />
                        </div>
                    </div>
                  </div>
                </div>
              </div>



