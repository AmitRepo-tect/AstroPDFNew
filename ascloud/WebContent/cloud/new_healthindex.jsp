<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.api.Health"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link type="text/css" href="css/birth-details.css" rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/atlas/css/jquery.autocomplete.css" />
<script type="text/javascript" src="/kundli/js/kundli.js"
	charset="utf-8"></script>
<script type='text/javascript' src='js/script/jquery.autocomplete.js'></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script src="js/raphael-2.1.4.min.js"></script>
<script src="js/justgage.js"></script>

<%
String usrMsg = request.getParameter("usermsg");

DesktopHoro objHoro = (DesktopHoro) request.getSession().getAttribute("HoroscopeObj");
Health health = new Health(objHoro);

double healthIndex = health.getImmunityStrength();
//healhIndex = 
String healthStr = "";
String label = "";
if(healthIndex < -4)
{
	healthIndex = -3.8;
}
if(healthIndex > 4)
{
	healthIndex = 4;
}
healthIndex = ((healthIndex*25) + 100 )/2;
if(healthIndex >= 0 && healthIndex < 25)
{
	label = "Very Weak";
	
}
else if(healthIndex >= 25 && healthIndex < 50)
{
	label = "Weak";
}
else if(healthIndex >= 50 && healthIndex < 75)
{
	label = "Average";
}
else if(healthIndex >= 75)
{
	label = "Strong";
}

Object healthObj = request.getAttribute("HealthIndex");
if(healthObj == null || healthObj.equals(""))
{
	healthStr = request.getParameter("healthindex");
	if(healthStr != null && !healthStr.equals(""))
	{
		healthIndex = Integer.valueOf(healthStr);
	}
}
else
{
	healthIndex = Integer.valueOf(healthObj.toString());
}

int fileLang = 0;

Object objLangCode = session.getAttribute("languageCode");

if(objLangCode != null)
{
	fileLang = (Integer) objLangCode;
}

Local fileLocal = new Local();

MyProperties fileHealthIndex = null;

fileHealthIndex = new MyProperties(fileLocal.loadPropertiesFile("healthindex", fileLang));
%>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card">
<div class="center"> 
<div id="gauge" class="500x200px"></div></div>
<script>
  var g = new JustGage({
    id: "gauge",
    value: <%=healthIndex%>,
    min: 0,
    max: 100,
    label: '<%=label%>',
    title: "<%=fileHealthIndex.getString("IMMUNITY_INDEX")%>",
    
  });
  $(function(){ 
      if (document.location.href.indexOf('usermsg') > 0) 
    	{
			$("#feedback-header").hide(); 
	     	$("#feedback-button-div").hide(); 
	     	$("#msg-div").show(); 
		} } ); 
  function getFeedback(checkValue)
  {
	  //alert("11111 : "+checkValue.value);
	  if(checkValue.value == 1)
	  {
		  document.getElementById("feedback-details").style.display = "none"; 
	  }
	  else if(checkValue.value == 0)
	  {
		  document.getElementById("feedback-details").style.display = "block"; 
	  }
	 
  }
   
</script>

<form action="/horapanchang.asp" method="post" class="mrb-20">
<div align="center" id="msg-div">
<label> <b><% if(usrMsg != null && !usrMsg.equals("")) { %><%=usrMsg%> <% } %></label>
</div>

<div class="hdg-content padding-all" id="feedback-header">
<h2>
	<%=fileHealthIndex.getString("SHARE_YOUR_FEEDBACK")%>
</h2>
 <p class="astro-txts"> 
 
 <%=fileHealthIndex.getString("DESCRIPTION")%> <%=fileHealthIndex.getString("WEAK")%>? </p>

 <div class="input-set"> 
 <input class="with-gap" type="radio" name="yesno" id="yes1" value="1" checked onclick="getFeedback(this)" /><label for="yes1"><%=fileHealthIndex.getString("YES")%></label>
  <input class="with-gap"  type="radio" name="yesno" id="yes2" value="0" onclick="getFeedback(this)"/> <label for="yes2"><%=fileHealthIndex.getString("NO")%></label><br>
  <input type="hidden" name="calcimmunity" value="<%=label.replace(" ","")%>"/>
  <input type="hidden" name="immunitystrength" value="<%=health.getImmunityStrength()%>"/>
  <input type="hidden" name="immunitystrength2" value="<%=health.getImmunityStrengthV2()%>"/>
  <input type="hidden" name="immunitystrength3" value="<%=health.getImmunityStrengthV3()%>"/></div>
</div>
<div id="feedback-details" style="display:none">

<div id="feedback-health" class="padding-all" align="left">
<div class="input-field col s12">

<select name="actualimmunity">
	<option value="VeryWeak"><%=fileHealthIndex.getString("VERY_WEAK")%></option>
	<option value="Weak"><%=fileHealthIndex.getString("WEAK")%></option>
	<option value="Average"><%=fileHealthIndex.getString("AVERAGE")%></option>
	<option value="Strong"><%=fileHealthIndex.getString("STRONG")%></option>
</select>
<label><%=fileHealthIndex.getString("IMMUNITY")%></label>
</div>


<div class="input-field col s12">
<textarea name="feedbackhealth" id="feedback1" class="materialize-textarea validate"></textarea>
<label><%=fileHealthIndex.getString("COMMENTS")%></label>
</div>
	
</div>
<br>
</div>


<div id="feedback-button-div" align="center">
<button type="submit" name="methodName" class="btn amber darken-4 waves-effect waves-light" value="saveFeedback"><%=fileHealthIndex.getString("SAVE_FEEDBACK")%></button>
</div>
</form>
</div>
</div>
</div>

