<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.DO.Services"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Local qbLocal = new Local();	
	int qbLang= Util.safeInt(session.getAttribute("languageCode"));	
	MyResourceBundle qbContent = qbLocal.loadPropertiesFileNew("filemenu", qbLang);
	MyResourceBundle detailedServConstants = qbLocal.loadPropertiesFileNew("i_services", qbLang);
	
	Object qbObj = session.getAttribute("constants");
	MyProperties rBConstantqb = null;
	if(qbObj == null)
	{
		rBConstantqb = new MyProperties(qbLocal.loadPropertiesFile("constants", qbLang));
		session.setAttribute("constants", rBConstantqb);
	}
	else
	{
		rBConstantqb = (MyProperties) qbObj;
	}	
%>
<script type="text/javascript">
    function Clear() {
        if (document.getElementById("qtext").value == "<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT5") %>")
        	{ document.getElementById("qtext").value = ""; }                           
        }

    function limittext(val) {//alert("hello");        
    	if (document.getElementById(val).value.length > 200)
        {document.getElementById(val).value = document.getElementById(val).value.substring(0, 200); 
       }
    } 

     function pdatasub() {
         if (document.getElementById("qtext").value == "") {
             alert("Please enter your question.");
             document.getElementById("qtext").focus();
             return false;
         }
         if (document.getElementById("qtext").value == "<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT5") %>") {
             alert("Please enter your question.");
             document.getElementById("qtext").focus();
             return false;
         }
         return true;
     }

      function AnimatedText() {                       
          setInterval('GetRandomText()', 3000);
      }

      function GetRandomText() {
          
          var randomText = new Array(4);

          randomText[1] = "<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT1") %>";
          randomText[2] = "<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT3") %>";
          randomText[3] = "<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT4") %> ";
          randomText[4] = "<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT2") %>";
          randomNumber = Math.floor(Math.random() * 4) + parseFloat(1)

          document.getElementById("RandomText").innerHTML = randomText[randomNumber];
      }
      var flag;
      flag = 1;

      function ShowDiscount() {                        
          if (flag == 1) {
              document.getElementById("DiscountBlink").innerHTML = 'Discount 64% till Nov 30';
              flag = 0;
          }
          else {
              document.getElementById("DiscountBlink").innerHTML = '&nbsp;';
              flag = 1;
               }
      }
      
      function callMultipleMethods(){
    	  if(pdatasub()){
    	  	problemVal = document.getElementById('qtext').value;
    		  openDetailedServicePopup('<%=Services.aryServiceId[0] %>', '<%=detailedServConstants.getString(Services.aryServiceName[0]) %>', '<%=Services.aryIconImage[0] %>', '250', '<%=Services.aryActualPriceRs[0]%>', '', '', '', 'ASKAQ', problemVal);
    	  	_gaq.push(['_trackEvent', 'links', 'order_now']);
    	  }
    	      	  
      }
      $(document).ready(function() {     
          AnimatedText();
          });
</script>

<div class="card mrt-30 mrb-30">
		<div class="hdg-lg1">
			<h2 class="amber lighten-5"><%=qbContent.getString("ASK_YOUR_QUESTION") %></h2>
		</div>
		<div class="padding-all">
			<h5 class="center-align mr-b-0 anitext" id="RandomText">
				<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT0") %>
			</h5>
<%  
	Object obj4 = session.getAttribute("HoroscopeObj");
    if(obj4!="" && obj4!=null){
        //myAstrologyObject = session.getAttribute("HoroscopeObj");
        DesktopHoro ObjHoro1 = (DesktopHoro) obj4;
     
        String name = ObjHoro1.getName();
        String place = ObjHoro1.getPlace();
        String gender = ObjHoro1.getMaleFemale();
        String secondBirth = ObjHoro1.getSecondOfBirth();
        String minuteBirth = ObjHoro1.getMinuteOfBirth();
        String hourBirth = ObjHoro1.getHourOfBirth();
        int dayBirth = ObjHoro1.getDayOfBirth();
        int monthBirth = ObjHoro1.getMonthOfBirth();
        int yearBirth = ObjHoro1.getYearOfBirth();        
        
  %>

	<form method="post" name="frm1" id="frmsub"	action="http://www.astrocamp.com/service.asp?Service_id=1" class="contact-form">		
		<div class="row mrg-0">
			<div class="input-field col s12">					
				<textarea name="question" id="qtext" class="materialize-textarea" cols="17" rows="3" onkeydown="limittext('qtext');" onkeypress="limittext('qtext');" onkeyup="limittext('qtext');" placeholder="<%=qbContent.getString("ASK_YOUR_QUESTION_BLINK_TEXT5") %>"></textarea>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12 center-align">			
				<input type="button" class="btn amber darken-4 waves-effect waves-light" onClick="return callMultipleMethods();" value='<%=rBConstantqb.getString("ORDER_NOW") %> - <%=Services.aryPrice[0]%>' />	
			</div>
		</div>
	</form>
	
<% }else {%>	
		<div class="row mrg-0">
			<div class="input-field col s12">
				<textarea readonly name="question" id="Textarea2" class="materialize-textarea" placeholder="Sorry Your Session has been expired... Login again"></textarea>
			</div>
			<div class="row">
				<div class="input-field col s12 center-align">
					<button type="submit" class="btn disabled" value="Order Now - <%=Services.aryPrice[0]%>" onclick="return pdatasub();" ><%=rBConstantqb.getString("ORDER_NOW") %> - <%=Services.aryPrice[0]%></button>
				</div>
			</div>
		</div>
<% } %>
</div>
</div>




