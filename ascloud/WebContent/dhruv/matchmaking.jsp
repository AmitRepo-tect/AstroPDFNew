<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="java.util.ResourceBundle"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title></title>

<link rel="shortcut icon" href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
<%@include file='/dhruv/cssscript.jsp'%> 
<%




 Local localMatch = new Local(); 
 int languageCodeM = (Integer) session.getAttribute("languageCode");
 MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
 MyResourceBundle matchMakingConstants = (MyResourceBundle) localMatch.loadPropertiesFileNew("matchmaking", languageCodeM); 
 MyResourceBundle editChartConstants = (MyResourceBundle) localMatch.loadPropertiesFileNew("editchart-matchmaking", languageCodeM);
 MyResourceBundle newEditChartConstants = (MyResourceBundle) localMatch.loadPropertiesFileNew("newchart-editchart-matchmaking", languageCodeM);
 MyResourceBundle newmChartConst = localMatch.loadPropertiesFileNew("newchart",languageCodeM);

 Calendar cal = Calendar.getInstance();
 DesktopHoro Objhoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
 
//Session check 
Object userOb = session.getAttribute("userid");
UserDAO UD = new UserDAO();
int getPlanId=1; // Set the this variable as basic plan
getPlanId = Integer.parseInt(UD.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if(userOb != null ||  Objhoro !=null){	
	
if (getPlanId == 8 || getPlanId == 9 || getPlanId == 10 ){
%>

</head>
<body class="dhruv-soft">	
	<%@include file='/dhruv/header.jsp'%>
	<div id="contentArea">
		<div class="wrapper">
			<%@include file='/dhruv/navbar.jsp'%>
			<section class="content" id="contentView">


<%@include file="/dhruv/mmscript.jsp"%>
<div id="matchmaking">
	<form method="post" action="/cloud/createsession-matchmaking.jsp" onsubmit="return formValidation();" class="das-form">
		<div class="row">
			<div class="col s2"></div>
			<div class="col s12 l4">
				<div class="card-panel br-radius br-all z-depth-0">
				<h2><%=matchMakingConstants.getString("ENTER_BOYS_BIRTH_DETAILS")%></h2>
					<div id="personal" class="mrt-10">
						

						<div class="row">
							<div class="col s12">
								<label for="name"> <%=baseConstants.getString("NAM") %></label>

								<input id="name" type="text" name="name1" />



							</div>

							<div class="col s4 l4">

								<label for="day"> <%=rBConstants.getString("BD_DAY")%></label> <input
									type="text" name="day1" id="day"
									value='<%=cal.get(Calendar.DAY_OF_MONTH)%>' />

							</div>
							<div class="col s4 l4">
								<label for="month"><%=rBConstants.getString("BD_MONTH")%></label>
								<input type="text" name="month1" id="month"
									value='<%=cal.get(Calendar.MONTH)+1%>' />

							</div>
							<div class="col s4 l4">
								<label for="year"><%=rBConstants.getString("BD_YEAR")%></label>
								<input name="year1" type="text" size="4" maxlength="4"
									value='<%=cal.get(Calendar.YEAR)%>' id="year" />

							</div>

							<div class="col s4 l4">
								<label for="hrs"><%=rBConstants.getString("BD_HRS")%></label> <input
									type="text" name="hrs1" id="hrs"
									value="<%=cal.get(Calendar.HOUR_OF_DAY)%>" />

							</div>
							<div class="col s4 l4">
								<label for="min"><%=rBConstants.getString("BD_MIN")%></label> <input
									type="text" name="min1" id="min"
									value="<%=cal.get(Calendar.MINUTE)%>" />

							</div>
							<div class="col s4 l4">
								<label for="sec"><%=rBConstants.getString("BD_SEC")%></label> <input
									type="text" name="sec1" size="4"
									value="<%=cal.get(Calendar.SECOND)%>" id="sec" />

							</div>
							<div class="col s12 l12">
								<label for="place"> <%=baseConstants.getString("PLAC")%>
									(<%=newEditChartConstants.getString("MIN_3_CHAR") %>)
								</label> <input type="text" name="place1" id="place" value='' />
							</div>

							<div class="col s12">
								<a id="aTag"
									class="btn waves-effect btn-small bg-light-purple black-text well-css"
									href="javascript:toggleAndChangeText();"> [&#43;] <%=newmChartConst.getString("COORDINATES_AND_ADVANCE_SETTINGS") %></a>
							</div>

						</div>

						<div id="divToToggle" style="display: none;">
							<div class="row">
								<div class="col s4 l4">
									<label for="LongDeg"> <%=baseConstants.getString("LONGITUDE")%></label>
									<input type="text" name="longdeg1" id="LongDeg" value='' />
								</div>




								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <input
										type="text" name="longmin1" id="LongMin" value='' />
								</div>



								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <select
										id="LongEW" name="longew1" class="browser-default">
										<option value="E" selected="selected">E</option>
										<option value="W">W</option>
									</select>

								</div>

								<div class="col s4 l4">
									<label for="LatDeg"> <%=baseConstants.getString("LATITUDE")%></label>

									<input type="text" name="latdeg1" id="LatDeg" value='' />



								</div>
								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <input
										type="text" name="latmin1" id="LatMin" value='' />
								</div>

								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <select
										id="LatNS" name="latns1" class="browser-default">
										<option value="N" selected="selected">N</option>
										<option value="S">S</option>
									</select>
								</div>

								<div class="col s6 l6">
									<label for="dst"><%=editChartConstants.getString("DST_CORRECTION") %></label>
									<select id="dst" name="dst1" class="browser-default">

										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
									</select>

								</div>
								<div class="col s6 l6">
									<label for="timeZone"> <%=baseConstants.getString("TIME_ZONE") %></label>
									<input type="text" name="timezone1" id="timeZone" />

								</div>


								<div class="col s6 l6">
									<label for="ayanamsa"> <%=baseConstants.getString("AYANAMSA") %></label>
									<select size="1" name="ayanamsa" id="ayanamsa"
										class="browser-default">
										<option value="1"><%=baseConstants.getString("K_P_NEW") %></option>
										<option value="2"><%=baseConstants.getString("K_P_OLD") %></option>
										<option value="0" selected="selected"><%=newEditChartConstants.getString("N_C_LAHIRI") %></option>
										<option value="3"><%=newEditChartConstants.getString("B_V_RAMAN") %></option>
										<option value="4"><%=baseConstants.getString("K_P_KHULLAR") %></option>
										<option value="5"><%=baseConstants.getString("SAYAN") %></option>
									</select>

								</div>

								<div class="col s6 l6">
									<label for="charting"> <%=baseConstants.getString("CHART_TYPE") %></label>
									<select size="1" name="charting" id="charting"
										class="browser-default">
										<option selected="selected" value="0"><%=baseConstants.getString("NORTH_INDIAN") %></option>
										<option value="1"><%=baseConstants.getString("SOUTH_INDIAN") %></option>
									</select>

								</div>

							</div>
						</div>

					</div>

				</div>
			</div>




			<div class="col s12 l4">
				<div class="card-panel br-radius br-all z-depth-0">
					<h2><%=matchMakingConstants.getString("ENTER_GIRLS_BIRTH_DETAILS")%></h2>
					<div id="personal" class="mrt-10">
						<div class="row">
							<div class="col s12">
								<label for="name"> <%=baseConstants.getString("NAM") %></label>
								<input id="name1" type="text" name="name2" />


							</div>

							<div class="col s4 l4">

								<label for="day"> <%=rBConstants.getString("BD_DAY")%></label> <input
									type="text" name="day2" id="day1"
									value='<%=cal.get(Calendar.DAY_OF_MONTH)%>' />

							</div>
							<div class="col s4 l4">
								<label for="month"><%=rBConstants.getString("BD_MONTH")%></label>
								<input type="text" name="month2" id="month1"
									value='<%=cal.get(Calendar.MONTH)+1%>' />

							</div>
							<div class="col s4 l4">
								<label for="year"><%=rBConstants.getString("BD_YEAR")%></label>
								<input name="year2" type="text" size="4" maxlength="4"
									value='<%=cal.get(Calendar.YEAR)%>' id="year1" />

							</div>

							<div class="col s4 l4">
								<label for="hrs"><%=rBConstants.getString("BD_HRS")%></label> <input
									type="text" name="hrs2" id="hrs1"
									value="<%=cal.get(Calendar.HOUR_OF_DAY)%>" />

							</div>
							<div class="col s4 l4">
								<label for="min"><%=rBConstants.getString("BD_MIN")%></label> <input
									type="text" name="min2" id="min1"
									value="<%=cal.get(Calendar.MINUTE)%>" />

							</div>
							<div class="col s4 l4">
								<label for="sec"><%=rBConstants.getString("BD_SEC")%></label> <input
									type="text" name="sec2" size="4"
									value="<%=cal.get(Calendar.SECOND)%>" id="sec1" />

							</div>

							<div class="col s12 l12">
								<label for="place"> <%=baseConstants.getString("PLAC")%>
									(<%=newEditChartConstants.getString("MIN_3_CHAR") %>)
								</label> <input type="text" name="place2" id="place1" value='' />
							</div>
							<div class="col s12">
								<a id="aTag1"
									class="btn waves-effect btn-small bg-light-purple black-text well-css"
									href="javascript:toggleAndChangeText1();"> [&#43;] <%=newmChartConst.getString("COORDINATES_AND_ADVANCE_SETTINGS") %></a>
							</div>
						</div>


						<div id="divToToggle1" style="display: none;">
							<div class="row">
								<div class="col s4 l4">
									<label for="LongDeg"> <%=baseConstants.getString("LONGITUDE")%></label>
									<input type="text" name="longdeg2" id="LongDeg1" value='' />
								</div>




								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <input
										type="text" name="longmin2" id="LongMin1" value='' />
								</div>



								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <select
										id="LongEW1" name="longew2" class="browser-default">
										<option value="E" selected="selected">E</option>
										<option value="W">W</option>
									</select>

								</div>

								<div class="col s4 l4">

									<label for="LatDeg1"> <%=baseConstants.getString("LATITUDE")%></label>
									<input type="text" name="latdeg2" id="LatDeg1" value='' />



								</div>
								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <input
										type="text" name="latmin2" id="LatMin1" value='' />
								</div>

								<div class="col s4 l4">
									<label for="lat" style="visibility: hidden">Lat </label> <select
										id="LatNS1" name="latns2" class="browser-default">
										<option value="N" selected="selected">N</option>
										<option value="S">S</option>
									</select>
								</div>

								<div class="col s6 l6">
									<label for="dst1"> <%=editChartConstants.getString("DST_CORRECTION") %></label>
									<select id="dst1" name="dst2" class="browser-default">

										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
									</select>

								</div>
								<div class="col s6 l6">
									<label for="timeZone"> <%=baseConstants.getString("TIME_ZONE") %></label>
									<input type="text" name="timezone2" id="timeZone1" />

								</div>


								<div class="col s6 l6">
									<label for="ayanamsa1"> <%=baseConstants.getString("AYANAMSA") %></label>
									<select size="1" name="ayanamsa2" id="ayanamsa1"
										class="browser-default">
										<option value="1"><%=baseConstants.getString("K_P_NEW") %></option>
										<option value="2"><%=baseConstants.getString("K_P_OLD") %></option>
										<option value="0" selected="selected"><%=newEditChartConstants.getString("N_C_LAHIRI") %></option>
										<option value="3"><%=newEditChartConstants.getString("B_V_RAMAN") %></option>
										<option value="4"><%=baseConstants.getString("K_P_KHULLAR") %></option>
										<option value="5"><%=baseConstants.getString("SAYAN") %></option>
									</select>

								</div>

								<div class="col s6 l6">
									<label for="charting"> <%=baseConstants.getString("CHART_TYPE") %></label>
									<select size="1" name="charting2" id="charting1"
										class="browser-default">
										<option selected="selected" value="0"><%=baseConstants.getString("NORTH_INDIAN") %></option>
										<option value="1"><%=baseConstants.getString("SOUTH_INDIAN") %></option>
									</select>

								</div>

							</div>
						</div>
					</div>

					<input type="hidden" name="kphn" value="0"> <input
						type="hidden" name="sex1" value="male" /> 
						<input type="hidden" name="sex2" value="female" />
						
						<input type="hidden" name="referrer" value="/cloud/matchmakingoutput.asp">
				</div>
			</div>
		</div>
		<div align="center">
			<input type="submit"
				class="btn btn-large waves-effect bg-dark-purple center well-css"
				value="<%=matchMakingConstants.getString("MATCH_ME") %>"
				name="match" />
		</div>
	</form>
</div>
</section>
		</div>
	</div>
	<%@include file='/dhruv/footer.jsp'%> 
	<%
}else{	
	response.sendRedirect("/dhruv/purchage-modal.jsp");
}
}
else{	
	session.setAttribute("dhruvNewKundli", "0");
	response.sendRedirect("/cloud/login.asp");
}
	%>
</body>
</html>




