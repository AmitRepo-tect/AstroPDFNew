<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.WorksheetUtilityFunctions"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@include file='/cloud/kp_south.jsp'%>
<%
    SharedFunction sf = new SharedFunction();
    double longitudeDifference=0;
    double[] bhavaPositions =new double [12];
    int[] bhavPosition=new int[13];
    int bhavPositionnew[] =new int[13];
    int []rashiPosition= new int[12];
    int []rashiPositionnew= new int[12];
    int []planetpositionarr=new int[13];
    int ayanamsa1 = 0;     
    for(int i = 0; i<=11; i++)
    {
        longitudeDifference =  myAstrologyObject.getKPCuspLongitude(i + 1) + ayanamsa1;
        if(longitudeDifference >= 360.0)
        	{
        	 longitudeDifference = longitudeDifference - 360.0;
        	}
        bhavaPositions[i] = (int)longitudeDifference;
        rashiPosition[i] = (int)(longitudeDifference / 30) + 1;	     
      
    }            
    for(int i = 0; i<=11; i++)
    {
       longitudeDifference = myAstrologyObject.getKPPlanetLongitude(i + 1) + ayanamsa1;
       rashiPositionnew[i] = (int)(longitudeDifference / 30) + 1;	  
      
        if( longitudeDifference >= 360.0)
        	{
        	longitudeDifference = longitudeDifference - 360.0;
        	}
            
          
            
        bhavPosition[i] = (int)sf.getPlanetBhavaPosition(longitudeDifference,bhavaPositions);
    }        

    for(int k = 0; k<=11; k++)
    {
        bhavPositionnew[k+1] = bhavPosition[k];
       
    } 
    bhavPositionnew[0] = rashiPosition[0];

    planetpositionarr = WorksheetUtilityFunctions.Getplanetpositionarr(1 ,myAstrologyObject);
    
    String ReturnJSONObj = "[{";
    ReturnJSONObj = ReturnJSONObj+"'arrayval':["+bhavPositionnew[0]+","+bhavPositionnew[1]+","+bhavPositionnew[2]+","+bhavPositionnew[3]+","+bhavPositionnew[4]+","+bhavPositionnew[5]+","+bhavPositionnew[6]+","+bhavPositionnew[7]+","+bhavPositionnew[8]+","+bhavPositionnew[9]+","+bhavPositionnew[10]+","+bhavPositionnew[11]+","+bhavPositionnew[12]+"],";
    ReturnJSONObj = ReturnJSONObj+"'arrayvalofrashi':["+rashiPosition[0]+","+rashiPosition[1]+","+rashiPosition[2]+","+rashiPosition[3]+","+rashiPosition[4]+","+rashiPosition[5]+","+rashiPosition[6]+","+rashiPosition[7]+","+rashiPosition[8]+","+rashiPosition[9]+","+rashiPosition[10]+","+rashiPosition[11]+"],";
    ReturnJSONObj = ReturnJSONObj+"'BhavRashi':["+rashiPositionnew[0]+","+rashiPositionnew[1]+","+rashiPositionnew[2]+","+rashiPositionnew[3]+","+rashiPositionnew[4]+","+rashiPositionnew[5]+","+rashiPositionnew[6]+","+rashiPositionnew[7]+","+rashiPositionnew[8]+","+rashiPositionnew[9]+","+rashiPositionnew[10]+","+rashiPositionnew[11]+"],";
    ReturnJSONObj = ReturnJSONObj+"'RashiPlanetForSouth':["+"{"+array1+"}"+","+"{"+array2+"}"+","+"{"+array3+"}"+","+"{"+array4+"}"+","+"{"+array5+"}"+","+"{"+array6+"}"+","+"{"+array7+"}"+","+"{"+array8+"}"+","+"{"+array9+"}"+","+"{"+array10+"}"+","+"{"+array11+"}"+","+"{"+array12+"}"+"]";
    ReturnJSONObj = ReturnJSONObj+"}]";
    out.print(ReturnJSONObj);
    
    


%>
