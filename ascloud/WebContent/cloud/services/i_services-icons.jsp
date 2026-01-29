<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%
Local local = new Local();
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle rBIServices = local.loadPropertiesFileNew("i_services",languageCode);
MyResourceBundle rBConstantFile = local.loadPropertiesFileNew("constants",languageCode);
request.setAttribute("i_services", rBIServices);
%>
<%@include file='i_services.jsp'%>

<script type="text/javascript" language="javascript">
    function submitForm(a) 
    {
        document.cookie = 'ServiceId=' + a;
        frmService.submit();
    }
</script>
<div class="card  default-class mrt-30">
	<div class="hdg-lg1">
	   <h2 class="br-amber-b amber lighten-5 head-R"> <%=rBConstantFile.getString("PAID_SERVICES") %>  </h2>
	</div>  
	<form name="frmService" action="service-order.asp" method="post">
		<div class="row">
			<%
				for(int i = 0; i<=2 ; i++){
			%>

			<div class="col s6 l12 border-top1 user-define ui-define padding-zero">
				<a href="#" class="black-text" onclick="openServicePopup('<%=aryServiceId[i]%>', '<%=aryServiceName[i]%>', '<%=aryIconImage[i]%>', '<%=aryPrice[i]%>', '<%=aryActualPrice[i] %>', '<%=sampleURL[i] %>', '<%=sampleURLHI[i] %>', '<%=aryContent[i] %>', '');">
				<div class="padding-2 resnv tamil-res">
					<div class="define-img"><img src="images/icons/<%=aryIconImage[i]%>" /></div>
					<div class="right tamil-case">
						<h6 class="card-title font-weight-400 mb-4"> <%=aryServiceName[i]%>  </h6>
						<div class="card-action1 border-non btn-paid hide-on-med-and-down" id="content<%=i + 1 %>">                                        
							<a href="#" onclick="openServicePopup('<%=aryServiceId[i]%>', '<%=aryServiceName[i]%>', '<%=aryIconImage[i]%>', '<%=aryPrice[i]%>', '<%=aryActualPrice[i] %>', '<%=sampleURL[i] %>', '<%=sampleURLHI[i] %>', '<%=aryContent[i] %>', '<%=aryPartnerId[i] %>');" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=rBConstantFile.getString("ORDER_NOW") %></a>                                        
                        </div>
                    </div>
                </div>
                </a>
           	</div>
		<%
        }
%>		    
            </div>                           
      </div>


	
