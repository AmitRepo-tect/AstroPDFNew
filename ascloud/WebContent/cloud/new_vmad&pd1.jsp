<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
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

			<h2 class="ml-10 mrt-10">
				<%=rBConstants.getString("SU_SUB_PERIODS") %></h2>

<div align="center" class="vim-table">
	

		<%  
       // Dim DashaOutput,splittedCells,i,j,balanceDasha,splittedLines,count,cellperpage,iLowerlimit,iUpperlimit,pagenum
       
        DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");   
        
        if(languageCode== 1){
            myAstrologyObject.setLanguageCode("1") ;
            myAstrologyObject.initialize();
        }
        else
        {
        	myAstrologyObject.setLanguageCode("0") ;
            myAstrologyObject.initialize();
        }
        
        String  DashaOutput =  String.valueOf(myAstrologyObject.getVimsottariDasaThreeLevel()) ;          
        int count=-1;
        int cellperpage=15;
        int pagenum=1    ;    
        //out.println(DashaOutput);
        //splittedCells = Split(DashaOutput, "+")
        String[] splittedCells = DashaOutput.split("\\+");
        int iLowerlimit=(pagenum-1) * cellperpage +1;
        int iUpperlimit=pagenum * cellperpage;

        if(splittedCells.length < iLowerlimit) {
            //response.write ("page5 No Display")
            out.println(" <div align='center' class='unable-cont'>  <i class='material-icons large'> warning </i>   <h2> Page 1 No Display</h2> </div>");
          //  response.end
        }else if (splittedCells.length >=iLowerlimit &&  splittedCells.length <iUpperlimit){
            iUpperlimit=splittedCells.length;
        }else{
            iUpperlimit=iUpperlimit;
        } 
    %>

		<div class="row top-border cr-font">
		
				<% 
                for(int i = iLowerlimit ;i<= iUpperlimit  ; i++){
               %>
				<div class="col s4 m4 altcolor"> 
				<div class="center">
				<% //splittedLines = Split(splittedCells(i), vbLf)
                        //out.println(splittedCells[i]+"neha");
                         //String newstring = splittedCells[i].replaceAll((char)10+"","<br/>");
                        String[] splittedLines = splittedCells[i].split("\n");
                        //out.println(splittedLines.length);
                        for(int j = 0; j< splittedLines.length;j++){ %>
					<div class="table-alt">
									<% if(languageCode == 0 ||  languageCode == 1) { %>
									<%//=splittedLines[j]%> <%=hindi.unicode(splittedLines[j],languageCode)%>
									<% } else{%> <%=local.unicodefForDasha(splittedLines[j], languageCode)%>
									<%} %>
								</div>
								<%}%>
								</div>
			
			</div>
						
				<%} %>
						
		</div>
		<table>
			<tr>
				<td style="text-align:center;"><a href="vimshottaridasha.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("MENU")%></a>
					<a href="VMMD&AD.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("BACK")%></a>
					<a href="VMAD&PD2.asp"
					class="waves-effect white-text waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("NEX")%></a>
				</td>
			</tr>
		
		</table>
</div>

</div>
</div>
