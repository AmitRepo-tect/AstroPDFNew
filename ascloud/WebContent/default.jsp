<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="cloud/dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="dist/css/app.css">
<link type="text/css" rel="stylesheet" href="cloud/dist/css/responsive.css">
<link type="text/css" rel="stylesheet" href="cloud/dist/css/perfect-scrollbar.css">
<link type="text/css" rel="stylesheet" href="cloud/js/script/jquery.autocomplete.css" />

<script type="text/javascript" src="cloud/dist/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.js"></script>
<script type="text/javascript" src="cloud/dist/js/perfect-scrollbar.min.js"></script>
<script type='text/javascript' src='cloud/js/script/jquery.autocomplete.js'></script>
	
<script type="text/javascript" src="/dhruv/js/app.js"></script>

<script type="text/javascript" src="/kundli/js/Editkundli-js.jsp" charset="utf-8"></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script type="text/javascript" src="/kundli/js/gpsfill.js"></script>
<script type="text/javascript" src="/dist/js/shared-functions.js"></script>

<script language="javascript" type="text/javascript">

//---------------------
    function toggleAndChangeText() {
        $('#divToToggle').toggle();
        if ($('#divToToggle').css('display') == 'none') {
            $('#aTag').html('[&#43]  Settings ');
        }
        else {
            $('#aTag').html('[&#8722] Settings ');
        }
    }
    function fillkphn() {

        $("#kphn").val(randomMinToMax(1, 249));
    }
    function randomMinToMax(c, a) {
        var b = a - c + 1;
        return Math.floor(Math.random() * b + c)
    }
    function getgpsAccuracy() {
        msg = 'Estimated GPS Accuracy is ' + $("#accuracy").val() + ' meters'
        alert(msg);
    }
    function setCurrDatTim() {
        var currentTime = new Date();
        $("#Day").val(currentTime.getDate());
        $("#Month").val(currentTime.getMonth() + 1);
        $("#Year").val(currentTime.getFullYear());
        $("#Hrs").val(currentTime.getHours());
        $("#Min").val(currentTime.getMinutes());
        $("#Sec").val(currentTime.getSeconds());
        $("#Name").val($("#Day").val() + "/" + $("#Month").val() + "/" + $("#Year").val() + " " + currentTime.getHours() + ":" + currentTime.getMinutes() + ":" + currentTime.getSeconds());

    }
    function findlocation(clickType) {
        $("#dstval").html('');
        autofillgps(clickType);
    }        

</script>



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
	<%@include file='/dhruv/newkundli.jsp'%> 
</section>
		</div>
	</div>
	<%@include file='/dhruv/footer.jsp'%> 
	<%@include file='/dhruv/openchart.jsp'%> 
	
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