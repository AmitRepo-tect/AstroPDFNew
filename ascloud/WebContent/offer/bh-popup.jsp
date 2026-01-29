<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    function subForm(val) {
        getEvents("modal", val);        
        document.forms["BHBirthForm"].submit();
    }
</script>
<%    
    int LanguageCodeBH = Util.safeInt(session.getAttribute("languageCode"));
	String getPrtnrId = Util.safestr(request.getParameter("prtnr_id"));
	
	if (getPrtnrId.equals("")) 
    {
        getPrtnrId= "BHFRE";
    }
    
    String printhdg            = "AstroSage Big Horoscope";
    String printcnt1           = "PDF Only";
    String printcnt2           = "Instant Delivery";
    String printcnt3           = "<b>Price:</b> <strike>Rs. 1105</strike> <b>Rs. 650/-</b>";
    String printcnt4           = "Printed";
    String printcnt5           = "Delivery in 7 Days";
    String printcnt6           = "<b>Price:</b> <strike>Rs. 2101</strike> <b>Rs. 999/-</b>";
    String printbtn            = "BUY NOW";
    String printurlservice     = "http://buy.astrosage.com/service/astrosage-big-horoscope?prtnr_id=" + getPrtnrId;
    String printurlproduct     = "http://buy.astrosage.com/miscellaneous/astrosage-big-horoscope?prtnr_id=" + getPrtnrId;
    String printdesc           = "<b>What will you get in 100+ pages Big Horoscope:</b> Detailed predictions on marriage, career, finance, health, children, property, family etc. Dasha analysis for life. Varshphal for 10 years. Favorable period for marriage, career, business. Gemstones and Remedies. Sade-sati, Kaal Sarp, Mangal dosha. Bhav Phal and Graha Phal. Detailed calculations - Parashari, KP, Lal Kitab.";
    		
	 if(LanguageCodeBH == 1)
	 {
	    printhdg            = "एस्ट्रोसेज महा कुंडली";
	    printcnt1           = "केवल पीडीएफ";
	    printcnt2           = "तुरंत पाएँ";
	    printcnt3           = "<b>कीमत:</b> <strike>&#x20B9; 1105</strike> <b>&#x20B9; 650/-</b>";
	    printcnt4           = "छपी हुई (प्रिंटेड)";
	    printcnt5           = "7 दिन में पाएँ";
	    printcnt6           = "<b>कीमत:</b> <strike>&#x20B9; 2101</strike> <b>&#x20B9; 999/-</b>";
	    printbtn            = "अभी खरीदें";
	    printurlservice     = "http://buy.astrosage.com/service/astrosage-big-horoscope?language=hi&prtnr_id=" + getPrtnrId;
	    printurlproduct     = "http://buy.astrosage.com/miscellaneous/astrosage-big-horoscope?language=hi&prtnr_id=" + getPrtnrId;
	    printdesc           = "<b>100+ पृष्ठों की एस्ट्रोसेज महाकुंडली में आप पाएंगे:</b> विवाह, करियर, धन, स्वास्थ्य, संतान, प्रॉपर्टी और परिवार के बारे में विस्तृत भविष्यफल। जीवन में चल रही और आने वाली विभिन्न ग्रहों की दशाओं का विश्लेषण। अगले 10 सालों का वर्षफल। विवाह, करियर और बिज़नेस के लिए सबसे अनुकूल समय की जानकारी। राशि रत्न व उपाय, साढ़े साती, काल सर्प, मंगल दोष। भाव फल और ग्रह फल। इसके अतिरिक्त पाराशरी, कृष्णमूर्ति पद्धति और लाल किताब पर आधारित विस्तृत गणनाएं।";
	 }
	 
