<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>


<div class="navbar-header">
	<%if(SharedFunction.Is_Mobile(request)){%>
	<button type="button" class="navbar-toggle-l" id="side-nav-slide-left">
		<span class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
	</button>
		<%@include file= '/controls/i_search-mobile.jsp'%>
		<%@include file='/controls/i_menu-mobile.jsp'%>
	<%}%>
</div>
<div class="collapse navbar-collapse">
	<%if(!SharedFunction.Is_Mobile(request)){%>
	<a class="fav-ico pull-left" href="/" data-toggle="tooltip-r"
		title="www.AstroSage.com: Vedic Astrology"><img width="50"
		style="margin-top: 3px;" src="/images/favicon.png"
		alt="Vedic Astrology - Horoscope - Online Kundli Software" /></a>
	<div class="ui-toplinks">
		<%@include file='/controls/i_toplinks.jsp'%>
	</div>
	<%@include file='/controls/i_search.jsp'%>
	<%}%>
</div>


