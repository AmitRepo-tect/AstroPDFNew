<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="service"
	class="com.ojassoft.astrosagecloud.DO.Services" scope="request" />
<%@include file="buy-service-chart.jsp"%>
<%
Local local2 = new Local();
int languageCode1 = (Integer)session.getAttribute("languageCode");
Cookie[] cookies = request.getCookies();
String serviceId = "";
for(Cookie cookie : cookies)
{
	if(cookie.getName().equals("ServiceId"))
	{
		serviceId = cookie.getValue();
		break;
	}
}

int indexServiceId = service.getIndexServiceId(serviceId);
MyProperties rBConstants1 = (MyProperties) session.getAttribute("constants");
MyResourceBundle iServicesConstants = local.loadPropertiesFileNew("i_services",languageCode);
MyResourceBundle servOrdConstants = local.loadPropertiesFileNew("service-order",languageCode);
MyResourceBundle servChartConstants1 = local.loadPropertiesFileNew("buy-service-chart",languageCode);

%>
<script type='text/javascript'>

    function showHidediv(obj) {
        count = 0;

        while (document.getElementById("d" + count)) {
            document.getElementById("d" + count).style.display = "none";
            count++;
        }
        if (obj.value == "IN") {
            //document.getElementById("d" + obj.selectedIndex).style.display = "block"
            document.getElementById("d0").style.display = "block";
            document.getElementById('Radio1').checked = true;
        }
        else {
            document.getElementById("d1").style.display = "block";
            document.getElementById('Radio4').checked = true;
        }
    }
</script>
<script type="text/javascript">
    $(document).ready(function() {
    	openChart1('<%=GetStringValue(iServicesConstants.getString(service.getAryServiceName()[indexServiceId]),local,servChartConstants) %>');
    });

    $("div.divServiceDetails").hide();

    function resetOrderForm() {
        //document.forms.reset();
        document.frmOrder.reset();
    }

    function showServiceDetails() {
        $('div.divServiceDetails').toggle('slow');
    }  
</script>

<script language="javascript" type="text/javascript">
    
    function validateOrderForm() {
    	
        if (document.getElementById("ddlDay").value == "") {
            alert('<%=servOrdConstants.getString("VALIDATE_SELECT_CHART") %>');
            return (false);
        }

        if (document.getElementById("txtEmail").value == "") {
            alert('<%=rBConstants.getString("EMAIL_SHOULD_NOT_BE_BLANK") %>');
            document.getElementById("txtEmail").focus();
            return (false);
        }

        if (echeck(document.getElementById("txtEmail").value) == false) {
            document.getElementById("txtEmail").focus();
            return (false);
        }

        document.getElementById("txtEmailConf").value = document.getElementById("txtEmail").value;

        if (document.getElementById("txtProblem").value == "") {
            alert('<%=servOrdConstants.getString("VALIDATE_PROBLEM") %>');
            document.getElementById("txtProblem").focus();
            return (false);
        }

        for (var i = 0; i < document.frmOrder.payMode.length; i++) {
            if (document.frmOrder.payMode[i].checked) {
                var pay_option = document.frmOrder.payMode[i].value;
            }
        }

        if (pay_option == "Cheque" & document.getElementById("PerInfo_Phone").value == "") {
            alert('<%=rBConstants.getString("VALID_PHONE_NUMBER") %>');
            document.getElementById("PerInfo_Phone").focus();
            return (false);
        }

        if (!document.getElementById("agreeDisagree").checked) {
            alert('<%=servOrdConstants.getString("VALIDATE_TERMS") %>');
            document.getElementById("agreeDisagree").focus();
            return (false);
        }

        frmOrder.submit();
    }

    function echeck(str) {
        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)

        if (str.indexOf(at) == -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(" ") != -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
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
       /*  $("h5.expand_heading").toggle(function() {
            $(this).addClass("active");
        }, function() {
            $(this).removeClass("active");
        }); */
        $("h5.expand_heading").click(function() {
            $(this).next(".toggle_container").slideToggle("slow");
        });
      /*   $(".expand_all").toggle(function() {
            $(this).addClass("expanded");
        }, function() {
            $(this).removeClass("expanded");
        }); */
        $(".expand_all").click(function() {
            $(".toggle_container").slideToggle("slow");
        });
    });
