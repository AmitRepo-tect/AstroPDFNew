<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>

<%
int languageCode= (Integer) session.getAttribute("languageCode");

int  chartType = Integer.parseInt(session.getAttribute("chartType").toString());
Local local = new Local();
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle lagnaConstants = local.loadPropertiesFileNew("lagna-navamsa-jpeg-chart", languageCode);
String planetstyleval = "0";
String planetStyle = Util.safestr(request.getParameter("planetstyle"));
if(!"".equals(planetStyle))
{
	planetstyleval = Util.safestr(planetStyle);
}
String ddlChartType = Util.safestr(request.getParameter("ddlChartType"));
String coloredText = Util.safestr(request.getParameter("coloredtext"));
String verticalChart = Util.safestr(request.getParameter("verticalchart"));

String imgpath = Common.imgPath[languageCode];
String imgpathhover = Common.imgPathHover[languageCode];

%>

<div class="hdg-lg card">
	<h1><%=lagnaConstants.getString("SAVE_CHART_AS_IMAGE_FILE_JPEG")%></h1>
	<div id="headad"></div>			
</div>

<div class="mrt-30"> 
<div class="card padding-all">
<h5 class="mr-t-0"> <%=lagnaConstants.getString("PRINT_EMBED_OR_SHARE_CHART_ON_FACEBOOK_TWITTER")%></h5>
<p class="ui-p"> <%=lagnaConstants.getString("SAVE_CHART_INTRO_PARA") %> </p>
     </div>
     </div>

<%
if(!Util.safestr(request.getParameter("LanguageCode")).equals("")){
	languageCode=Integer.parseInt((Util.safestr(request.getParameter("LanguageCode"))));
}else{
	languageCode= (Integer) session.getAttribute("languageCode");
}
lagnaConstants = local.loadPropertiesFileNew("lagna-navamsa-jpeg-chart", languageCode);
%>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="mrt-30">
<div class="card-panel padding-all">
                  <div class="row mrt-10">
                    <form class="col s12" id="aform" action="lagna-navamsa-jpeg-chart.asp" method="get" name="hh">
                     <div class="row">
                        <div class="input-field col s6 l6">
                          <select name="LanguageCode" id="LanguageCode">
							<option value="0" <%if(languageCode == 0){%>
								selected="selected" <%} %>>English</option>
							<option value="1" <%if(languageCode == 1){%>
								selected="selected" <%} %>>हिन्दी</option>
							<option value="2" <%if(languageCode == 2){%>
								selected="selected" <%} %>>Tamil</option>
							<option value="5" <%if(languageCode == 5){%>
								selected="selected" <%} %>>Telugu</option>
							<option value="6" <%if(languageCode == 6){%>
								selected="selected" <%} %>>Bengali</option>

							</select>
                          <label><%=lagnaConstants.getString("SELECT_LANGUAGE") %></label>
                        </div>
                        <div class="input-field col s6 l6">
                          <select name="ddlChartType" id="ddlChartType">
							<option value="Lagna-Navamsa-Chart"<%if (ddlChartType.equals("Lagna-Navamsa-Chart") || chartType == 0){ %>selected="selected"><%=lagnaConstants.getString("LAGNA_NAVMSA_NORTH") %></option><%} %>
							<option value="Lagna-Navamsa-Chart-South"<%if (ddlChartType.equals("Lagna-Navamsa-Chart-South") || chartType == 1){ %>selected="selected"><%=lagnaConstants.getString("LAGNA_NAVMSA_SOUTH") %></option><%} %>
							<option value="East-Indian-Chart"<%if (ddlChartType.equals("East-Indian-Chart")){%>selected="selected" <%} %>><%=lagnaConstants.getString("LAGNA_NAVMSA_EAST") %></option>
							<option value="Lagna-Chart"<%if (ddlChartType.equals("Lagna-Chart")){%>selected="selected" <%} %>><%=lagnaConstants.getString("LAGNA_CHART_NS") %></option>
							<option value="LalKitab-Lagna-Chart"<%if (ddlChartType.equals("LalKitab-Lagna-Chart")){%>selected="selected" <%} %>><%=lagnaConstants.getString("LALKITAB_LAGNA_CHART_NS") %></option>
							<option value="LalKitab-VarshaphalChart"<%if (ddlChartType.equals("LalKitab-VarshaphalChart")){%>selected="selected" <%} %>><%=lagnaConstants.getString("LALKITAB_LAGNA_CHART_VARSHAPHAL_NORTH") %></option>
						   </select>
                          <label><%=lagnaConstants.getString("SHOW_CHART") %></label>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col s6 l3">
                          <input class="filled-in" type="checkbox" value="1" <% if("1".equals(coloredText)) %> checked 
                          name="coloredtext" id="coloredtext" />
                          <label for="coloredtext"><%=lagnaConstants.getString("COLOR") %></label>
                        </div>
                        <div class="col s6 l3">
                          <input class="filled-in" type="checkbox" value="1" <% if("1".equals(verticalChart)) %> checked 
                          name="verticalchart" id="verticalchart" />
                          <label for="verticalchart"><%=lagnaConstants.getString("VERTICAL_CHART") %></label>
                        </div>

                        <div class="col s6 l3 ui-mrg ui-top">
                          <input class="with-gap" type="radio" <% if("1".equals(planetstyleval)) %> checked 
                          name="planetstyle" id="planetstyleId"  value="1" />
    					  <label for="planetstyleId"><%=lagnaConstants.getString("HIDE_UR_NE_PL") %></label>
                        </div>

                        <div class="col s6 l3 ui-mrg ui-top">
                        <input class="with-gap" type="radio"
														<% if("0".equals(planetstyleval))  %> checked 
														name="planetstyle" id="planetstyleId1" value="0"/>
             			<label for="planetstyleId1"><%=lagnaConstants.getString("SHOW_UR_NE_PL")%></label>
                        </div>
                      </div>

                     <div class="input-field center">
                            <button class="btn waves-effect amber darken-4 waves-light" onclick="alertSelectedIndex('ddlChartType');" name="Apply Changes">Submit
                             </button>
                          </div>
                     
                  </form>
                  </div>
                </div>
                </div>
                
                <div class="mrt-30">
