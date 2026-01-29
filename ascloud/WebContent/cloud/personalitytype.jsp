<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Know Your Personality Type</title>
</head>
<body>
<%
HashMap<String, String> map = (HashMap<String, String>)session.getAttribute("PMap");
String dominant = map.get("Dominant");
String subDominant = map.get("SubDominant");
%>


<div style="page-break-after: always; padding-top: 16px;">
			<h2 class="pg4-hdg">
				<span class="pg-hdg-bg bg-4"></span>
				Your Personality Type
			</h2>


			<div style="padding: 16px 24px;">
				
				<div class="barg">

					<div class="bar1 brd-i">
						<h3 class="barg-i-1">You are <%=dominant %></h3>
					</div>
					
				</div>

				
				<div class="row" style="margin-top: 20px">
					<div class="col-xs-12">
						<div class="intprt-box">
							<img src="http://aspdf.astrosage.com/images/icons/img_<%=dominant.toLowerCase().charAt(0) %>.png"
								class="intprt-box-icon1">
							<div class="intprt-hdg-sm txt-i"><%=map.get("DominantDescription") %></div>
							
						</div>
					</div>
				</div>
				
			</div>
			
			<div style="padding: 16px 24px;">
				
				<div class="barg">

					<div class="bar1 brd-i">
						<h3 class="barg-i-1">You are <%=subDominant %></h3>
					</div>
					
				</div>

				
				<div class="row" style="margin-top: 20px">
					<div class="col-xs-12">
						<div class="intprt-box">
							<img src="http://aspdf.astrosage.com/images/icons/img_<%=subDominant.toLowerCase().charAt(0) %>.png"
								class="intprt-box-icon1">
							<div class="intprt-hdg-sm txt-i"><%=map.get("SubDominantDescription") %></div>
							
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
</body>
</html>