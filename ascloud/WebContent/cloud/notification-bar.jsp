<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local objLocal = new Local();
int objLanguageCode = Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBNotificationBar = objLocal.loadPropertiesFileNew("notificationbar", objLanguageCode);
	
	Object objnoti = session.getAttribute("constants");
	MyProperties rBConstants = null;
	if(objnoti != null)
	{
		rBConstants = (MyProperties) objnoti;
	}
	else
	{
		rBConstants = new MyProperties(objLocal.loadPropertiesFile("constants", objLanguageCode));
		session.setAttribute("constants", rBConstants);
	}
	
%>

<script type="text/javascript">
    $(document).ready(function () {
        $(".hide-notibar").click(function () { 
            // creating session to hide the notification bar, once clicked
             $("#card-alert").animate({ opacity: 'hide' }, "slow");
            $.get("session-notification-bar.jsp",function(data){            	
            });
        });
    });  
</script>


<%
		if (session.getAttribute("notification") != "show") {
	%>

<div class="row hide-on-small-only">
<div class="col s12">

	<div id="card-alert" class="card">
		<div class="card-content orange-text">
			<p class="center-align grey-text text-darken-4 font-size">
				<%=rBNotificationBar.getString("ANNOUNCED") %>,
				 <a class="amber-text text-darken-4" href="/cloud/redirecttocloud.jsp?languagecode=0"><u><%=rBNotificationBar.getString("OLDER_VERSION") %></u></a>
			</p>
			<button type="button" class="close grey-text text-darken-4 hide-notibar">
				<i class="material-icons medium">close</i>
			</button>

		</div>

	</div>

</div>
</div>
	<% } %>