</script>
<script type="text/javascript">
    // Popup window code
    function newPopup(url) {
        popupWindow = window.open(
        url, 'popUpWindow', 'height=410,width=620,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');        
    }
</script>

<div class="row">
	<div class="col s12">

		<div class="hdg-lg card">
			<h1>
				<%=rBConstants.getString("ORDER_REPORT") %>
			</h1>
			<span id="headad"></span>
		</div>
	</div>
</div>


<div class="row">
	<div class="col s12">
	<div class="card padding-all ui-paragraph-style">

	<div class="hdg-sub">
		<h2>
			<%=iServicesConstants.getString(service.getAryServiceName()[indexServiceId])+service.getAryPrice()[indexServiceId]%>
		</h2>
	</div>

	<div class="ui-container">
		<div class="OrdPage">
			<div class="expand_wrapper">
				<h5 class="expand_heading valign-wrapper">				
					 <%=servOrdConstants.getString("SERVICE_DETAILS") %> <i class="material-icons">add</i>
				</h5>

				<div class="toggle_container">
					<div class="card-panel">
										
					<p class="justify"> 	
					<%=iServicesConstants.getString(service.getAryContent()[indexServiceId])%> Delivered by email in <b>72 hours</b>
					</p>
					</div>
				</div>
			</div>

			<form name="frmOrder" id="frmOrder" action="http://www.astrocamp.com/service.asp?service_id=<%=serviceId%>&prtnr_id=1" onsubmit="return validateOrderForm(this)" method="post">
                
                <div class="row"> 
                <div class="col s12 l12">
                
                <input type="hidden" name="txtEmailConf" id="txtEmailConf" /> <input
					type="hidden" name="txtRegName" id="txtRegName" /> <input
					type="hidden" name="PerInfo_name" id="PerInfo_name" /> <input
					type="hidden" name="PerInfo_gender" id="PerInfo_gender" /> <input
					type="hidden" name="forWhom" id="forWhom" value="other" /> <input
					type="hidden" name="ddlDay" id="ddlDay" /> <input type="hidden"
					name="ddlMonth" id="ddlMonth" /> <input type="hidden"
					name="ddlYear" id="ddlYear" /> <input type="hidden" name="ddlHour"
					id="ddlHour" /> <input type="hidden" name="ddlMinute"
					id="ddlMinute" /> <input type="hidden" name="txtPlace"
					id="txtPlace" /> <input type="hidden" name="submitconus"
					id="submitconus" value="Get This Report" /> <input type="hidden"
					name="txtSource" value="AstroSage-FreeKundali" />
				<!-- input type="hidden" name="txtUserAgent" value="<%//request.getseRequest.ServerVariables("HTTP_USER_AGENT") %>" /> -->
                
                <p class="center">
						<b><% String[] changestrarr = {"<span id=\"spanChartName\" style=\"color:Red\"></span>"};%>
							<%=local.getDesiredString(servOrdConstants.getString("ORDERFOR_CHANGECHART"),changestrarr)%>
							<a href="#dialog-form-openchart1" style="color: Red" class="modal-trigger"><u><%=rBConstants.getString("CLICK_HERE") %></u></a>
					
					</b></p>
                
                
               </div>
                </div>
                
                
				<div class="row"> 
                <div class="input-field  col s12 l12">
                 <input type="text" name="txtEmail" id="txtEmail" maxlength="50" />
                 <label for="txtEmail"> <%=rBConstants.getString("EMAIL") %>
					
				</label>
                </div>
                </div>
				
				<div class="row"> 
                <div class="input-field  col s12 l12">
                <textarea name="txtProblem" id="txtProblem" cols="50" rows="8" class="materialize-textarea" data-length="8000"></textarea>					
					<label for="txtProblem"> <%=servOrdConstants.getString("PROBLEM") %></label>	
					
                </div>
                </div>
				<div class="row"> 
             	<div class="col s12">
				<h5> <%=servOrdConstants.getString("PAYMENT_MODE") %> </h5>
				</div>
				
				<div class="input-field col s12">
    				<select name="ddlCountry" id="ddlCountry" onchange="showHidediv(this)">
							<option value="IN" selected="selected">India</option>
							<option value="US">United States of America</option>
							<option value="UK">United Kingdom</option>
							<option value="CND">Canada</option>
							<option value="OTHR">Others</option>
					</select>
    				<label><%=servOrdConstants.getString("SELECT_YOUR_COUNTRY") %></label>
  				</div>
				
				
                </div>

				<div id="d0" style="display: block;">
				<p>
					<input type="radio" name="payMode" id="Radio1" value="ICICI" checked="checked" class="with-gap" />
					<label for="Radio1"> <%=servOrdConstants.getString("GATEWAY1") %></label>
				</p>	
				<p> <input type="radio" name="payMode" id="Radio2"	value="CCAvenue" class="with-gap" /> 
						<label for="Radio2">  <%=servOrdConstants.getString("GATEWAY2") %></label>
				</p>
				<p>
					<input type="radio" name="payMode" id="Radio3" value="Cheque" class="with-gap"  />
					<label for="Radio3"> <%= servOrdConstants.getString("CHEQUE_DD") %></label>
				</p>
				</div>
				<div id="d1" style="display: none;" class="ui-rdo">
				<p>
				<input type="radio" name="payMode" id="Radio4" value="ICICI-US" class="with-gap" /> 
				<label for="Radio4"> Gateway 1 (Visa / Mastercard) </label>
				</p>
					
					<p>
					<input type="radio" name="payMode" id="Radio5" value="PayPal" class="with-gap" /> 
					<label for="Radio5"> Gateway 2 - Paypal (Visa / Mastercard / Discover / American Express)
					</label>
					</p>
					
					<p> 
					<input type="radio" name="payMode" id="Radio6" value="CCAvenue" class="with-gap" /> 
					<label for="Radio6"> Gateway 3 (Mastercard / American Express / Diners Club Card / JCB card / Visa) 
					</label>
					</p>
				</div>
				<br />

				<div class="row">
				 <div class="input-field  col s12 l12">
					
					<input type="text" name="PerInfo_Phone" id="PerInfo_Phone">
					<label for="PerInfo_Phone"> <%=rBConstants.getString("PHONE") %></label>
					<div class="contents">
					 <span> (<%=servOrdConstants.getString("COMPULSORY") %>) </span> 
					</div>
					</div>
				</div>

				<div class="row">
				 <div class="col s12 l12">
				 	<input type="checkbox" class="filled-in" id="agreeDisagree" name="agreeDisagree" value="agree" />
			     	<label for="agreeDisagree"> <%=servOrdConstants.getString("HAVE_READ_TERMS_CONDITIONS_AGREEMENT")%>.</label>
				 </div>
				 </div>
               <p> &nbsp; </p>

				<div class="center">
					<a href="javascript:void(0);" name="submitconus" onclick="return validateOrderForm();" class="waves-effect waves-light btn amber darken-4 box-shadow"> <%=rBConstants.getString("ORDER_REPORT") %></a>
					<a href="javascript:void(0);" name="reset" onclick="resetOrderForm();" class="waves-effect waves-light btn amber darken-4 box-shadow"> <%=rBConstants.getString("RESET")%></a>
				</div>

				

				<div class="contents mrb-10 mrt-10" align="center">
					(#<%=rBConstants.getString("FROM_PARTNER_WEBSITE_ASTROCAMP") %>)
				</div>

				<div class="contents">
					<p>
						<%=servOrdConstants.getString("NEED_ASSISTANCE1")%> 
						+91 99118 40126 <%=servOrdConstants.getString("NEED_ASSISTANCE2")%></p>
				</div>
				 
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
	

