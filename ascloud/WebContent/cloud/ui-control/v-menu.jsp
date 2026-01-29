<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local vMenuLocal = new Local();	
	int vMenuLang= Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBChartStylevMenu = vMenuLocal.loadPropertiesFileNew("filemenu-chartstyle", vMenuLang);
	MyResourceBundle rBvMenu = vMenuLocal.loadPropertiesFileNew("loginmenu", vMenuLang);
	
	Object objvMenu = session.getAttribute("constants");
	MyProperties vMenuConstants = null;
	if(objvMenu != null)
	{
		vMenuConstants = (MyProperties) objvMenu;
	}
	else
	{
		vMenuConstants = new MyProperties(vMenuLocal.loadPropertiesFile("constants", vMenuLang));
		session.setAttribute("constants", vMenuConstants);
	}
%>

           <ul id="open-category" class="dropdown-content mb-dropdown">
              <li>
                <a href="/cloud/session-destroy-for-newchart.asp?methodName=newChart" class="black-text text-darken-1">
                 <i class="material-icons">add</i>  <%=vMenuConstants.getString("NEW_CHART")%></a>
              </li>
              <li>
                <a href="javascript:void(0);" onClick="openChart('open');" class="black-text text-darken-1">
                 <i class="material-icons">&#xE89E;</i> <%=vMenuConstants.getString("OPEN_CHART") %></a>
              </li>
              <li>
                <a href="/cloud/editchart.asp" class="black-text text-darken-1">
                 <i class="material-icons" title="Edit Chart">&#xE254;</i>  <%=vMenuConstants.getString("EDIT_CHART") %></a>
              </li>
              
              <li>
                <a href="javascript:void(0);" onclick="openprintdialog();" class="black-text text-darken-1">
                 <i class="material-icons" title="Print Chart">&#xE8AD;</i> <%=vMenuConstants.getString("PRINT") %></a>
              </li>
              
                <li>
                <a href="#modal20" class="black-text text-darken-1 modal-trigger">
               <i class="material-icons dp48">language</i> <%=vMenuConstants.getString("LANGUAGE_TYPE") %> </a>
              </li>
              <li>
                <a href="#" class="black-text text-darken-1">
                <i class="material-icons dp48">file_download</i> <%=vMenuConstants.getString("PDF_MASTROSAGE")%></a>
              </li>
              <li>
                <a href="javascript:popupvisibility();" class="black-text text-darken-1">
                <i class="material-icons dp48">file_upload</i> <%=vMenuConstants.getString("PAID_CONSULTATION")%></a>
              </li>
              <li>
                <a href="#modal21" class="black-text text-darken-1 modal-trigger">
              <i class="material-icons dp48">border_outer</i>  <%=rBChartStylevMenu.getString("CHART_STYLE") %></a>
              </li>
              
                <li>
                <a href="javascript:openShareChart();" class="black-text text-darken-1">
               <i class="material-icons dp48">&#xE80D;</i> <%=vMenuConstants.getString("SHARE_CHART")%> </a>
              </li>
            
              <li>
                <a href="javascript:openfeedbackform();" class="black-text text-darken-1">
               <i class="material-icons dp48">feedback</i> <%=vMenuConstants.getString("FEEDBACK") %></a>
              </li>
              <li>
                <a href="http://buy.astrosage.com/" class="black-text text-darken-1">
               <i class="material-icons dp48">shopping_cart</i> <%=vMenuConstants.getString("ASTROSHOP") %> </a>
              </li>
              <li>
              <% if(session.getAttribute("User_Id")!= null && !session.getAttribute("User_Id").equals("")){ 
             
              %>
               <a href="logout.jsp" class="black-text text-darken-1"> <i class="material-icons dp48">power_settings_new</i> <%=rBvMenu.getString("LOGOUT")%></a>
				
			  <% 
			  }              
              else
              { 	
            	 
			  %>
			 	<a href="login.asp" class="black-text text-darken-1"> <i class="material-icons dp48">person</i> <%=vMenuConstants.getString("LOGIN")%></a>
				
			  <%} %>		
            
               
            </ul>