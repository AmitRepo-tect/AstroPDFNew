<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title></title>

<link rel="shortcut icon" href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
<%@include file='/dhruv/cssscript.jsp'%> 
</head>
<%

Local localad = new Local();
int langad = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle dasAD = localad.loadPropertiesFileNew("dhruv", langad);	


String getname=request.getParameter("name");
String uname = new String(getname.getBytes("ISO-8859-1"), "UTF-8");	
String name  = Util.safestr(uname);
String dob   = Util.safestr(request.getParameter("dob"));
String tob   = Util.safestr(request.getParameter("tob"));
String place = Util.safestr(request.getParameter("place"));
String email   = Util.safestr(request.getParameter("email"));
String mobile = Util.safestr(request.getParameter("mobile"));
String pay = Util.safestr(request.getParameter("pay"));
String atime = Util.safestr(request.getParameter("atime"));
String remarks = Util.safestr(request.getParameter("remarks"));

%>

<body class="dhruv-soft">	
	<%@include file='/dhruv/header.jsp'%>
		<div id="contentArea">
		<div class="wrapper">
			<%@include file='/dhruv/navbar.jsp'%>
			 <section class="content" id="contentView">
             <div class="row">
              <div class="col s12 l3"></div>
               <div class="col s12 l6"> 
                <div class="card-panel br-radius br-all z-depth-0">
                <h2><%=dasAD.getString("APPOINTMENT_DETAILS")%></h2>
                 <div class="stle-btm"></div>
                <div class="row mt-3 style-apoint">
             	<h5 class="center-align"><%=dasAD.getString("APPOINTMENT_BOOKED_SUCCESSFULLY")%></h5>
               
                <div class="mt-3 res-set hide"> 
                
                 <div class="col s10 l10"> 
                 <div class="right-appoint">                 
                 <ul> 
                 <li> <span class="bg-dark-blue bullets"></span> <%=name %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=dob %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=tob %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=place %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=email %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=mobile %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=pay %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=atime %> </li>
                 <li> <span class="bg-dark-blue bullets"></span> <%=remarks %> </li>
                 
               </ul>
                  </div>
                 </div>
               
                <div class="stle-btm"></div>
                <div class="center-align mrt-20 hide">
                	<button
				class="btn btn-large waves-effect bg-dark-blue center well-css btn-ch-db1"
				value="Book Now" type="button">Print Receipt</button>
       </div>
        </div>
                </div>
                
               </div>
              </div>
             </div>
            </section>
		</div>
	</div>
<%@include file='/dhruv/footer.jsp'%> 
</body>
</html>