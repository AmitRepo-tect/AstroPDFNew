<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr">
<div class="ui-wid-ovr">
    <table>
        <%
    Local local = new Local();
	String[] bhavValue = new String[12];
	String[] planetName = new String[12];
    String[] bhavValueForKpCusp1 =  new String[12];
    String[] bhavValueForKpCusp2 = new String[12];
    String[][] planetToKpAspect =  new String [12][12];
    String[][] planetToKpWeight = new String[12][12];
    String[] planetWeight = new String[12];
	
	DesktopHoro ObjHoroKpCusp = (DesktopHoro)session.getAttribute("HoroscopeObj");
	int languageCode = (Integer) session.getAttribute("languageCode");
    Hindi hindi = new Hindi();
	
	if(languageCode == 1){
        ObjHoroKpCusp.setLanguageCode("1");
        ObjHoroKpCusp.initialize();
	}

	for(int i=1 ;i<= 12; i++){ 
		planetName[i-1]=ObjHoroKpCusp.getPlanetName(i);
		bhavValue=ObjHoroKpCusp.getBhavValueForKPCusp(i);
		bhavValueForKpCusp1[i-1]=bhavValue[0];
		bhavValueForKpCusp2[i-1]=bhavValue[1];
		planetWeight[i-1]=ObjHoroKpCusp.getPlanetWeight(i);
	}
        %>
        <% 
	for(int i=1 ;i<= 12;i++){
		for(int j=1 ;j<= 12;j++){
			planetToKpAspect[i-1][j-1]=ObjHoroKpCusp.getPlanetToKPCuspAspect(i,j);
			planetToKpWeight[i-1][j-1]=ObjHoroKpCusp.getPlanetToKPCuspAspectWeight(i,j);
		}
	}
        %>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                1<br>
                <%=bhavValueForKpCusp1[0]%><br>
                <%=bhavValueForKpCusp2[0]%>
            </td>
            <td>
                2<br>
                <%=bhavValueForKpCusp1[1]%><br>
                <%=bhavValueForKpCusp2[1]%>
            </td>
            <td>
                3<br>
                <%=bhavValueForKpCusp1[2]%><br>
                <%=bhavValueForKpCusp2[2]%>
            </td>
            <td>
                4<br>
                <%=bhavValueForKpCusp1[3]%><br>
                <%=bhavValueForKpCusp2[3]%>
            </td>
            <td>
                5<br>
                <%=bhavValueForKpCusp1[4]%><br>
                <%=bhavValueForKpCusp2[4]%>
            </td>
            <td>
                6<br>
                <%=bhavValueForKpCusp1[5]%><br>
                <%=bhavValueForKpCusp2[5]%>
            </td>
            <td>
                7<br>
                <%=bhavValueForKpCusp1[6]%><br>
                <%=bhavValueForKpCusp2[6]%>
            </td>
            <td>
                8<br>
                <%=bhavValueForKpCusp1[7]%><br>
                <%=bhavValueForKpCusp2[7]%>
            </td>
            <td>
                9<br>
                <%=bhavValueForKpCusp1[8]%><br>
                <%=bhavValueForKpCusp2[8]%>
            </td>
            <td>
                10<br>
                <%=bhavValueForKpCusp1[9]%><br>
                <%=bhavValueForKpCusp2[9]%>
            </td>
            <td>
                11<br>
                <%=bhavValueForKpCusp1[10]%><br>
                <%=bhavValueForKpCusp2[10]%>
            </td>
            <td>
                12<br>
                <%=bhavValueForKpCusp1[11]%><br>
                <%=bhavValueForKpCusp2[11]%>
            </td>
        </tr>
        <% 
	for(int i=1 ;i<= 12;i++){
        %>
        <tr>
            <td>
                <%=hindi.unicode(planetName[i-1],languageCode)%><br>
                <%=local.correctSeperatorDot(planetWeight[i-1])%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][0],languageCode)%><br>
                <%=planetToKpWeight[i-1][0]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][1],languageCode)%><br>
                <%=planetToKpWeight[i-1][1]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][2],languageCode)%><br>
                <%=planetToKpWeight[i-1][2]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][3],languageCode)%><br>
                <%=planetToKpWeight[i-1][3]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][4],languageCode)%><br>
                <%=planetToKpWeight[i-1][4]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][5],languageCode)%><br>
                <%=planetToKpWeight[i-1][5]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][6],languageCode)%><br>
                <%=planetToKpWeight[i-1][6]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][7],languageCode)%><br>
                <%=planetToKpWeight[i-1][7]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][8],languageCode)%><br>
                <%=planetToKpWeight[i-1][8]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][9],languageCode)%><br>
                <%=planetToKpWeight[i-1][9]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][10],languageCode)%><br>
                <%=planetToKpWeight[i-1][10]%>
            </td>
            <td class="cellcontent">
                <%=hindi.unicode(planetToKpAspect[i-1][11],languageCode)%><br>
                <%=planetToKpWeight[i-1][11]%>
            </td>
        </tr>
        <%}%>
    </table>
    </div>
</div>