<%@page import="com.ojassoft.astrosagecloud.DAO.AtlasDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <!--#include file= 'util/confirmdata.res' -->
        <!--#include file= 'util/confirmdata_hi.res' -->
        <!--#include file= 'util/confirmdata_ta.res' -->
        <!--#include file= 'util/confirmdata_te.res' -->
        <!--#xinclude file= 'util/confirmdata_mr.res' -->
        <!--#xinclude file= 'util/confirmdata_ka.res' -->
        <!--#xinclude file= 'util/confirmdata_ml.res' -->
        <!--#include file= 'util/confirmdata_bn.res' -->
        <!--#include file = 'model/getplacesdetails.asp'-->
    <script type="text/javascript">
        function submitfrm(City,LongDeg,LongMin,LongEW,LatDeg,LatMin,LatNS,Timezone) {            
            document.getElementById('city').value = City;
            document.getElementById('LongDeg').value = LongDeg;
            document.getElementById('LongMin').value = LongMin;
            document.getElementById('LongEW').value = LongEW;
            document.getElementById('LatDeg').value = LatDeg;
            document.getElementById('LatMin').value = LatMin;
            document.getElementById('LatNS').value = LatNS;
            document.getElementById('Timezone').value = Timezone;
            submitform();
        }
        function submitform() {
            document.forms["UserCityDetailsFormfreekundali"].submit();
        }       
        
    </script>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td width="100%" class="boxtopbg">
                <div class="boxhdg">||&nbsp;&nbsp;<%="Select Your Birth Place" %>&nbsp;&nbsp;||
                    </div>
            </td>
        </tr>
    </tbody>
