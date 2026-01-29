<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.ResourceBundle"%>
<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");

%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LALKITAB_DASHA")%></h1>	
</div>



<%   
//**********Code Of Function To Get Planet's Heading
String[] arrPlanet = new String[10];
String[] arrHead = new String[28];

arrPlanet[1]=rBConstants.getString("SUN");
arrPlanet[2]=rBConstants.getString("MOON");
arrPlanet[3]=rBConstants.getString("MARS");
arrPlanet[4]=rBConstants.getString("MERCURY");
arrPlanet[5]=rBConstants.getString("JUPITER");
arrPlanet[6]=rBConstants.getString("VENUS");
arrPlanet[7]=rBConstants.getString("SATURN");
arrPlanet[8]=rBConstants.getString("RAHU");
arrPlanet[9]=rBConstants.getString("KETU");

arrHead[0] = arrPlanet[7];
arrHead[1] = arrPlanet[8];
arrHead[2] = arrPlanet[9];
arrHead[3] = arrPlanet[5];
arrHead[4] = arrPlanet[1];
arrHead[5] = arrPlanet[2];
arrHead[6] = arrPlanet[6];
arrHead[7] = arrPlanet[3];
arrHead[8] = arrPlanet[4];
arrHead[9] = arrPlanet[7];
arrHead[10] = arrPlanet[8];
arrHead[11] = arrPlanet[9];
arrHead[12] = arrPlanet[5];
arrHead[13] = arrPlanet[1];
arrHead[14] = arrPlanet[2];
arrHead[15] = arrPlanet[6];
arrHead[16] = arrPlanet[3];
arrHead[17] = arrPlanet[4];
arrHead[18] = arrPlanet[7];
arrHead[19] = arrPlanet[8];

arrHead[20] = arrPlanet[9];
arrHead[21] = arrPlanet[5];
arrHead[22] = arrPlanet[1];
arrHead[23] = arrPlanet[2];
arrHead[24] = arrPlanet[6];

arrHead[25] = arrPlanet[3];
arrHead[26] = arrPlanet[4];

//**********Code Of Procedure To Intialize The Lalkitab

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
LalKitab objLalKitab = new LalKitab();

objLalKitab.setName (myAstrologyObject.getName());
objLalKitab.setPlace (myAstrologyObject.getPlace());
objLalKitab.setTimeZone (myAstrologyObject.getTimeZone());
objLalKitab.setMaleFemale (myAstrologyObject.getMaleFemale());
objLalKitab.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
objLalKitab.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
objLalKitab.setHourOfBirth (myAstrologyObject.getHourOfBirth());
objLalKitab.setDayOfBirth(String.valueOf(myAstrologyObject.getDayOfBirth()));
objLalKitab.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
objLalKitab.setYearOfBirth (String.valueOf(myAstrologyObject.getYearOfBirth()));
objLalKitab.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
objLalKitab.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
objLalKitab.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
objLalKitab.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
objLalKitab.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
objLalKitab.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
objLalKitab.setEastWest (myAstrologyObject.getEastWest());
objLalKitab.setNorthSouth (myAstrologyObject.getNorthSouth());
objLalKitab.setDST (myAstrologyObject.getDST());
objLalKitab.setLanguageCode("0");
objLalKitab.initialize();

//*********Code For LalKitab Dasha*********
String[] arrPlanetName = arrHead;
String[] arrHeading = new String[27];
arrHeading[0] = arrPlanetName[0] + " " +  6 + " " +  rBConstants.getString("YEA");
arrHeading[1] = arrPlanetName[1] + " " +  6 + " " +  rBConstants.getString("YEA");
arrHeading[2] = arrPlanetName[2] + " " +  3 + " " +  rBConstants.getString("YEA");
arrHeading[3] = arrPlanetName[3] + " " +  6 + " " +  rBConstants.getString("YEA");
arrHeading[4] = arrPlanetName[4] + " " +  2 + " " +  rBConstants.getString("YEA");

