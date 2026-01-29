<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<%
Local objLocal = new Local();
Hindi hindi = new Hindi();
int languageCode = Util.safeInt(session.getAttribute("languageCode"));

MyResourceBundle rBAstroSketch = objLocal.loadPropertiesFileNew("astrosketch",languageCode);

DesktopHoro objHoro = new DesktopHoro();
objHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");

MyProperties rBConstant = (MyProperties) session.getAttribute("constants");

%>
<div class="hdg-lg card">
	<h1><%=rBConstant.getString("ASTRO_SKETCH")%></h1>	
</div>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card-panel padding-all hdg-content">
<div id="divhead"><h2> <%=rBConstant.getString("ASTRO_SKETCH")%></h2></div>

	<p>
					<% 
		String KeyOfAstro="";
		String[] astroData;
		String gender = objHoro.getMaleFemale();  
		
		int rasiNumber = objHoro.getRasi();		     
		%>
					<b><%=rBConstant.getString("RASHI") %> (<%=rBConstant.getString("MOON_SIGN")%>):</b> 
					<%=hindi.unicode(objHoro.getRasiName(),languageCode) %><br /> <b><%=rBConstant.getString("NAKSHATRA") %>-<%=rBConstant.getString("PADA")%>:</b>
					<%=hindi.unicode(objHoro.getNakshatraName(),languageCode)  + "-" + objHoro.getPadaOfPlanet(2) %></p> 
				
				<%                               
         if(gender.equalsIgnoreCase("male")){        	 
        	 KeyOfAstro = rBAstroSketch.getString("ASTRO_SKETCH_DATA_MALE");
         }
         else{        	 
        	 KeyOfAstro = rBAstroSketch.getString("ASTRO_SKETCH_DATA_FEMALE");     
         }
         astroData = objLocal.getStringArray(KeyOfAstro);
         out.println(astroData[rasiNumber]);
     %>

</div>
</div>
</div>
