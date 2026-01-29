<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local headLocal = new Local();
	
	int headLang= Util.safeInt(session.getAttribute("languageCode"));
	
	MyResourceBundle rBShared = headLocal.loadPropertiesFileNew("header",headLang);
	MyResourceBundle rBNotificationBar1 = headLocal.loadPropertiesFileNew("notificationbar", headLang);
	MyResourceBundle rBLoginMenu1 = headLocal.loadPropertiesFileNew("loginmenu", headLang);
	
	Object objhead = session.getAttribute("constants");
	MyProperties headConstants = null;
	if(objhead != null)
	{
		headConstants = (MyProperties) objhead;
	}
	else
	{
		headConstants = new MyProperties(headLocal.loadPropertiesFile("constants", headLang));
		session.setAttribute("constants", headConstants);
	}
%>
<% Object getUrl = request.getAttribute("javax.servlet.forward.request_uri");
		if(getUrl == null){			
			getUrl = request.getRequestURL();
		}
		String getRequestUrl = getUrl.toString() ;
		String getQuery = ""; 
		String getMethodName = request.getParameter("methodName");
		if(getMethodName != null && !getMethodName.equals(""))
		{
			getQuery = "&methodName="+getMethodName;
		}
		
		%>
<script>
	 $(function(){   

	   var getCatUrl = window.location.pathname;
	   
	   if(getCatUrl == "/cloud/prediction-cat.asp"){
	   		$(".slitem").html("<%=headConstants.getString("PREDICTIONS_REPORTS").replace("& Reports", "")%> <span><i class='material-icons'>arrow_drop_down</i></span>");
	   }
	   if(getCatUrl == "/cloud/dasha-cat.asp"){
	   		$(".slitem").html("<%=headConstants.getString("DASHA")%> <span><i class='material-icons'>arrow_drop_down</i></span>");
	   }
	   if(getCatUrl == "/cloud/calculation-cat.asp"){
	   		$(".slitem").html("<%=headConstants.getString("CALCULATIONS")%> <span><i class='material-icons'>arrow_drop_down</i></span>");
	   }
	   if(getCatUrl == "/cloud/lalkitab-cat.asp"){
	   		$(".slitem").html("<%=headConstants.getString("LAL_KITAB")%> <span><i class='material-icons'>arrow_drop_down</i></span>");
	   }
	   if(getCatUrl == "/cloud/kp-system-cat.asp"){
	   		$(".slitem").html("<%=headConstants.getString("KP_SYSTEM")%> <span><i class='material-icons'>arrow_drop_down</i></span>");
	   }
	   if(getCatUrl == "/cloud/matching-cat.asp"){
	   		$(".slitem").html("<%=headConstants.getString("MATCH_YOUR_HOROSCOPE")%> <span><i class='material-icons'>arrow_drop_down</i></span>");
	   }
	   
	}); 
	 
	 
