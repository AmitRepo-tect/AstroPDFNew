<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Local localaf = new Local();
int langaf = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle dasAF = localaf.loadPropertiesFileNew("dhruv", langaf);	
%>

<h2><%=dasAF.getString("APPOINTMENT_BOOK_AN")%></h2>
<form class="das-form mrt-30" action="appointment-details.jsp" method="post"
	onsubmit="return formValidation();" name="dataReadForm">
	<div class="row">
		<div class="col s12 l6">
			<label for="name" class="active"><%=dasAF.getString("APPOINTMENT_NAME")%>
			</label> <input type="text"
				placeholder="<%=dasAF.getString("APPOINTMENT_NAME")%>" name="name"
				id="name" required>
		</div>
		<div class="col s12 l6 adgs">
			<label for="email"><%=dasAF.getString("APPOINTMENT_EMAIL_ID")%>
			</label> <input type="email"
				placeholder="<%=dasAF.getString("APPOINTMENT_EMAIL_ID")%>"
				name="email" id="email" required>

		</div>
	</div>
	<div class="row">
		<div class="col s6 l6">
			<label for="mobile" class="active"><%=dasAF.getString("APPOINTMENT_MOBILE")%>
			</label> <input type="number"
				placeholder="<%=dasAF.getString("APPOINTMENT_MOBILE")%>"
				name="mobile" id="mobile" required>
		</div>
		<div class="col s6 l6">
			<label for="dob"><%=dasAF.getString("APPOINTMENT_DATE_OF_BIRTH")%>
			</label>
			<div class="icons-post">
				<input type="text"
					placeholder="<%=dasAF.getString("APPOINTMENT_DATE_OF_BIRTH")%>"
					name="dob" id="dob" class="datepicker"> <i
					class="material-icons pointer" id="datePicker">calendar_today</i>
			</div>

		</div>
	</div>
	<div class="row">
		<div class="col s6 l6">
			<label for="tob" class="active"><%=dasAF.getString("APPOINTMENT_TIME_OF_BIRTH")%>
			</label>
			<div class="icons-post">
				<input type="text"
					placeholder="<%=dasAF.getString("APPOINTMENT_TIME_OF_BIRTH")%>"
					name="tob" id="tob" class="timepicker"> <i
					class="material-icons pointer" id="timePicker">watch_later</i>
			</div>
		</div>
		<div class="col s6 l6">
			<label for="place"><%=dasAF.getString("APPOINTMENT_PLACE_OF_BIRTH")%></label>
			<div class="icons-post">
				<input type="text"
					placeholder="<%=dasAF.getString("APPOINTMENT_PLACE_OF_BIRTH")%>"
					name="place" id="place"> <i class="material-icons">location_on</i>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col s6 l6">
			<label for="pay" class="active">Appointment Date</label> 
			<div class="icons-post">
				<input type="text"
					placeholder="Appointment Date"
					name="adate" id="adate" class="apntdatepicker"> <i
					class="material-icons pointer" id="ApntDatePicker">calendar_today</i>
			</div>
		</div>
		<div class="col s6 l6">
		<div class="row">
		<div class="col s6 l6">
			<label for="atime"><%=dasAF.getString("APPOINTMENT_TIME")%></label>
			<select class="browser-default" name="fdate">
				<%				
				Calendar cal = Calendar.getInstance();
		        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		        cal.set(Calendar.HOUR, 0);
		        cal.set(Calendar.MINUTE, 0);
		        cal.set(Calendar.HOUR_OF_DAY, 0);
		        
		        for(int i=0;i<96;i++){
		        	out.print("<option  value="+sdf.format(cal.getTime())+">"+sdf.format(cal.getTime())+"</option>");
		        	cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE)+ 15);
		        }
		        
					
				%>
			</select>
			
			
		</div>
		<div class="col s6 l6">
			<label for="atime" style="visibility:hidden;"><%=dasAF.getString("APPOINTMENT_TIME")%></label>
			<select class="browser-default">
				<%		        
				for(int i=0;i<96;i++){
		        	out.print("<option  value="+sdf.format(cal.getTime())+">"+sdf.format(cal.getTime())+"</option>");
		        	cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE)+ 15);
		        }
					
				%>
			</select>
			
		</div>
		</div>
		</div>
	</div>
	<div class="row">
	<div class="col s6 l6">
			<label for="pay" class="active"><%=dasAF.getString("APPOINTMENT_PAYMENT_RECEIVED")%>
			</label> <input type="number"
				placeholder="<%=dasAF.getString("APPOINTMENT_PAYMENT_RECEIVED")%>"
				name="pay" id="pay">
		</div>
		<div class="col s12 l6">
			<label for="remarks" class="active"><%=dasAF.getString("APPOINTMENT_REMARKS")%>
			</label> <input type="text"
				placeholder="<%=dasAF.getString("APPOINTMENT_REMARKS")%>"
				name="remarks" id="remarks">
		</div>

	</div>

	<div class="center">		
		<div class="cnf-hide-sys">
			<button
				class="btn btn-large waves-effect bg-dark-blue center well-css btn-ch-db1 book-appit"
				value="Book Now" type="submit"><%=dasAF.getString("APPOINTMENT_BOOK")%></button>
			<div class="cntrl-cb mt-1">
			<label for="person">
				<input type="checkbox" class="filled-in" id="person"
					checked="checked" name="gtw"> 
					<span><%=dasAF.getString("APPOINTMENT_NOTIFY_PERSON")%></span>
			</label>
			</div>
		</div>
	</div>
</form>