%>
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h3 class="modal-title">
                    <%=printhdg %>
                    <button type="button" class="close" data-dismiss="modal">
                        <i class="material-icons">close</i></button></h3>
            </div>
            <div class="modal-body buy-page">
                <div class="ui-padding-t ui-padding-l ui-padding-r">
                    <p class="text-justify text-sm">
                        <%=printdesc %>
                    </p>
                </div>
                <div class="margin-b">
                    <% if (LanguageCodeBH == 1) {  %>
                    <div class="text-center">
                        <img src="/images/pdf.png" width="36" />
                        <a href="/pdf/vedic-report-hi.pdf" onclick='getEvents("modal", "sample-hi");'><u>सैंपल देखें</u>
                        </a>
                    </div>
                    <% } else { %>
                    <div class="text-center">
                        <img src="/images/pdf.png" width="36" />
                        <a href="/pdf/vedic-report-en.pdf" onclick='getEvents("modal", "sample-en");'><u>Sample</u>
                        </a>
                    </div>
                    <%} %>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="col-sm-6 margin-b  margin-t border-t">
                    <div class="col-xs-3 col-sm-4">
                        <img src="/images/print-kundli-en.png" class="img-responsive" />
                    </div>
                    <div class="col-xs-9 col-sm-8">
                        <h4>
                            <%=printcnt1 %></h4>
                        <p class="text-muted text-17">
                            <%=printcnt2 %></p>
                        <p class="text-17">
                            <%=printcnt3 %></p>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="col-xs-12">
                        <div align="center">
                            <a href="javascript:void(0);" onclick='subForm("buy-pdf");' class="btn-buy-1 orange">
                                <%=printbtn %></a></div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="col-sm-6 margin-t border-t margin-b">
                    <div class="col-xs-3 col-sm-4">
                        <img src="/images/printed-book.png" class="img-responsive" />
                    </div>
                    <div class="col-xs-9 col-sm-8">
                        <h4>
                            <%=printcnt4 %></h4>
                        <p class="text-muted text-17">
                            <%=printcnt5 %></p>
                        <p class="text-17">
                            <%=printcnt6 %></p>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="col-xs-12">
                        <div align="center">
                            <a href="<%=printurlproduct %>"
                                onclick='getEvents("modal", "print-pdf");' class="btn-buy-1 orange">
                                <%=printbtn %></a></div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
</div>
<%  
DesktopHoro ObjHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
String payMode = "ICICI-US";
if(Util.safestr(request.getParameter("currentcountry")).equals("IN"))
      payMode = "ICICI";
        
%>
<form name="BHBirthForm" action="http://www.astrocamp.com/service.asp?service_id=114" method="post">
<!--<input type="hidden" name="service_id" value="114" />-->
<input type="hidden" name="txtSource" value="Buy-AstroSage" />
<input type="hidden" name="txtUserAgent" value="<%=request.getHeader("HTTP_USER_AGENT") %>" />
<input type="hidden" name="payMode" value="<%=payMode %>" />
<input type="hidden" name="prtnr_id" value="<%=getPrtnrId %>" />
<input type="hidden" name="PerInfo_name" value="<%=ObjHoro.getName() %>" />
<input type="hidden" name="PerInfo_gender" value="<%=ObjHoro.getMaleFemale() %>" />
<input type="hidden" name="ddlDay" value="<%=ObjHoro.getDayOfBirth() %>" />
<input type="hidden" name="ddlMonth" value="<%=ObjHoro.getMonthOfBirth() %>" />
<input type="hidden" name="ddlYear" value="<%=ObjHoro.getYearOfBirth() %>" />
<input type="hidden" name="ddlHour" value="<%=ObjHoro.getHourOfBirth() %>" />
<input type="hidden" name="ddlMinute" value="<%=ObjHoro.getMinuteOfBirth() %>" />
<input type="hidden" name="txtPlace" value="<%=ObjHoro.getPlace() %>" />
<input type="hidden" name="longDeg" value="<%=ObjHoro.getDegreeOfLongitude() %>" />
<input type="hidden" name="longMin" value="<%=ObjHoro.getMinuteOfLongitude() %>" />
<input type="hidden" name="longEW" value="<%=ObjHoro.getEastWest() %>" />
<input type="hidden" name="latDeg" value="<%=ObjHoro.getDegreeOfLattitude() %>" />
<input type="hidden" name="latMin" value="<%=ObjHoro.getMinuteOfLattitude() %>" />
<input type="hidden" name="latNS" value="<%=ObjHoro.getNorthSouth() %>" />
<input type="hidden" name="timezone" value="<%=ObjHoro.getTimeZone() %>" />
<input type="hidden" name="txtState" value="<%=Util.safestr(request.getParameter("state")) %>" />
<input type="hidden" name="BirthInfo_country" value="<%=Util.safestr(request.getParameter("country")) %>" />
<input type="hidden" name="ddlCountry" value="<%=Util.safestr(request.getParameter("currentcountry")) %>" />
<input type="hidden" name="txtRegName" value="<%=ObjHoro.getName() %>" />
<input type="hidden" name="txtEmail" value="<%=Util.safestr(request.getParameter("email")) %>" />
<input type="hidden" name="txtEmailConf" value="<%=Util.safestr(request.getParameter("email")) %>" />
<!-- <input type="hidden" name="txtProblem" value="<%//=servicename %>" /> -->
<input type="hidden" name="agreeDisagree" value="agree" />
<input type="hidden" name="submitconus" value="submitform" />
</form>