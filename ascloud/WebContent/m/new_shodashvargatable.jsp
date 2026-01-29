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
	int ArrayLagnaChartRashiPositions[];
	int ArrayBhavPosition[];
	
	DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");	
	
	
	 String ArrayShodashvarga[]=new String[17];
	        ArrayShodashvarga[1] = "Lagna";
			ArrayShodashvarga[2] = "Hora";
			ArrayShodashvarga[3] = "Drekkana";
			ArrayShodashvarga[4] = "Chaturthamsha";
			ArrayShodashvarga[5] = "Saptamamsha";
			ArrayShodashvarga[6] = "Navamsha";
			ArrayShodashvarga[7] = "Dashamamsha";
			ArrayShodashvarga[8] = "Dwadashamamsha";
			ArrayShodashvarga[9] = "Shodashamsha";
			ArrayShodashvarga[10] = "Vimshamsha";
			ArrayShodashvarga[11] = "Chaturvimshamsha";
			ArrayShodashvarga[12] = "Saptavimshamsha";
			ArrayShodashvarga[13] = "Trimshamsha";
			ArrayShodashvarga[14] = "Khavedamsha";
			ArrayShodashvarga[15] = "Akshvedamsha";
			ArrayShodashvarga[16] = "Shastiamsha";

	
	
%>
<div class="textad"><b>Shodashvarga Rashi Table</b><br /> 

<TABLE>
  <TR>
    <td><b>S.N.</b></td>
    <td><b>Shodashvarga</b></td>
    <td><b>Lagn</b></td>
    <td><b>Sun</b></td>
    <td><b>Moon</b></td>
    <td><b>Mar</b></td>
    <td><b>Mer</b></td>
    <td><b>Jup</b></td>
    <td><b>Ven</b></td>
    <td><b>Sat</b></td>
    <td><b>Rah</b></td>
    <td><b>Ket</b></td>
    <td><b>Ure</b></td>
    <td><b>Nep</b></td>
    <td><b>Plu</b></td></TR>
    
    <%
    int Tempcount,Tempcount2;
    for (Tempcount = 0; Tempcount<=15; Tempcount++)
    {
    %> 
  <TR>
    <TD><%=Tempcount+1%></TD>
    <TD><%=ArrayShodashvarga[Tempcount+1]%></TD>
    <%ArrayLagnaChartRashiPositions = myAstrologyObject.getPositionForShodasvarg(Tempcount);
    		 for (Tempcount2 = 0; Tempcount2<=12; Tempcount2++)
    		    { %>
    <TD><%=ArrayLagnaChartRashiPositions[Tempcount2] %></TD>
    <% } %></TR>
    <% } %>
  
  </TABLE>
</div><br />


<div class="textad"><b>Shodashvarga Bhav Table</b><br /> 
  <%!
  

public int[] RashiToBhavConversion(int[] RashiPosition)
{
	int BhavPosition[]=new int[12];
	for(int i = 0; i <=11; i++)
	{
		BhavPosition[i] = RashiPosition[i+1];
	}
	for(int i = 0; i <=11; i++)
	{
  		BhavPosition[i] = BhavPosition[i]- RashiPosition[0];
  		if(BhavPosition[i]<0)
  			{
  			BhavPosition[i]= BhavPosition[i] + 12;
  			}
 		BhavPosition[i]= BhavPosition[i]+1;
	}

	return BhavPosition;

}





%>

<TABLE>
  <TR>
    <td><b>S.N.</b></td>
    <td><b>Shodashvarga</b></td>
    <td><b>Lagn</b></td>
    <td><b>Sun</b></td>
    <td><b>Moon</b></td>
    <td><b>Mar</b></td>
    <td><b>Mer</b></td>
    <td><b>Jup</b></td>
    <td><b>Ven</b></td>
    <td><b>Sat</b></td>
    <td><b>Rah</b></td>
    <td><b>Ket</b></td>
    <td><b>Ure</b></td>
    <td><b>Nep</b></td>
    <td><b>Plu</b></td></TR>
    <%  for (Tempcount = 0; Tempcount<=15; Tempcount++)
    { %>
    
  <TR>
    <TD><%=Tempcount+1%></TD>
    <TD><%=ArrayShodashvarga[Tempcount+1]%></TD>
    <TD>1</TD>
    <%ArrayLagnaChartRashiPositions = myAstrologyObject.getPositionForShodasvarg(Tempcount);
    ArrayBhavPosition = RashiToBhavConversion(ArrayLagnaChartRashiPositions);
    for (Tempcount2 = 0; Tempcount2<=11; Tempcount2++)
    {%>
    <TD><%	if (ArrayBhavPosition[Tempcount2]== 6 || ArrayBhavPosition[Tempcount2]== 8 || ArrayBhavPosition[Tempcount2]== 12) { %>
			<Font color =  "red">
			<%=ArrayBhavPosition[Tempcount2]%>
			</Font>
			<%
            }
			else
			{
				out.print(ArrayBhavPosition[Tempcount2]);
				
			}
          %>
      </TD>
    <% } %> </TR>
    <% } %>
 </TABLE>
 </div>
 <br />
 <%@include file='/m/include/i_footer.jsp'%>
 </body>
</html>