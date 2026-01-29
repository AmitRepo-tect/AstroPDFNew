<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 MyResourceBundle services = null;
	if(request.getAttribute("i_services") != null)
	{
		services = (MyResourceBundle) request.getAttribute("i_services");
	}
 String[] aryServiceId =  new String[3];
 String[] aryServiceName =  new String[3];
 String[] aryContent =  new String[3];
 String[] aryPrice =  new String[3];
 String[] aryActualPrice =  new String[3];
 String[] aryIconImage =  new String[3];
 String[] aryLargeImage =  new String[3];
 String[] sampleURL =  new String[3];
 String[] sampleURLHI =  new String[3];
 String[] aryPartnerId =  new String[3];
 
	//AstroSage Brihat Horoscope
	aryServiceId[0] = "148";
	aryServiceName[0] = services.getString("SERVICE_NAME_3");
	aryContent[0] = services.getString("SERVICE_DESC_3");
	aryPrice[0] = "750";
	aryActualPrice[0] = "1498";
	aryIconImage[0] = "brihat-horoscope.png";
	aryLargeImage[0] = "brihat-horoscope.png";
	sampleURL[0] = "https://www.astrosage.com/pdf/brihat-horoscope.pdf";
	sampleURLHI[0] = "https://www.astrosage.com/pdf/brihat-horoscope-hi.pdf";
	aryPartnerId[0] = "NCBKR";
	
	//Raj Yoga Report
	aryServiceId[1] = "120";
	aryServiceName[1] = services.getString("SERVICE_NAME_8");
	aryContent[1] = services.getString("SERVICE_DESC_8");
	aryPrice[1] = "399";
	aryActualPrice[1] = "499";
	aryIconImage[1] = "raj-yoga.png";
	aryLargeImage[1] = "raj-yoga.png";
	sampleURL[1] = "https://www.astrosage.com/pdf/rajyoga-en.pdf";
	sampleURLHI[1] = "https://www.astrosage.com/pdf/rajyoga-hi.pdf";
	aryPartnerId[1] = "NCRYR";
	
	//Personalized Horoscope 2020
	aryServiceId[2] = "152";
	aryServiceName[2] = services.getString("SERVICE_NAME_9");
	aryContent[2] = services.getString("SERVICE_DESC_9");
	aryPrice[2] = "399";
	aryActualPrice[2] = "998";
	aryIconImage[2] = "ic-personalized-horoscope.png";
	aryLargeImage[2] = "ic-personalized-horoscope.png";
	sampleURL[2] = "https://www.astrocamp.com/pdf/personalized-horoscope-yearly.pdf";
	sampleURLHI[2] = "https://www.astrocamp.com/pdf/personalized-horoscope-yearly-hi.pdf";
	aryPartnerId[2] = "NCPHR";   
 
    //Ask a question
    /*aryServiceId[0] = "1";
    aryServiceName[0] = services.getString("SERVICE_NAME_1");
    aryContent[0] = services.getString("SERVICE_DESC_1");
    aryPrice[0] = "4.6";
    aryIconImage[0] = "ask-a-question.png";
    aryLargeImage[0] = "ask-a-question.png";*/

    //Health
    /* aryServiceId[1] = "7";    
    aryServiceName[1] = services.getString("SERVICE_NAME_7");
    aryContent[1] = services.getString("SERVICE_DESC_7");
    aryPrice[1] = "16";
    aryIconImage[1] = "health-fitness.png";
    aryLargeImage[1] = "health-fitness.png"; */

    //Phone consultation
    //aryServiceId(2) = "60"    
    //aryServiceName(2) = GetString("SERVICE_NAME_14")
    //aryContent(2) = GetString("SERVICE_DESC_14")
    //aryPrice(2) = "30"
    //aryIconImage(2) = "img_ph_service.jpg"
    //aryLargeImage(2) = "img_phone.jpg"

    //Career
    /*aryServiceId[1] = "81"   ; 
    aryServiceName[1] = services.getString("SERVICE_NAME_4");
    aryContent[1] = services.getString("SERVICE_DESC_4");
    aryPrice[1] = "24";
    aryIconImage[1] = "career-report.png";
    aryLargeImage[1] = "career-report.png";

    //Finance
    aryServiceId[2] = "82";    
    aryServiceName[2] = services.getString("SERVICE_NAME_12");
    aryContent[2] = services.getString("SERVICE_DESC_12");
    aryPrice[2] = "24";
    aryIconImage[2] = "finance.png";
    aryLargeImage[2] = "finance.png";
    */
    //Gemstone and remedies
    /* aryServiceId[4] = "84" ;  
    aryServiceName[4] = services.getString("SERVICE_NAME_13");
    aryContent[4] = services.getString("SERVICE_DESC_13");
    aryPrice[4] = "16";
    aryIconImage[4] = "ic_gemstone.png";
    aryLargeImage[4] = "ic_gemstone.png";

    //Love and Marriage
    aryServiceId[5] = "80" ;   
    aryServiceName[5] = services.getString("SERVICE_NAME_6");
    aryContent[5] = services.getString("SERVICE_DESC_6");
    aryPrice[5] = "28";
    aryIconImage[5] = "ic_weekly_love.png";
    aryLargeImage[5] = "ic_weekly_love.png";

    //Lal kitab
    aryServiceId[6] = "5"  ;  
    aryServiceName[6] = services.getString("SERVICE_NAME_5");
    aryContent[6] = services.getString("SERVICE_DESC_5");
    aryPrice[6] = "24";
    aryIconImage[6] = "ic_lalkitab.png";
    aryLargeImage[6] = "ic_lalkitab.png";

    //Birth time Rectification
    aryServiceId[7] = "2" ;   
    aryServiceName[7] = services.getString("SERVICE_NAME_2");
    aryContent[7] = services.getString("SERVICE_DESC_2");
    aryPrice[7] = "50";
    aryIconImage[7] = "birth-time-rectification.png";
    aryLargeImage[7] = "birth-time-rectification.png"; */

  
    
    %>
<%!
  
   // public String indexServiceId(String searchServiceId){
  //      for(int a = 0 ; a<= aryServiceId.length ; a++){
   //         if(aryServiceId[a] = searchServiceId ){
  //            return(a);
  //          }
  //      }
  //  }
    
    %>