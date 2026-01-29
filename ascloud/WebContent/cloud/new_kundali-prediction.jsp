<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
	CloudDAO dao = new CloudDAO();
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	try {
		connObj = dBUtils.getConnection();
		Local local = new Local();
		Hindi hindi = new Hindi();
		int langCode = (Integer) session.getAttribute("languageCode");
		MyResourceBundle rBConstants = local.loadPropertiesFileNew("constants", langCode);
		MyResourceBundle rBPredCharHoro = local.loadPropertiesFileNew("prediction1-characterhoroscope",
				langCode);
		MyResourceBundle rBPredCarHoro = local.loadPropertiesFileNew("prediction2-careerhoroscope", langCode);
		MyResourceBundle rBPredLoveHoro = local.loadPropertiesFileNew("prediction3-lovehoroscope", langCode);
		String[] EnglishArrayHeading = { "CHARACTER", "HAPPINESS AND FULFILLMENT", "LIFE STYLE", "CAREER",
				"OCCUPATION", "HEALTH", "HOBBIES", "LOVE MATTERS", "FINANCE" };
		String[] EnglishArrayHeadingTxt = { rBPredCharHoro.getString("CHARACTER"),
				rBPredCharHoro.getString("HAPPINESS_AND_FULFILLMENT"), rBPredCharHoro.getString("LIFE_STYLE"),
				rBPredCarHoro.getString("CAREER"), rBPredCarHoro.getString("OCCUPATION"),
				rBConstants.getString("HEALTHE"), rBPredLoveHoro.getString("HOBBIES"),
				rBPredLoveHoro.getString("LOVE_MATTERS"), rBConstants.getString("FINANCE") };
		String[] HindiArrayHeading = new String[] { "चरित्र", "सौभाग्य और संतुष्टि", "जीवन शैली", "रोजगार",
				"व्यवसाय", "स्वास्थ्य", "रुचि", "प्रेम प्रसंग", "वित्त" };
%>

<div class="hdg-lg card">
	<h1>
		<%=rBConstants.getString("GENERAL_PREDICTION_NEW")%></h1>
</div>

<div class="mrt-30 mrb-30">
	<div class="card">
		<%
			DesktopHoro JPEGHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");

				String userDetails_jp = "Name=" + JPEGHoro.getName() + "&Place=" + JPEGHoro.getPlace().trim()
						+ "&timeZone=" + JPEGHoro.getTimeZone() + "&Sex=" + JPEGHoro.getMaleFemale() + "&Sec="
						+ JPEGHoro.getSecondOfBirth() + "&Min=" + JPEGHoro.getMinuteOfBirth() + "&Hrs="
						+ JPEGHoro.getHourOfBirth() + "&Day=" + JPEGHoro.getDayOfBirth() + "&Month="
						+ JPEGHoro.getMonthOfBirth() + "&Year=" + JPEGHoro.getYearOfBirth() + "&LatDeg="
						+ JPEGHoro.getDegreeOfLattitude() + "&LongDeg=" + JPEGHoro.getDegreeOfLongitude() + "&LatSec="
						+ JPEGHoro.getSecondOfLattitude() + "&LongSec=" + JPEGHoro.getSecondOfLongitude() + "&LongMin="
						+ JPEGHoro.getMinuteOfLongitude() + "&LatMin=" + JPEGHoro.getMinuteOfLattitude() + "&LongEW="
						+ JPEGHoro.getEastWest() + "&LatNS=" + JPEGHoro.getNorthSouth() + "&Dst=" + JPEGHoro.getDST()
						+ "&Ayanamsa=" + SharedFunction.getAyan(JPEGHoro) + "&kphn=" + JPEGHoro.getKPHorarySeed()
						+ "&chartType=" + session.getAttribute("chartType");
		%>
		<%
			//out.println("neha"+userDetails_jp);
		%>
		<div class="mrt-20 mrb-20" align="center">
			<img
				src="http://www.astrosage.com/cloud/lagna-navamsa-chart-jsp.asp?Chart_type=Lagna-Navamsa-Chart&LanguageCode=<%=langCode%>&textcolor=0&planetstyle=0&verticalchart=0&<%=userDetails_jp%>"
				onload="resizeimg(this,'0');" />
		</div>
	</div>

</div>
<div class="mrt-30 mrb-30 ">
	<div class="card">
		<div class="padding-all ui-paragraph-head">


			<%
				for (int i = 0; i <= 8; i++) {
			%>

			<h5>
				<%=EnglishArrayHeadingTxt[i]%>
			</h5>

			<p>
				<%=dao.getPredictionForAspect(0, EnglishArrayHeading[i], myAstrologyObject, langCode, hindi,
							connObj)%></p>
			<%
				}
			%>

			<%
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					//connObj.close();//commented by ambuj(07 may 2018)
					dBUtils.closeConnection(connObj, null, null);
				}
			%>
		</div>
	</div>
</div>

<div class="mrt-30 mrb-30 center">
	<div class="card">
		<div class="padding-2">
			<a href="hindi-transit-today.asp"
				class="waves-effect waves-light btn amber darken-4 box-shadow btn-btm">आज
				का गोचर फल</a> <a href="hindi-mahadasha-phal.asp"
				class="waves-effect waves-light btn amber darken-4 box-shadow btn-btm">विंशोत्‍तरी
				महादशा फल</a>
		</div>
	</div>
</div>



