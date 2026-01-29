<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Know Your Personality Type</title>
<link rel="stylesheet" type="text/css" href="css/app-ca.css">
<style>
.box-setting{background:#e7e7e7; border-radius:150px 20px 20px 150px; padding:16px;position:relative;}
.box-setting img {width: 90px; left: -12px;position: absolute; top:-24px;}
.box-setting .clbar {display:inline-block;border-radius: 150px; padding: 8px;}
.clbar span{padding-left:76px;}
.box-setting{padding:0px;border-radius: 150px; color:#fff;}
</style>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-xs-12">
<div class="card-panel">
			<h2 class="pg4-hdg">
				<span class="pg-hdg-bg bg-4"></span>
				Your Personality Types are in the following order: 
			</h2>
	<%
	int[] arr = (int[]) session.getAttribute("riasecArray");
	Map<String, Integer> map = (Map<String, Integer>)session.getAttribute("PMap");
	%>		
	<div class="box-setting"> Received R: <%=request.getParameter("r")%>, Calculated R : <%=arr[0] %>, Astrology+Psychology R : <%=map.get("R") %></div>
	<div class="box-setting">&nbsp;&nbsp;</div>	
	<div class="box-setting"> Received I: <%=request.getParameter("i")%>, Calculated I : <%=arr[1] %>, Astrology+Psychology I : <%=map.get("I") %></div>
	<div class="box-setting">&nbsp;&nbsp;</div>	
	<div class="box-setting"> Received A: <%=request.getParameter("a")%>, Calculated A : <%=arr[2] %>, Astrology+Psychology A : <%=map.get("A") %></div>
	<div class="box-setting">&nbsp;&nbsp;</div>	
	<div class="box-setting"> Received S: <%=request.getParameter("s")%>, Calculated S : <%=arr[3] %>, Astrology+Psychology S : <%=map.get("S") %></div>
	<div class="box-setting">&nbsp;&nbsp;</div>	
	<div class="box-setting"> Received E: <%=request.getParameter("e")%>, Calculated E : <%=arr[4] %>, Astrology+Psychology E : <%=map.get("E") %></div>
	<div class="box-setting">&nbsp;&nbsp;</div>	
	<div class="box-setting"> Received C: <%=request.getParameter("c")%>, Calculated C : <%=arr[5] %>, Astrology+Psychology C : <%=map.get("C") %></div>
	<div class="box-setting">&nbsp;&nbsp;</div>				
<%
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
Local local = new Local();

MyResourceBundle cogniConst = local.loadPropertiesFileNew("cogniastro",languageCode);



for (Map.Entry<String, Integer> entry : map.entrySet()) 
{
	String key = entry.getKey();
	int value = entry.getValue();
%>

	<input type="hidden" name="<%=key%>" value="<%=value %>" />		
<% }
for (Map.Entry<String, Integer> entry : map.entrySet()) 
{
	String key = entry.getKey();
	int value = entry.getValue();
%>
				
				
				<div class="box-setting">
				 <div class="bg-<%=key.toLowerCase()%> clbar" style="width:<%=value%>%">
							<img src="http://aspdf.astrosage.com/images/icons/img_<%=key.toLowerCase()%>.png">
							<span><%=cogniConst.getString(key+"_ONLY") %></span>
						</div>
					</div>
				
				<div class="col-xs-4">
				<div class=""><p><%=cogniConst.getString(key+"_DESC")%></p></div>
				</div>
				
		
<% } %>	

</div>
</div>

</div>

</body>
</html>