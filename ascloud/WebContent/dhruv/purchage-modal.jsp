<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local openLocal = new Local();
int openLangCode = Util.safeInt(session.getAttribute("languageCode"));
Object objConst = session.getAttribute("constants");
MyProperties openRBConstants = null;
if(objConst == null)
{
	openRBConstants = new MyProperties(openLocal.loadPropertiesFile("constants", openLangCode));
	session.setAttribute("constants", openRBConstants);
}
else
{
	openRBConstants = (MyProperties) objConst;
}
String printLangPM = "";
if(openLangCode == 1){
	printLangPM = "hi";	
}else{
	printLangPM = "en";	
}

MyResourceBundle dasPM = openLocal.loadPropertiesFileNew("dhruv", openLangCode);
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title>Dhruv Astro Software</title>

<link rel="shortcut icon" href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
<%@include file='/dhruv/cssscript.jsp'%> 

<script type="text/javascript">

    $(document).ready(function() {
    	$('#purchage-plan').modal()[0].M_Modal.options.dismissible = false;
    	$("#purchage-plan").modal('open');    	
    });    
	function getPlan(){
    	$("#purchage-plan").modal('close');  
    	$("#buyService").modal('open');
    	getEvents('daspopup', 'buyfromdashboardpopup');
    	}

</script>

</head>

<body class="dhruv-soft">
<%@include file='/dhruv/header.jsp'%>
	<div id="contentArea">
		<div class="wrapper">
		<%@include file='/dhruv/navbar.jsp'%> 	
<section class="content" id="contentView">

</section>
</div>
	</div>
	<%@include file='/dhruv/footer.jsp'%> 
	
	
<div id="purchage-plan" class="modal model-bar bg-white">
  <div class="modal-content center-align">
   <a href="javascript:getPlan();">  
   		<img src="images/dhruv-plan-<%=printLangPM %>.jpg" class="responsive-img hide-on-small-only"/>
   		<img src="images/dhruv-plan-m-<%=printLangPM %>.jpg" class="responsive-img hide-on-large-only"/>
   	</a>	
   	
   	<a href="/cloud/home.asp" class="modal-close waves-effect waves-green btn-flat right mrb12" onclick="getEvents('daspopup', 'gotoastrosage');"><%=dasPM.getString("GOTO_ASTROSAGE")%> <i class="material-icons text-purple right">arrow_forward</i></a>
</div>

</div>
<style>
.modal-content h2{font-size:32px;margin-top:24px;}
.modal-content h3{font-size:18px;margin-top:24px;}
.modal-content .mrt24{margin-top:24px;}
.modal-content .mrb12{margin-bottom:12px;}
#buyService.modal {max-height: 40%; width: 35%; will-change: top, opacity;}
.plnbox{padding:8px;}
</style>

<div id="buyService" class="modal model-bar bg-white">

  <div class="modal-content center-align">
  
  <div class="row">
  
  <div class="col s6">
  <div class="plnbox">
  	<h2><%=dasPM.getString("MONTHLY_PLAN")%></h2>
  	 <h3 class="text-dark-purple"><b><%=dasPM.getString("PRICE")%>:</b> <strike>&#x20B9; 1500</strike> <b>&#x20B9; 999/-</b></h3>
     
     <a href="https://buy.astrosage.com/service/astrosage-cloud-paid-plan-platinum-one-month?language=<%=printLangPM %>&prtnr_id=DASLP" onclick="getEvents('daspopup', 'buyfromdashboard');" class="mrt24 btn waves-effect btn-large bg-dark-purple">  
   		<%=dasPM.getString("BUY_MONTHLY")%>
   	</a>
   	</div>
  </div>
    <div class="col s6">
    <div class="plnbox">
      <h2><%=dasPM.getString("YEARLY_PLAN")%></h2>
      <h3 class="text-dark-blue"><b><%=dasPM.getString("PRICE")%>:</b> <strike>&#x20B9; 15000</strike> <b>&#x20B9; 9999/-</b></h3>
     <a href="https://buy.astrosage.com/service/astrosage-cloud-paid-plan-platinum?language=<%=printLangPM %>&prtnr_id=DASLP" onclick="getEvents('daspopup', 'buyfromdashboard');" class="mrt24 btn waves-effect btn-large bg-dark-blue">  
   		<%=dasPM.getString("BUY_YEARLY")%>
   	</a>
   	</div>
  </div>
	</div>
	<a href="/cloud/home.asp" class="modal-close waves-effect waves-green btn-flat right mrb12" onclick="getEvents('daspopup', 'gotoastrosage');"><%=dasPM.getString("GOTO_ASTROSAGE")%> <i class="material-icons text-purple right">arrow_forward</i></a>
</div>

      
 
</div>	 
</body>
</html>





