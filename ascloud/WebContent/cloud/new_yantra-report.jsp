<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>


<% Local local = new Local();
int languageCode = (Integer) session.getAttribute("languageCode");
DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle yantraConstants = local.loadPropertiesFileNew("yantra-reports", languageCode);
//*******************'
String suffix = "en";
if(languageCode==1) {
	suffix = "hi";
}


String productInfo="";

if(languageCode == 1)
{
productInfo=Common.hiYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 9)
{
	productInfo=Common.mrYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 6)
{
	productInfo=Common.bnYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 8)
{
	productInfo=Common.mlYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 5)
{
	productInfo=Common.teYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 7)
{
	productInfo=Common.guYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 2)
{
	productInfo=Common.taYantraName[myAstrologyObject.getRasi()];
}
else if(languageCode == 4)
{
	productInfo=Common.kaYantraName[myAstrologyObject.getRasi()];
}
else
{
 productInfo=Common.enYantraName[myAstrologyObject.getRasi()];
}
String recYantra=Common.Yantra[myAstrologyObject.getRasi()];
String YantraURL=Common.YantraUrl[myAstrologyObject.getRasi()];
String YantraImage=Common.YantraImages[myAstrologyObject.getRasi()];                     
%>

<div class="hdg-lg card">
	<h1><%=yantraConstants.getString("YANTRA_SUGGESTION_REPORT_HEADING")%></h1>	
</div>
<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all"> 
<h2><%=yantraConstants.getString("YANTRA_SUGGESTION_REPORT_HEADING")%></h2>	
<p> <%=yantraConstants.getString("YANTRA_SUGGESTION_REPORT")%></p>
</div>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all"> 
<h2><%=yantraConstants.getString("YANTRA_AND_ITS_IMPORTANCE_HEADING")%> </h2>
<p> <%=yantraConstants.getString("YANTRA_AND_ITS_IMPORTANCE")%>  </p>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content box-setting padding-all"> 
<h2><%=yantraConstants.getString("RECOMMENDATIONS_HEADING")%> </h2>
<p><%=yantraConstants.getString("RECOMMENDATIONS")%>  </p>
<h2 class="mrb-10"> <%=yantraConstants.getString("RECOMMENDED_YANTRA")%>: <%=productInfo%> </h2>

<div class="ynt mrb-10 mrt-20"> 
<div class="left"> 
 <img src="https://ascloud.astrosage.com/cloud/images/product-images/<%=YantraImage%>" align="left"> </div>
<div class="center"> 
<h4> <%=productInfo%></h4>
 <a href="https://buy.astrosage.com/navagrah-yantra/<%=YantraURL%>?prtnr_id=CLYNT&language=<%=suffix%>" class="waves-effect waves-light btn amber darken-4 white-text box-shadow center"><%=yantraConstants.getString("BUY_NOW")%></a> 
</div>
</div>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all"> 
<h2> <%=productInfo%></h2>
<p> <%=yantraConstants.getString(recYantra+"_YANTRA")%> </p>
</div>
</div>



<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all"> 

<h5> <%=yantraConstants.getString("HOW_TO_INSTALL_"+recYantra+"_YANTRA_HEADING")%></h5>
<p> <%=yantraConstants.getString("HOW_TO_INSTALL_"+recYantra+"_YANTRA")%> </p>
<p> <%=yantraConstants.getString("IMPORTANCE_OF_NATURAL_YANTRA_HEADING")%> </p>
<p> <%=yantraConstants.getString("IMPORTANCE_OF_NATURAL_YANTRA")%></p>
</div>
</div>
