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
MyResourceBundle jadiConstants  = local.loadPropertiesFileNew("jadi-reports", languageCode);


//*******************'
String suffix = "en";
if(languageCode==1) {
	suffix = "hi";
}


String productInfo="";

if(languageCode == 1)
{
productInfo=Common.hiJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 9)
{
	productInfo=Common.mrJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 6)
{
	productInfo=Common.bnJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 8)
{
	productInfo=Common.mlJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 5)
{
	productInfo=Common.teJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 7)
{
	productInfo=Common.guJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 2)
{
	productInfo=Common.taJadiName[myAstrologyObject.getRasi()];
}
else if(languageCode == 4)
{
	productInfo=Common.kaJadiName[myAstrologyObject.getRasi()];
}
else
{
 productInfo=Common.enJadiName[myAstrologyObject.getRasi()];
}
String recJadi=Common.Jadi[myAstrologyObject.getRasi()];
String JadiURL=Common.JadiUrl[myAstrologyObject.getRasi()];
String JadiImage=Common.JadiImages[myAstrologyObject.getRasi()];


  %>                     


<div class="hdg-lg card">
	<h1><%=jadiConstants.getString("JADI_SUGGESTION_REPORT_HEADING")%></h1>	
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all"> 
<h2><%=jadiConstants.getString("JADI_SUGGESTION_REPORT_HEADING")%></h2>	
<p><%=jadiConstants.getString("JADI_SUGGESTION_REPORT")%></p>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
<h2><%=jadiConstants.getString("JADI_AND_ITS_IMPORTANCE_HEADING")%></h2>
<p><%=jadiConstants.getString("JADI_AND_ITS_IMPORTANCE")%></p>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
	<h2>
				<%=jadiConstants.getString("RECOMMENDATIONS_HEADING")%>  </h2>
	
		<p>
			<%=jadiConstants.getString("RECOMMENDATIONS")%>  
			
		</p>
				<div class="ynt mrb-10 mrt-20"> 
<div class="left"> 
 <img src="https://ascloud.astrosage.com/cloud/images/product-images/<%=JadiImage%>" align="left"> </div>
<div class="center"> 
<h4> <%=productInfo%></h4>
 <a href="https://buy.astrosage.com/jadi-tree-roots/<%=JadiURL%>?prtnr_id=CLJDI&language=<%=suffix%>" class="waves-effect waves-light btn amber darken-4 white-text box-shadow center"><%=jadiConstants.getString("BUY_NOW")%></a> 
</div>
</div>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
<h2><%=productInfo%></h2>
<p> <%=jadiConstants.getString("TREE_ROOT_OF_"+recJadi)%></p>
</div>
</div>

<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all">
<h2><%=jadiConstants.getString("HOW_TO_USE_TREE_ROOT_OF_"+recJadi+"_HEADING")%></h2>
<p><%=jadiConstants.getString("HOW_TO_USE_TREE_ROOT_OF_"+recJadi)%></p>
</div>
</div>


<div class="mrt-30 mrb-30"> 
<div class="card hdg-content padding-all"> 
<h2><%=jadiConstants.getString("IMPORTANCE_OF_NATURAL_JADI_HEADING")%> </h2>
<p> <%=jadiConstants.getString("IMPORTANCE_OF_NATURAL_JADI")%></p>
</div>
</div>
	