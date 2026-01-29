<%@page import="com.cslsoftware.varshphala.Varshphala"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table-without-hdg ui-hgt">
<%
    Local local = new Local();
    int languageCode = (Integer)session.getAttribute("languageCode");
    MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
    MyResourceBundle varshphalallpages = local.loadPropertiesFileNew("varshphalallpages",languageCode);
    String[] arrHeadingsPanchadhikari = new String[6];
    String[] arr1Planet = new String[6];
    
    DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
    Varshphala objVarshPhal = new Varshphala();
    //myvalue=Year(date) 
    int myvalue=Calendar.getInstance().get(Calendar.YEAR);
    myvalue = myvalue - Integer.parseInt(String.valueOf(myAstrologyObject.getYearOfBirth()));    
    //myValue = CInt(myValue) - CInt(myAstrologyObject.getYearOfBirth) 
    if(myvalue>=0 || myvalue<=0) // this method need to call anyhow to genrate correct out put. comment by manoj
    {   
	initializeVarshPhal(myvalue, myAstrologyObject.getYearOfBirth(),myAstrologyObject,objVarshPhal,languageCode);
    }		
    int intJD = Integer.parseInt(String.valueOf(objVarshPhal.calculateJdForVarshphal()));
    int intVarshYear = objVarshPhal.getVarshphalYear();
    //out.println(intVarshYear+","+intJD);
    int[] arrVarshPhal = objVarshPhal.getVarshphal(intVarshYear, intJD);
    objVarshPhal.initializeForBirthTime();
    objVarshPhal.initializeForVarshphala();
    objVarshPhal.calculateMuntha();
    objVarshPhal.calculateOpeningDasa();

   
    arrHeadingsPanchadhikari[0]= varshphalallpages.getString("MUNTHA")+" "+rBConstants.getString("LORD");
    arrHeadingsPanchadhikari[1]= rBConstants.getString("BIRTH")+" "+rBConstants.getString("ASCENDANT")+"&nbsp;"+rBConstants.getString("LORD");
    arrHeadingsPanchadhikari[2]= rBConstants.getString("YEA") +" "+rBConstants.getString("ASCENDANT")+"&nbsp;"+rBConstants.getString("LORD");
    arrHeadingsPanchadhikari[3]= varshphalallpages.getString("TRIRASHI")+" "+rBConstants.getString("LORD");
    arrHeadingsPanchadhikari[4]= varshphalallpages.getString("DINRATRI")+" "+rBConstants.getString("LORD");
	 
    arr1Planet[0] = objVarshPhal.getMunthesh();
    arr1Planet[1] = objVarshPhal.getBirthAscendentLord();
    arr1Planet[2] = objVarshPhal.getVarshAscendentLord();
    arr1Planet[3] = objVarshPhal.getTriRashiPati();
    arr1Planet[4] = objVarshPhal.getDinRatriPati();
%>
<table style="min-height:262px;">        
    <%for(int i=0 ;i<= 4;i++){ %>
    <tr>
        <td>
            <%=arrHeadingsPanchadhikari[i]%>
        </td>
        <td>
            <%=rBConstants.getString((arr1Planet[i]).toUpperCase())%>
        </td>
    </tr>
    <%}%>    
</table>
</div>
<%!
public void initializeVarshPhal(int intInput ,int strYear,DesktopHoro myAstrologyObject,Varshphala objVarshPhal , int languageCode) throws Exception{
	objVarshPhal.setName (myAstrologyObject.getName());
	objVarshPhal.setPlace (myAstrologyObject.getPlace());
	objVarshPhal.setTimeZone (myAstrologyObject.getTimeZone());
	objVarshPhal.setMaleFemale (myAstrologyObject.getMaleFemale());
	objVarshPhal.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
	objVarshPhal.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
	objVarshPhal.setHourOfBirth (myAstrologyObject.getHourOfBirth());
	objVarshPhal.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
	objVarshPhal.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
	objVarshPhal.setYearOfBirth (String.valueOf(strYear)); 
	objVarshPhal.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
	objVarshPhal.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
	objVarshPhal.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
	objVarshPhal.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
	objVarshPhal.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
	objVarshPhal.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
	objVarshPhal.setEastWest (myAstrologyObject.getEastWest());
	objVarshPhal.setNorthSouth (myAstrologyObject.getNorthSouth());
	objVarshPhal.setDST (myAstrologyObject.getDST());
	objVarshPhal.initialize(); 
	objVarshPhal.setVarshphalYear(intInput);
	objVarshPhal.setLanguageCode ("0");
	//if(languageCode==1) {
	   //objVarshPhal.setLanguageCode(String.valueOf(languageCode));
	//}
	
	

}
%>