<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>

<%

Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBShodWesVarshKP = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday",languageCode);
MyProperties vimshottartiConstants = (MyProperties) session.getAttribute("constants");

%>
<%
                String[] myPlanetDMS =  new String[13];   
                String[]  myPlanetNames   = new  String[13];
%>
<%
                  DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");   
	              UtilDesktop objUtil = new UtilDesktop();
	            // Set objUtil =Server.createObject("HoroDesktop.UtilDesktop")
                  
            //*********Code For Planet table*********      
                  //Use this line in case of Western System
					  double ayanamsa1 = myAstrologyObject.getKPAyanamsaLongitude();
					 
					   myPlanetNames[1]=vimshottartiConstants.getString("SUN");
					   myPlanetNames[2]=vimshottartiConstants.getString("MOON");
					   myPlanetNames[3]=vimshottartiConstants.getString("MARS");					   					   
					   myPlanetNames[4]=vimshottartiConstants.getString("MERCURY");
					   myPlanetNames[5]=vimshottartiConstants.getString("JUPITER");				   
					   myPlanetNames[6]=vimshottartiConstants.getString("VENUS");
					   myPlanetNames[7]=vimshottartiConstants.getString("SATURN");
					   myPlanetNames[8]=vimshottartiConstants.getString("RAHU");
					   myPlanetNames[9]=vimshottartiConstants.getString("KETU");
					   myPlanetNames[10]=rBShodWesVarshKP.getString("URANUS");
					   myPlanetNames[11]=rBShodWesVarshKP.getString("NEPTUNE");
					   myPlanetNames[12]=rBShodWesVarshKP.getString("PLUTO");
					  
				   	//Fetch Values for Degree
				   	for(int i = 1 ; i<=12 ; i++){
                    double planetLongitude = (myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1;
                      if(planetLongitude >= 360){ 
                        planetLongitude = planetLongitude - 360;
                      } 
                       myPlanetDMS[i] = objUtil.dms1(planetLongitude);
				   	}			   					   					   					   					  
%>

<div class="hdg-lg card">
	<h1><%=vimshottartiConstants.getString("WESTERN_SYSTEM") %></h1>	
</div>


<div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=vimshottartiConstants.getString("PLANETS") %> </h4>
<table class="highlight striped bordered ui-table ui-font">
<thead>
<tr>
		<th class="cellhead"><%=vimshottartiConstants.getString("PLANETS")%></th>
		<th class="cellhead"><b><%=vimshottartiConstants.getString("DEGREE")%></th>
	</tr>
	</thead>
	
	<% for(int i=1;i<= 12 ; i++){ %>
	<tr>
		<td class="cellcontent"><%=myPlanetNames[i]%>&nbsp;</td>
		<td class="cellcontent"><%=hindi.unicode(myPlanetDMS[i],Integer.parseInt(String.valueOf(session.getAttribute("languageCode"))))%>&nbsp;
		</td>
	</tr>
	<%}%>
</table>
</div>
</div>
</div>


<%
 String[] planetDegreeArr = new String[12];
 for(int i = 1 ;i<=12 ; i++){
	 double cuspalLongitude = (myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1;
        if(cuspalLongitude >= 360)  {
        	cuspalLongitude = cuspalLongitude - 360; 
        }
        objUtil.dms1 (cuspalLongitude);
        
        double planetLongitude1 = (myAstrologyObject.getKPCuspLongitude(i)) + ayanamsa1;
        if( planetLongitude1 >= 360)
        planetLongitude1 = planetLongitude1 - 360;
        planetDegreeArr[i - 1] = objUtil.dms1(planetLongitude1);
 }
%>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=vimshottartiConstants.getString("BHAV")%> </h4>
<table class="highlight striped bordered ui-table ui-font">
<thead>
<tr>
		<th class="cellhead"><%=vimshottartiConstants.getString("CUSP")%>
		</th>
		<th class="cellhead"><%=vimshottartiConstants.getString("DEGREE")%>
		</th>
	</tr>
</thead>

<% for(int i=1 ;i<=12 ; i++){ %>
	<tr>
		<td class="cellcontent"><%=(i)%>&nbsp;</td>
		<td class="cellcontent"><%=hindi.unicode(planetDegreeArr[i-1],Integer.parseInt(String.valueOf(session.getAttribute("languageCode"))))%>
		</td>
	</tr>
	<% }%>
</table>
</div>
</div>
</div>

<p><%@include file='calculations-footer.jsp'%></p>


<%! //Code Of Function getRNSSForCusp for Wesrtern Bhav Table
public String getRNSSForCusp(int i , DesktopHoro myAstrologyObject) {
	
       String  strDeLimiter = "-" ;
 
       String rashiName = myAstrologyObject.getRashiNameForKPCusp(i);
       String nakName = myAstrologyObject.getNakshatraLordNameForKPCusp(i);
       String subLordName = myAstrologyObject.getSubLordNameForKPCusp(i);
       String  subSubLordName = myAstrologyObject.getSubSubLordNameForKPCusp(i);
        
       String Rnss = rashiName + strDeLimiter + nakName + strDeLimiter + subLordName + strDeLimiter + subSubLordName;
   
    return(Rnss);
}
%>

