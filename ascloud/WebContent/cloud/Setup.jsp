<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set up the Horoscope Object</title>
</head>
<body>
	<form name="astrosagecloud" method="post" action="/cloud/home.asp">

		<table width='100%'>
			<tr>
				<td><label for="Name">Name:</label> <input type="text"
					name="name" id="name" value="" /> <label for="Place">Place:</label>
					<input type="text" name="place" id="place" value="" /></td>
			</tr>
			<tr>
				<td><label for="Gender">Gender:</label> <input type="text"
					name="sex" id="sex" value="" /> <label for="DOB">Date Of
						Birth:</label> <input type="text" name="day" id="day" value="" /></td>
			</tr>
			<tr>
				<td><label for="MOB">Month:</label> <input type="text"
					name="month" id="month" value="" /> <label for="YOB">Year:</label>
					<input type="text" name="year" id="year" value="" /></td>
			</tr>
			<tr>
				<td><label for="Hour">Hr</label> <input type="text" name="hrs"
					id="hrs" value="" /> <label for="Minute">Min</label> <input
					type="text" name="min" id="min" value="" /></td>
			</tr>
			<tr>
				<td><label for="Second">Sec</label> <input type="text"
					name="sec" id="sec" value="" /> <label for="Timezone">Timezone:</label>
					<input type="text" name="timeZone" id="timeZone" value="" /></td>
			</tr>
			<tr>
				<td><label for="LongDeg">LongDeg</label> <input type="text"
					name="longDeg" id="longDeg" value="" /> <label for="LongMin">LongMin</label>
					<input type="text" name="longMin" id="longMin" value="" /></td>
			</tr>
			<tr>
				<td><label for="EW">EW</label> <input type="text" name="longEW"
					id="longEW" value="" /> <label for="LatDeg">LatDeg</label> <input
					type="text" name="latDeg" id="latDeg" value="" /></td>
			</tr>
			<tr>
				<td><label for="LatMin">LatMin</label> <input type="text"
					name="latMin" id="latMin" value="" /> <label for="NS">NS</label> <input
					type="text" name="latNS" id="latNS" value="" /></td>
			</tr>
			<tr>
				<td><label for="DST">DST</label> <input type="text" name="dst"
					id="dst" value="" /> <label for="LanguageCode">LanguageCode</label>
					<input type="text" name="languageCode" id="languageCode" value="" />
				</td>
			</tr>
			<tr>
				<td>
		</table>
		<label for="Ayanamsa">Ayanamsa</label> <select name="ayanamsa"
			id="ayanamsa">
			<option value="0">N_C_LAHIRI</option>
			<option value="1">K_P_NEW</option>
			<option value="2">K_P_OLD</option>
			<option value="3">B_V_RAMAN</option>
			<option value="4">K_P_KHULLAR</option>
			<option value="5">SAYAN</option>
		</select> <label for="charttype">Ayanamsa</label> <select name="charttype"
			id="charttype">
			<option value="0">North</option>
			<option value="1">South</option>
			<option value="2">East</option>
		</select> </br> </br> <input type="submit" class="as-ui-button" value="Submit" />

	</form>
</body>
</html>