<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ojassoft.astrosagecloud.localization.*" %>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%

DesktopHoro dt = (DesktopHoro)session.getAttribute("myobj");
out.println(dt.getName());

%>