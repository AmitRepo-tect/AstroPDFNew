<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%
  	  Local local3 = new Local();
      Hindi hindi3 = new Hindi();
      int languageCode3 = Util.safeInt(session.getAttribute("languageCode"));
      MyProperties rBConstants3 = (MyProperties) session.getAttribute("constants");
      MyResourceBundle favConstants3 = local3.loadPropertiesFileNew("favourable",languageCode3);
      
%>
        <table class="table table-bordered table-striped">
            <thead>
<tr>
	<th><%=favConstants3.getString("FAV_DASHA") %></th>
	<th><%=favConstants3.getString("FAV_ANTAR_DASHA") %></th>
	<th><%=favConstants3.getString("FAV_PERIOD_START") %></th>
	<th><%=favConstants3.getString("FAV_PERIOD_END") %></th>
	<th><%=favConstants3.getString("FAV_ANALYSIS") %></th>
</tr>
</thead>
<tbody>

<tr>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td><%=rBConstants3.getString("MERCURY") %></td>
	<td>21/10/1999</td>
	<td>9/ 5/2002</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td><%=rBConstants3.getString("KETU") %></td>
	<td>9/ 5/2002</td>
	<td>27/ 5/2003</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td><%=rBConstants3.getString("VENUS") %></td>
	<td>27/ 5/2003</td>
	<td>27/ 5/2006</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td><%=rBConstants3.getString("SUN") %></td>
	<td>27/ 5/2006</td>
	<td>21/ 4/2007</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td><%=rBConstants3.getString("MOON") %></td>
	<td>21/ 4/2007</td>
	<td>21/10/2008</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td><%=rBConstants3.getString("MARS") %></td>
	<td>21/10/2008</td>
	<td>9/11/2009</td>
	<td><!--#include file='i_upgrade-1.asp'--></td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td>9/11/2009</td>
	<td>27/12/2011</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("KETU") %></td>
	<td>15/10/2016</td>
	<td>21/ 9/2017</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("VENUS") %></td>
	<td>21/ 9/2017</td>
	<td>21/ 5/2020</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("SUN") %></td>
	<td>21/ 5/2020</td>
	<td>9/ 3/2021</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("MOON") %></td>
	<td>9/ 3/2021</td>
	<td>9/ 7/2022</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("MARS") %></td>
	<td>9/ 7/2022</td>
	<td>15/ 6/2023</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td>15/ 6/2023</td>
	<td>9/11/2025</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("KETU") %></td>
	<td>21/ 7/2031</td>
	<td>30/ 8/2032</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("VENUS") %></td>
	<td>30/ 8/2032</td>
	<td>30/10/2035</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("SUN") %></td>
	<td>30/10/2035</td>
	<td>12/10/2036</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("MOON") %></td>
	<td>12/10/2036</td>
	<td>12/ 5/2038</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("MARS") %></td>
	<td>12/ 5/2038</td>
	<td>21/ 6/2039</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>


<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("RAHU") %></td>
	<td>21/ 6/2039</td>
	<td>27/ 4/2042</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

<tr>
	<td><%=rBConstants3.getString("SATURN") %></td>
	<td><%=rBConstants3.getString("JUPITER") %></td>
	<td>27/ 4/2042</td>
	<td>9/11/2044</td>
	<td>
	<%@include file='i_upgrade-1.jsp'%>
	</td>
</tr>

</tbody>
</table>