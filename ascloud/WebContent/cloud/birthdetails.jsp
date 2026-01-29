<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="css/birth-details.css" rel='stylesheet' />
<link rel="stylesheet" type="text/css"
	href="/atlas/css/jquery.autocomplete.css" />
<script type="text/javascript" src="js/script/jquery.1.5.min.js"></script>
<script type='text/javascript' src='js/script/jquery.autocomplete.js'></script>

<script type="text/javascript" src="/cloud/js/kundli.js" charset="utf-8"></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>



<title>Insert title here</title>
</head>
<body>

<form>
 <div class="RecommendationHeading"
	  style="padding-top: 7px; width: 40%;">NAME : </div>
 <div class="RecommendationContent" style="float: left; width: 45%;">
 	<input name="name" id="name" class="inputtext" maxlength="50"
		style="width: 200px" value=""
		tabindex="1" />
 </div>
	<div class="RecommendationHeading"
	style="padding-top: 7px; width: 40%;">
	GENDER : </div>
	<div class="RecommendationContent" style="float: left; width: 45%;">
		<select size="1" name="sex" id="sex" tabindex="2">
			<option	value="male">Male</option>
			<option value="female">Female</option>
		</select>
	</div>
	<div class="RecommendationHeading"
		style="padding-top: 7px; width: 40%;">Date of Birth
		<font color="red" size="1">(DD/MM/YYYY)</font>
	</div>
	<div class="RecommendationContent" style="float: left; width: 45%;">
		<input type="text" name="day" id="day" class="inputtext"
			value='' size="2" maxlength="2"
			tabindex="3" style="width: 13%" autocomplete="off" /> <input
			type="text" name="month" id="month" class="inputtext"
			value='' size="2" maxlength="2"
			tabindex="4" style="width: 13%" autocomplete="off" /> <input
			name='year' size='4' maxlength='4' class="inputtext"
			value='' id='year' tabindex='5'
			style="width: 20%" autocomplete="off" />
	</div>
	<div class="RecommendationHeading"
		style="padding-top: 7px; width: 40%;">
		TIME OF BIRTH : 
		<font color="red" size="1">(in 24 hour format)
		</font>
	</div>
	<div class="RecommendationContent" style="width: 59%;">
		<input type="text" name="hrs" id="hrs" class="inputtext"
			value="" size="2" maxlength="2"
			tabindex="6" style="width: 13%" /> <input type="text" name="min"
			id="min" class="inputtext"
			value="" size="2" maxlength="2"
			tabindex="7" style="width: 13%" /> <input type="text" name="sec"
			size="2" class="inputtext" maxlength="2"
			value="" id="sec" tabindex="8"
			style="width: 13%" />
	</div>
	<div class="RecommendationHeading"
		style="padding-top: 15px; width: 40%;">
		PLACE : 
		<font color="red" size="1">(Minimum 3 char)
		</font>
	</div>
	<div class="RecommendationContent" style="float: left; width: 45%;">
		<input type="text" id="place" name="place" class="inputtext"
			maxlength="50" style="width: 200px"
			value="" tabindex="9" />
		<!--<input type="button" value="Get Value" onclick="lookupAjax();" />-->
	</div>
	<div class="RecommendationHeading"
		style="padding-top: 7px; width: 40%;">
		LONGITUDE : </div>
	<div class="RecommendationContent" style="float: left; width: 45%;">
		<input name="longdeg" id="LongDeg" class="inputtext"
			style="width: 13%" size="3" maxlength="3"
			value='' autocomplete="off"
			tabindex="10" /> <input name="longmin" id="LongMin"
			class="inputtext" style="width: 13%" size="2" maxlength="2"
			value='' autocomplete="off"
			tabindex="11" /> 
			<select size="1" name="longew" id="longEW" tabindex="12">
				<option value="E">E</option>
				<option value="W">W</option>
			</select>
	</div>
	<div class="RecommendationHeading"
		style="padding-top: 7px; width: 40%;">
		LATITUDE : </div>
		<div class="RecommendationContent" style="float: left; width: 45%;">
			<input name="latdeg" id="latDeg" class="inputtext"
				style="width: 13%" size="3" maxlength="3"
				value='' autocomplete="off"
				tabindex="10" /> <input name="latmin" id="latMin"
				class="inputtext" style="width: 13%" size="2" maxlength="2"
				value='' autocomplete="off"
				tabindex="11" /> 
				<select size="1" name="latns" id="latNS" tabindex="15">
					<option value="N">N</option>
					<option value="S">S</option>
				</select>
		</div>
		<div class="RecommendationHeading"
			style="padding-top: 7px; width: 40%;">
			 TIMEZONE : </div>
		<div class="RecommendationContent" style="float: left; width: 45%;">
			<input type="text" name="timezone" id="timezone"
				value='' class="inputtext"
				style="width: 20%" tabindex="16" maxlength="6" /> <input
				type="hidden" name="tags" value="" />
		</div>
</form>
</body>
</html>