</script>

 <header id="header" class="page-topbar">
      <%-- <%@include file='top-nav.jsp'%>  --%>
      <%@include file='app-banner.jsp'%> 
         <div class="navbar-fixed">
            <nav class="navbar-color amber z-depth-1">
               <div class="nav-wrapper">
                  <div class="left">
                     <ul>
                     <li> 
                     	<div class="opne-menu-tab">
                     		<a href="javascript:void(0);" data-activates="slide-out" class="sidebar-collapse tkkk waves-effect waves-light accent-2"><i class="material-icons barmenu">close</i></a> 
                     	</div>                    	
                   
                        <li>                        
                              <a href="https://www.astrosage.com/" class="brand-logo darken-1 logo hide-on-small-only logo-wrapper hide-logo">
                              	<img src="images/icons/as-logo.png" alt="AstroSage logo" class="responsive-img">
                              </a> 
                                                       
                           <div class="select-box-item hide-on-med-only"> 
                           <a class='dropdown-button slitem truncate' href='javascript:void(0);' data-activates='selCategoryMenu'> <%=rBShared.getString("CATEGORY_SELECT")%> <span>  <i class="material-icons">arrow_drop_down</i> </span></a>
							<!-- Dropdown Structure -->
							   <ul id='selCategoryMenu' class='dropdown-content tamil-css'>
							    <li><a href="/cloud/calculation-cat.asp" onclick="getEvents('ascloud','catCalculation');"><%=headConstants.getString("CALCULATIONS")%></a></li>
							    <li><a href="/cloud/prediction-cat.asp" onclick="getEvents('ascloud','catPrediction');"><%=headConstants.getString("PREDICTIONS_REPORTS")%></a></li>
							    <li><a href="/cloud/dasha-cat.asp" onclick="getEvents('ascloud','catDasha');"><%=headConstants.getString("DASHA")%></a></li>
							    <li><a href="/cloud/lalkitab-cat.asp" onclick="getEvents('ascloud','catLalkitab');"><%=headConstants.getString("LAL_KITAB")%></a></li>
							    <li><a href="/cloud/kp-system-cat.asp" onclick="getEvents('ascloud','catKP');"><%=headConstants.getString("KP_SYSTEM")%></a></li>
							    <li><a href="/cloud/matching-cat.asp" onclick="getEvents('ascloud','catMatching');"><%=headConstants.getString("MATCH_YOUR_HOROSCOPE")%></a></li>
							  </ul>
							 </div>
                        </li>
                     
                     	<li class="ui-search-icon hide-on-large-only">                    
                      		<span class="sb-icon-search" onclick="getEvents('ascloud','search');"></span>                        	
                        	<div id="sb-search" class="sb-search">
       							<form class="input-field">
									<input type="text" class="sb-search-input find-keyword" placeholder="<%=rBShared.getString("SEARCH_HERE")%>..." />
										<span class="sb-icon-close"></span>		
	  							</form>
							</div>
                        </li>
                         
                        <li class="ui-notes-icon hide-on-large-only"> 
                         	<a href="#notesModal" class="waves-effect waves-block waves-light modal-trigger"> <i class="material-icons font-size-20">insert_comment</i></a> 
                         </li>
                         
                        <li>
                           <div class="noti-icon">
                            <a href="javascript:void(0);" class="waves-effect waves-block waves-light notification-button" data-activates="notifications-dropdown" style="">
                              <i class="material-icons font-size-20">notifications_none</i>
                              </a>
                              <ul id="notifications-dropdown" class="dropdown-content">
                                 <p class="center-align grey-text text-darken-4 font-size"><%=rBNotificationBar1.getString("ANNOUNCED") %>, <a class="amber-text text-darken-4" href="session-for-oldversion.jsp"><u>Older version</u></a></p>
                                 <li class="divider"></li>
                              </ul>
                           </div>
                        </li>
                        
                           <li class="ui-notes-icon hide-on-large-only" style="right:0px;"> <a href="javascript:void(0);" data-activates="open-category" class="waves-effect waves-block waves-light profile-button">
                           <i class="material-icons font-size-24">more_vert</i>
                            </a> 
                 <%@include file='v-menu.jsp'%>
                </li>
                
                     </ul>
                  </div>                   
                  <div class="icon-formate hide-on-med-and-down">
                     <ul class="btm-b">
                        <li> <a href="/cloud/home.asp" onclick="getEvents('ascloud','home');" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="AstroSage Cloud"> <i class="material-icons">&#xE88A;</i> </a> </li>
                        <li> <a href="session-destroy-for-newchart.asp?methodName=newChart" onclick="getEvents('ascloud','newchart');" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("NEW_CHART")%>"> <i class="material-icons">&#xE24D;</i> </a> </li>
                        <li> <a href="javascript:void(0)" class="tooltipped" onclick="openChart('open');" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("OPEN_CHART") %>">  <i class="opchart"></i> </a> </li>
                        <li> <a href="javascript:void(0)" class="tooltipped" onclick="openprintdialog();" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("PRINT") %>"> <i class="material-icons">print</i> </a> </li>
                        <li> <a href="javascript:void(0)" class="tooltipped" onclick="savechart();" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("SAVCHART") %>"> <i class="material-icons">save</i> </a> </li>
                        <li> <a href="editchart.asp" onclick="getEvents('ascloud','editchart');" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("EDIT_CHART") %>"> <i class="material-icons">&#xE254;</i> </a> </li>
                        <li> <a href="javascript:void(0)" class="tooltipped" onclick="openChart('manage');" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("DELETE_CHART") %>"> <i class="material-icons">&#xE872;</i> </a> </li>
                        <li> <a href="javascript:openShareChart();" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("SHARE_CHART")%>"> <i class="material-icons">&#xE80D;</i> </a> </li>                        
                        <li> <a href="/cloud/worksheet/" onclick="getEvents('ascloud','worksheet');" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="<%=headConstants.getString("WORK_SHEET_AS") %>"> <i class="material-icons">&#xE3EC;</i> </a> </li>
                        
                        <li> <a href="javascript:void(0);" onclick="getEvents('ascloud','search');" class="tooltipped sb-icon-search-d" data-position="bottom" data-delay="50" data-tooltip="Search"> <i class="material-icons">search</i> </a> 
                        
                        <div id="sb-search-d" class="sb-search">
       						<form class="input-field">
								<input type="text" class="sb-search-input validate find-keyword" placeholder="<%=rBShared.getString("SEARCH_HERE")%>...">
								<span class="sb-icon-close"></span>		
							</form>
							</div>
                        
                        </li>
                     </ul>
                  </div>
                  <div class="right">
                     <ul class="hide-on-med-and-down default-bar language-type">
                     		  <li> <a href="<%=getRequestUrl + "?LanguageType=english&charttype=north"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="English"><span class="min-screen">En</span><span class="lg-screen">  English </span> </a></li>
                     		  <li> <a href="<%=getRequestUrl + "?LanguageType=hindi&charttype=north"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="हिंदी"><span class="min-screen">हिं</span><span class="lg-screen">  हिंदी </span> </a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=tamil&charttype=south"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="தமிழ்"> <span class="min-screen">த</span> <span class="lg-screen"> தமிழ் </span> </a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=telugu&charttype=south"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip=" తెలుగు"> <span class="min-screen">తె</span> <span class="lg-screen"> తెలుగు </span> </a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=kannada&charttype=south"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip=" ಕನ್ನಡ "><span class="min-screen">ಕ</span> <span class="lg-screen"> ಕನ್ನಡ </span></a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=gujarati&charttype=north"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="ગુજરાતી"> <span class="min-screen">ગુ</span> <span class="lg-screen"> ગુજરાતી </span> </a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=marathi&charttype=north"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="मराठी "> <span class="min-screen">म</span> <span class="lg-screen"> मराठी </span> </a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=bengali&charttype=east"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="বাংলা"><span class="min-screen">বা</span> <span class="lg-screen"> বাংলা  </span></a></li>
                              <li> <a href="<%=getRequestUrl + "?LanguageType=malayalam&charttype=south"+ getQuery %>" class="btn waves-effect white black-text tooltipped" data-position="bottom" data-delay="50" data-tooltip="മലയാളം"><span class="min-screen">മ</span> <span class="lg-screen"> മലയാളം </span> </a></li> 
                     </ul>
                  </div>
                  <div class="row ui-rs-frmt hide-on-large-only">
                     <ul class="card">
                        <li> <a href="home.asp" onclick="getEvents('ascloud','home');"> <i class="material-icons">&#xE88A;</i> </a> </li>
                        <li> <a href="session-destroy-for-newchart.asp?methodName=newChart" onclick="getEvents('ascloud','newchart');"> <i class="material-icons">&#xE24D;</i> </a></li>
                        <li> <a href="javascript:void(0);" class="waves-effect waves-light modal-trigger" onclick="openChart('open');"> <i class="opench"></i>  </a> </li>
                        <li> <a href="javascript:void(0);" onclick="savechart();"> <i class="material-icons">save</i> </a> </li>
                        <li> <a href="editchart.asp" onclick="getEvents('ascloud','editchart');"> <i class="material-icons">&#xE254;</i> </a> </li>
                        <li> <a href="javascript:void(0);" onclick="openChart('manage');"> <i class="material-icons">&#xE872;</i> </a> </li>
                        <li> <a href="javascript:openShareChart();"> <i class="material-icons">&#xE80D;</i> </a> </li>
                        <li> <a href="/cloud/worksheet/" onclick="getEvents('ascloud','worksheet');"> <i class="material-icons">&#xE3EC;</i> </a> </li>
                       
                     </ul>
                  </div>
               </div>
            </nav>
         </div>        
          
           
      
      </header>