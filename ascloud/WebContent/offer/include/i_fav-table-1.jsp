<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%
  	  Local local = new Local();
      Hindi hindi = new Hindi();
      int languageCode = Util.safeInt(session.getAttribute("languageCode"));
      MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
      MyResourceBundle favConstants = local.loadPropertiesFileNew("favourable",languageCode);
      
%>
<table class="table table-bordered table-striped">
<thead>
<tr>
	<th><%=favConstants.getString("FAV_DASHA") %></th>
	<th><%=favConstants.getString("FAV_ANTAR_DASHA") %></th>
	<th><%=favConstants.getString("FAV_PERIOD_START") %></th>
	<th><%=favConstants.getString("FAV_PERIOD_END") %></th>
	<th><%=favConstants.getString("FAV_ANALYSIS") %></th>
</tr>
</thead>
<tbody>

<tr>
	<td><%=rBConstants.getString("RAHU") %></td>
	<td><%=rBConstants.getString("KETU") %></td>
	<td>9/ 5/2002</td>
	<td>27/ 5/2003</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("RAHU") %></td>
	<td><%=rBConstants.getString("VENUS") %></td>
	<td>27/ 5/2003</td>
	<td>27/ 5/2006</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("RAHU") %></td>
	<td><%=rBConstants.getString("MOON") %></td>
	<td>21/ 4/2007</td>
	<td>21/10/2008</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("RAHU") %></td>
	<td><%=rBConstants.getString("MARS") %></td>
	<td>21/10/2008</td>
	<td>9/11/2009</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td>9/11/2009</td>
	<td>27/12/2011</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("SATURN") %></td>
	<td>27/12/2011</td>
	<td>9/ 7/2014</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("KETU") %></td>
	<td>15/10/2016</td>
	<td>21/ 9/2017</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("VENUS") %></td>
	<td>21/ 9/2017</td>
	<td>21/ 5/2020</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("MOON") %></td>
	<td>9/ 3/2021</td>
	<td>9/ 7/2022</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("MARS") %></td>
	<td>9/ 7/2022</td>
	<td>15/ 6/2023</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
<tr>
	<td><%=rBConstants.getString("JUPITER") %></td>
	<td><%=rBConstants.getString("RAHU") %></td>
	<td>15/ 6/2023</td>
	<td>9/11/2025</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>
</tbody>
</table>