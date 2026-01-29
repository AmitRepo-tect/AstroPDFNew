<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<%

Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer) session.getAttribute("languageCode");
MyResourceBundle rashiConstants = local.loadPropertiesFileNew("rasicalculator", languageCode);
MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
String myAstroRashiName = myAstrologyObject.getRasiName();
//This is by default set to show the 'Scorpio' sign.
//This is done because it has been found that sometimes the rashi name comes as 'Scorpion', instead of 'Scorpio'.
//Which does not match with the rashi name in array which is being sent in all other cases.
int signNumber = 7;

String RashiName = hindi.unicode(myAstroRashiName, languageCode);
String[] rashiArray = Common.langRashiNames[languageCode];
for(int i=0;i<rashiArray.length;i++)
{
	if(RashiName.equals(rashiArray[i]))
	{
		signNumber = i+1;
		break;
	}
}

%>

<div class="hdg-lg card">
	<%--<h1><%=baseConstants.getString("WHAT_IS_RASI") %></h1>--%>
	<h1><%=rashiConstants.getString("WHAT_IS_RASI") %></h1>	
</div>
<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">

<h2> <%=rashiConstants.getString("RASI_ACCORDING_TO_VEDIC_ASTROLOGY_HINDI") %>
					<%=RashiName+" " %>
					<%=rashiConstants.getString("RASI_ACCORDING_TO_VEDIC_ASTROLOGY") %></h2>
					
<p> <%=rashiConstants.getString("RASI_PREDICTION_"+signNumber)%></p>

</div>
</div>
</div>

