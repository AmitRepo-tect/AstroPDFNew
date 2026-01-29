<%@page import="com.ojassoft.astrosagecloud.util.KCILUtil"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.ojassoft.kpextension.BeanKP4Step"%>
<%@page import="com.ojassoft.astrosagecloud.DO.InPlanetKpCusp"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
Local local = new Local();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
%>

<div class="hdg-lg card">
	<h1><%=rbConstants.getString("STEP4")%></h1>	
</div>

<%
	DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj");
	InPlanetKpCusp inPlanetCusp = (InPlanetKpCusp) session.getAttribute("KPObj");
	
    BeanKP4Step[] beanArray = KCILUtil.getBeanKp4StepBeansArrayNew(inPlanetCusp);
   //out.println(responseString);
       /*String[] arr = new String[4];
       arr[0]="PLANET";
       arr[1]="STAR_LORD";
       arr[2]="SUB_LORD";
       arr[3]="STAR_LORD_OF_SUB_LORD";
      
      
      String[] arr1 = new String[] {"SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};*/
       
%>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-style hdg-content">
<h2> <%=rbConstants.getString("STEP4")%></h2>
<%for(int icount= 0;icount<= 8;icount++) { 
        	String planetName = Common.arrLongPlanetName[beanArray[icount].getKp4Step1().getPlanet()];
        %>
        
         
            <div class="cellhead  hdg-content">
                <div id="divhead">
                  <h2>   <%=rbConstants.getString(planetName.toUpperCase())%> </h2></div>
            </div>
            <div class="RecommendationBorder1">
            <ol class="padding-all">
             <div class="RecommendationHeading1">
                   <li><%=rbConstants.getString("PLANET")%></li></div>
                <div class="RecommendationContent1">
                    <%if (beanArray[icount].getKp4Step1().isPlanetStrong()) { %><%=KCILUtil.printSteps(beanArray[icount].getKp4Step1(), true, rbConstants) %>
                    <% } else { %><%=rbConstants.getString(planetName.toUpperCase())%><% } %></div>
                    <div style="clear:both"/>
            <div class="RecommendationHeading1">
                    <li><%=rbConstants.getString("STAR_LORD")%></li></div>
                <div class="RecommendationContent1">
                    <%=KCILUtil.printSteps(beanArray[icount].getKp4Step2(), false, rbConstants)%></div>
                    <div style="clear:both"/>
            <div class="RecommendationHeading1">
                    <li><%=rbConstants.getString("SUB_LORD")%></li></div>
                <div class="RecommendationContent1">
                    <%=KCILUtil.printSteps(beanArray[icount].getKp4Step3(), false, rbConstants)%></div>
                    <div style="clear:both"/>
            <div class="RecommendationHeading1">
                    <li><%=rbConstants.getString("STAR_LORD_OF_SUB_LORD")%></li></div>
                <div class="RecommendationContent1">
                    <%=KCILUtil.printSteps(beanArray[icount].getKp4Step4(), false, rbConstants)%></div>
                    <div style="clear:both"/>
                </ol>
            </div>
        
        <% } %>
</div>
</div>
</div>


