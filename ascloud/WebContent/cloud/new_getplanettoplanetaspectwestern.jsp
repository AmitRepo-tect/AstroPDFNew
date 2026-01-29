<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<% 
    int languageCode = (Integer)session.getAttribute("languageCode");
	Local local = new Local();
	Hindi hindi= new Hindi();
	MyProperties pawConstants = (MyProperties) session.getAttribute("constants");
    //MyResourceBundle kpSignConstants = local.loadPropertiesFileNew("kpsignirp", languageCode);
 	//MyResourceBundle uraNepPlutoConstants = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday", languageCode);
 %>
 
 <div class="hdg-lg card">
	<h1><%=pawConstants.getString("PLANET_TO_PLANET_ASPECT")%></h1>	
</div>

<div class="row mrt-30 get-planet-table"> 
<div class="col s12 l12">
<div class="card table-panel rt-custom">
<table class="highlight striped bordered responsive-table ui-table">
		
        
        <%
                              /* '######### Variable Declaration Area #########*/
                 int bhavValue;
                 
                 String splittedPlanetDegree[]=new String[12];
                 String splittedPlanetMinute[]=new String[12];
                 String planetWeight []=new String[12];
                 String planetName[] = new String[12];
                 String splittedPlanetWeight[] = new String[12];
                 String bhavValueForKpCusp1[] = new String[12];
	             String bhavValueForKpCusp2[] = new String[12];
                 String planetToplanetAspect[][]  =new String [12][12];
 	             String planetToplanetAspectWeight[][] =new String[12][12];
                 
 %>
 <%          
                  //set objHoroPlanetAsp =  session("HoroscopeObj")
                  DesktopHoro objHoroPlanetAsp = (DesktopHoro) session.getAttribute("HoroscopeObj");
                  
                  if(languageCode ==1)
                  {
                	  objHoroPlanetAsp.setLanguageCode("1");
                      objHoroPlanetAsp.initialize();
  
                  }
                        
                  for (int i=1; i<=12; i++)
                 {	 
                      planetName[i-1]= objHoroPlanetAsp.getPlanetName(i);
                      planetWeight[i-1]= objHoroPlanetAsp.getPlanetWeight(i);
                      if(languageCode==1)
                      {
                    	  splittedPlanetWeight =local.correctSeperator(planetWeight[i-1]).split(":");  
                      }
                      else
                      {
                    	  splittedPlanetWeight =local.correctSeperator(planetWeight[i-1]).split("\\.");  
                      }
                     
                      splittedPlanetDegree[i-1] = splittedPlanetWeight[0];
                      splittedPlanetMinute[i-1] = splittedPlanetWeight[1];
                  }
                  
                  for (int i=1; i<=12; i++)
                  {
		              for (int j=1; j<=12; j++)
		              {
			             planetToplanetAspect[i-1][j-1]=objHoroPlanetAsp.getPlanetToPlanetAspect(i,j);
			             planetToplanetAspectWeight[i-1][j-1]=objHoroPlanetAsp.getPlanetToPlanetAspectWeight(i,j);
		              }
                  }
  
   %>
 <thead>
        
       
 <tr class="amber lighten-5">
     <th class="cellhead">&nbsp;</th>
     <% for (int i=1; i<=12; i++){  %>
     <th class="cellhead">
                   <%=hindi.unicode(planetName[i-1], languageCode)%><br>
                    <%=local.correctSeperator(splittedPlanetDegree[i-1])%><br>
                    <%=local.correctSeperator(splittedPlanetMinute[i-1])%>
     </th>
     <% } %>
 </tr>  
   </thead>
     <% 
	for (int i=1; i<=12; i++)
	{
            %>
            <tr>
                <td class="cellhead" style="font-size:9px;">
                     <%=hindi.unicode(planetName[i-1], languageCode)%><br>
                    <%=local.correctSeperator(planetWeight[i-1])%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][0],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][0]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][1],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][1]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][2],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][2]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][3],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][3]%>
                </td>
                <td class="cellcontent" style="font-size:9px;" >
                    <%=hindi.unicode(planetToplanetAspect[i-1][4],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][4]%>
                </td>
                <td class="cellcontent"style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][5],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][5]%>
                </td>
                <td class="cellcontent" style="font-size:9px;" >
                    <%=hindi.unicode(planetToplanetAspect[i-1][6],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][6]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][7],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][7]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][8],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][8]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][9],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][9]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][10],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][10]%>
                </td>
                <td class="cellcontent" style="font-size:9px;">
                    <%=hindi.unicode(planetToplanetAspect[i-1][11],languageCode)%><br>
                    <%=planetToplanetAspectWeight[i-1][11]%>
                </td>
            </tr>
            <% } %>

 </table>
       
        </div>
        </div>
        </div>
        
        <%@include file='ui-control/ad-content-area.jsp'%>
        
        <div class="row mrt-30"> 
