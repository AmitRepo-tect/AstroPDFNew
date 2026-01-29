<%@page import="com.ojassoft.astrosagecloud.WorksheetServlet"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
WorksheetServlet WkNv = new WorksheetServlet();
WkNv.initialize(request, response);
int langCodeNv = 0;
langCodeNv = Util.safeInt(session.getAttribute("languageCode"));
MyProperties rBConstantsNv = (MyProperties) session.getAttribute("constants");
%>


<div class="nav_header bg-dark-purple" id="navbar-header">
<div class="container">
<div class="row">
<div class="col-lg-12"> 
<nav class="navbar navbar-expand-sm navbar-dark">
        <a class="navbar-brand" href=""><img src="/cloud/images/worksheet-logo2.png" /></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
  </button>
   <div class="collapse navbar-collapse navbar-setting" id="navbarTogglerDemo01">
        <ul class="navbar-nav ml-auto">
       
   	
   	
            <li class="nav-item">
                <a class="nav-link" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">home</i></span> <span><%=rBConstantsNv.getString("HOME")%></span></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">add</i></span> <%=rBConstantsNv.getString("NEW_CHART")%></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">folder_open</i></span> <%=rBConstantsNv.getString("OPEN_CHART")%></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">local_printshop</i></span> <%=rBConstantsNv.getString("PRINT")%></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">save</i></span> <%=rBConstantsNv.getString("SAVCHART")%></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">edit</i></span><%=rBConstantsNv.getString("EDIT_CHART")%></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link pr-0" href="javascript:void(0);"><span class="nav-icons"><i class="material-icons">delete</i></span><%=rBConstantsNv.getString("DELETE_CHART")%></a>
            </li>
            
        </ul>
        </div>
    </nav>
    </div>
</div>
</div>
</div>