<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%
	Local objLocal = new Local();
	Hindi hindi = new Hindi();
 	int objLanguageCode = (Integer)session.getAttribute("languageCode");
 	MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

 <div class="hdg-lg card">
	<h1><%=rBConstants.getString("ASPECT_ON_BHAV_MADHYA") %></h1>	
</div>

<div class="row mrt-30 get-planet-table"> 
<div class="col s12 l12">
<div class="card table-panel">
<table class="highlight striped bordered ui-table-reflow responsive-table ui-table">
<%
	    
     int i=0,j=0;
     String[] planetName = new String[12];
     String[] bhavValue = new String[2];
     String[] bhavValueForBhavMadhya1 = new String[12];
     String[] bhavValueForBhavMadhya2 = new String[12];
     String[] planetWeight = new String[12];
     String[][] planetToBhavMadhyaAspect = new String[12][12];
     String[][] planetToBhavMadhyaWeight = new String[12][12];
     
	DesktopHoro objHoroBhavMadhya = (DesktopHoro)session.getAttribute("HoroscopeObj");
    if(session.getAttribute("languageCode")!=null && String.valueOf(session.getAttribute("languageCode")).equals("1")){        
    	objHoroBhavMadhya.setLanguageCode("1");
    }
    if(session.getAttribute("languageCode")!=null && String.valueOf(session.getAttribute("languageCode")).equals("0")){   		
   		objHoroBhavMadhya.setLanguageCode("0");
    }
    //objHoroBhavMadhya.initialize();
	for(i=1;i<=12;i++){
		planetName[i-1]=objHoroBhavMadhya.getPlanetName(i);
		bhavValue=objHoroBhavMadhya.getBhavValueForBhavMadhya(i);
		bhavValueForBhavMadhya1[i-1]=bhavValue[0];
		bhavValueForBhavMadhya2[i-1]=bhavValue[1];
		planetWeight[i-1] = objHoroBhavMadhya.getPlanetWeight(i);
	}
	
	for(i=1;i<=12;i++){
		for(j=1;j<=12;j++){			
			planetToBhavMadhyaAspect[i-1][j-1]=objHoroBhavMadhya.getPlanetToBhavMadhyaAspect(i,j);
			planetToBhavMadhyaWeight[i-1][j-1]=objHoroBhavMadhya.getPlanetToBhavMadhyaWeight(i,j);
		}
	}
            %>
            <thead>
		<tr class="amber lighten-5">
			<th class="cellhead">&nbsp;</th>
			<%for(i=0;i<=11;i++){ %>
			<th class="cellhead"><%=i+1 %><br> <%=bhavValueForBhavMadhya1[i]%><br>
				<%=bhavValueForBhavMadhya2[i]%></th>
			<%} %>
		</tr>
		</thead>
		<%
           for(i=1;i<=12;i++){
            %>
		<tr>
			<td class="cellhead"><%=hindi.unicode(planetName[i-1], objLanguageCode)%><br>
				<%=planetWeight[i-1]%></td>
			<%for(j=0;j<=11;j++){ %>
			<td class="cellcontent" style="font-size: 9px;"><%=hindi.unicode(planetToBhavMadhyaAspect[i-1][j], objLanguageCode)%><br>
				<%=planetToBhavMadhyaWeight[i-1][j]%></td>
			<%} %>
		</tr>
		<%} %>

</table>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>

<div class="row mrt-30"> 
<div class="col s12 l12">
<div class="card table-panel ui-paragraph-head">
<h5 class="pdl-15"> <%=rBConstants.getString("NOTE_MASTROSAGE")%>: </h5>
 <ol class="mrb-20">
 <li><%=rBConstants.getString("NOTE_ONE_ASPECT_KP_BM")%></li>
 </ol>

  <table class="highlight striped bordered ui-table-reflow ui-table responsive-table">
  <thead>
  <tr class="amber lighten-5">
  <td class="cellhead"><%=rBConstants.getString("SHORT_ASPECT_KP")%></td>
  <td class="cellhead"><%=rBConstants.getString("DEGREE")%></td>
  <td class="cellhead"><%=rBConstants.getString("ORB_LIMIT_KP")%></td>
  <td class="cellhead"><%=rBConstants.getString("WEIGHT_PLANET_KP")%></td>
  <td class="cellhead"><%=rBConstants.getString("SHORT_ASPECT_KP")%></td>
  <td class="cellhead"><%=rBConstants.getString("DEGREE")%></td>
  <td class="cellhead"><%=rBConstants.getString("ORB_LIMIT_KP")%></td>
  <td class="cellhead"><%=rBConstants.getString("WEIGHT_PLANET_KP")%></td>
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

   <ol class="mrt-20"> 
         <li><%=rBConstants.getString("NOTE_TWO_ASPECT_KP_BM")%><br /></li>
         <li><%=rBConstants.getString("NOTE_LINE_THREE_BHAV_MADHYA")%></li>
         <li><%=rBConstants.getString("NOTE_LINE_FOUR_BHAV_MADHYA")%></li>
         </ol>
</div>
</div>
</div>




	<p>
		<%@include file='calculations-footer.jsp'%>
	</p>
