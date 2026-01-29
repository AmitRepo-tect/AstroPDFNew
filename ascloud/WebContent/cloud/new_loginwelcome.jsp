<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local loginLocal = new Local();
int loginLang = 0;
if(session.getAttribute("languageCode") != null)
	loginLang = (Integer)session.getAttribute("languageCode");
	MyResourceBundle rBLoginWelcome = loginLocal.loadPropertiesFileNew("loginwelcome", loginLang);
	
	MyProperties loginConstants = (MyProperties) session.getAttribute("constants");
%>
<div class="hdg-lg card">
	<h1><%=loginConstants.getString("WELCOME_TO_ASTROSAGE_COM_NO_1_INDIAN_ASTROLOGY_PORTAL") %></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card-panel">
    <div class="alert alert-success center">
    	<%=rBLoginWelcome.getString("YOU_ARE_LOGGED_IN_SUCCESSFULLY") %>        
    </div>
   </div>
   </div>
</div>


<script>
    $(document).ready(function() {
        //alert('<%=request.getParameter("val") %>');
        if ('<%=request.getParameter("val") %>' == "save") {
            openLoginForm();
        }
        else {
            if ('<%=request.getParameter("val") %>' == "saveonly") {
                savechart();
            }
            else {
                openChart('<%=request.getParameter("val") %>');
            }
        }
    }
);
</script>