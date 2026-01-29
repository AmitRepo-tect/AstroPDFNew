<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
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
//Session check 
Object horoOb = session.getAttribute("HoroscopeObj");
Object userOb = session.getAttribute("userid");
UserDAO UD = new UserDAO();

int getPlanId=1; // Set the this variable as basic plan
getPlanId = Integer.parseInt(UD.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if(userOb != null ||  horoOb !=null){	
	
if (getPlanId == 8 || getPlanId == 9 || getPlanId == 10 ){
%>
</head>
<body class="dhruv-soft">	
	<%@include file='/dhruv/header.jsp'%>
		<div id="contentArea">
		<div class="wrapper">
			<%@include file='/dhruv/navbar.jsp'%>
			<section class="content" id="contentView">
<div class="row" id="swar">
	<div class="col s12 l3"></div>
	<div class="col s12 l6">
		<div class="card-panel br-radius br-all z-depth-0">
			<h2>ENTER DETAILS</h2>

			<form class="das-form mrt-30"
				action="https://www.astrosage.com/swarodaya/swardetail.asp" method="post"
				onsubmit="return formValidation();" name="dataReadForm">
				<div class="row">
					<div class="col s12">
						<label for="Name">Your Name </label> 
						<input type="text"	placeholder="Name" name="text1" id="text1" />

					</div>

					<div class="col s12">
						<label for="sex">Swar </label> 
						<select name="Firstword" id="Firstword" class="browser-default">
							 <option selected>A</option>
                                <option>Bha</option>
                                <option>Bhe</option>
                                <option>Bhi</option>
                                <option>Bho</option>
                                <option>Bhu</option>
                                <option>Cha</option>
                                <option>Che</option>
                                <option>Chha</option>
                                <option>Chi</option>
                                <option>Cho</option>
                                <option>Chu</option>
                                <option value="Daa">Da (दा)</option>
                                <option value="Da">Da (डा)</option>
                                <option value="Dae">De (दे)</option>
                                <option value="De">De (डे)</option>
                                <option>Dha</option>
                                <option value="Dai">Di (दी)</option>
                                <option value="Di">Di (डी)</option>
                                <option value="Dao">Do (दो),</option>
                                <option value="Do">Do (डो)</option>
                                <option value="Dau">Du (दू)</option>
                                <option value="Du">Du (डू)</option>
                                <option>E</option>
                                <option>Ga</option>
                                <option>Ge</option>
                                <option>Gha</option>
                                <option>Gi</option>
                                <option>Go</option>
                                <option>Gu</option>
                                <option>Ha</option>
                                <option>He</option>
                                <option>Hi</option>
                                <option>Ho</option>
                                <option>Hu</option>
                                <option>I</option>
                                <option>Ja</option>
                                <option>Je</option>
                                <option>Jha</option>
                                <option>Ji</option>
                                <option>Jo</option>
                                <option>Ju</option>
                                <option>Ka</option>
                                <option>Ke</option>
                                <option>Kha</option>
                                <option>Khe</option>
                                <option>Khi</option>
                                <option>Kho</option>
                                <option>Khu</option>
                                <option>Ko</option>
                                <option>Ki</option>
                                <option>Ku</option>
                                <option>La</option>
                                <option>Le</option>
                                <option>Li</option>
                                <option>Lo</option>
                                <option>Lu</option>
                                <option>Ma</option>
                                <option>Me</option>
                                <option>Mi</option>
                                <option>Mo</option>
                                <option>Mu</option>
                                <option>Na</option>
                                <option>Na</option>
                                <option>Ne</option>
                                <option>Nga</option>
                                <option>Ni</option>
                                <option>Nja</option>
                                <option>No</option>
                                <option>Nu</option>
                                <option>Pa</option>
                                <option>Pe</option>
                                <option>Pha</option>
                                <option>Pi</option>
                                <option>Po</option>
                                <option>Pu</option>
                                <option>Ra</option>
                                <option>Re</option>
                                <option>Rha</option>
                                <option>Ri</option>
                                <option>Ro</option>
                                <option>Ru</option>
                                <option>Sa</option>
                                <option>Se</option>
                                <option>Sha</option>
                                <option>Si</option>
                                <option>So</option>
                                <option>Su</option>
                                <option value="Taa">Ta (ता)</option>
                                <option value="Ta">Ta (टा)</option>
                                <option value="Tae">Te (ते)</option>
                                <option value="Te">Te (टे)</option>
                                <option>Tha</option>
                                <option value="Tai">Ti (ती)</option>
                                <option value="Ti">Ti (टी)</option>
                                <option value="Tao">To (तो)</option>
                                <option value="To">To (टो)</option>
                                <option value="Tau">Tu (तू)</option>
                                <option value="Tu">Tu (टू)</option>
                                <option>U</option>
                                <option>Va</option>
                                <option>Ve</option>
                                <option>Vi</option>
                                <option>Vo</option>
                                <option>Vu</option>
                                <option>Ya</option>
                                <option>Ye</option>
                                <option>Yi</option>
                                <option>Yo</option>
                                <option>Yu</option>
						</select>

					</div>
				</div>

				<div class="center">
					<button
						class="btn btn-large waves-effect bg-dark-purple center well-css" value="Get Swar Details" type="submit">Get Swar Details</button>

				</div>


			</form>

		</div>
	</div>
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