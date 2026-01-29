<%@page import="com.ojassoft.astrosagecloud.DO.Services"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle iServices = local.loadPropertiesFileNew("i_services",languageCode);
%>
<script type="text/javascript" language="javascript">
    function submitForm1(a) {
        document.cookie = 'ServiceId=' + a;
        frmService1.submit();
    }
    
    $(document).ready(function(){
    	eqHeightCol('.ui-service-icon');
    });
</script>



<div class="row">
	<div class="col s12">

		<div class="hdg-lg card">
			<h1>
				<%=rBConstants.getString("PAID_SERVICES") %>
			</h1>
			<span id="headad"></span>
		</div>
	</div>
</div>
<div class="mrt-30 mrb-30">
<div class="card  default-class">
<form name="frmService1" action="service-order.asp" method="post">
	
		<div class="row">
			<c:set var="languageCode" value="<%=languageCode%>" />
			
			<%
			for(int i=0;i<=7;i++)
			{
			%>
			<div class="col s12 l4 ui-service-icon">
			  <div class="padding-all ui-paragraph-head">
                  <div class="define-img">
                       <span class="ui-services-content-img"><a href="#" onclick="submitForm1('<%=Services.aryServiceId[i]%>')"><img src="images/icons/<%=Services.aryLargeImage[i]%>" /></a>
</span>
                  </div>
                  
                  <div class="center">
                  <h6 class="card-title font-weight-400 mb-4  hide-on-med-and-down"> <a href="#" onclick="submitForm1('<%=Services.aryServiceId[i]%>')" /><%=iServices.getString(Services.aryServiceName[i])+" "+Services.aryPrice[i]%></a></h6>
              
				   <p><%=iServices.getString(Services.aryContent[i]).substring(0, 120)%>...</p>
						<a href="#" onclick="submitForm1('<%=Services.aryServiceId[i]%>')" class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("ORDER_NOW") %></a>
                 </div>
                                
           </div>
           <div class="clearfix"></div>
				</div>
				
			<% } %>
		
		
	</div>
</form>
</div>
</div>