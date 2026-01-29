<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.yoginidasa.YoginiDasa"%>

<%
    out.print("<b>Yogini Dasha</b>" + "<br/>");
      
// ******* declare variable ******
	String[]  arrYoginiAntraDasha = new String[24];
	String[] arrsplitted, arrSplittedCell;
	String strMahaDasha;
    int  iCount, iCount1=0, iLowerLimit=0 , iUpperLimit=11, arrLength;
               
	DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj");
    YoginiDasa objYogini = new YoginiDasa();
              
    objYogini.setLanguageCode ("0");
    objYogini.initializesArrayValues();
                 
    objYogini.setUserBirthTime(myAstrologyObject.getDayOfBirth(), myAstrologyObject.getMonthOfBirth(), myAstrologyObject.getYearOfBirth());
    objYogini.restDasaOfYogini(myAstrologyObject.getPlanetaryLongitude(2));
    objYogini.generate1stLevelYoginiDasa();
    strMahaDasha = objYogini.generate2ndLevelYoginiDasa(0).toString();
    
    boolean firstText = false, boldHeading=false;

    arrSplittedCell = strMahaDasha.split("\n");        
                
    for(iCount = iLowerLimit; iCount <= iUpperLimit; iCount++) {
        arrYoginiAntraDasha[iCount] = objYogini.generate2ndLevelYoginiDasa(iCount).toString();
        }
             
    for(iCount = iLowerLimit; iCount <= iUpperLimit; iCount++) {
            arrsplitted = arrYoginiAntraDasha[iCount].split("\n");

			for(iCount1 = 0; iCount1 < arrsplitted.length; iCount1++){
 
                if (arrsplitted[iCount1].contains("Years")  && firstText) {
					%><!-- </div> -->
                    <br/><div class="textad"><b>
				<%
                 	boldHeading = true;
				}
                else if (arrsplitted[iCount1].contains("Years") && firstText) {
					%>
					<div class="textad"><b>
				<%
                    firstText = true;
                    boldHeading = true;
                }
                
                out.print(arrsplitted[iCount1] + "<br/>");
                
                if(boldHeading) {
                    %>
                    </b>
                 <%
				}
 	   }
	}
%>
	</div>
	<p><b><a href="new_yoginidasha-2.asp">Next</a></b></p>
</div>