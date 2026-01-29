<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>Welcome TO The World Of Astrology</title>
</head>

<body>

	<table borderColor="#E8F0F8" cellSpacing="0" cellPadding="0"
		width="100%" border="1">
		<tbody>
			<tr>
				<td width="100%" bgcolor="#E8F0F8">
					<!-- <img src="images\kushal\bhoot1.jpg"> -->
					<h2 align="center">
						<font color="#181068">Shodashvarga Kundlis</font>
					</h2>
				</td>
			</tr>
		</tbody>
	</table>

	<table width=60% align="center">
		<tr>
			<br>
			<td bgcolor="ccccff">
				<h3 align="center">
					<font color="#181068">Hora &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						Wealth</font>
					</h2>
			</td>
		</tr>
	</table>

	<%out.println(((NorthChart)request.getAttribute("objChart")).printChart()); %>

	<center>

		<hr>
	</center>

	<p align="left">
		<font size="1">Copyright © 2002-2005, AstroCAMP </font>
	</p>
	<p>&nbsp;</p>
</body>
</html>

