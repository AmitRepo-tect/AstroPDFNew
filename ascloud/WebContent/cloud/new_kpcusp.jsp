<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
Local local = new Local();
Hindi hindi = new Hindi();

int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

 <div class="hdg-lg card">
	<h1><%=rBConstants.getString("ASPECT_ON_KP_CUSP")%></h1>	
</div>


<div class="row mrt-30 get-planet-table"> 
<div class="col s12 l12">
<div class="card table-panel">
<table class="highlight striped bordered ui-table-reflow responsive-table ui-table">

		<%	

String[] planetName = new String[12];
String[] bhavValueForKpCusp1 = new String[12];
String[] bhavValueForKpCusp2 = new String[12];
String[] planetWeight = new String[12];
String[][] planetToKpAspect = new String[12][12];
String[][] planetToKpWeight = new String[12][12];
String[] bhavValue = new String[12];
	

    DesktopHoro ObjHoroKpCusp = (DesktopHoro)session.getAttribute("HoroscopeObj");
	
	if(String.valueOf(session.getAttribute("languageCode")).equals("1")) {
        ObjHoroKpCusp.setLanguageCode("1");
        ObjHoroKpCusp.initialize();
	}
	
	//ObjHoroKpCusp
	for(int i=1; i<=12; i++){ 
		planetName[i-1]=ObjHoroKpCusp.getPlanetName(i);
		bhavValue=ObjHoroKpCusp.getBhavValueForKPCusp(i);
		bhavValueForKpCusp1[i-1]=bhavValue[0];
		bhavValueForKpCusp2[i-1]=bhavValue[1];
		planetWeight[i-1]=ObjHoroKpCusp.getPlanetWeight(i);
	}
            %>

		<% 
	for(int i=1 ; i<=12 ; i++){
		for(int j=1 ;j<= 12 ; j++){
			planetToKpAspect[i-1][j-1]=ObjHoroKpCusp.getPlanetToKPCuspAspect(i,j);

			planetToKpWeight[i-1][j-1]=ObjHoroKpCusp.getPlanetToKPCuspAspectWeight(i,j);
			//out.println(ObjHoroKpCusp.getPlanetToKPCuspAspect(i,j)+"<br/>");
		}
	}
            %>

		<!--<table width="100%" border="1" cellspacing="1" cellpadding="1">-->
		<thead>
		<tr class="amber lighten-5">
			<th class="cellhead">&nbsp;</th>
			<% for(int i=0;i<=11;i++)
                	{%>
			<th class="cellhead"><%=(i+1)%><br> <%=bhavValueForKpCusp1[i]%><br>
				<%=bhavValueForKpCusp2[i]%></th>
			<% } %>

		</tr>
		</thead>
		<% 
	for(int i=1 ;i<= 12; i++){
            %>
		<tr>
			<td class="cellhead" style="font-size: 9px;"><%=hindi.unicode(planetName[i-1],languageCode)%><br>
				<%=local.correctSeperatorDot(planetWeight[i-1])%></td>
			<% for(int j=0;j<=11;j++)
                { %>

			<td class="cellcontent" style="font-size: 9px;"><%=hindi.unicode(planetToKpAspect[i-1][j],languageCode)%><br>
				<%=planetToKpWeight[i-1][j]%></td>
			<% } %>
		</tr>
		<%
	}

            %>
	</table>
	</div>
</div>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="row mrt-30"> 
<div class="col s12 l12">
<div class="card table-panel ui-paragraph-head">
<h5 align="left" class="pdl-15"><%=rBConstants.getString("NOTE_MASTROSAGE")%>: </h5>

<ol class="mrb-20">
				<li><%=rBConstants.getString("NOTE_ONE_ASPECT_KP_BM")%></li>
			</ol>
			
			<table class="highlight striped bordered ui-table-reflow ui-table responsive-table">
			<thead>
				<tr class="amber lighten-5">
					<th><%=rBConstants.getString("SHORT_ASPECT_KP")%></th>
					<th><%=rBConstants.getString("DEGREE")%></th>
					<th><%=rBConstants.getString("ORB_LIMIT_KP")%></th>
					<th><%=rBConstants.getString("WEIGHT_PLANET_KP")%></th>
					<th><%=rBConstants.getString("SHORT_ASPECT_KP")%></th>
					<th><%=rBConstants.getString("DEGREE")%></th>
					<th><%=rBConstants.getString("ORB_LIMIT_KP")%></th>
					<th><%=rBConstants.getString("WEIGHT_PLANET_KP")%></th>
				</tr>
				</thead>
				<tr>
					<td class="cellcontent"><%=rBConstants.getString("CONJ_SHORT_NAME")%></td>
					<td class="cellcontent">0</td>
					<td class="cellcontent">15</td>
					<td class="cellcontent">10</td>
					<td class="cellcontent"><%=rBConstants.getString("OPPN_SHORT_NAME")%></td>
					<td class="cellcontent">180</td>
					<td class="cellcontent">15</td>
					<td class="cellcontent">10</td>
				</tr>
				<tr>
					<td class="cellcontent"><%=rBConstants.getString("TRIN_SHORT_NAME")%></td>
					<td class="cellcontent">120</td>
					<td class="cellcontent">6</td>
					<td class="cellcontent">3</td>
					<td class="cellcontent"><%=rBConstants.getString("SQUR_SHORT_NAME")%></td>
					<td class="cellcontent">90</td>
					<td class="cellcontent">6</td>
					<td class="cellcontent">3</td>
				</tr>
				<tr>
					<td class="cellcontent"><%=rBConstants.getString("SEXT_SHORT_NAME")%></td>
					<td class="cellcontent">60</td>
					<td class="cellcontent">6</td>
					<td class="cellcontent">3</td>
					<td class="cellcontent"><%=rBConstants.getString("SSQU_SHORT_NAME")%></td>
					<td class="cellcontent">45</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent">1</td>
				</tr>
				<tr>
					<td class="cellcontent"><%=rBConstants.getString("NONL_SHORT_NAME")%></td>
					<td class="cellcontent">40</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent"><%=rBConstants.getString("QUIN_SHORT_NAME")%></td>
					<td class="cellcontent">72</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent">1</td>
				</tr>
				<tr>
					<td class="cellcontent"><%=rBConstants.getString("SQQD_SHORT_NAME")%></td>
					<td class="cellcontent">135</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent"><%=rBConstants.getString("QUINC_SHORT_NAME")%></td>
					<td class="cellcontent">150</td>
					<td class="cellcontent">1</td>
					<td class="cellcontent">1</td>
				</tr>
			</table>
			<ol start="2" class="mrt-20">
				<li><%=rBConstants.getString("NOTE_TWO_ASPECT_KP_BM") %></li>
				<li><%=rBConstants.getString("NOTE_LINE_THREE_KPCUSP") %></li>
				<li><%=rBConstants.getString("NOTE_LINE_FOUR_KPCUSP") %></li>
			</ol>

</div>
</div>
</div>



<p><%@include file='calculations-footer.jsp'%></p>
<%@include file='kp-footer.jsp'%>