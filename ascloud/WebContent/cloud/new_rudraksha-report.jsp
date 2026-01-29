<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>


<% Local local = new Local();
int languageCode = (Integer) session.getAttribute("languageCode");
DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rudrakshConstants = local.loadPropertiesFileNew("rudraksha-reports", languageCode);

//*******************'
String suffix = "en";
if(languageCode==1) {
	suffix = "hi";
}


String productInfo="";

if(languageCode == 1)
{
productInfo=Common.hiRudrakshaName[myAstrologyObject.getRasi()];
}
else if(languageCode == 9)
{
	productInfo=Common.mrRudrakshaName[myAstrologyObject.getRasi()];
}
else if(languageCode == 6)
{
	productInfo=Common.bnRudrakshaName[myAstrologyObject.getRasi()];
}
else if(languageCode == 8)
{
	productInfo=Common.mlRudrakshaName[myAstrologyObject.getRasi()];
}
else if(languageCode == 5)
{
	productInfo=Common.teRudrakshaName[myAstrologyObject.getRasi()];
}
else if(languageCode == 7)
{
	productInfo=Common.guRudrakshaName[myAstrologyObject.getRasi()];
	
}
else if(languageCode == 2)
{
	productInfo=Common.taRudrakshaName[myAstrologyObject.getRasi()];
}
else if(languageCode == 4)
{
	productInfo=Common.kaRudrakshaName[myAstrologyObject.getRasi()];
}
else
{
 productInfo=Common.enRudrakshaName[myAstrologyObject.getRasi()];
}
String recRudraksh=Common.Rudraksha[myAstrologyObject.getRasi()];
String RudrakshaURL=Common.RudrakshaUrl[myAstrologyObject.getRasi()];
String RudrakshaImage=Common.RudrakshaImages[myAstrologyObject.getRasi()];

 


%>                  

<div class="hdg-lg card">
	<h1><%=rudrakshConstants.getString("RUDRAKSH_SUGGESTION_REPORT_HEADING")%></h1>	
</div>
<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
	<h2><%=rudrakshConstants.getString("RUDRAKSH_SUGGESTION_REPORT_HEADING")%></h2>	
	<p><%=rudrakshConstants.getString("RUDRAKSH_SUGGESTION_REPORT")%></p>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>
<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
	<h2><%=rudrakshConstants.getString("RUDRAKSHA_AND_ITS_IMPORTANCE_HEADING")%> </h2>
	<p><%=rudrakshConstants.getString("RUDRAKSHA_AND_ITS_IMPORTANCE")%></p>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content box-setting padding-all">
<h2><%=rudrakshConstants.getString("RECOMMENDATIONS_HEADING")%>  </h2>
<p><%=rudrakshConstants.getString("RECOMMENDATIONS")%> </p>
<div class="ynt mrb-10 mrt-20"> 
<div class="left"> 
 <img src="https://ascloud.astrosage.com/cloud/images/product-images/<%=RudrakshaImage%>" align="left"> </div>
<div class="center"> 
<h4> <%=productInfo%></h4>
 <a href="https://buy.astrosage.com/rudraksha/<%=RudrakshaURL%>?prtnr_id=CLRDK&language=<%=suffix%>" class="waves-effect waves-light btn amber darken-4 white-text box-shadow center"><%=rudrakshConstants.getString("BUY_NOW")%></a> 
</div>
</div>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
<h2><%=productInfo%></h2>
<p><%=rudrakshConstants.getString("RUDRAKSHA_"+recRudraksh)%></p>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
<h2><%=rudrakshConstants.getString("HOW_TO_WEAR_"+recRudraksh+"_HEADING")%></h2>
<p><%=rudrakshConstants.getString("HOW_TO_WEAR_"+recRudraksh)%></p>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
<h2><%=rudrakshConstants.getString("IMPORTANCE_OF_NATURAL_RUDRAKSHA_HEADING")%></h2>
<p><%=rudrakshConstants.getString("IMPORTANCE_OF_NATURAL_RUDRAKSHA")%></p>
</div>
</div>