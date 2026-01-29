<%@page import="java.text.MessageFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.ojassoft.astrosagecloud.util.GetAstrologyFullNames"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="java.util.ResourceBundle"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ephemeris</title>

<%@include file='/dhruv/cssscript.jsp'%> 
<%@include file='/cloud/planets-detailed-informations.jsp'%>
</head>
<%
//Session check 
Object horoOb = session.getAttribute("HoroscopeObj");
Object userOb = session.getAttribute("userid");
UserDAO UD = new UserDAO();
GetAstrologyFullNames objFullName =  new GetAstrologyFullNames();

int getPlanId=1; // Set the this variable as basic plan
getPlanId = Integer.parseInt(UD.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if(userOb != null ||  horoOb !=null){	
	
if (Util.isDhruvPlan(getPlanId)){

	Local local = new Local();
	int languageCode = Util.safeInt(session.getAttribute("languageCode"));
	MyProperties rBConstants = new MyProperties(local.loadPropertiesFile("constants", languageCode));
	MyResourceBundle objResLang = local.loadPropertiesFileNew("dhruv", languageCode);
	MyResourceBundle objResBd = local.loadPropertiesFileNew("birthdetails", languageCode);
	MyResourceBundle objArudha = local.loadPropertiesFileNew("arudha", languageCode);
	String place = Util.safestr(request.getAttribute("place"))==""?"New Delhi":Util.safestr(request.getAttribute("place"));
	
	String hourValue = Util.safestr(request.getAttribute("hour"))==""?"5":Util.safestr(request.getAttribute("hour"));
	String minuteValue = Util.safestr(request.getAttribute("minute"))==""?"30":Util.safestr(request.getAttribute("minute"));
	
	MyResourceBundle newChartEditMatchMakConst = local.loadPropertiesFileNew("newchart-editchart-matchmaking", languageCode);
	List<DesktopHoro> mDesktopHorosList = (ArrayList<DesktopHoro>)request.getAttribute("desktophoro");
	Calendar mCalendar = (Calendar)request.getAttribute("date");
	int value = mCalendar.get(Calendar.MONTH)+1;
	DesktopHoro desktopHoro1 = mDesktopHorosList.get(0);	
%>

<body class="dhruv-soft">
<%@include file='/dhruv/header.jsp'%>
		<div id="contentArea">
		<div class="wrapper">
			<%@include file='/dhruv/navbar.jsp'%>
			<section class="content" id="contentView">
			
			<div class="row" id="kundli">

	<div class="col s12 l12">
	<div class="card-panel br-radius br-all z-depth-0">
			

<h2> <%= MessageFormat.format(objResLang.getString("EPHEMERIS_TITLE"), rBConstants.getString(SharedFunction.monthName(mCalendar.get(Calendar.MONTH)+1)), String.valueOf(mCalendar.get(Calendar.YEAR)))%></h2>
			

<form class="das-form mrt-30" name="Ephemeris" method="post" action="/ephemeris" onsubmit="return validateEphemeris()">

  <div class="row">
      <div class="col s4">
              <label for="month"><%=rBConstants.getString("BD_MONTH")%></label>

<select name="month" class="browser-default">
  <option value="1" <%= value == 1 ? "selected" : "" %>><%=rBConstants.getString("JANUARY")%></option>
  <option value="2" <%= value == 2 ? "selected" : "" %>><%=rBConstants.getString("FEBRUARY")%></option>
  <option value="3" <%= value == 3 ? "selected" : "" %>><%=rBConstants.getString("MARCH")%></option>
  <option value="4" <%= value == 4 ? "selected" : "" %>><%=rBConstants.getString("APRIL")%></option>
  <option value="5" <%= value == 5 ? "selected" : "" %>><%=rBConstants.getString("MAY")%></option>
  <option value="6" <%= value == 6 ? "selected" : "" %>><%=rBConstants.getString("JUNE")%></option>
  <option value="7" <%= value == 7 ? "selected" : "" %>><%=rBConstants.getString("JULY")%></option>
  <option value="8" <%= value == 8 ? "selected" : "" %>><%=rBConstants.getString("AUGUST")%></option>
  <option value="9" <%= value == 9 ? "selected" : "" %>><%=rBConstants.getString("SEPTEMBER")%></option>
  <option value="10" <%= value == 10 ? "selected" : "" %>><%=rBConstants.getString("OCTOBER")%></option>
  <option value="11" <%= value == 11 ? "selected" : "" %>><%=rBConstants.getString("NOVEMBER")%></option>
  <option value="12" <%= value == 12 ? "selected" : "" %>><%=rBConstants.getString("DECEMBER")%></option>
</select>           
       </div>
        <div class="col s4">
   <label for="year"><%=rBConstants.getString("BD_YEAR")%></label>
<input type="text" name="year" value ="<%= mCalendar.get(Calendar.YEAR)%>">
                        
       </div>

      <div class="col s4">
      <label for="place"><%=rBConstants.getString("PLAC")%> (<%=newChartEditMatchMakConst.getString("MIN_3_CHAR")%>)</label>
				<input type="text" placeholder="Place" name="place"
					value="<%=place%>" tabindex="9" id="place" maxlength="50" /> 
      </div>
       
      </div>
      
      <div class="row">
      <div class="col s6">
                <label for="Hrs"><%=rBConstants.getString("BD_HRS")%></label>
                    <input type="number" value="<%=hourValue%>" class="form-control" name="hour" id="hour" placeholder="Hours" 
                        maxlength="2" tabindex="7" data-toggle="tooltip" title="Hours" min = "0" max = "23" />
                </div>
                <div class="col s6">
                <label for="Min"><%=rBConstants.getString("BD_MIN")%></label>
                    <input type="number" value="<%=minuteValue%>" class="form-control input-sm-1" name="minute" id="minute" 
                        placeholder="Minute" maxlength="2" tabindex="8" data-toggle="tooltip" title="Minute" min = "0" max = "59"/>
                </div>
      </div>
      
  <div class="row">
      <div class="col s12 center-align mrb-20">
       	<button class="btn btn-large waves-effect bg-dark-purple center well-css"  type="submit"><%=objArudha.getString("SUBMIT") %></button>
      </div>
      </div>



<input type="hidden" id="LatDeg" name="LatDeg" value="<%=request.getParameter("LatDeg") %>">
<input type="hidden" id="LatMin" name="LatMin" value="<%=request.getParameter("LatMin") %>">
<input type="hidden" id="LatNS" name="LatNS" value="<%=request.getParameter("LatNS") %>">
<input type="hidden" id="LongDeg" name="LongDeg" value="<%=request.getParameter("LongDeg") %>">
<input type="hidden" id="LongMin" name="LongMin" value="<%=request.getParameter("LongMin") %>">
<input type="hidden" id="LongEW" name="LongEW" value="<%=request.getParameter("LongEW") %>">
<input type="hidden" id="timeZone" name="timeZone" value="<%=request.getParameter("timeZone") %>">
<input type="hidden" id="timezoneid" name="timezoneid" value=""> 

</form>

<table id="ephemeris" class="striped bordered centered">
<thead>
<tr>
<th><%=rBConstants.getString("DAT")%></th>   
<% for(int planetIterator = 0;planetIterator < 13; planetIterator++){ 
	if( planetIterator == 0){ %> 
	<th><%=objResBd.getString("SIDERAL_TIME") %></th> 
	<% } else { %>
            
             <th><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(objFullName.getFullDaysName(desktopHoro1.getPlanetName(planetIterator),languageCode,3),languageCode),languageCode)%></th>
            
    <% }} %>
</tr>
</thead>
<tbody>

<% for(int dateIterator =0;dateIterator<mDesktopHorosList.size();dateIterator++) {
	DesktopHoro desktopHoro = mDesktopHorosList.get(dateIterator);%>
	
	<tr><td><%=dateIterator+1 %></td>    
	<%for(int planetItr=0;planetItr<13;planetItr++){
	
		if( planetItr == 0) { %>
		<td><%=SharedFunction.dms(desktopHoro.getSiderealTime())%></td> 
	<% } else { %>
	
            <td><%= (int)desktopHoro.getPlanetaryDegree()[planetItr]/30+": "+
            		SharedFunction.getdms(desktopHoro.getPlanetaryDegree()[planetItr]%30) %></td>
      
    <% }}%></tr>
	 <%} %>
	 </tbody>
</table>
</div>
</div>
</div>
</section>
</div>
</div>

<%@include file='/dhruv/footer.jsp'%>

<%
}else{	
	response.sendRedirect("/dhruv/purchage-modal.jsp");
}
}
else{	
	session.setAttribute("dhruvNewKundli", "0");
	response.sendRedirect("/cloud/login.asp");
}
	%>
</body>
</html>