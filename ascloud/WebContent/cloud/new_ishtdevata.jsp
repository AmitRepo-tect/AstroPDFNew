<%@page import="java.io.OutputStream"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.text.MessageFormat"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.api.What"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<%
	Local local = new Local();
	int languageCode = (Integer)session.getAttribute("languageCode");
	MyResourceBundle rbIshtDevata = local.loadPropertiesFileNew("isht-devata", languageCode);
	DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
%>

<div class="hdg-lg card">
	<h1>
		<%=rbIshtDevata.getString("ISHT_DEVATA_HEADING") %>
	</h1>	
</div>

<div class="row mrt-30">
	<div class="col s12 l12">
		<div class="card padding-all ui-paragraph-head ui-para">
			<p>
<%
				String ishtDevata[] = {"ISHT_DEVATA1", "ISHT_DEVATA2", "ISHT_DEVATA3", "ISHT_DEVATA4", "ISHT_DEVATA5", "ISHT_DEVATA6", "ISHT_DEVATA7", "ISHT_DEVATA8", "ISHT_DEVATA9"};

				What what = new What(ObjHoro);

				int ishtDevPlanet = what.findIstaDev();
				
				//ishtDevPlanet = 9;

				/*
				out.println(rbIshtDevata.getString("ISHT_DEVATA_PARAGRAPH1"));

				out.print("<b>" + rbIshtDevata.getString(ishtDevata[ishtDevPlanet - 1]) + "</b>");

				if (languageCode == 1)
				{
					out.print(" " + rbIshtDevata.getString("ISHT_DEVATA_PARAGRAPH2"));
				}
				else
				{
					out.print(rbIshtDevata.getString("ISHT_DEVATA_PARAGRAPH2"));
				}
				*/

				out.println(MessageFormat.format(rbIshtDevata.getString("ISHT_DEVATA_PARA"), "<b>"+ rbIshtDevata.getString(ishtDevata[ishtDevPlanet - 1]) +"</b>"));

				if (ishtDevPlanet - 1 == 0)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-1.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_RAMA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_RAMA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_RAMA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_RAMA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_RAMA5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_RAMA6"));

					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SHIVA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SHIVA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SHIVA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SHIVA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SHIVA5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SHIVA6"));
				}
				else if (ishtDevPlanet - 1 == 1)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-2.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KRISHNA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KRISHNA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KRISHNA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KRISHNA4"));
					
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SARASWATI1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SARASWATI2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SARASWATI3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SARASWATI4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SARASWATI5"));
				}
				else if (ishtDevPlanet - 1 == 2)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-3.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_HANUMAN1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_HANUMAN2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_HANUMAN3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_HANUMAN4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_HANUMAN5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_HANUMAN6"));
					
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KARTIKEYA_MURUGAN1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KARTIKEYA_MURUGAN2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KARTIKEYA_MURUGAN3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KARTIKEYA_MURUGAN4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KARTIKEYA_MURUGAN5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_KARTIKEYA_MURUGAN6"));
				}
				else if (ishtDevPlanet - 1 == 3)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-4.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_VISHNU1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_VISHNU2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_VISHNU3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_VISHNU4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_VISHNU5"));
					
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_THIRUMAL1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_THIRUMAL2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_THIRUMAL3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_THIRUMAL4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_THIRUMAL5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_THIRUMAL6"));
				}
				else if (ishtDevPlanet - 1 == 4)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-5.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SRI_VAMANA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SRI_VAMANA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SRI_VAMANA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SRI_VAMANA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_SRI_VAMANA5"));
					
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_DATTATREYA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_DATTATREYA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_DATTATREYA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_DATTATREYA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_DATTATREYA5"));
				}
				else if (ishtDevPlanet - 1 == 5)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-6.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAHA_LAKSHMI1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAHA_LAKSHMI2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAHA_LAKSHMI3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAHA_LAKSHMI4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAHA_LAKSHMI5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAHA_LAKSHMI6"));
					
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_GOURI1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_GOURI2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_GOURI3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_GOURI4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_GOURI5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_GOURI6"));
				}
				else if (ishtDevPlanet - 1 == 6)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-7.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA6"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_BRAHMA7"));
					
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA6"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_AYYAPPA7"));
				}
				else if (ishtDevPlanet - 1 == 7)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-8.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_DURGA1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_DURGA2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_DURGA3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_DURGA4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_DURGA5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_MAA_DURGA6"));
				}
				else if (ishtDevPlanet - 1 == 8)
				{
%>
					<div class="mrt-20" align="center">
						<img src="/cloud/images/i_dev-9.jpg" class="responsive-img" width="560" />
					</div>
<%
					out.print("<hr /><br />");
					
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_GANESH1"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_GANESH2"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_GANESH3"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_GANESH4"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_GANESH5"));
					out.print(rbIshtDevata.getString("ISHT_DEVTA_LORD_GANESH6"));
				}
%>
			</p>
		</div>
	</div>
</div>