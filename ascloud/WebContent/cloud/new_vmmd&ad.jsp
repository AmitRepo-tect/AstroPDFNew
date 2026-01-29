<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<%
Hindi hindi = new Hindi();
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties vimshottartiConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro vimshoHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
String DashaOutput = vimshoHoro.getVimsottariDasaTwoLevel().toString();
String balanceDasha = vimshoHoro.getBalanceOfDasa().toString();

%>
<div class="hdg-lg card">
	<h1><%=vimshottartiConstants.getString("VIMSHOTTARI_DASHA") %></h1>	
</div>
<div class="mrt-30 mrb-30"> 
<div class="card hdg-content"> 
<h2 class="ml-10 mrt-10"><%=vimshottartiConstants.getString("SU_SUB_PERIODS") %></h2>

<div align="center" class="vim-table">


		<table>
			<tr>
				<td><h6 align="center"><%=vimshottartiConstants.getString("BAL_OF_DASA")%><%=Util.localizeBalOfDasha(balanceDasha, languageCode, vimshottartiConstants) %></h6></td>
			</tr>
		</table>
		
		<% String[] splittedCells = DashaOutput.split("\\+") ;%>
		<div class="row top-border cr-font">			
				<% for(int i = 0;i<=4;i++){%>
				<div class="col s4 l4 altcolor">
				<div class="center">
					<%  String[] splittedLines = splittedCells[i+1].split("\n");%> 					
					<%  for(int j = 0;j<splittedLines.length;j++)
                	{%>
					<div class="table-alt">
						
									<% if( languageCode == 0 || languageCode == 1) { %> <%=hindi.unicode(splittedLines[j], languageCode).trim()%>
									<% } else { %> <%=local.unicodefForDasha(splittedLines[j].trim(), languageCode)%> <% } %>
							
					</div> 
					<% } %>
					
					</div>
				</div>
				<% } %>
				
				<% for(int i = 5;i<=9;i++){%>
				<div class="col s4 l4 altcolor">
				<div class="center">
				<%  if(splittedCells.length > i+1)
					{
					String[] splittedLines = splittedCells[i+1].split("\n");%> 
					
					<%  for(int j = 0;j<splittedLines.length;j++)
                	{%>
					<div class="table-alt">
						
									<% if( languageCode == 0 || languageCode == 1) { %> <%=hindi.unicode(splittedLines[j], languageCode).trim()%>
									<% } else { %> <%=local.unicodefForDasha(splittedLines[j].trim(), languageCode)%> <% } %>
							
					</div> 
					<% } }%>
					
					</div>
				</div>
				<% } %>
			
		</div>
		
		<table align="center">
			<tr>
				<td style="text-align:center;"><a href="vimshottaridasha.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=vimshottartiConstants.getString("MENU")%></a>
					<a href="VMAD&PD1.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=vimshottartiConstants.getString("NEX") %></a></td>
			</tr>
			
		</table>
	
</div>
</div>
</div>
