
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%
int LanguageCodeMD = Util.safeInt(session.getAttribute("languageCode"));
Local localMD = new Local();
Hindi hindiMD = new Hindi();
DesktopHoro myAstrologyObjectMD = (DesktopHoro)session.getAttribute("HoroscopeObj");
MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle manglikConstants = (MyResourceBundle) localMD.loadPropertiesFileNew("manglikdetails", LanguageCodeMD);
%>
<div align="center" class="heading-sec">
    <h2>
        <%=baseConstants.getString("MANGLIK_DETAILS")%>
    </h2>
</div>
<div class="inner-sec">
    <%               
                    
                
boolean MangaldoshOfBirth = myAstrologyObjectMD.isMangalDosh();
boolean MangalDoshOfMoon = myAstrologyObjectMD.isMangalDoshForMoonChart();
int[] PlanetInBhav = myAstrologyObjectMD.getPlanetInBhav();
int MangalDoshBhav = myAstrologyObjectMD.getMarsInBhavForMoonChart();

int StoreBhavNumber = PlanetInBhav  [2];
String StoreBhavName = baseConstants.getString("MANGLIK_HOUSE_NO"+StoreBhavNumber);
String StoreMoonName = baseConstants.getString("MANGLIK_HOUSE_NO"+MangalDoshBhav);                                             
                 
                    %>
    <h3>
        <%
        if (MangaldoshOfBirth && MangalDoshOfMoon) 
        {
        out.println(manglikConstants.getString("PERSON_IS_MANGLIK")+"("+baseConstants.getString("HIGH")+")"+baseConstants.getString("HAIENG"));
        }
        else if(MangaldoshOfBirth || MangalDoshOfMoon) 
        {
        out.println(manglikConstants.getString("PERSON_IS_MANGLIK")+"("+baseConstants.getString("LOW")+")"+baseConstants.getString("HAIENG"));
        }
        else if(!MangaldoshOfBirth && !MangalDoshOfMoon) 
        {
        out.println(manglikConstants.getString("PERSON_IS_NOT_MANGLIK")+baseConstants.getString("HAIENG"));
        }
        %>
    </h3>
    <p>
        <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH1")%>
    </p>
    <p>
        <%=manglikConstants.getString("MANGLIK_DETAILS_FIRST")+"<font color=Blue>"+ StoreBhavName +" </font>"+manglikConstants.getString("MANGLIK_DETAILS_SECOND")+"<font color=Blue>"+ StoreMoonName +" </font>"+manglikConstants.getString("MANGLIK_DETAILS_THIRD")+"<br/><br/>" %>
    </p>
    <p>
        <b>
            <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE")%>

            <% if(!MangaldoshOfBirth && !MangalDoshOfMoon) {%> 
            <%=manglikConstants.getString("PRESENT_NEITHER_IN_LAGNA_CHART_NOR_IN_MOON_CHART") %>
                      
            <% }
            if( MangaldoshOfBirth && MangalDoshOfMoon) { %> <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE1")%>
			<% } else 
			if( MangaldoshOfBirth && !MangalDoshOfMoon) { %> <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE2")%>
						<% } else 
			if( !MangaldoshOfBirth && MangalDoshOfMoon) {%> <%=manglikConstants.getString("MANGLIK_DETAILS_HENCE_NOTE3")%>
			<% } %> 
        </b>
    </p>
    <p>
        <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH4")%>
    </p>
    <p>
        <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH5")%>
    </p>
    <p class="text-center">
        <b><u><%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING1")%></u></b>
    </p>
    <p>
        <b>
            <%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING2")%></b>
    </p>
    <p>
        <%=manglikConstants.getString("MANGLIK_DETAILS_PARAGRAPH6")%>
    </p>
    <p>
        <b>
            <%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING3")%></b>
    </p>
    <ul>
        <li>
            <%=manglikConstants.getString("REMEDIES1")%></li>
        <li>
            <%=manglikConstants.getString("REMEDIES2")%></li>
        <li>
            <%=manglikConstants.getString("REMEDIES3")%></li>
    </ul>
    <p>
        <b>
            <%=manglikConstants.getString("MANGLIK_DETAILS_SUBHEADING4")%></b>
    </p>
    <ul>
        <li>
            <%=manglikConstants.getString("LK_REMEDIES1")%></li>
        <li>
            <%=manglikConstants.getString("LK_REMEDIES2")%></li>
        <li>
            <%=manglikConstants.getString("LK_REMEDIES3")%></li>
    </ul>
    <p>
        <b>
            <%=baseConstants.getString("NOTE")%>: </b>
        <%=manglikConstants.getString("MANGLIK_DETAILS_NOTE")%></p>
</div>
