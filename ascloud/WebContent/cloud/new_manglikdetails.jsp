<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
Local local = new Local();
int languageCode = (Integer) session.getAttribute("languageCode");
MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle manglikConstants = (MyResourceBundle) local.loadPropertiesFileNew("manglikdetails", languageCode);
%>

<div class="hdg-lg card">
	<h1><%=baseConstants.getString("MANGLIK_DETAILS")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content ul-text-content">
<h2> <%=baseConstants.getString("MANGLIK_DETAILS")%></h2>
	<%               
                    
DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");                     
boolean MangaldoshOfBirth = myAstrologyObject.isMangalDosh();
boolean MangalDoshOfMoon = myAstrologyObject.isMangalDoshForMoonChart();
int[] PlanetInBhav = myAstrologyObject.getPlanetInBhav();
int MangalDoshBhav = myAstrologyObject.getMarsInBhavForMoonChart();

int StoreBhavNumber = PlanetInBhav  [2];
String StoreBhavName = baseConstants.getString("MANGLIK_HOUSE_NO"+StoreBhavNumber);
String StoreMoonName = baseConstants.getString("MANGLIK_HOUSE_NO"+MangalDoshBhav);                                             
                 
                    %>
                    
                    <img class="ui-img-ico" src="images/icons/ic_mangal_dosh.png" align="left" style="margin-right:10px; width:100px;" />
								<%if (MangaldoshOfBirth && MangalDoshOfMoon) {%>

								<h2><%=manglikConstants.getString("PERSON_IS_MANGLIK")+"("+baseConstants.getString("HIGH")+")"+baseConstants.getString("HAIENG")%></h2>

								<% } else if (MangaldoshOfBirth || MangalDoshOfMoon) {%>

								<h2><%=manglikConstants.getString("PERSON_IS_MANGLIK")+"("+baseConstants.getString("LOW")+")"+baseConstants.getString("HAIENG")%></h2>
								<% } else if (!MangaldoshOfBirth && !MangalDoshOfMoon) { %>

								<h2><%=manglikConstants.getString("PERSON_IS_NOT_MANGLIK")+baseConstants.getString("HAIENG")%></h2>
								<%} %>
								
							<p>	<%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH1")%>
								 <%=manglikConstants.getString("MANGLIK_DETAILS_FIRST")+"<font color=Blue>"+ StoreBhavName +" </font>"+manglikConstants.getString("MANGLIK_DETAILS_SECOND")+"<font color=Blue>"+ StoreMoonName +" </font>"+manglikConstants.getString("MANGLIK_DETAILS_THIRD")+"" %>
</p>
</div>
</div>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content ul-text-content">

<h2> <%//=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE")%>
									<% if(!MangaldoshOfBirth && !MangalDoshOfMoon) {%> <%=manglikConstants.getString("PRESENT_NEITHER_IN_LAGNA_CHART_NOR_IN_MOON_CHART") %>
								 <% }
       if( MangaldoshOfBirth && MangalDoshOfMoon) { %> <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE1")%>
									<% } else 
       if( MangaldoshOfBirth && !MangalDoshOfMoon) { %> <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE2")%>
									<% } else 
      if( !MangaldoshOfBirth && MangalDoshOfMoon) {%> <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE3")%>
									<% } %> </h2>
									
									<p> <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH4")%> </p>
									<p> <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH5")%> </p>
									
									<h2> 
									<%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING1")%>
									</h2>
									
									<p class="mrb-10"> <b><%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING2")%></b> </p>
									<p> <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH6")%>
									</p>
									
									<p class="mrt-10">  <b><%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING3")%></b>  </p>
									<ul>
										<li><%=manglikConstants.getString("REMEDIES1")%>
										<li><%=manglikConstants.getString("REMEDIES2")%>
										<li><%=manglikConstants.getString("REMEDIES3")%>
									</ul>
									
									<p> <b><%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING4")%></b> </p>
									
									<ul>
										<li><%=manglikConstants.getString("LK_REMEDIES1")%>
										<li><%=manglikConstants.getString("LK_REMEDIES2")%>
										<li><%=manglikConstants.getString("LK_REMEDIES3")%>
									</ul>
									<p> <b><%=baseConstants.getString("NOTE")%>: </b>
									<%=manglikConstants.getString("MANGLIK_DETAILS_NOTE")%></p>
</div>
</div>
</div>

