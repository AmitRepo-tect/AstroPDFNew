<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="service" class="com.ojassoft.astrosagecloud.DO.Services" scope="request" />

<%
try
{
Local local2 = new Local();
int languageCode1 = Util.safeInt(session.getAttribute("languageCode"));

MyProperties rBConstants1 = (MyProperties) session.getAttribute("constants");
MyResourceBundle iServicesConstants = local2.loadPropertiesFileNew("i_services",languageCode1);
MyResourceBundle servOrdConstants = local2.loadPropertiesFileNew("service-order",languageCode1);
String autoReportDeliveryNote = servOrdConstants.getString("DELIVERY_NOTE");
String detailedReportDeliveryNote = servOrdConstants.getString("DELIVERY_NOTE1");
UserDAO objUdao=new UserDAO();
HashMap<String, String> userDetailsHM;
String userIdmy = Util.safestr(session.getAttribute("User_Id"));
String emailId = "", mobileNo = "", genderVal="";
if(!("").equals(userIdmy)){
	userDetailsHM = objUdao.getRecordOfUser(userIdmy,null);	
	emailId = userDetailsHM.get("email");
	mobileNo = userDetailsHM.get("mobile");
}
DesktopHoro objFileHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
String userNameVal="",userHOBVal="",userMinOBVal="",userPlaceVal="",userLongDegVal="",userLongMinVal="",userLongEWVal="";
String userLatDegVal="",userLatMinVal="",userLatNSVal="",userTimezoneVal="",userDSTVal="";
int userDOBVal=0,userMOBVal=0,userYOBVal=0;
boolean isObjHoroNull = true;
if(objFileHoro!=null){
	isObjHoroNull = false;
	if (objFileHoro.getMaleFemale()!=null && !("").equals(objFileHoro.getMaleFemale()) && (objFileHoro.getMaleFemale().equals("पुरुष") || objFileHoro.getMaleFemale().equals("male") || objFileHoro.getMaleFemale().equals("Male") || objFileHoro.getMaleFemale().equals("m") || objFileHoro.getMaleFemale().equals("M")))
	{
	    genderVal = "male";
	}
	else if (objFileHoro.getMaleFemale()!=null && !("").equals(objFileHoro.getMaleFemale()) && (objFileHoro.getMaleFemale().equals("स्त्री") || objFileHoro.getMaleFemale().equals("female") || objFileHoro.getMaleFemale().equals("Female") || objFileHoro.getMaleFemale().equals("f") || objFileHoro.getMaleFemale().equals("F")))
	{
			genderVal = "female";		
	}
	userNameVal = objFileHoro.getName();
	userDOBVal = objFileHoro.getDayOfBirth();
	userMOBVal = objFileHoro.getMonthOfBirth();
	userYOBVal = objFileHoro.getYearOfBirth();
	userHOBVal = objFileHoro.getHourOfBirth();
	userMinOBVal = objFileHoro.getMinuteOfBirth();
	userPlaceVal = objFileHoro.getPlace();
	userLongDegVal = objFileHoro.getDegreeOfLongitude();
	userLongMinVal = objFileHoro.getMinuteOfLongitude();
	userLongEWVal = objFileHoro.getEastWest();
	userLatDegVal = objFileHoro.getDegreeOfLattitude();
	userLatMinVal = objFileHoro.getMinuteOfLattitude();
	userLatNSVal = objFileHoro.getNorthSouth();
	userTimezoneVal = objFileHoro.getTimeZone();
	userDSTVal = objFileHoro.getDST();
	
}
%>
<script type="text/javascript">
    $("div.divServiceDetails").hide();

    function showServiceDetails() {
        $('div.divServiceDetails').toggle('slow');
    }     
</script>

<script language="javascript" type="text/javascript">
    
    function validateOrderForm(payCurrency) { 	    
    	
 	    if(payCurrency=='USD'){    		
 	    	document.getElementById("ddCountry").value = 'Other';
    		}
 	    else{
 	    	document.getElementById("ddCountry").value = 'IN'; 	    	
 	    }    	
	    if (document.getElementById("ddDay").value == "") {
            alert('<%=servOrdConstants.getString("VALIDATE_SELECT_CHART") %>');
            return (false);
        }
	    
	    if(document.getElementById('txtQuestion').value == ""){
	    	alert('<%=rBConstants1.getString("ALL_FIELD_VALUES_REQUIRED") %>');
            document.getElementById("txtQuestion").focus();
            return (false);
	    }

        if (document.getElementById("textEmail").value == "") {
            alert('<%=rBConstants1.getString("EMAIL_SHOULD_NOT_BE_BLANK") %>');
            document.getElementById("textEmail").focus();
            return (false);
        }

        if (echeck(document.getElementById("textEmail").value) == false) {
            document.getElementById("textEmail").focus();
            return (false);
        }
        if(document.getElementById("phoneNumber").value!=""){
	        if(isNaN(document.getElementById("phoneNumber").value)){	        	
	        	alert('<%=rBConstants1.getString("INVALID_MOBILE_NO") %>');
	        	document.getElementById("phoneNumber").focus();
	            return (false);
	        }
        }
        document.getElementById("textEmailConf").value = document.getElementById("textEmail").value;
        frmOrderPopup.submit();
    }

    function echeck(str) {
        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)

        if (str.indexOf(at) == -1) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(" ") != -1) {
            alert('<%=rBConstants1.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        return true
    }

    function limitText(limitField, limitCount, limitNum) {
        if (limitField.value.length > limitNum) {
            limitField.value = limitField.value.substring(0, limitNum);
        }
        else {
            limitCount.value = limitNum - limitField.value.length;
        }
    }
     
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $(".toggle_container").hide();       
        $("h5.expand_heading").click(function() {
            $(this).next(".toggle_container").slideToggle("slow");
        });
        $(".expand_all").click(function() {
            $(".toggle_container").slideToggle("slow");
        });
        //$('#problemDiv').hide();
    });