arrHeading[5] = arrPlanetName[5] + " " +  1 + " " +  rBConstants.getString("YEA");
arrHeading[6] = arrPlanetName[6] + " " +  3 + " " +  rBConstants.getString("YEA");
arrHeading[7] = arrPlanetName[7] + " " +  6 + " " +  rBConstants.getString("YEA");
arrHeading[8] = arrPlanetName[8] + " " +  2 + " " +  rBConstants.getString("YEA");
arrHeading[9] = arrPlanetName[9] + " " +  6 + " " +  rBConstants.getString("YEA");

arrHeading[10] = arrPlanetName[10] + " " + 6 + " " + rBConstants.getString("YEA");
arrHeading[11] = arrPlanetName[11] + " " + 3 + " " + rBConstants.getString("YEA");
arrHeading[12] = arrPlanetName[12] + " " + 6 + " " + rBConstants.getString("YEA");
arrHeading[13] = arrPlanetName[13] + " " + 2 + " " + rBConstants.getString("YEA");
arrHeading[14] = arrPlanetName[14] + " " + 1 + " " + rBConstants.getString("YEA");

arrHeading[15] = arrPlanetName[15] + " " +  3 + " " +  rBConstants.getString("YEA");
arrHeading[16] = arrPlanetName[16] + " " +  6 + " " +  rBConstants.getString("YEA");
arrHeading[17] = arrPlanetName[17] + " " +  2 + " " +  rBConstants.getString("YEA");
arrHeading[18] = arrPlanetName[18] + " " +  6 + " " +  rBConstants.getString("YEA");
arrHeading[19] = arrPlanetName[19] + " " +  6 + " " +  rBConstants.getString("YEA");

arrHeading[20] = arrPlanetName[20] + " " + 3 + " " + rBConstants.getString("YEA");
arrHeading[21] = arrPlanetName[21] + " " + 6 + " " + rBConstants.getString("YEA");
arrHeading[22] = arrPlanetName[22] + " " + 2 + " " + rBConstants.getString("YEA");
arrHeading[23] = arrPlanetName[23] + " " + 1 + " " + rBConstants.getString("YEA");
arrHeading[24] = arrPlanetName[24] + " " + 3 + " " + rBConstants.getString("YEA");
arrHeading[25] = arrPlanetName[25] + " " + 6 + " " + rBConstants.getString("YEA");
arrHeading[26] = arrPlanetName[26] + " " + 2 + " " + rBConstants.getString("YEA");
String[] arrDasaPeriod = objLalKitab.getIstLevelLalKitabDasa();
String[] arrDasaSpan = objLalKitab.getSecondLevelLalKitabDasa();

int intLowerLimit = 0;
int intUpperLimit = 1;

%>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-content">
<h2 class="mrt-10 ml-10">  <%=rBConstants.getString("SU_SUB_PERIODS") %>   </h2>
<table width="100%" class="vim-tablen cr-font">
	<%int jLowerCount= 0;
    for (int iCount = 0; iCount<= 26 ; iCount++){
    	
    %>
    
    
    
    <%  if(iCount % 3==0 ){%>
	<tr class="altcolor">
		<%}%>
		<td>
		
			<table>
				<tr>
					<td><b><%=arrHeading[iCount]%></b>
					</td>
				</tr>
				<tr>
					<td><b>--------------------------</b></td>
				</tr>
				<tr>
					<td><%=arrDasaPeriod[intLowerLimit]  +" - "  + arrDasaPeriod[intUpperLimit]%>
					</td>
				</tr>
				<tr>
					<td><b>--------------------------</b></td>
				</tr>
			</table>
			<table>
				<%
            String[] arrMiddlePlanetName =getPlanetName(arrPlanetName[iCount],rBConstants);
            int intNo = 0; 
            %>
				<% for (int jCount = 0;jCount<=2;jCount++){  %>
				<tr>
					<td><b><%=arrMiddlePlanetName[intNo]%></b>

						<b><%=arrDasaSpan[jLowerCount]%></b>
					</td>
					<% intNo = intNo + 1; %>
				</tr>
				<% jLowerCount = jLowerCount + 1; 
                    %>
				<% } %>
			</table> <% intLowerLimit = intUpperLimit;
                intUpperLimit = iCount + 2;  %>
		</td>
		<%}%>
	</tr>
	
	
	
