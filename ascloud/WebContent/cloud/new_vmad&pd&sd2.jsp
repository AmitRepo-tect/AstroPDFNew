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
String DashaOutput = vimshoHoro.getVimsottariDasaFourLevel().toString();
String balanceDasha = vimshoHoro.getBalanceOfDasa().toString();

%>
<div class="hdg-lg card">
	<h1><%=vimshottartiConstants.getString("VIMSHOTTARI_DASHA") %></h1>	
</div>
<div class="mrt-30 mrb-30"> 
<div class="card hdg-content"> 
<h2 class="ml-10 mrt-10"><%=vimshottartiConstants.getString("SOOKSHAMA") %>&nbsp;<%=vimshottartiConstants.getString("VIMSHOTTARI_DASHA") %></h2>

<div align="center" class="vim-tablen">
	
		<%          
	int count=-1;
	int cellperpage=12;
	int pagenum=2    ;          
       
	String[] splittedCells = DashaOutput.split("\\+");
    int iLowerlimit=(pagenum-1) * cellperpage;
    int iUpperlimit=pagenum * cellperpage-1;
    
%>
		<div class="row top-border cr-font">
			<% 
                for(int i = iLowerlimit ;i<= iUpperlimit  ; i++){
                %>
				<div class="col s4 m4 altcolor">
				<div class="center">
					<%
            String[] splittedLines = splittedCells[i+1].split("\n");
                
             for(int j = 0;j<splittedLines.length;j++) { %>
             
             <div class="table-alt">
					
									<% if(languageCode == 0 || languageCode == 1) { %> <%=hindi.unicode(splittedLines[j], languageCode)%>

									<% } else { %> <%=local.unicodefForDasha(splittedLines[j].trim(), languageCode)%>
									<% } %>
							</div>
							<% } %>
						</div>
						</div>
					<% } %>
				
		</div>
		<table>
			<tr>
				<td style="text-align:center;"><a href="vimshottaridasha.asp"
					class="waves-effect waves-light white-text btn amber darken-4 box-shadow"><%=vimshottartiConstants.getString("MENU")%></a>
					<a href="VMAD&PD&SD1.asp"
					class="waves-effect waves-light white-text btn amber darken-4 box-shadow"><%=vimshottartiConstants.getString("BACK")%></a>
					<a href="VMAD&PD&SD3.asp"
					class="waves-effect waves-light white-text btn amber darken-4 box-shadow"><%=vimshottartiConstants.getString("NEX")%></a>
				</td>
			</tr>
			
		</table>
		
</div>

</div>
</div>