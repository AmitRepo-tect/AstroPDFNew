<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>


<%	
Local footerLocal = new Local();
Calendar mCalendar = Calendar.getInstance();
int gtLang = 0;
Object objfooter = session.getAttribute("languageCode");
if(objfooter != null)
{
	gtLang = (Integer) objfooter;
}   

MyResourceBundle rBChartStyleFooter = footerLocal.loadPropertiesFileNew("filemenu-chartstyle", gtLang);

Object footerObj = session.getAttribute("constants");
MyProperties rBConstantFooter = null;
if(footerObj == null)
{
	rBConstantFooter = new MyProperties(footerLocal.loadPropertiesFile("constants",gtLang));
	session.setAttribute("constants", rBConstantFooter);
}
else
{
	rBConstantFooter = (MyProperties) footerObj;
}

%>

<div class="footer-bar">
            <div class="container">
               <div class="row mrb-30">
                  <div class="col s12 l4">
                     <div class="founder-bar">
                        <h2 class="founder"> <%=rBChartStyleFooter.getString("ABOUT_ASTROSAGE") %> </h2>
                        <p> <%=rBChartStyleFooter.getString("ABOUT_ASTROSAGE_TXT") %>...<a href="http://www.astrosage.com/about-us.asp" class="text-orange"> Read more</a> 
                        </p>
                     </div>
                  </div>
                  <div class="col s12 l4">
                     <div class="founder-bar ui-img-bar">
                        <h2 class="founder"> <%=rBChartStyleFooter.getString("ASK_APP") %> </h2>
                        <div class="download-link center">
                          <a href="https://itunes.apple.com/app/astrosage-kundli/id824705526?mt=8"> <img src="images/icons/app-icon.png" class="responsive-img" alt="Download kundli app"> </a>  <a href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage"> <img src="images/icons/google-play.png" class="responsive-img" alt="Download kundli app"> </a>
                        </div>
                     </div>
                  </div>
                  <div class="col s12 l4">
                     <div class="founder-bar">
                        <h2 class="founder"> <%=rBChartStyleFooter.getString("SERVICES_PRODUCTS") %> </h2>
                        <ul class="product-services">
                           <li> <a href="//buy.astrosage.com/gemstone" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT1") %> </a> </li>
                           <li> <a href="//buy.astrosage.com/rudraksha" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT2") %> </a> </li>
                           <li> <a href="//buy.astrosage.com/yantra" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT3") %>  </a> </li>
                           <li> <a href="//buy.astrosage.com/fengshui" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT4") %>  </a> </li>
                           <li> <a href="//buy.astrosage.com/service/astrosage-brihat-horoscope" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT11") %>  </a> </li>
                           <li> <a href="//buy.astrosage.com/service/as-year-book" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT6") %>  </a> </li>
                           <li> <a href="//buy.astrosage.com/service/ask-a-question" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT7") %> </a> </li>
                           <!-- <li> <a href="//buy.astrosage.com/service/2018-year-book-large" target="_blank"> Order Trikal Samhita  </a> </li> -->
                           <li> <a href="//buy.astrosage.com/service/shani-sade-sati" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT8") %> </a> </li>
                           <li> <a href="//buy.astrosage.com/service/marriage-and-love-analysis-new2" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT9") %> </a> </li>
                           <li> <a href="//buy.astrosage.com/service/career-job-new2" target="_blank"> <%=rBChartStyleFooter.getString("BUY_FT10") %> </a> </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="footer-copyright">
            <div class="container">
               <div class="row mr-b-0">
                  <div class="col s12 l4"> <span class="copyRight mt-1">All copyrights reserved © <%= mCalendar.get(Calendar.YEAR) %> </span> </div>
                  <div class="col s12 l4">
                     <ul class="center link-bar">
                        <li> <a href="//www.astrosage.com"> <%=rBConstantFooter.getString("HOME") %> </a></li>
                        | 
                        <li> <a href="javascript:openfeedbackform();">  <%=rBConstantFooter.getString("FEEDBACK") %> </a></li>
                        | 
                        <li> <a href="disclaimer.asp"> <%=rBConstantFooter.getString("DISCLAIM") %>  </a></li>
                     </ul>
                  </div>
                 
               </div>
            </div>
            
         </div>
         
         <div id="modal20" class="modal modal-lang">
                    
        <div class="modal-content">
        <h4 class="black-text"><%=rBChartStyleFooter.getString("CHOOSE_LANGUAGE") %></h4>
         <p>
         <input class="with-gap" name="group1" id="eng" type="radio" value="english1" <% if(gtLang==0) {%>checked<%} %>  />
         <label for="eng"> English </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="hind" type="radio" value="hindi1" <% if(gtLang==1) {%>checked<%} %> />
         <label for="hind"> हिंदी </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="tami" type="radio" value="tamil1" <% if(gtLang==2) {%>checked<%} %>  />
         <label for="tami"> தமிழ் </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="telg" type="radio" value="telugu1" <% if(gtLang==5) {%>checked<%} %>  />
         <label for="telg"> తెలుగు </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="kann" type="radio" value="kannada1" <% if(gtLang==4) {%>checked<%} %>  />
         <label for="kann"> ಕನ್ನಡ </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="gujr" type="radio" value="gujarati1" <% if(gtLang==7) {%>checked<%} %>  />
         <label for="gujr"> ગુજરાતી </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="mara" type="radio" value="marathi1"  <% if(gtLang==9) {%>checked<%} %> />
         <label for="mara"> मराठी </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="bang" type="radio" value="bengali1" <% if(gtLang==6) {%>checked<%} %>  />
         <label for="bang"> বাংলা  </label>
         </p>
         <p>
         <input class="with-gap" name="group1" id="mal" type="radio" value="malayalam1" <% if(gtLang==8) {%>checked<%} %>  />
         <label for="mal"> മലയാളം </label>
         </p>
    
        </div>
        <div class="modal-footer">
         <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat text-orange">CANCEL</a>
        <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat text-orange" onclick=changeLanguage();>OK</a>
       
        </div>
        </div>
        
        
        <div id="modal21" class="modal modal-lang">
           
        <div class="modal-content">
        <h4 class="black-text">Chart Style</h4>
         <p>
         <input class="with-gap" name="changechart" id="nort" type="radio" value="north1" checked />
         <label for="nort"><%=rBChartStyleFooter.getString("NORTH") %></label>
         </p>
         <p>
         <input class="with-gap" name="changechart" id="sout" type="radio" value="south1" />
         <label for="sout"> <%=rBChartStyleFooter.getString("SOUTH") %> </label>
         </p>
         <p>
         <input class="with-gap" name="changechart" id="est" type="radio" value="east1" />
         <label for="est"> <%=rBChartStyleFooter.getString("EAST") %> </label>
         </p>
         
    
        </div>
        <div class="modal-footer">
         <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat text-orange">CANCEL</a>
        <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat text-orange" onclick=changeChartstyle();>OK</a>
       
        </div>
        </div>
        
        <script type="text/javascript">       
        function changeLanguage(){
        	//alert(document.getElementById("group1").value);
        	value=$("input[type=radio][name=group1]:checked").val();
        	 if (value == 'hindi1') {
     	    	window.location.href="/cloud/home.asp?LanguageType=hindi&charttype=north";
     	    }
     	    else if (value == 'english1') {
     	        window.location.href="/cloud/home.asp?LanguageType=english&charttype=north";
     	    }
     	    else if (value == 'tamil1') {
     	        window.location.href="/cloud/home.asp?LanguageType=tamil&charttype=north";
     	    }
     	   else if (value == 'telugu1') {
    	        window.location.href="/cloud/home.asp?LanguageType=telugu&charttype=south";
    	    }
     	  else if (value == 'kannada1') {
  	        	window.location.href="/cloud/home.asp?LanguageType=kannada&charttype=south";
  	    }
     	 else if (value == 'gujarati1') {
   	        	window.location.href="/cloud/home.asp?LanguageType=gujarati&charttype=north";
   	    }
     	 else if (value == 'marathi1') {
    	        window.location.href="/cloud/home.asp?LanguageType=marathi&charttype=north";
    	    }
     	else if (value == 'bengali1') {
	        	window.location.href="/cloud/home.asp?LanguageType=bengali&charttype=east";
	    }
     	else if (value == 'malayalam1') {
	        	window.location.href="/cloud/home.asp?LanguageType=malayalam&charttype=south";
	    }
        }
        </script>
        
        <% 
       Object dturl = request.getAttribute("javax.servlet.forward.request_uri");
		if(dturl == null)
		{
			
			dturl = request.getRequestURL();
		}
		String requestUrlChart = dturl.toString() ;
		String gtquery = ""; 
		String gtmethodName = request.getParameter("methodName");
		if(gtmethodName != null && !gtmethodName.equals(""))
		{
			gtquery = "&methodName="+gtmethodName;
		}
		
		%>


<script type="text/javascript">
     
function changeChartstyle(){
	value=$("input[type=radio][name=changechart]:checked").val();
	 if (value == 'north1') {
	    	window.location.href="<%=requestUrlChart + "?charttype=north"+gtquery %>";
	    }
	    else if (value == 'south1') {
	        window.location.href="<%=requestUrlChart + "?charttype=south"+gtquery %>";
	    }
	    else if (value == 'east1') {
	        window.location.href="<%=requestUrlChart + "?charttype=east"+gtquery %>";
	    }
	   
}
        </script>
        
<%if(Util.isMobileDevice(request)) { %>
	<%@include file='snackbar.jsp'%>
<%} %>


<%@include file='getSearchData.jsp'%>
         
         