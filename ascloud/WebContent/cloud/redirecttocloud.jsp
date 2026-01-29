<%@page import="java.net.URLEncoder"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%
DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
%>
<Body onload="document.forms['logindetails2'].submit();" >

<%if(myAstrologyObject!=null && session.getAttribute("User_Id")!=null && !myAstrologyObject.equals("") && !session.getAttribute("User_Id").equals("")){ %>
    <Form method="post" name="logindetails2" id="logindetails2" action="http://cloud.astrosage.com/cloud/createsession.asp" >
    <input type="hidden" value="<%=myAstrologyObject.getName()%>" name="name"/>
    <input type="hidden" value="<%=myAstrologyObject.getMaleFemale()%>" name="sex" />
    <input type="hidden" value="<%=myAstrologyObject.getDayOfBirth()%>" name="day" />
    <input type="hidden" value="<%=myAstrologyObject.getMonthOfBirth()%>" name="month" />
    <input type="hidden" value="<%=myAstrologyObject.getYearOfBirth()%>" name="year" />
    <input type="hidden" value="<%=myAstrologyObject.getHourOfBirth()%>"name="hrs" />
    <input type="hidden" value="<%=myAstrologyObject.getMinuteOfBirth()%>"name="min" />
    <input type="hidden" value="<%=myAstrologyObject.getSecondOfBirth()%>" name="sec" />
    <input type="hidden" value="<%=myAstrologyObject.getPlace()%>" name="place" />
    <input type="hidden" value="<%=myAstrologyObject.getDegreeOfLattitude()%>" name="latdeg" />
    <input type="hidden" value="<%=myAstrologyObject.getMinuteOfLattitude()%>" name="latmin" />
    <input type="hidden" value="<%=myAstrologyObject.getNorthSouth()%>" name="latns" />
    <input type="hidden" value="<%=myAstrologyObject.getDegreeOfLongitude()%>" name="longdeg" />
    <input type="hidden" value="<%=myAstrologyObject.getMinuteOfLongitude()%>" name="longmin" />
   <input type="hidden" value="<%=myAstrologyObject.getEastWest()%>" name="longew" />
   <input type="hidden" value="<%=myAstrologyObject.getTimeZone()%>" name="timezone" />
   <input type="hidden" value="<%=myAstrologyObject.getDST()%>" name="dst" />
   <input type="hidden" value="<%=SharedFunction.getAyan(myAstrologyObject)%>" name="ayanamsa" />
   <input type="hidden" value="<%=myAstrologyObject.getKPHorarySeed()%>" name="kphn" />
   <input type="hidden" value="<%=request.getParameter("languagecode")%>" name="languagecode" />
   <input type="hidden" value="<%=URLEncoder.encode(SharedFunction.EnCrypt(String.valueOf(session.getAttribute("User_Id"))), "UTF-8")%>" name="swa"/>
   <input type="hidden" value="1" name="vfd" />
  </Form>
  <%}else{%>
   <Form method="post" name="logindetails2" id="logindetails2" action="http://cloud.astrosage.com/cloud/home.asp" >
   </Form>
   <%} %>
  </Body>