<div class="card padding-4">
<%
			DesktopHoro JPEGHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
			
			String userDetails_jp="Name="+JPEGHoro.getName()+"&Place="+JPEGHoro.getPlace().trim()+"&timeZone="+JPEGHoro.getTimeZone()+
					"&Sex="+JPEGHoro.getMaleFemale()+"&Sec="+JPEGHoro.getSecondOfBirth()+"&Min="+ JPEGHoro.getMinuteOfBirth()+
					"&Hrs="+JPEGHoro.getHourOfBirth()+"&Day="+ JPEGHoro.getDayOfBirth()+"&Month="+JPEGHoro.getMonthOfBirth()+
					"&Year="+ JPEGHoro.getYearOfBirth()+"&LatDeg="+JPEGHoro.getDegreeOfLattitude()+"&LongDeg="+
					JPEGHoro.getDegreeOfLongitude()+"&LatSec="+JPEGHoro.getSecondOfLattitude()+"&LongSec="+JPEGHoro.getSecondOfLongitude()+
					"&LongMin="+JPEGHoro.getMinuteOfLongitude()+"&LatMin="+JPEGHoro.getMinuteOfLattitude()+"&LongEW="+
					JPEGHoro.getEastWest()+"&LatNS="+JPEGHoro.getNorthSouth()+"&Dst="+JPEGHoro.getDST()+"&Ayanamsa="+
					SharedFunction.getAyan(JPEGHoro)+"&kphn="+JPEGHoro.getKPHorarySeed()+"&chartType="+session.getAttribute("chartType"); %>
					<%//out.println("neha"+userDetails_jp);%>
			<div align="center">
				<img class="responsive-img" src="http://www.astrosage.com/cloud/lagna-navamsa-chart-jsp.asp?Chart_type=<%=ddlChartType%>&LanguageCode=<%=languageCode %>&textcolor=<%=coloredText %>&planetstyle=<%=planetstyleval %>&verticalchart=<%=verticalChart %>&<%=userDetails_jp%>"
                 onload="resizeimg(this,'<%=verticalChart %>');" />
			</div>
			
			 
			<div id="downloadbtn" class="clearbutton center mrt-30">
				<a class="btn waves-effect amber darken-4 waves-light" href="http://www.astrosage.com/cloud/lagna-navamsa-chart-jsp.asp?Chart_type=<%=ddlChartType%>&LanguageCode=<%=languageCode%>&textcolor=<%=coloredText %>&planetstyle=<%=planetstyleval %>&verticalchart=<%=verticalChart %>&<%=userDetails_jp %>"

					title="Click Here to Save Kundali's Images "><span
					style='<% if(languageCode== 2) {%>font-size:12px; <%}%>'><%=lagnaConstants.getString("DOWNLOAD_CHART")%></span></a>

			</div>
</div>
</div>


<div class="mrt-30 mrb-30">
<div class="card padding-2">
<div id="downloadbtn" class="clearbutton left mrb-10">
				<%--<a class="btn waves-effect amber darken-4 waves-light" href="vedic-chart-pdf.asp" --%>
				<a class="btn waves-effect amber darken-4 waves-light" href="vedic-chart-pdf.asp?language_Code=<%=languageCode%>"
					target="_blank"
					title="<%=lagnaConstants.getString("DOWNLOAD_KUNDALI_REPORT") %>"><span
					style='<% if(languageCode == 2) {%> font-size:12px; <%}else{%> font-size:12.5px; <%}%>'><%=lagnaConstants.getString("DOWNLOAD_KUNDALI_REPORT") %></span></a>
			</div>
			
			<div id="downloadbtn" class="clearbutton ui-rights mrb-10">
				<a class="btn waves-effect amber darken-4 waves-light" href="vedic-chart-pdf.asp?page=17&isopenkundli=yes" target="_blank"
					title="<%=lagnaConstants.getString("DOWNLOAD_KUNDALI_CALCULATION_REPORT") %>"><span
					style="<% if(languageCode == 2) {%> font-size:12px; <%} else {%>font-size:12px;  <%}%>"><%=lagnaConstants.getString("DOWNLOAD_KUNDALI_CALCULATION_REPORT") %></span></a>
			</div>
</div>
</div>



