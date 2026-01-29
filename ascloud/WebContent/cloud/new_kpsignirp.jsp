<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	 int languageCode = (Integer)session.getAttribute("languageCode");
	 Local local = new Local();
	 MyProperties kpConstants = (MyProperties) session.getAttribute("constants");
    MyResourceBundle kpSignConstants = local.loadPropertiesFileNew("kpsignirp", languageCode);
 	MyResourceBundle uraNepPlutoConstants = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday", languageCode);
         int[] planetNames = new int[12];  
         
         int[][] myArray = new int[10][12];	
         String[] myPlanetNames = new String[12];

         int X;
         String[] myArrayNo = new String[12];
         int[][] BhavArray = new int[12][12];
         
         DesktopHoro kpHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
         if(languageCode == 1){
        	 kpHoro.setLanguageCode("1");
        	 kpHoro.initialize();
         }
                                  

                        myPlanetNames[0]=kpConstants.getString("SUN");
                        myPlanetNames[1]=kpConstants.getString("MOON");
                        myPlanetNames[2]=kpConstants.getString("MARS");									   
                        myPlanetNames[3]=kpConstants.getString("MERCURY");				  
                        myPlanetNames[4]=kpConstants.getString("JUPITER");					   
                        myPlanetNames[5]=kpConstants.getString("VENUS");
                        myPlanetNames[6]=kpConstants.getString("SATURN");
                        myPlanetNames[7]=kpConstants.getString("RAHU");
                        myPlanetNames[8]=kpConstants.getString("KETU");
                        myPlanetNames[9]=uraNepPlutoConstants.getString("URANUS");
                        myPlanetNames[10]=uraNepPlutoConstants.getString("NEPTUNE");
                        myPlanetNames[11]=uraNepPlutoConstants.getString("PLUTO");	
					  
  
                        for(int i = 0;i<= 9;i++)
                        {
                            myArray[i] = kpHoro.getKPPlanetSignification(i);
                        } 
                        
    %>
    
    <div class="hdg-lg card">
	<h1><%=kpSignConstants.getString("SIGNIFICATORS_RULING_PLANETS") %></h1>	
</div>

<div class="row mrt-30">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=kpConstants.getString("PLANETS") %>&nbsp;
						<%=kpConstants.getString("SIGNIFICATION") %> </h4>
						
						<table class="highlight striped bordered ui-table ui-font">
						<thead>
						<tr>
			<th><%=kpConstants.getString("PLANETS") %></th>
			<th><%=kpSignConstants.getString("HOUSE_KP") %></th>		
		</tr>
		</thead>

		<% for(int icount = 1;icount<= 9;icount++)
        	{%>
		<tr>
			<td>
					<%=myPlanetNames[icount-1]%></td>
			<% for(int iJ = 0;iJ<= 11;iJ++)
            {
            	if(myArray[icount][iJ] != 0)
            	{
            	%>
			<td>
					<%=String.valueOf(myArray[icount][iJ])%>
					<%// out.println("<br/>"+icount+","+iJ); %></td>
			<%
            		
            	}else{
            		
            		%>
            		<td></td>
            		<%
            	}
            	
            
            }
			
			
			
          
            %>
		</tr>

		<%  } 
        
        	myArrayNo[0] = "I";
			myArrayNo[1] = "II";
			myArrayNo[2] = "III";
			myArrayNo[3] = "IV";
			myArrayNo[4] = "V";
			myArrayNo[5] = "VI";
			myArrayNo[6] = "VII";
			myArrayNo[7] = "VIII";
			myArrayNo[8] = "IX";
			myArrayNo[9] = "X";
			myArrayNo[10] = "XI";
			myArrayNo[11] = "XII";


