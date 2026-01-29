<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<% 
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("VIMSHOTTARI_DASHA") %></h1>	
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content"> 

		<h2 class="ml-10 mrt-10"><%=rBConstants.getString("SU_SUB_PERIODS") %></h2>

<div align="center" class="vim-table">
	
		<%  
       // Dim DashaOutput,splittedCells,i,j,balanceDasha,splittedLines,count,cellperpage,iLowerlimit,iUpperlimit,pagenum
       
        DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");   
        
        if(String.valueOf(session.getAttribute("languageCode")).equals("1")){
            myAstrologyObject.setLanguageCode("1") ;
            myAstrologyObject.initialize();
        }
        
        String  DashaOutput =  String.valueOf(myAstrologyObject.getVimsottariDasaThreeLevel()) ;          
        int count=-1;
        int cellperpage=15;
        int pagenum=4    ;    
        //out.println(DashaOutput);
        //splittedCells = Split(DashaOutput, "+")
        String[] splittedCells = DashaOutput.split("\\+");
        int iLowerlimit=(pagenum-1) * cellperpage +1;
        int iUpperlimit=pagenum * cellperpage;

        boolean proceed = true;
        if(splittedCells.length < iLowerlimit) {
            //response.write ("page5 No Display")
            proceed = false;
            out.println("<div align='center' class='unable-cont'>  <i class='material-icons large'> warning </i>   <h2> Page 4 No Display</h2> </div>");
          //  response.end
          //System.exit(0);
        }else if (splittedCells.length >=iLowerlimit &&  splittedCells.length <iUpperlimit){
            iUpperlimit=splittedCells.length;
        }
    %>
		<div class="row top-border cr-font">
			
				<% 			
				if(proceed)
				{
				for(int i = iLowerlimit ;i< iUpperlimit  ; i++){
                %>
				<div class="col s4 m4 altcolor">
				<div class="center">
					<%  String[] splittedLines = splittedCells[i].split("\n"); %> <% for(int j = 0; j< splittedLines.length;j++){ %>
					<div class="table-alt">
						
						
									<% if(String.valueOf(session.getAttribute("languageCode")).equals("0") ||  String.valueOf(session.getAttribute("languageCode")).equals("1")) { %>
									<%//=splittedLines[j]%> <%=hindi.unicode(splittedLines[j],Integer.parseInt(String.valueOf(session.getAttribute("languageCode"))))%>
									<% } else{%> <%=local.unicodefForDasha(splittedLines[j].trim(), languageCode).replaceAll(" ","")%>
									<%} %>
							</div> 
							<% } %>
						
					
					</div>
				</div>
					<% }} %>
					
			
		</div>
		<table>
			<tr>
				<td style="text-align:center;"><a href="vimshottaridasha.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("MENU")%></a>
					<a href="VMAD&PD3.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("BACK")%></a>
					<a href="VMAD&PD5.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("NEX")%></a>
				</td>
			</tr>
			
		</table>
		
</div>

</div>
</div>