</table>
 <div class="ui-form-container">        
                 <form name="UserCityDetailsFormfreekundali" id="UserCityDetailsForm" method="post" action="newchart-session.asp">
                <%String placename = request.getParameter("place"); 
                if(placename != null && placename.length() > 2)
                {
                	AtlasDAO dao = new AtlasDAO();
                	String ListOfCityDetails = dao.getCityDetails(placename);
                    if(!ListOfCityDetails.equals("")) { %>               
                         <h1 align="center">Select Your Birth Place</h1>
                         <%    
                                       
                         String[] arrOfListOfCityDetails = ListOfCityDetails.split("#");
                         %>               
                
                    <table cellspacing="0" cellpadding="0" style="margin-left:5px; margin-right:0px; margin-bottom:10px; border-collapse: collapse;" width="99%" border="1" bordercolor="#f96d06">
                        <tr>
                            <td class="cellhead" style="font-size:18px;text-align:left">
                                City
                            </td>
                            <td class="cellhead" style="font-size:18px;text-align:left">
                                State
                            </td >
                            <td class="cellhead" style="font-size:18px;text-align:left">
                                Longitude
                            </td>
                            <td class="cellhead" style="font-size:18px;text-align:left">
                                Latitude
                            </td>
                            <td class="cellhead" style="font-size:18px;text-align:left">
                                Country
                            </td>
                        </tr>
                        <% 
                           for(int iCityCounter = 0;iCityCounter<arrOfListOfCityDetails.length;iCityCounter++)
                           {
                        %>
                        <tr class="tdbackground">
                        <%   
                        		String[] SubArrOfCityDetails = arrOfListOfCityDetails[iCityCounter].split("\\|");
                                String City     = SubArrOfCityDetails[0];
                                String State    = SubArrOfCityDetails[1];
                                String Country  = SubArrOfCityDetails[2];
                                String LatDeg   = SubArrOfCityDetails[3];
                                String LatMin   = SubArrOfCityDetails[4];
                                String LatNS    = SubArrOfCityDetails[5];
                                String LongDeg  = SubArrOfCityDetails[6];
                                String LongMin  = SubArrOfCityDetails[7];
                                String LongEW   = SubArrOfCityDetails[8];
                                String Timezone = SubArrOfCityDetails[9];
                            %>   
                            <td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><b><a style="font-size:16px" href="javascript: submitfrm('<%=City %>',<%=LongDeg %>,<%=LongMin %>,'<%=LongEW %>',<%=LatDeg %>,<%=LatMin %>,'<%=LatNS %>',<%=Timezone %>);"><%=City %></a></b></td>
                            <td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><b><a style="font-size:16px"href="javascript: submitfrm('<%=City %>',<%=LongDeg %>,<%=LongMin %>,'<%=LongEW %>',<%=LatDeg %>,<%=LatMin %>,'<%=LatNS %>',<%=Timezone %>);"><%=State %></a></b></td>
                            <td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><b><a style="font-size:16px" href="javascript: submitfrm('<%=City %>',<%=LongDeg %>,<%=LongMin %>,'<%=LongEW %>',<%=LatDeg %>,<%=LatMin %>,'<%=LatNS %>',<%=Timezone %>);"><%=LongDeg %><%=LongEW %><%=LongMin %></a></b></td>
                            <td class="cellcontent" id="PlanetaryTableTD" style="text-align:left"><b><a style="font-size:16px" href="javascript: submitfrm('<%=City %>',<%=LongDeg %>,<%=LongMin %>,'<%=LongEW %>',<%=LatDeg %>,<%=LatMin %>,'<%=LatNS %>',<%=Timezone %>);"><%=LatDeg %><%=LatNS %><%=LatMin %></a></b></td>
                            <td class="cellcontent" id="PlanetaryTableTD"  style="text-align:left"><b><a style="font-size:16px" href="javascript: submitfrm('<%=City %>',<%=LongDeg %>,<%=LongMin %>,'<%=LongEW %>',<%=LatDeg %>,<%=LatMin %>,'<%=LatNS %>',<%=Timezone %>);"><%=Country %></a></b></td>
                        </tr>
                        <%
                           } %>
                   </table>
                    <input type="hidden" name="name" value="<%=Util.safestr(request.getParameter("name")) %>" />
                    <input type="hidden" name="sex" value="<%=Util.safestr(request.getParameter("sex")) %>" />
                    <input type="hidden" name="day" value="<%=Util.safestr(request.getParameter("day")) %>" />
                    <input type="hidden" name="month" value="<%=Util.safestr(request.getParameter("month")) %>" />
                    <input type="hidden" name="year" value="<%=Util.safestr(request.getParameter("year")) %>" />
                    <input type="hidden" name="hrs" value="<%=Util.safestr(request.getParameter("hrs")) %>" />
                    <input type="hidden" name="min" value="<%=Util.safestr(request.getParameter("min")) %>" />
                    <input type="hidden" name="sec" value="<%=Util.safestr(request.getParameter("sec")) %>" />
                    <input type="hidden" name="place" id="city" value="<%=placename %>" />
                 
                
                    <input type="hidden" name="longdeg" id="LongDeg" value="<%=Util.safestr(request.getParameter("longdeg")) %>" />
                    <input type="hidden" name="longmin" id="LongMin" value="<%=Util.safestr(request.getParameter("longmin")) %>" />
                    <input type="hidden" name="longew" id="LongEW" value="<%=Util.safestr(request.getParameter("longew")) %>" />
                    <input type="hidden" name="latdeg" id="LatDeg" value="<%=Util.safestr(request.getParameter("latdeg")) %>" />
                    <input type="hidden" name="latmin" id="LatMin" value="<%=Util.safestr(request.getParameter("latmin")) %>" />
                    <input type="hidden" name="latns"  id="LatNS" value="<%=Util.safestr(request.getParameter("latns")) %>" />
                    <input type="hidden" name="timezone" id="Timezone" value="<%=Util.safestr(request.getParameter("timezone")) %>" />
                    <input type="hidden" name="kphn" id="kphn"  value="<%=Util.safestr(request.getParameter("kphn")) %>" />
                    <input type="hidden" name="dst" id="dst"value="<%=Util.safestr(request.getParameter("dst")) %>" />
                    <input type="hidden" name="ayanamsa" id="ayanamsa"value="<%=Util.safestr(request.getParameter("ayanamsa")) %>" />
                    <input type="hidden" name="charting" id="charting" value="<%=Util.safestr(request.getParameter("charting")) %>" />
                    <input type="hidden" name="referrer" id="referrer" value="<%=Util.safestr(request.getParameter("referrer")) %>"/>   
                    <input type="hidden" name="methodName" value="<%=Util.safestr(request.getParameter("methodName"))%>"/>                
                    <input type="hidden" name="newChartDone" id="newchartdone" value="<%=Util.safestr(request.getParameter("newChartDone"))%>" />
                    <input type="hidden" name="newChartDoneAndSave" id="newchartdoneandsave" value="<%=Util.safestr(request.getParameter("newChartDoneAndSave"))%>" />
            
                    <%} else { %> 
                    <p style="font-weight:bold; color:#FF0000; text-align:center;">Sorry! your city name was not found in our database..! <a href="javascript:history.go(-1)">Back</a></p>
                    <% } %>
                <% } else { %>
                    <p style="font-weight:bold; color:#FF0000; text-align:center; font-size:18px;">Please enter at least first three character of city name. <a href="javascript:history.go(-1)">Back</a></p>
                <% } %>
                </form>
          
    </div>    
