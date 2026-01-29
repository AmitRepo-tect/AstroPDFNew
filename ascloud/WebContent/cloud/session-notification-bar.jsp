
<%	
	if(request.getParameter("notification-box") == "" || request.getParameter("notification-box")==null){		
		session.setAttribute("notification","show");
	}
	else{               
		Cookie HideNotificationCookie = new Cookie("hidenotification","1");		
		HideNotificationCookie.setMaxAge(60*60*24*365);
		response.addCookie(HideNotificationCookie);
	}
 %>