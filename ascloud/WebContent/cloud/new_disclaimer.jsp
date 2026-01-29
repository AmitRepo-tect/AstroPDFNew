<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

 <div class="hdg-lg card">
	<h1><%=rBConstants.getString("DISCLAIM") %></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<h5> <%=rBConstants.getString("DISCLAIM") %></h5>
<p> The information and data contained on <i>astrosage.com</i> website is
			to be treated purely for your entertainment purposes only. Any
			prediction or other message that you receive is not a substitute for
			advice, programs, or treatment that you would normally receive from a
			licensed professional such as a lawyer, doctor, psychiatrist, or
			financial advisor. Accordingly, <i>astrosage.com </i>provides no
			guarantees, implied warranties, or assurances of any kind, and will
			not be responsible for any interpretation made or use by the
			recipient of the information and data mentioned above. </p>
</div>
</div>
</div>
