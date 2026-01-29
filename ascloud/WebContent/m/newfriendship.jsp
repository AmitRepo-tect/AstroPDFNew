<%@page import="com.cslsoftware.maitri.Maitri"%>
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

    out.print("<b>Friendship Charts</b>" + "<br>");      

    
    int arrshodasvarg[];
    int arrPermanent[][]=new int[7][7]; 
    int arrTemporal[][]=new int[7][7];
    int arrPanchadha[][]=new int[7][7];
    String myarraystr[][]=new String[7][7]; 
    String arrPlanet[]=new String[7];
    
    DesktopHoro myAstrologyObject =(DesktopHoro)session.getAttribute("HoroscopeObj");
    arrshodasvarg = myAstrologyObject.getPositionForShodasvarg(0);
    Maitri ObjMaitri = new Maitri();
    ObjMaitri.getPositionForlagnaKundli(arrshodasvarg);

    for(int i = 1; i<=7;i++)
    {
        arrPlanet[i - 1] = myAstrologyObject.getPlanetName(i);
    }

    for(int i = 0; i<=6;i++)
    {
    	for(int ixplanet = 0; ixplanet<=6;ixplanet++)
        {
            arrPermanent[i][ixplanet] = ObjMaitri.getNaisargikMatri(i + 1, ixplanet + 1);
           int relationbwplanet = arrPermanent[i][ixplanet];
			
            switch(relationbwplanet)
            {
            
                case -2:
                {
                myarraystr[i][ixplanet] = "Bitter";
                break;
                }
                case -1:
                {
                myarraystr[i][ixplanet] = "Enemy";
                break;
                }
                case 0:
                {
                myarraystr[i][ixplanet] = "Neutral";
                break;
                }
                case 1:
                {
                myarraystr[i][ixplanet] = "Friend";
                break;
                }
                case 2:
                {
                myarraystr[i][ixplanet] = "Intimat";
                break;
                }
                case 3:
                {
                myarraystr[i][ixplanet] = "---";
                break;
                }
                default :
                {
                    myarraystr[i][ixplanet] = "---";
                }
            }
            
        }
    }

    out.print("<div class=textad><b>Permanent:" + "</b><br>");
    out.print("<table><tr><td></td>");
    out.print("<td><b><b>SUN</b></td>");
    out.print("<td><b>MOON</b></td>");
    out.print("<td><b>MAR</b></td>");
    out.print("<td><b>MER</b></td>");
    out.print("<td><b>JUP</b></td>");
    out.print("<td><b>VEN</b></td>");
    out.print("<td><b>SAT</b></td></tr>");

    for(int i = 0; i<=6;i++)
    {
        if(i == 0)
        {
            out.print("<tr><td><b>SUN</b></td>");
        }
        if(i == 1)
        {
            out.print("<tr><td><b>MOON</b></td>");
        }
        if(i == 2)
        {
            out.print("<tr><td><b>MAR</b></td>");
        }
        if(i == 3)
        {
            out.print("<tr><td><b>MER</b></td>");
        }
        if(i == 4)
        {
            out.print("<tr><td><b>JUP</b></td>");
        }
        if(i == 5)
        {
            out.print("<tr><td><b>VEN</b></td>");
        }
        if(i == 6)
        {
            out.print("<tr><td><b>SAT</b></td>");
        }

        for( int j = 0; j<=6;j++)
        {
            out.print("<td>" + myarraystr[i][j] + "</td>");
        }
        out.print("</tr>");
    }
    out.print("</table>");
    out.print("</div><br />");

    for(int i = 0; i<=6;i++)
    {
        for (int ixplanet = 0; ixplanet<=6; ixplanet++)
        {
            arrTemporal[i][ixplanet] =ObjMaitri.getTatkalikMatri(i + 1, ixplanet + 1);
           int relationbwplanet = arrTemporal[i][ixplanet];
            		switch(relationbwplanet)
                    {
                    
                        case -2:
                        {

                        myarraystr[i][ixplanet] = "Bitter";
                        break;
                        }
                        case -1:
                        {
                        	myarraystr[i][ixplanet] = "Enemy";
                        	break;
                        }
                        
                        case 0:
                        {
                        	myarraystr[i][ixplanet] = "Neutral";
                        	break;
                        }
                        case 1:
                        {
                        	myarraystr[i][ixplanet] = "Friend";
                        	break;
                        }
                        case 2:
                        {
                        	myarraystr[i][ixplanet] = "Intimat";
                        	break;
                        }
                        case 3:
                        {
                        	myarraystr[i][ixplanet] = "---";
                        	break;
                
                        }
                        default :
                        {
                	        myarraystr[i][ixplanet] = "---";
                	        break;
                        }
                    
                    }
    }
    }

	out.print("<div class=textad><b>Temporal:" + "</b><br>");

    out.print("<table><tr><td></td>");
    out.print("<td><b><b>SUN</b></td>");
    out.print("<td><b>MOON</b></td>");
    out.print("<td><b>MAR</b></td>");
    out.print("<td><b>MER</b></td>");
    out.print("<td><b>JUP</b></td>");
    out.print("<td><b>VEN</b></td>");
    out.print("<td><b>SAT</b></td></tr>");

    for(int i = 0; i<=6;i++)
    {
        if (i == 0) 
        {
            out.print("<tr><td><b>SUN</b></td>");
         }
        if(i == 1)
        {
            out.print("<tr><td><b>MOON</b></td>");
        }
        if(i == 2)
        {
            out.print("<tr><td><b>MAR</b></td>");
        }
        if(i == 3)
        {
            out.print("<tr><td><b>MER</b></td>");
        }
        if(i == 4)
        {
            out.print("<tr><td><b>JUP</b></td>");
        }
        if(i == 5)
        {
            out.print("<tr><td><b>VEN</b></td>");
        }
        if(i == 6)
        {
            out.print("<tr><td><b>SAT</b></td>");
        }
        
        for(int j = 0; j<=6;j++)
        {
           out.print("<td>" + myarraystr[i][j] + "</td>");
        }   
        out.print("</tr>");
    }
    out.print("</table>");
    out.print("</div><br />");

     

    for(int i = 0; i<=6;i++)
    {
        for (int ixplanet = 0; ixplanet<=6; ixplanet++)
        {
            arrPanchadha[i][ixplanet] = ObjMaitri.getPanchadaMatri(i + 1, ixplanet + 1);
            int relationbwplanet=arrPanchadha[i][ixplanet];
            switch(relationbwplanet)
            {
            case -2:
            {
            	myarraystr[i][ixplanet] = "Bitter";
            	break;
            }
            case -1:
            {
            	myarraystr[i][ixplanet] = "Enemy";
            	break;
            }
            case 0:
            {
            	myarraystr[i][ixplanet] = "Neutral";
            	break;
            }case 1:
            {
            	myarraystr[i][ixplanet] = "Friend";
            	break;
            }
            case 2:
            {
            	myarraystr[i][ixplanet] = "Intimat";
            	break;
            }       
            case 3:
            {
            	myarraystr[i][ixplanet] = "---";
            	break;
             }
            default :
            {
            	myarraystr[i][ixplanet] = "---";
            }
            }
    }
    }

	out.print("<div class=textad><b>Panchadha:" + "</b><br>");

	out.print("<table><tr><td></td>");
	out.print("<td><b><b>SUN</b></td>");
	out.print("<td><b>MOON</b></td>");
	out.print("<td><b>MAR</b></td>");
	out.print("<td><b>MER</b></td>");
	out.print("<td><b>JUP</b></td>");
	out.print("<td><b>VEN</b></td>");
	out.print("<td><b>SAT</b></td></tr>");

    for(int i = 0; i<=6;i++)
    {
        if (i == 0)
        	{
        		out.print("<tr><td><b>SUN</b></td>");
        	}
        if (i == 1)
    	{
        		out.print("<tr><td><b>MOON</b></td>");
    	}
        if (i == 2)
    	{
        		out.print("<tr><td><b>MAR</b></td>");
    	}
        if (i == 3)
    	{
        		out.print("<tr><td><b>MER</b></td>");
    	}
        if (i == 4)
    	{
        		out.print("<tr><td><b>JUP</b></td>");
    	}
        if (i == 5)
    	{
        		out.print("<tr><td><b>VEN</b></td>");
    	}
        if (i == 6)
    	{
        		out.print("<tr><td><b>SAT</b></td>");
    	}
        
        for(int j = 0; j<=6;j++)
        {
        	out.print("<td>" + myarraystr[i][j] + "</td>");
        }
            out.print("</tr>");	    
    }
    out.print("</table>");
    out.print("</div><br />");
    %>
<%@include file='/m/include/i_footer.jsp'%>
</body>
</html>