</table>
</div>
</div>
</div>

<%@include file='lalkitab-footer.jsp'%>
<%!

//****************Code of FunctionTo get Planet Name********
public String[] getPlanetName(String strPlanet,MyProperties rBConstants){
	
String[] arrMiddlePlanetName= new String[10];
String[] arrPlanetName= new String[4];

arrMiddlePlanetName[1]=rBConstants.getString("SUN"); 
arrMiddlePlanetName[2]=rBConstants.getString("MOON");
arrMiddlePlanetName[3]=rBConstants.getString("MARS");
arrMiddlePlanetName[4]=rBConstants.getString("MERCURY") ;
arrMiddlePlanetName[5]=rBConstants.getString("JUPITER") ;
arrMiddlePlanetName[6]=rBConstants.getString("VENUS") ;
arrMiddlePlanetName[7]=rBConstants.getString("SATURN") ;
arrMiddlePlanetName[8]=rBConstants.getString("RAHU");
arrMiddlePlanetName[9]=rBConstants.getString("KETU");


if (strPlanet.equals(arrMiddlePlanetName[1])){
  arrPlanetName[0] = arrMiddlePlanetName[1]+ " ";
  arrPlanetName[1] = arrMiddlePlanetName[2];
  arrPlanetName[2] = arrMiddlePlanetName[3];
}
else if(strPlanet.equals(arrMiddlePlanetName[2])){
	 arrPlanetName[0] = arrMiddlePlanetName[5] + " ";
	 arrPlanetName[1] = arrMiddlePlanetName[1] + " ";
	 arrPlanetName[2] = arrMiddlePlanetName[2]; 
}
else if(strPlanet.equals(arrMiddlePlanetName[3])){
	 arrPlanetName[0] = arrMiddlePlanetName[3];
	 arrPlanetName[1] = arrMiddlePlanetName[7] + " ";
	 arrPlanetName[2] = arrMiddlePlanetName[6]+ " "; 
}
else if(strPlanet.equals(arrMiddlePlanetName[4])){
	 arrPlanetName[0] = arrMiddlePlanetName[2];
	 arrPlanetName[1] = arrMiddlePlanetName[3];
	 arrPlanetName[2] = arrMiddlePlanetName[5]+ " "; 
}
else if(strPlanet.equals(arrMiddlePlanetName[5])){
	 arrPlanetName[0] = arrMiddlePlanetName[9]+ " "; 
	 arrPlanetName[1] = arrMiddlePlanetName[5]+ " "; 
	 arrPlanetName[2] = arrMiddlePlanetName[1]+ " "; 
}
else if(strPlanet.equals(arrMiddlePlanetName[6])){
	 arrPlanetName[0] = arrMiddlePlanetName[3]; 
	 arrPlanetName[1] = arrMiddlePlanetName[1]+ " "; 
	 arrPlanetName[2] = arrMiddlePlanetName[2]; 
}
else if(strPlanet.equals(arrMiddlePlanetName[7])){
	 arrPlanetName[0] = arrMiddlePlanetName[8]+ " "; 
	 arrPlanetName[1] = arrMiddlePlanetName[4]+ " "; 
	 arrPlanetName[2] = arrMiddlePlanetName[7]+ " "; 
}
else if(strPlanet.equals(arrMiddlePlanetName[8])){
	 arrPlanetName[0] = arrMiddlePlanetName[3];
	 arrPlanetName[1] = arrMiddlePlanetName[9]+ " "; 
	 arrPlanetName[2] = arrMiddlePlanetName[8]+ " "; 
}
else if(strPlanet.equals(arrMiddlePlanetName[9])){
	 arrPlanetName[0] = arrMiddlePlanetName[7]+ " ";
	 arrPlanetName[1] = arrMiddlePlanetName[8]+ " "; 
	 arrPlanetName[2] = arrMiddlePlanetName[9]+ " "; 
}
return(arrPlanetName);
}
%>