</script>
<script type="text/javascript">
    // Popup window code
    function newPopup(url) {
        popupWindow = window.open(
        url, 'popUpWindow', 'height=410,width=620,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');        
    }

    function openServicePopup(serviceId, serviceName, serviceImg, servicePrice, serviceActualPrice, sampleURL, sampleURLHI, serviceDesc, partnerId){ 	
    	$('#serviceDetails').show();
    	if(!<%=isObjHoroNull%>){   		
    		if(serviceId==148){    		
            	$('#servicesDescBrihat').show();
            	$('#servicesDesc').hide();
    		}
    		else{
    			$('#servicesDesc').show();
    			$('#servicesDescBrihat').hide();
    		}
    	//alert(serviceName+','+serviceImg+','+servicePrice+','+partnerId);    
    	arrLangCode = ["en", "hi", "ta", "", "ka", "te", "bn", "gu","ml","mr"];
    	
    	if('<%=languageCode1%>'==1){
    		sampleURL = sampleURLHI;
    	}    	
    	
    	if(partnerId == ""){    		
    		partnerId = "1";
    	}
    	$('#pdfSampleDiv').show();
    	document.forms["frmOrderPopup"].action = "https://www.astrocamp.com/service.asp?service_id="+serviceId+"&prtnr_id="+partnerId;
    	document.getElementById('serviceName').innerHTML = serviceName; 
    	document.getElementById('serviceImg').src = "/cloud/images/icons/"+serviceImg;
    	document.getElementById('servActualPrice').innerHTML = '<strike>  Rs. '+serviceActualPrice+'/- </strike>';
    	document.getElementById('pdfSampleURL').href = sampleURL;
    	document.getElementById('servicePrice').innerHTML = '<b>  Rs. '+servicePrice+"/-</b>";
    	document.getElementById('servicesDesc').innerHTML = serviceDesc;
    	document.getElementById('txtQuestion').value = serviceName+"-"+arrLangCode['<%=languageCode1%>'];
    	document.getElementById('deliveryNote').innerHTML = '<%=autoReportDeliveryNote%>';
    	$('#problemDiv').hide();
    	$('#buy-service').modal('open'); 
    	<%if(SharedFunction.Is_Mobile(request)){%>
    		showLessMoreText();
    	<%}%>
    	}
    	else{
    	//alert("Object Null");
    	serviceName = serviceName.toLowerCase();
    	serviceName = serviceName.replace(/ /g,"-");
    	//alert(serviceName);
    	window.location.href="https://buy.astrosage.com/service/"+serviceName;
    	}
    }
	function openDetailedServicePopup(serviceId, serviceName, serviceImg, servicePrice, serviceActualPrice, sampleURL, sampleURLHI, serviceDesc, partnerId, problem){ 	
		$('#servicesDescBrihat').hide();
		$('#serviceDetails').hide();
		$('#problemDiv').hide();
    	if(!<%=isObjHoroNull%>){    		
    	    
    	arrLangCode = ["en", "hi", "ta", "", "ka", "te", "bn", "gu","ml","mr"];
    	
    	if('<%=languageCode1%>'==1){
    		sampleURL = sampleURLHI;
    	}    	
    	
    	if(partnerId == ""){    		
    		partnerId = "1";
    	}    	
    	document.forms["frmOrderPopup"].action = "https://www.astrocamp.com/service.asp?service_id="+serviceId+"&prtnr_id="+partnerId;
    	document.getElementById('serviceName').innerHTML = serviceName; 
    	document.getElementById('serviceImg').src = "/cloud/images/icons/"+serviceImg;
    	document.getElementById('servActualPrice').innerHTML = '<strike>  Rs. '+serviceActualPrice+'/- </strike>';
    	if(problem==''){
    		document.getElementById('txtQuestion').value = '';
    		$('#problemDiv').show();
    	}
    	else{
    		document.getElementById('txtQuestion').value = problem;
    	}
    	
    	$('#pdfSampleDiv').hide();    	
    	document.getElementById('servicePrice').innerHTML = '<b>  Rs. '+servicePrice+"/-</b>";
    	if(serviceDesc!=''){
    		document.getElementById('servicesDesc').innerHTML = serviceDesc;
    		$('#serviceDetails').show();
    	}
    	document.getElementById('deliveryNote').innerHTML = '<%=detailedReportDeliveryNote%>';
    	$('#buy-service').modal('open'); 
    	<%if(SharedFunction.Is_Mobile(request)){%>
    		showLessMoreText();
    	<%}%>
    	}
    	else{
    	//alert("Object Null");
    	serviceName = serviceName.toLowerCase();
    	serviceName = serviceName.replace(/ /g,"-");
    	//alert(serviceName);
    	window.location.href="https://buy.astrosage.com/service/"+serviceName;
    	}
    }
