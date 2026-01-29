<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties vimshottartiConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle vimshottartiLocalConstants = (new Local()).loadPropertiesFileNew("vimshottaridasha", languageCode);
%>

<div class="hdg-lg card">
	<h1><%=vimshottartiConstants.getString("VIMSHOTTARI_DASHA")%></h1>	
</div>

<div class="mrt-30">
<div class="card"> 

<div class="col s12 l6">
 <div class="collection">
	<a href="VMMD&AD.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_MD_AD")%></a>
	<a href="VMAD&PD1.asp" class="collection-item"><%=vimshottartiConstants.getString("Vimshottari_MD_AD_1")%></a>
	<a href="VMAD&PD2.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_MD_AD_2")%></a>
	<a href="VMAD&PD3.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_MD_AD_3")%></a>
	<a href="VMAD&PD4.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_MD_AD_4")%></a>
	<a href="VMAD&PD5.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_MD_AD_5")%></a>
</div>
</div>
<div class="col s12 l6">
 <div class="collection">	
	<a href="VMAD&PD&SD1.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_AD_PD_SD_1")%></a>
	<a href="VMAD&PD&SD2.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_AD_PD_SD_2")%></a>
	<a href="VMAD&PD&SD3.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_AD_PD_SD_3")%></a>
	<a href="VMAD&PD&SD4.asp" class="collection-item"> <%=vimshottartiConstants.getString("Vimshottari_AD_PD_SD_4")%></a>
  </div>
</div>
	</div>
	</div>
	<%@include file='ui-control/ad-content-area.jsp'%>
<p><%@include file='calculations-footer.jsp'%></p>