<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
Local local = new Local();
int langCode = (Integer) session.getAttribute("languageCode");
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
%>
 <div class="hdg-lg card">
  <h1> <%=rbConstants.getString("USER_MESSAGE") %> </h1>
</div>

<%
String msgval = request.getParameter("msgval");
String msg = request.getParameter("msg");
    
    if((msgval != null && msgval != "") &&(msg != null && msg != ""))
    {
%>
<div class="row mrt-20">
<div class="col s12">
<div class="card padding-all ui-paragraph-style">

<div class="boxhdg">
        <p><%=Util.safestr(msg) %></p>  
           
    </div>
</div>
</div>
</div>
<div style=" margin-top:20px;"></div>
<%
    }
%>
<script type="text/javascript">

document.getElementById('clickme').onclick = function () {
    popupvisibility();
    }
</script>