<div class="col s12 l12">
<div class="card table-panel ui-paragraph-head rt-custom">
<h5 align="left" class="pdl-15"><%=pawConstants.getString("NOTE_MASTROSAGE")%>:</h5>
 <ol class="mrb-20">
  <li><%=pawConstants.getString("NOTE_ONE_ASPECT_KP_BM")%></li>
  </ol>
<table class="highlight striped bordered ui-table responsive-table">
<thead> 
<tr class="amber lighten-5">
  <th class="cellhead"><%=pawConstants.getString("SHORT_ASPECT_KP")%></th>
  <th class="cellhead"><%=pawConstants.getString("DEGREE")%></th>
  <th class="cellhead"><%=pawConstants.getString("ORB_LIMIT_KP")%></th>
  <th class="cellhead"><%=pawConstants.getString("WEIGHT_PLANET_KP")%></th>
  <th class="cellhead"><%=pawConstants.getString("SHORT_ASPECT_KP")%></th>
  <th class="cellhead"><%=pawConstants.getString("DEGREE")%></th>
  <th class="cellhead"><%=pawConstants.getString("ORB_LIMIT_KP")%></th>
  <th class="cellhead"><%=pawConstants.getString("WEIGHT_PLANET_KP")%></th>
  </tr>
  </thead>
  <tr>
  <td class="cellcontent"><%=pawConstants.getString("CONJ_SHORT_NAME")%></td>
  <td class="cellcontent">0</td>
  <td class="cellcontent">15</td>
  <td class="cellcontent">10</td>
  <td class="cellcontent"><%=pawConstants.getString("OPPN_SHORT_NAME")%></td>
  <td class="cellcontent">180</td>
  <td class="cellcontent">15</td>
  <td class="cellcontent">10</td>
  </tr>
  <tr>
  <td class="cellcontent"><%=pawConstants.getString("TRIN_SHORT_NAME")%></td>
  <td class="cellcontent">120</td>
  <td class="cellcontent">6</td>
  <td class="cellcontent">3</td>
  <td class="cellcontent"><%=pawConstants.getString("SQUR_SHORT_NAME")%></td>
  <td class="cellcontent">90</td>
  <td class="cellcontent">6</td>
  <td class="cellcontent">3</td>
  </tr>
   <tr>
  <td class="cellcontent"><%=pawConstants.getString("SEXT_SHORT_NAME")%></td>
  <td class="cellcontent">60</td>
  <td class="cellcontent">6</td>
  <td class="cellcontent">3</td>
  <td class="cellcontent"><%=pawConstants.getString("SSQU_SHORT_NAME")%></td>
  <td class="cellcontent">45</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent">1</td>
  </tr>
   <tr>
  <td class="cellcontent"><%=pawConstants.getString("NONL_SHORT_NAME")%></td>
  <td class="cellcontent">40</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent"><%=pawConstants.getString("QUIN_SHORT_NAME")%></td>
  <td class="cellcontent">72</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent">1</td>
  </tr>
   <tr>
  <td class="cellcontent"><%=pawConstants.getString("SQQD_SHORT_NAME")%></td>
  <td class="cellcontent">135</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent"><%=pawConstants.getString("QUINC_SHORT_NAME")%></td>
  <td class="cellcontent">150</td>
  <td class="cellcontent">1</td>
  <td class="cellcontent">1</td>
  </tr>
  </table>
 <ol start="2" class="mrt-20"> 
  <li><%=pawConstants.getString("NOTE_TWO_ASPECT_KP_BM") %></li>
  <li><%=pawConstants.getString("NOTE_THREE_ASPECT_KP_BM") %></li>
  <li><%=pawConstants.getString("NOTE_FOUR_ASPECT_KP_BM")%></li>

  </ol>
</table>
</div>
</div>
</div>


<p>
		<%@include file='calculations-footer.jsp'%>
		<%@include file='kp-footer.jsp'%>
		
</p>
