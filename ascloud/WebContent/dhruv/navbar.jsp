<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

Local localnv = new Local();
int langnv = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle dasNav = localnv.loadPropertiesFileNew("dhruv", langnv);	
%>

<div class="row no-margin-b">
<div class="col s12"> 
 <div id="slide-out" class="menucntrol main-slide-menu"> 
	<a href="/dhruv/createkundli.jsp?kundli=kundli&kn=1" class="menu-class" title="Create Kundli"><div class="icon-img bg-light-blue"><img src="/dhruv/images/kundli.png"></div><span><%=dasNav.getString("CREATE_KUNDLI") %></span></a>
	<a href="/dhruv/matchmaking.jsp" class="menu-class" title="Kundli Matching"><div class="icon-img bg-light-purple"><img src="/dhruv/images/kundli-milan.png"></div><span><%=dasNav.getString("KUNDLI_MATCH") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=prashna&kn=1" id="prshn" class="menu-class" title="Prashna Kundli"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/prashna-horary.png"></div><span><%=dasNav.getString("PRASHNA_KUNDLI") %></span></a>
	<a href="/dhruv/print.jsp" class="menu-class" title="Print Kundli"><div class="icon-img bg-light-blue"><img src="/dhruv/images/print-kundli.png"></div><span><%=dasNav.getString("PRINT_KUNDLI") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=prediction&kn=1" class="menu-class" title="Prediction"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/predictions.png"></div><span><%=dasNav.getString("PREDICTION") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=varshphal&kn=1" class="menu-class" title="Varshphal"> <div class="icon-img bg-light-purple"> <img src="/dhruv/images/varshfal.png"></div><span><%=dasNav.getString("VARSHAPHAL") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=numerology&kn=1" class="menu-class" title="Numerology"> <div class="icon-img bg-light-blue"> <img src="/dhruv/images/numerology.png"></div><span><%=dasNav.getString("NUMEROLOGY") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=kp&kn=1" class="menu-class" title="KP/ Stellar"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/kp.png"></div><span><%=dasNav.getString("KP_STELLAR") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=lalkitab&kn=1" class="menu-class" title="Lal Kitab"> <div class="icon-img bg-light-blue"> <img src="/dhruv/images/lal-kitab.png"></div><span><%=dasNav.getString("LALKITAB") %></span></a>
	<%-- <a href="/dhruv/createkundli.jsp?kundli=sarvatobhadra&kn=1" class="menu-class" title="Sarvatobhadra"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/Sarvatobhadra.png"></div><span><%=dasNav.getString("SARVATOBHADRA") %></span></a> --%>
	<a href="/dhruv/bhrigoo.jsp" class="menu-class" title="Bhrigoo"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/bhrigoo.png"></div><span><%=dasNav.getString("AI_ASTROLOGY") %></span></a>
	<a href="/dhruv/createkundli.jsp?kundli=jaimini&kn=1" class="menu-class" title="Jaimini"> <div class="icon-img bg-light-purple"> <img src="/dhruv/images/jaimini.png"></div><span><%=dasNav.getString("JAIMINI") %></span></a>
	<%-- <a href="/dhruv/swar.jsp?kundli=swar&kn=1" class="menu-class" title="Swarodaya"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/swaroday.png"></div><span><%=dasNav.getString("SWARODAYA") %></span></a> --%>
	<a href="/dhruv/swarodaya.jsp" class="menu-class" title="Swarodaya"> <div class="icon-img bg-light-orange"> <img src="/dhruv/images/swaroday.png"></div><span><%=dasNav.getString("SWARODAYA") %></span></a>
	<a href="/dhruv/panchang.jsp" class="menu-class"> <div class="icon-img bg-light-orange" title="Panchang"> <img src="/dhruv/images/panchang.png"></div><span><%=dasNav.getString("PANCHANG") %></span></a>
	<a href="/dhruv/business.jsp" class="menu-class"> <div class="icon-img bg-light-blue" title="My Business"> <img src="/dhruv/images/business.png"></div><span><%=dasNav.getString("MYBUSINESS") %></span></a>
</div>
</div>
</div>
