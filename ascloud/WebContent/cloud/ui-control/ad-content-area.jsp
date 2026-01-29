<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%if(Util.isMobileDevice(request)) { %>
<div align="center" class="mrt-20">
    <%@include file="responsive-ad.jsp"%>
</div>
<%}%>