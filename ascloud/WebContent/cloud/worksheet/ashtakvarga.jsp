<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table RScroll ui-hgt">
    <%
    Local local = new Local();
    Hindi hindi = new Hindi();
    int languageCode = (Integer) session.getAttribute("languageCode");
    MyProperties constants = (MyProperties) session.getAttribute("constants");
    MyResourceBundle ashtakVarga = local.loadPropertiesFileNew("ashtaktable", languageCode); 
    
    DesktopHoro ObjHoroAshtak = (DesktopHoro)session.getAttribute("HoroscopeObj");
    int[][] ashtakVargaBindu = new int[7][12];
    int[] totalAshtakVargaValue = new int[13];
    for(int i=0 ;i<= 6 ; i++){
		for(int k=0 ;k<= 11 ;k++){
			ashtakVargaBindu[i][k]=ObjHoroAshtak.getAshtakvargaBinduForSignAndPlanet(i,k);
    }
    }
	
	for(int j = 0 ;j<= 11;j++){
		totalAshtakVargaValue=ObjHoroAshtak.getTotalAshtakVargaValue();		
	}
	%>
     <table style="min-height:260px;">
        <tbody>
      <tr>
         <td><%=ashtakVarga.getString("RASHINO")%>&nbsp;</td>
         <td>1</td>
         <td>2</td>
         <td>3</td>
         <td>4</td>
         <td>5</td>
         <td>6</td>
         <td>7</td>
         <td>8</td>
         <td>9</td>
         <td>10</td>
         <td>11</td>
         <td>12</td>
      </tr>

            <%for(int i=0 ;i<= 6 ; i++){%>
            <tr>
                <td>
                    <%=hindi.unicode(ObjHoroAshtak.getPlanetName(i+1),languageCode)%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][0]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][1]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][2]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][3]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][4]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][5]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][6]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][7]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][8]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][9]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][10]%>
                </td>
                <td>
                    <%=ashtakVargaBindu[i][11]%>
                </td>
            </tr>
            <%}%>
            <tr>
                <td>
                    <%=constants.getString("TOTAL")%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[0]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[1]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[2]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[3]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[4]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[5]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[6]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[7]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[8]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[9]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[10]%>
                </td>
                <td>
                    <%=totalAshtakVargaValue[11]%>
                </td>
            </tr>
        </tbody>
    </table>
</div>

