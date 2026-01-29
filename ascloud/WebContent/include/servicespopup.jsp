<%
String tagval ="",imgSource="";
       String dodURL = "";
        String evnval = "service";
        if((session.getAttribute("languageCode")!=null && session.getAttribute("languageCode").equals("1")) || (request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi"))) 
        {
	        tagval = "yearbook-popup-hindi";     
	        dodURL = "https://buy.astrosage.com/service/as-year-book?language=hi&prtnr_id=NCYBP";
	        imgSource = "https://www.astrosage.com/images/promotion/year-book-popup-hi.jpg";  
        }
        else
        {
	        tagval = "yearbook-popup-other"; 
	        dodURL = "https://buy.astrosage.com/service/as-year-book?language=en&prtnr_id=NCYBP";
	        imgSource = "https://www.astrosage.com/images/promotion/year-book-popup-en.jpg";  
        }

        
%>

<div id="overlay5">
</div>
    <div id="popup5">
        <div class="box-area">
            <a href="javascript:closePopup('<%=evnval %>','close-popup','overlay5','popup5')" class="close5"></a>
            <div>
                <a href="<%=dodURL%>" onclick="closePopup('<%=evnval %>','<%=tagval %>','overlay5','popup5')">
                    <img src="<%=imgSource%>" />
                </a>
            </div>
        </div>
    </div>
