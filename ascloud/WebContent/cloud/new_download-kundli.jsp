<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle downloadKundli = local.loadPropertiesFileNew("download-kundli",languageCode);
%>

<script type="text/javascript" language="javascript">
    function submitForm1(a) {
        document.cookie = 'ServiceId=' + a;
        frmService1.submit();
    }
    
    $(document).ready(function(){
    	eqHeightCol('.ui-download-kundli');
    	
    });
</script>



  <div class="hdg-lg card">
	<h1><%=downloadKundli.getString("Download_and_Open_Kundli".toUpperCase())%></h1>	
</div>
 <div class="card ui-padd-zero kundali-set">
                      <div class="row">
                        <div class="col s12 l4 pdr-0 ui-download-kundli">
                        <a href="vedic-chart-pdf.jsp" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'new_full_pdf']);">
                          <div class="center promo promo-example">
                            <i class="material-icons orange-text">file_download</i>
                            <p class="flow-text black-text font-weight-500"><%=downloadKundli.getString("Download_Life_Report".toUpperCase())%></p>
                            <p class="light center black-text"><%=downloadKundli.getString("your_40_pages_birth_kundlibirth_chart".toUpperCase())%></p>
                          </div>
                          </a>
                        </div>
                        <div class="col s12 l4  pdl-0 pdr-0 ui-download-kundli">
                        <a href="vedic-chart-pdf.jsp?isopenkundli=yes" target="_blank"  onClick="_gaq.push(['_trackEvent', 'view_page', 'new_full_pdf']);">
                          <div class="center promo promo-example">
                            <i class="material-icons orange-text">insert_drive_file</i>
                            <p class="flow-text black-text font-weight-500"><%=downloadKundli.getString("View_Life_Report".toUpperCase())%></p>
                            <p class="light center black-text"><%=downloadKundli.getString("your_40_pages_birth_kundlibirth_chart".toUpperCase())%></p>
                          </div>
                          </a>
                        </div>
                        <div class="col s12 l4  pdl-0 ui-download-kundli no-br-r">
                        <a href="javascript:void(0);" onclick="openBigHoroPopup();">
                          <div class="center promo promo-example">
                            <img class="ui-img-ico" src="https://www.astrosage.com/offer/images/bk-hi.jpg" width="100" alt="Brihat Horoscope"/> 
                            <p class="flow-text black-text font-weight-500"><%=downloadKundli.getString("BK_BUY")%></p>
                            <p class="light center black-text"><%=downloadKundli.getString("BK_TAG_LINE")%></p> 
                            <p class="light center black-text"><%=downloadKundli.getString("BK_PRICE")%></p> 
                          </div>
                          </a>
                        </div>
                      </div>
                    </div>
                    
                    
                    


