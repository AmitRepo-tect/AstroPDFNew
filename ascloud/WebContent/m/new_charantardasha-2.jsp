<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.chardasa.*"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.MatchMakingDAO"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <style type="text/css">
        div.textad { background:#ffc; border:1px solid #cc6;}
    </style>
</head>
<body>
<div class="textad">
<% 
               out.print("<b>Char Maha Dasha</b>" + "<br><br>");

	DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj");
	CharDasa objCharDasha=new CharDasa();
	StringBuffer DashaOutput;
	int DashaOutput1[][];
	String splittedCells[] , splittedLines[];
	int count=0;
            

	String ADashaOutput[]=new String[12];
	int[][] ADashaOutput1;
	String AsplittedCells[], AsplittedLines[];
	int currentColumn , currentRow; 
	int cellsPerPage=6; 
	int columnsPerPage=3; 
	int rowsPerPage=4;
	int pageNumber = 2;
	int Charpagenumber=1;
	objCharDasha.setLanguageCode ("0"); 
	objCharDasha.initializesArrayValues();

                DashaOutput1 = myAstrologyObject.getVarga();
                objCharDasha.getVargaForDasa (DashaOutput1);
                objCharDasha.setUserBirthTimeDetails(myAstrologyObject.getDayOfBirth(),myAstrologyObject.getMonthOfBirth(),myAstrologyObject.getYearOfBirth());
                objCharDasha.dasa();
               objCharDasha.getPlanetsStringDasaValue();
               objCharDasha.getStringDasaRashi();
               DashaOutput = objCharDasha.getFormatted1LevelOutput(); 
              
               splittedCells =  DashaOutput.toString().split("\\+");
               
          
               for(int i = 0; i<=3;i++ )  
               {
                  
                  splittedLines = splittedCells[i].split("\n");
                   
                  for(int j = 0; j<=splittedLines.length-1; j++)
                  {
                  
                      if(count==0)
                      	{
                          count+=1;
                      	}
          			
                      out.print(splittedLines[j]+"<br>");
                      

                  }
                  }
            %>
<br /></div>

    <%

        ADashaOutput1 = myAstrologyObject.getVarga();
   
    objCharDasha.getVargaForDasa (ADashaOutput1);
    
    objCharDasha.setUserBirthTimeDetails(myAstrologyObject.getDayOfBirth(),myAstrologyObject.getMonthOfBirth(),myAstrologyObject.getYearOfBirth());
    objCharDasha.dasa();
    objCharDasha.getPlanetsStringDasaValue();
    objCharDasha.getStringDasaRashi();
    
    String arrLength[];
    String firstText, boldHeading;
    firstText = "false";
    boldHeading = "false";
    
    
    for(int i = 0; i <=11; i++)
    {
      ADashaOutput[i] = objCharDasha.getFormatted2LevelOutput(i).toString();
    }
   
    for(int i = (pageNumber - 1) * cellsPerPage; i<=(pageNumber * cellsPerPage - 1); i++)
    {
        
    	splittedLines = ADashaOutput[i].split("\n");
        for(int j = 0; j<=splittedLines.length-1; j++)
        {

        	splittedLines[j] =  splittedLines[j].replaceAll("------------------------",""); 
            
            arrLength = splittedLines[j].split(" ");
            
            if(arrLength.length  == 10 && firstText.equals("true"))
            	{
                %>
                </div><br /><div class="textad"><b>
                
                <% 
                boldHeading = "true";
            	}
            else if(arrLength.length == 10 && firstText.equals("false"))
            	{
                %><div class="textad"><b>
                <%
                firstText = "true";
                boldHeading = "true";
            	}
				out.print(splittedLines[j]+"<br>");
             
            
            if (boldHeading.equals("true"))
            	{
                %></b><%
            	}

            }
        }
    

   
    String balanceOfDasaText; 
    balanceOfDasaText = myAstrologyObject.getBalanceOfDasa().toString();
%>
<br />
</div><br />
   <b>Notes:</b> Dates given above are dasha ending dates.
   <a href="new_CharAntardasha-1.asp">Back</a><br /><br />
   <%@include file='/m/include/i_footer.jsp'%>
</body>
</html>