<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>
<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LALKITAB_REMEDIES_RULES")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">

<h5> <%=rBConstants.getString("LALKITAB_REMEDIES_RULES") %> </h5>

<ol> 
<li>  <%=rBConstants.getString("LALKITAB_REMEDIES_RULES1") %> </li>
<li>  <%=rBConstants.getString("LALKITAB_REMEDIES_RULES2") %> </li>
<li>  <%=rBConstants.getString("LALKITAB_REMEDIES_RULES3") %> </li>
<li>  <%=rBConstants.getString("LALKITAB_REMEDIES_RULES4") %> </li>
</ol>

</div>
</div>
</div>