</script>
<div id="buy-service" class="modal pg-buy-services">
          <div class="model-header amber darken-1">
            <h4 class="white-text padding-all-5"> <span id="serviceName"> </span>    
            <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
            </h4>
         </div>
 <div class="modal-content ui-forms-setting1 clearfix">
 <span id="headad"></span>
		<div class="ui-forms-setting">
		<div class="OrdPage">			

			<!--<form name="frmOrder" id="frmOrder" action="http://www.astrocamp.com/service.asp?prtnr_id=1" onsubmit="return validateOrderForm(this)" method="post">
			 <form name="frmOrder" id="frmOrder" action="http://localhost/service.asp?service_id=<%//=serviceId%>&prtnr_id=1" onsubmit="return validateOrderForm(this)" method="post">-->
			 <div class="as-buy-services" id="serviceDetails">
			 <div class="row">
			 <div class="col s4 l2">
			 <div class="buy-img"> 
			 <img id="serviceImg" />
			 </div>
			  <div class="as-sam" id="pdfSampleDiv"> 
			 	<a href="" id="pdfSampleURL" target="_blank"> <b> <%=servOrdConstants.getString("VIEW_SAMPLE") %></b></a>
			 </div>
			    
			  </div>
			 <div class="col s8 l10">
			 
			  <div class="as-ul" id="servicesDesc">
			 
			 </div> 
		  	<div class="as-ul-1" id="servicesDescBrihat"> 
			 <ul>  
			   	<li>
			   		<i class="material-icons">star</i> <div class="as-left"> <%=iServicesConstants.getString("BRIHAT_HORO_DESC_1") %> </div>  </li>
				    <li><i class="material-icons">star</i> <div class="as-left"> <%=iServicesConstants.getString("BRIHAT_HORO_DESC_2") %> </div>  </li>
				    <li><i class="material-icons">star</i> <div class="as-left"> <%=iServicesConstants.getString("BRIHAT_HORO_DESC_3") %> </div>  </li>
				    <li><i class="material-icons">star</i> <div class="as-left"> <%=iServicesConstants.getString("BRIHAT_HORO_DESC_4") %> </div>  </li>
				    <!-- <li><i class="material-icons">star</i> <div class="as-left"> <%//=iServicesConstants.getString("BRIHAT_HORO_DESC_5") %> </div>  </li> -->			   
			 </ul>
			 </div>			
			 </div>
			 </div>
			 </div>
			 
			<div class="col s12 l12"> 
				<div class="as-radio">	
					<%=servOrdConstants.getString("REPORT_PRICE") %>: <span class="text-red" id="servActualPrice">  </span> <span class="pr-bold" id="servicePrice">   </span>
				</div>
		    </div>		
			 <form name="frmOrderPopup" id="frmOrderPopup" class="pg-form" action="" onsubmit="return validateOrderForm(this)" method="post">
			  <div class="row"> 
                
                <div class="col s12 l12">                

                	<input type="hidden" name="txtEmailConf" id="textEmailConf" value="<%=emailId %>" /> 
                	<input type="hidden" name="txtRegName" id="txtRegName" value="<%=userNameVal%>" /> 
                	<input type="hidden" name="PerInfo_name" id="PerInfo_name" value="<%=userNameVal%>" /> 
                	<input type="hidden" name="PerInfo_gender" id="PerInfo_gender" value="<%=genderVal %>" /> 
                	<input type="hidden" name="forWhom" id="forWhom" value="other" /> 
                	<input type="hidden" name="ddlDay" id="ddDay" value="<%=userDOBVal %>" /> 
                	<input type="hidden" name="ddlMonth" id="ddMonth" value="<%=userMOBVal %>" /> 
                	<input type="hidden" name="ddlYear" id="ddYear" value="<%=userYOBVal %>" /> 
                	<input type="hidden" name="ddlHour"	id="ddHour" value="<%=userHOBVal %>" /> 
                	<input type="hidden" name="ddlMinute" id="ddMinute" value="<%=userMinOBVal %>" /> 
                	<input type="hidden" name="txtPlace" id="txtPlace" value="<%=userPlaceVal %>" />
                	<input type="hidden" name="ddlCountry" id="ddCountry"  />                	
                	<input type="hidden" name="submitconus" id="submitconus" value="Get This Report" />  
                	<input type="hidden" name="txtSource" value="AstroSage-FreeKundali" />
   				    <input type="hidden" name="longDeg" id="longDeg" value="<%=userLongDegVal %>" />
				    <input type="hidden" name="longMin" id="longMin" value="<%=userLongMinVal %>" />
				    <input type="hidden" name="longEW" id="longEW" value="<%=userLongEWVal %>" />
				    <input type="hidden" name="latDeg" id="latDeg" value="<%=userLatDegVal %>" />
				    <input type="hidden" name="latMin" id="latMin" value="<%=userLatMinVal %>" />
				    <input type="hidden" name="latNS" id="latNS" value="<%=userLatNSVal %>" />
				    <input type="hidden" name="timeZone" id="timeZone" value="<%=userTimezoneVal %>" />
				    <input type="hidden" name="dst" id="dst" value="<%=userDSTVal %>" />
				    <input type="hidden" name="txtUserAgent" value="<%=request.getHeader("User-Agent") %>" />				    
                	<input type="hidden" id="agreeDisagree1" name="agreeDisagree" value="agree" />
                	<input type="hidden" name="payMode" value="Razorpay" />               
               
                </div>  
                <div class="as-form-details" id="problemDiv"> 
                 <div  class="col s3 l2"> 
                 <label for="txtProblem" class=""> <%=servOrdConstants.getString("PROBLEM") %>: </label>
                 </div>
                  <div class="col s9 l10">                 
                  <textarea name="txtProblem" id="txtQuestion" class="materialize-textarea" cols="17" rows="3" onkeydown="limittext('txtQuestion');" onkeypress="limittext('txtQuestion');" onkeyup="limittext('txtQuestion');" ></textarea>                
                 </div>	
                </div>
                <div class="as-form-details"> 
                 <div  class="col s4 l2"> 
                 <label for="txtEmail" class=""> <%=rBConstants1.getString("EMAIL") %>:</label>
                 </div>
                  <div class="col s8 l10">                 
                  <input type="text" name="txtEmail" id="textEmail" maxlength="50" value="<%=emailId %>" />  
                  <span class="as-text-muted" id="deliveryNote"> </span>              
                 </div>	
                </div>
				<div class="as-form-details"> 
				<div  class="col s4 l2"> 
				<label for="PerInfo_Phone" class=""> <%=rBConstants1.getString("MOBILE_NO") %>:</label>
				</div>
				<div class="col s8 l10 margin-input">
				    <input type="text" name="PerInfo_Phone" id="phoneNumber" value="<%=mobileNo%>">
					
				</div>
				</div>  
               
			 <div class="col s12 l12"> 
				<div class="center as-pay-btn">
					<a href="javascript:void(0);" name="submitconus" onclick="return validateOrderForm('INR');" class="waves-effect waves-light btn amber darken-4 box-shadow">  &#x20B9; <%=servOrdConstants.getString("PAY_NOW") %></a>
					
				</div>
				<div class="center">
				<a href="javascript:void(0);" name="submitconus" onclick="return validateOrderForm('USD');" class="btn-buy-link">  $ Pay In USD / I am not from India</a>
				</div>	
				</div>		
				
				<div class="pay-option">
				<a href=""><img src="/images/mst-vs.png"></a>
				<a href=""><img src="/images/razor-pay.png"></a>				
				</div>				
				</div>				 
			</form>
		</div>
	</div>
	</div>
	</div>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


