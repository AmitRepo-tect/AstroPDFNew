<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.cslsoftware.horo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology
        Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel='stylesheet' type='text/css' href='css/stylesheet.css'>
</head>
<body>
<%
    out.print("<b>Prastharashtakvarga Tables</b>" + "<br>");  

   
    

    int arrPrVarga[][][]=new int[8][8][13];
    int arrColTotal[][]=new int[9][13]; 
    String arrPlanetNames[]=new String[10];
    String arrZodiac1[]=new String[13]; 
    String arrPlanets[]=new String[8]; 
    
	DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
    
	arrPlanetNames[1] = "<b>Su</b>";
    arrPlanetNames[2] = "<b>Mo</b>";
    arrPlanetNames[3] = "<b>Ma</b>";
    arrPlanetNames[4] = "<b>Me</b>";
    arrPlanetNames[5] = "<b>Ju</b>";
    arrPlanetNames[6] = "<b>Ve</b>";
    arrPlanetNames[7] = "<b>Sa</b>";
    arrPlanetNames[8] = "<b>As</b>";
    arrPlanetNames[9] = "<b>Total</b>"; 

    
    arrZodiac1[0] = "<b>Ar</b>";
    arrZodiac1[1] = "<b>Ta</b>";
    arrZodiac1[2] = "<b>Ge</b>";
    arrZodiac1[3] = "<b>Ca</b>";
    arrZodiac1[4] = "<b>Le</b>";
    arrZodiac1[5] = "<b>Vi</b>";
    arrZodiac1[6] = "<b>Li</b>";
    arrZodiac1[7] = "<b>Sc</b>";
    arrZodiac1[8] = "<b>Sa</b>";
    arrZodiac1[9] = "<b>Ca</b>";
    arrZodiac1[10] = "<b>Aq</b>";
    arrZodiac1[11] = "<b>Pi</b>";
    arrZodiac1[12] = "<b>Tot</b>";

    
    int count=0;

    for(int iCounti = 0; iCounti <=6; iCounti++)
    {
    	for(int iCountj = 0; iCountj <=11; iCountj++)
        {   
    		arrColTotal[iCounti][iCountj] = myAstrologyObject.getAshtakvargaBinduForSignAndPlanet(iCounti, iCountj);
        }
    }

    for(int iCounti = 0; iCounti <=7; iCounti++)
    {
    	for(int iCountj = 0; iCountj <=7; iCountj++)
        {
    		for(int iCountK = 0; iCountK <=12; iCountK++)
    	    {
                arrPrVarga[iCounti][iCountj][iCountK] = myAstrologyObject.getPrastharashtakvargaTables(iCounti + 1, iCountj + 1, iCountK + 1);
    	    }
        }
    }

    arrPlanets[0] = "Sun";
    arrPlanets[1] = "Moon";
    arrPlanets[2] = "Mars";
    arrPlanets[3] = "Mercury";
    arrPlanets[4] = "Jupiter";
    arrPlanets[5] = "Venus";
    arrPlanets[6] = "Saturn";
    arrPlanets[7] = "Rahu";

    

    for(int iCounti = 0; iCounti <=3; iCounti++)
    {

    out.print("<div class=textad><b>" + arrPlanets[iCounti] + "</b><br>");
    out.print("<table><tr><td>");
    out.print("<td><b>" + arrZodiac1[0] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[1] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[2] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[3] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[4] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[5] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[6] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[7] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[8] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[9] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[10] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[11] + "</b></td>");
    out.print("<td><b>" + arrZodiac1[12] + "</b></td></tr>");

    for(int iCountj= 0; iCountj <=8; iCountj++)
    {
            
            out.print("<tr><td>" + arrPlanetNames[iCountj + 1] + "</td>");

            for(int iCountK = 0; iCountK <=12; iCountK++)
            {
                

                if (iCountj == 8)
                	{
                    if(iCountK == 12)
                    {
                    }
                    else
                    {
                        out.print("<td>" + arrColTotal[iCounti][iCountK] + "</td>");
                    }
                    
                	}
                else
                {
                    out.print("<td>" + arrPrVarga[iCounti][iCountj][iCountK] + "</td>");
                }
            }

            out.print("</tr>");
    }
        out.print("</table>");
        out.print("</div><br />");        
    }
    
    
    

    for(int iCounti = 4; iCounti <=7; iCounti++)
    {

        out.print("<div class=textad><b>" +arrPlanets[iCounti] + "</b><br>");
        out.print("<table><tr><td>");
        out.print("<td><b>" + arrZodiac1[0] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[1] + "</b></td>");
        out.print("<td><b>" + arrZodiac1[2] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[3] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[4] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[5] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[6] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[7] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[8] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[9] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[10] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[11] + "</b></td>"); 
        out.print("<td><b>" + arrZodiac1[12] + "</b></td></tr>"); 

        for(int iCountj = 0; iCountj <=8; iCountj++)
        {
           
            out.print("<tr><td>" + arrPlanetNames[iCountj + 1] + "</td>");

            for(int iCountK = 0; iCountK <=12; iCountK++)
            {
                

                if (iCountj == 8)
                	{
                    if(iCountK == 12)
                    {
                    }
                    else
                    {
                        out.print("<td>" + arrColTotal[iCounti][iCountK] + "</td>");
                    }
                    
                	}
                else
                {
                    out.print("<td>" + arrPrVarga[iCounti][iCountj][iCountK] + "</td>");
                }
            }
		    out.print("</tr>");
        }
        out.print("</table>");
        out.print("</div><br />");
    }
    
    
%>
<%@include file='/m/include/i_footer.jsp'%>
</body>
</html>