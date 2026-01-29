<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

Local localHd = new Local();
int langHd = Util.safeInt(session.getAttribute("languageCode"));

//Object userObj = session.getAttribute("userid");
String usrname = "";
String userName = "";

String usrdob = "";
String usrtob="";
String usrpob = "";
String userayan = "";
String getChartName ="";
DesktopHoro horoObj = (DesktopHoro) session.getAttribute("HoroscopeObj");
userName = Util.safestr(session.getAttribute("User_Id"));
MyProperties hDConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle hDBirthDetailsVarshphalallPages = localHd.loadPropertiesFileNew("birthdetails-varshphalallpages",langHd);
MyResourceBundle rBLoginHd = localHd.loadPropertiesFileNew("loginmenu", langHd);

if(horoObj !=null){	
	usrname = horoObj.getName();
	usrdob = horoObj.getDayOfBirth() + ":" +horoObj.getMonthOfBirth() +  ":" + horoObj.getYearOfBirth();
	usrtob = horoObj.getHourOfBirth() + ":" +horoObj.getMinuteOfBirth() +  ":" + horoObj.getSecondOfBirth();
	usrpob = horoObj.getPlace() + " ("+horoObj.getDegreeOfLongitude()+horoObj.getEastWest()+horoObj.getMinuteOfLongitude()+ ", " +horoObj.getDegreeOfLattitude() + horoObj.getNorthSouth() + horoObj.getMinuteOfLattitude()+ ", "  +horoObj.getTimeZone()+ ")";

	int AynamsaType = Integer.parseInt(SharedFunction.getAyan(horoObj));
    
	switch(AynamsaType){
	  case 0:			
		  userayan= hDBirthDetailsVarshphalallPages.getString("LAHIRI_AYAN");
		  break;
	  case 1:
		  userayan= hDConstants.getString("K_P_NEW");
		  break;
	  case 2:
		  userayan= hDConstants.getString("K_P_OLD");
		  break;
	  case 3:
		  userayan= hDBirthDetailsVarshphalallPages.getString("RAMAN");
		  break;
	  case 4:
		  userayan= hDConstants.getString("K_P_KHULLAR");
		  break;
	  case 5:
		  userayan= hDBirthDetailsVarshphalallPages.getString("SAAYAN");
		  break;
		  
	}	
	if(usrname.length()>=15){		
		getChartName = usrname.substring(0,11) + "...";
	}
	else{
		getChartName = usrname;
		}
}
else{	
	response.sendRedirect("/cloud/login.asp");
}
%>
<header id="header" class="page-topbar">
		<div class="navbar-fixed">
			<nav class="navbar-color white z-depth-0">			
				<div class="nav-wrapper">
					<div class="left">
						<ul>							
							<li><a href="https://ascloud.astrosage.com/" class="brand-logo darken-1 logo logo-wrapper"><img src="/dhruv/images/logo.png" alt="AstroSage logo" class="responsive-img"></a></li>
							<li class="mobile"><a href="javascript:void(0);" data-target="slide-out" class="brmenu sidenav-trigger"><i class="material-icons">menu</i></a></li>
						</ul>
						
						<ul class="mobile-class ns-hide">
						    <li>
						    	<a href="javascript:void(0);" class="dropdown-trigger" data-target="dropdown-support-m"><i class="material-icons text-orange">call</i></a>
						    	
						    
						    <ul id="dropdown-support-m" class="dropdown-content">
						     	<li><a>+91 95606 70006 </a></li>        						
						    </ul>
						    </li>	
							<!-- <li>
								<a href="javascript:void(0);"class="box-shadow-none notification-button" data-activates="notifications-dropdown-m">
									<span class="mb-hide"> Notification </span> <i class="material-icons text-dark-blue">notifications_none</i>
								</a>
								<ul id="notifications-dropdown-m" class="dropdown-content">
									<li><a>A link</a></li>
        							<li><a>A second link</a></li>
        							<li><a>A third link</a></li>
								</ul>								
							</li>	 -->						
							<li>								
								<a href="javascript:void(0);" class="dropdown-trigger" data-target="dropdown-settings-m"> <i class="material-icons text-dark-purple">account_circle</i></a>
								<ul id="dropdown-settings-m" class="dropdown-content">
									<li><a href="" class="modal-trigger black-text"><%=userName %></a></li>
        							<li><a href="/cloud/logout.jsp"><%=rBLoginHd.getString("LOGOUT") %></a></li>
								</ul>				
												
							</li>
						</ul>
					</div>
					<ul class="chartdtl chartsname">
						<li class="br-blue-dk black-text"><span><%=getChartName %>, <%=usrdob %>, <%=usrtob %>,</span> <%=usrpob %>,  <%=userayan %></li>
					</ul>					
					 <ul class="right topcntrl mb-hide">
					<li>
						    	<a href="javascript:void(0);" class="dropdown-trigger btn btn-small bg-light-orange black-text" data-target="dropdown-support">Support<i class="material-icons right text-orange">call</i></a>
						    	
						    
						    <ul id="dropdown-support" class="dropdown-content">
						     	<li><a>+91 95606 70006 </a></li>        						
						    </ul>
						    </li>			
					 <!-- <li>
					 	<a href="javascript:void(0);" class="modal-trigger notification-button" data-activates="notifications-dropdown">
					 		<i class="material-icons text-dark-blue">notifications_none</i>
					 	</a>
						<ul id="notifications-dropdown" class="dropdown-content">
							<li><a>A link</a></li>
        					<li><a>A second link</a></li>
        					<li><a>A third link</a></li>
						</ul>
								
					</li> -->
					<li>
					<a href="javascript:void(0);" class="dropdown-trigger btn btn-small bg-light-purple black-text" data-target="dropdown-settings"> <%=userName %> <i class="material-icons text-dark-purple right">account_circle</i></a>
								<ul id="dropdown-settings" class="dropdown-content">									
        							<li><a href="/cloud/logout.jsp"><%=rBLoginHd.getString("LOGOUT") %></a></li>
								</ul>
					</li>
				</ul>
			</div>				
		</nav>
	</div>
</header>
