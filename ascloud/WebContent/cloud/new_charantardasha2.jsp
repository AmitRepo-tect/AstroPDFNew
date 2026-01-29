<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.chardasa.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("CHAR_DASHA")%></h1>	
</div>

<%  
       
         int[][] DashaOutput1 = new int[11][11];
         int  cellsPerPage  = 6;
         int  columnsPerPage  = 3;
         int rowsPerPage  = 4;
      
         int pageNumber = 2 ;
         int count = 0;
       
         DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
         CharDasa objCharDasha = new CharDasa();
         if(String.valueOf(session.getAttribute("languageCode")).equals("1")){
             myAstrologyObject.setLanguageCode("1");
         }
        
         if(String.valueOf(session.getAttribute("languageCode")).equals("0")) {
             myAstrologyObject.setLanguageCode("0");
         }
            
         myAstrologyObject.initialize();
         int  charpagenumber=1;
         
         if(String.valueOf(session.getAttribute("languageCode")).equals("1"))
            objCharDasha.setLanguageCode ("1");  //Hindi languagecde
         else                
            objCharDasha.setLanguageCode ("0");  //English languagecde
            
            objCharDasha.initializesArrayValues();

            DashaOutput1 = myAstrologyObject.getVarga();
            objCharDasha.getVargaForDasa (DashaOutput1);
            objCharDasha.setUserBirthTimeDetails(myAstrologyObject.getDayOfBirth(), myAstrologyObject.getMonthOfBirth(), myAstrologyObject.getYearOfBirth());
            objCharDasha.dasa();
            objCharDasha.getPlanetsStringDasaValue();
            objCharDasha.getStringDasaRashi();
            String DashaOutput = String.valueOf(objCharDasha.getFormatted1LevelOutput()); 
            String[] splittedCells = DashaOutput.split("\\+"+(char)10);
       %>
<div class="mrt-30"> 
<div class="card"> 

	<% for(int i = 0 ;i<= 3 ; i++){
      
    %>
		<div class="col s6 altcolor-oe">
		<div class="center">

	
			<%String[] splittedLines =  new String[3];
            splittedLines = splittedCells[i].split(""+(char)10);
            
            // out.println(splittedLines[0]+"<br/>"+splittedLines[1]+"<br/>"+splittedLines[2]);
            //Split(splittedCells(i), vbLf)%> 
            <%for(int j = 0 ;j<splittedLines.length ;j++){
            	 // out.println(splittedLines.length);%>
			<div class="table-alt cr-font">
			<% if((String.valueOf(session.getAttribute("languageCode")).equals("0"))|| (String.valueOf(session.getAttribute("languageCode")).equals("1")))
                            {
                            %> <%//=splittedLines[j]%> <%=(hindi.unicode(splittedLines[j],Integer.parseInt(String.valueOf(session.getAttribute("languageCode"))))).replace("़",".")
                            
                               %> <% }
                         else {
                             %> <%=local.unicodefForDasha(splittedLines[j].trim(), languageCode).replace("़",".")%>
							<%}%>

				</div>
				
					<%  } %>
				
			</div>
			</div>
			<%}%>
	
<div class="clearfix"></div>

</div>
</div>
<%
//----------------Code For Char Antar Dasha---------------
    int[][] aDashaOutput1 =  new int[12][12];
   String[] aDashaOutput =  new String[12];
    aDashaOutput1 = myAstrologyObject.getVarga();   
    objCharDasha.getVargaForDasa (aDashaOutput1)   ; 
    objCharDasha.setUserBirthTimeDetails(myAstrologyObject.getDayOfBirth(),myAstrologyObject.getMonthOfBirth(),myAstrologyObject.getYearOfBirth());
    
   objCharDasha.dasa();
   objCharDasha.getPlanetsStringDasaValue();
   objCharDasha.getStringDasaRashi();
    
    for(int i = 0 ;i<=11 ; i++){
      aDashaOutput[i] = String.valueOf(objCharDasha.getFormatted2LevelOutput(i));
     
    }
%>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="mrt-30"> 
<div class="card"> 

	<%   for(int i = (pageNumber - 1) * cellsPerPage ;i<= pageNumber * cellsPerPage - 1; i++){ %>

<div class="col s12 m4  altcolor">
		<div class="center">
			<%//out.println(i);
            //out.println(ADashaOutput[i]+"<br/>");
            String[] splittedLines =  new String[17]; 
            splittedLines = aDashaOutput[i].split(""+(char)10);
            //out.println(splittedLines.length);
            for(int k=0 ;k<=14 ; k++){
            //out.println(splittedLines[k]);
            }
            
           // out.println(splittedLines[i]+"i="+i);// Split(ADashaOutput(i), vbLf)              
              for(int j = 0 ; j < splittedLines.length ; j++){  %>
			<div class="table-alt cr-font">
			<%if(String.valueOf(session.getAttribute("languageCode")).equals("0") || String.valueOf(session.getAttribute("languageCode")).equals("1")) { %>

							<%=hindi.unicode(splittedLines[j],Integer.parseInt(String.valueOf(session.getAttribute("languageCode")))).replace("़",".")
                                  %> <%}else
                            { %> <%=local.unicodefForDasha(splittedLines[j].trim(), languageCode).replace("़",".")%>
							<% }%>
				</div>
					<%  } %>
					</div>
					</div>
				
			<% } %>
		<div class="clearfix"></div>
</div>
</div>
<%       
   String balanceOfDasaText ;
   balanceOfDasaText = String.valueOf(myAstrologyObject.getBalanceOfDasa()); // 'Print this value%>
    <div class="mrt-30"> 
   <div class="card">
   
    <div class="left padding-2 mrt-10"> 
 <b> <%=rBConstants.getString("NOTE") %> : <%=rBConstants.getString("DATES_GIVEN_ABOVE_ARE_DASHA_ENDING_DATES") %>
			</b>
			</div>
			
			<div class="right padding-2">
			<a href="charantardasha1.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("BACK") %></a>
			</div>

</div>
</div>
<p><%@include file='calculations-footer.jsp'%></p>