for(int planetCount = 1;planetCount<= 9;planetCount++)
{
    for(int bhavaCount = 0;bhavaCount<= 11;bhavaCount++)
    {
        int readValue = myArray[planetCount][bhavaCount];
        if( readValue != 0) 
        {
        	BhavArray[readValue - 1][planetCount - 1] = planetCount;
        	//out.println(planetCount);
        }
    }
}
        %>
						
						</table>
						
          
          </div>
          </div>
          </div>
          
          
          <div class="row mrt-30">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel rt-custom">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=kpSignConstants.getString("SIGNIFICATORS_OF_HOUSES") %></h4>
						
						<table class="highlight striped bordered ui-table ui-font responsive-table">
						<thead>
						<tr>
				<th> <%=kpSignConstants.getString("HOUSE_KP") %></th>
				<th><%=kpConstants.getString("PLANETS") %></th>	
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>			
			</tr>
			</thead>
			<% 
            for(int icount=0;icount<=11;icount++)
 	    	   {
 	    	   %>
			<tr>
				<td> <%= myArrayNo[icount]%>
				</td>
				<% for(int iJ = 0;iJ <= 11;iJ++)
                {
                	int s = BhavArray[icount][iJ];
                	//out.println(myPlanetNames[s]+"<br/>");
		          if(myPlanetNames[s] != "" && s!=0)
		          {
		          String tempPlanet=myPlanetNames[s-1];
		                %>

				<td><%=tempPlanet%>
				</td>
				<%}
		          else{
	            		
	            		%>
	            		<td></td>
	            		<%
	            	}
				%>
				<%  } %>
			</tr>
			<% } %>
						</table>
						</div>
						</div>
						</div>

		<% 
			String ascendant = kpConstants.getString("ASCENDANT");
			String nakshatra = kpConstants.getString("NAKSHATRA");
			String moon = kpConstants.getString("MOON");
			String lord = kpConstants.getString("LORD");
			String sign = kpConstants.getString("SIGN");
			String[] myArrayHeading = new String[7];
    		myArrayHeading[0] = ascendant+"&nbsp;"+nakshatra+"&nbsp;"+lord;
			myArrayHeading[1] = ascendant+"&nbsp;"+sign+"&nbsp;"+lord;
			myArrayHeading[2] = moon+"&nbsp;"+nakshatra+"&nbsp;"+lord;
			myArrayHeading[3] = moon+"&nbsp;"+sign+"&nbsp;"+lord;
			myArrayHeading[4] = kpSignConstants.getString("DA")+"&nbsp;"+lord;
			myArrayHeading[5] = kpSignConstants.getString("ASCENDANT_SUB_LORD");
			myArrayHeading[6] = kpSignConstants.getString("MOON_SUB_LORD");

			double AscendantDegree  = (kpHoro.getAscendentLongitude() - kpHoro.getKPAyanamsaLongitude() + kpHoro.getAyanamsa());
			String[]  myArrayValue = new String[7];  
			myArrayValue[0] = kpHoro.getKPAscendentNakshatraLordName();
			myArrayValue[1] = kpHoro.getKPAscendentSignLordName();
			myArrayValue[2] = kpHoro.getKPMoonNakshatraLordName();
			myArrayValue[3] = kpHoro.getKPMoonSignLordName();
			myArrayValue[4] = kpHoro.getKPDayLordName();
			myArrayValue[5] = kpHoro.getKPAscendentSubLordName();
			myArrayValue[6] = kpHoro.getKPMoonSubLordName();          
  
%>
         <div class="row mrt-30">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=kpSignConstants.getString("RULING") %>&nbsp;
							<%=kpConstants.getString("PLANETS") %></h4>
						
						<table class="highlight striped bordered ui-table ui-font">
						<% 
        
        Hindi hindi = new Hindi();
        for(int i=0;i<= 6;i++)
        	{%>
				<tr style="background-color:white">
					<td>
						<%=myArrayHeading[i]%>
					</td>
					<td>&nbsp;</td>
					<td><%=hindi.unicode(String.valueOf(myArrayValue[i]), languageCode)%>
					</td>
				<tr>
					<%}%>
						</table>
						</div>
						</div>
						</div>
						

		
		<%@include file='kp-footer.jsp'%>