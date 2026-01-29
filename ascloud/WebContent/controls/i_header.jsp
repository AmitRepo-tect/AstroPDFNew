<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>


<%if(!SharedFunction.Is_Mobile(request)){%>
<div class="ui-head-grid">
	<div class="ui-head-block-a logo">
		<a href="http://www.astrosage.com/"
			data-title="Free Kundli & Horoscope Matching"> <img
			src="/images/logo.png" border="0" width="140"
			alt="Free Kundli & Horoscope Matching"></a>
	</div>
	<div class="ui-head-block-b gpls">
		<g:plusone size="tall" href="http://www.astrosage.com"></g:plusone>
	</div>
	<div class="ui-head-block-c">
		<div class="zodiac-sign">
			<%@include file='/controls/i_zodiac.jsp'%>
		</div>
	</div>
	<div class="ui-language ui-head-block-d">
		<%@include file='/controls/i_language.jsp'%>
	</div>
	<div class="ui-clear"></div>
</div>
<div id="navbar" class="navbar_absolute">
	<div class="ui-topnav">
		<%@include file='/controls/i_menu.jsp'%>
	</div>
	<div style="clear: both"></div>
</div>
<%}%>

