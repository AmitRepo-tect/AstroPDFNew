<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 
<%
String tagval= "",KEEP_IMP_CHARTS_NOTES="",BASIC="",ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING="",CREATE_KUNDLI="";
String HOROSCOPE_MATCHING="",SAVE_10_CHARTS_CLOUD="",SAVE_UNLTD_CHARTS_DEVICE="",SAVE_UNLTD_CHARTS_ON_CLOUD="";
String SILVERR="",SETUP_ASTROLOGICAL_FEATURES="",SAVE_500_CHARTS_CLOUD="",WRITE_NOTES_COMMENTS="",GOLD="";
String COMPLETE_EXP_POWERS="",BUY_NOW="",GOLD_PLAN="",BASIC_PLAN="",FREE="",SELECT_BASIC="",RS_84_PER_MONTH="";
String RS_999_ANNUALLY="",RS_167_PER_MONTH="",RS_1999_ANNUALLY="",SILVER_PLAN="",SAVE_UPTO_500_CHARTS_ON_CLOUD="";
String SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD="",AS_CLOUD="",WORK_SHEET="",THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER="",SAVE="";
String THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold="",PHONE_NUM="",EMAIL_IDD="",BUY_PLAN="",FIVE_HUND_CHARTS_KUNDLI="",UNLTD_CHARTS_KUDLI;
String DHRUV_PLAN="",RS_999_PER_MONTH="",RS_9999_ANNUALLY="",ALL_BASIC_FEATURES="",UNLIMITED_COLORED_KUNDLI="",NAME_ADDRESS_ON_KUNDLI="",ADS_FREE="",SAVE_UNLIMITED_CHARTS_ON_CLOUD="",THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV="";
int langCode_Paid = 0;
Object langCodeObj = session.getAttribute("languageCode");
if(langCodeObj != null)
{
	langCode_Paid = (Integer) langCodeObj;
}

Local localp = new Local();

if(langCode_Paid == 0 || request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("english")) {
    tagval = "cross-english";
    KEEP_IMP_CHARTS_NOTES  = "Keep Your Important Charts & Notes on AstroSage Cloud";
    BASIC  = "BASIC";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "All the simple tools that you need for Kundli (birth-chart) & horoscope matching.";
    CREATE_KUNDLI = "Create Kundli";
    HOROSCOPE_MATCHING  = "Horoscope matching";
    SAVE_10_CHARTS_CLOUD  = "Save 10 charts on cloud";
    SAVE_UNLTD_CHARTS_DEVICE = "Save unlimited charts on your device";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="Save unlimited charts on cloud";
    SILVERR  = "SILVER";
    SETUP_ASTROLOGICAL_FEATURES = "Step up to more space, astrological features, and enjoy every bit of it.";
    SAVE_500_CHARTS_CLOUD = "Save 500 charts on cloud";
    WRITE_NOTES_COMMENTS = "Write your notes and comments";
    GOLD = "GOLD";
    COMPLETE_EXP_POWERS = "The complete experience with all the powers that you need.";
    BUY_NOW = "Buy Now";
    GOLD_PLAN = "GOLD PLAN";
    BASIC_PLAN = "BASIC PLAN";
    FREE = "FREE";
    SELECT_BASIC = "Select Basic";
    RS_84_PER_MONTH = "85<sub>/mo</sub>";
    RS_999_ANNUALLY = "999 Annually";
    RS_167_PER_MONTH = "176<sub>/mo</sub>";
    RS_1999_ANNUALLY = "2099 Annually";
    SILVER_PLAN = "SILVER PLAN";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "Save up to <b>500 charts(Kundli)</b> on cloud";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "Save <b>unlimited charts(Kundli)</b> on cloud";
    AS_CLOUD = " AstroSage Cloud";
    WORK_SHEET = "Work-sheet";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "Thank you for choosing AstroSage Cloud Silver Plan. Please provide details to order now:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "Thank you for choosing AstroSage Cloud Gold Plan. Please provide details to order now:";  
    PHONE_NUM ="Phone No";
    EMAIL_IDD ="Email Id" ;  
    BUY_PLAN ="Buy";
    DHRUV_PLAN="DHRUV";
    RS_999_PER_MONTH = "999<sub>/mo</sub>";
    RS_9999_ANNUALLY = "9999 Annually";
    ALL_BASIC_FEATURES="All the Features of Basic Membership";
    UNLIMITED_COLORED_KUNDLI="200+ Pages COLORED Kundli Print";
    NAME_ADDRESS_ON_KUNDLI="Your NAME & ADDRESS on Every Kundli";
    ADS_FREE="Ads Free";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="Save Unlimited Charts (Kundli) on Cloud";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "Thank you for choosing AstroSage Cloud Dhruv Plan. Please provide details to order now:";
   // out.println(langCode_Paid);
}

MyResourceBundle rBLoginBuyPlan = localp.loadPropertiesFileNew("loginbuyplan", langCode_Paid);

if( langCode_Paid == 1 || (request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi"))) {
    tagval = "cross-hindi";
    KEEP_IMP_CHARTS_NOTES  = " ऐस्ट्रोसेज क्लाउड पर आपकी महत्वपूर्ण टिप्पणियाँ और कुंडलियाँ रखें";
    BASIC  = "सामान्य";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "कुंडली व कुंडली मिलान के लिए वे सभी ज़रूरी औज़ार जो आपको चाहिए।";
    CREATE_KUNDLI = "कुंडली बनाएँ";
    HOROSCOPE_MATCHING  = "कुंडली मिलान करें";
    SAVE_10_CHARTS_CLOUD  = "क्लाउड पर 10 कुंडलियाँ सहेजें";
    SAVE_UNLTD_CHARTS_DEVICE = "अपनी डिवाइस पर अनगिनत कुंडलियाँ सहेजें";
    SILVERR  = "रजत";
    SETUP_ASTROLOGICAL_FEATURES = "अधिक कुंडलियों के लिए जगह और अन्य महत्वपूर्ण सुविधाओं का मज़ा लें।";
    WRITE_NOTES_COMMENTS = "कुंडलियों से संबंधित टिप्पणियाँ और जानकारियाँ साथ में लिखें";
    GOLD = "स्वर्ण";
    COMPLETE_EXP_POWERS = "अधिक कुंडलियों के लिए असीमित जगह के साथ ज्योतिष की शक्ति का पूरा अनुभव हासिल करें।";
    BUY_NOW = "अभी खरीदें";
    GOLD_PLAN = "स्वर्ण";
    UNLTD_CHARTS_KUDLI = "अनगिनत कुंडलियाँ";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="क्लाउड पर अनगिनत कुंडलियाँ सहेजें";
    BASIC_PLAN = "सामान्य";
    FREE = "मुफ्त";
    SELECT_BASIC = "सामान्य चुनें";
    RS_84_PER_MONTH = "85<sub>/माह</sub>";
    RS_999_ANNUALLY = "999/वर्ष";
    RS_167_PER_MONTH = "176<sub>/माह</sub>";
    RS_1999_ANNUALLY = "2099/वर्ष";
    SILVER_PLAN = "रजत";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "क्लाउड पर <b>500 कुंडलियाँ</b> सहेजें";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "क्लाउड पर <b>अनगिनत कुंडलियाँ</b> सहेजें";
    AS_CLOUD = " ऐस्ट्रोसेज क्लाउड";
    SAVE_500_CHARTS_CLOUD = "क्लाउड पर 500 कुंडलियाँ सहेजें";
    WORK_SHEET = "वर्क-शीट";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "एस्ट्रोसेज क्लाउड सिल्वर प्लान चुनने के लिए धन्यवाद। कृपया ऑर्डर के लिए निम्न जानकारियाँ दीजिए-";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "एस्ट्रोसेज क्लाउड गोल्ड प्लान चुनने के लिए धन्यवाद। कृपया ऑर्डर के लिए निम्न जानकारियाँ दीजिए-" ;
    PHONE_NUM = "फोन नंबर"   ;
    EMAIL_IDD ="ईमेल आईडी";
    BUY_PLAN ="खरीदें";
    DHRUV_PLAN="ध्रुव";
    RS_999_PER_MONTH = "999<sub>/माह</sub>";
    RS_9999_ANNUALLY = "9999/वर्ष";
    ALL_BASIC_FEATURES="बेसिक मेम्बरशिप की सभी सुविधाएँ";
    UNLIMITED_COLORED_KUNDLI="200+ से ज्यादा पृष्ठों की रंगीन कुंडली प्रिंट करें";
    NAME_ADDRESS_ON_KUNDLI="हर कुंडली पर आपका नाम और पता";
    ADS_FREE="विज्ञापन मुक्त";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="क्लाउड पर असीमित चार्ट (कुंडली) सहेजें";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "एस्ट्रोसेज क्लाउड ध्रुव प्लान चुनने के लिए धन्यवाद। कृपया ऑर्डर के लिए निम्न जानकारियाँ दीजिए-";
   
}

if(langCode_Paid == 2) {
    tagval = "cross-tamil";
   KEEP_IMP_CHARTS_NOTES  = "முக்கிய ஜாதகம் மற்றும் குறிப்பு ஆஸ்ட்ரோசேஜ் க்லௌடில் வைக்கவும்";
    BASIC  = "பேசிக்";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "ஜாதகம் மற்றும் பொருத்தம் பார்க்கிரதிற்கு வேண்டிய எளிய கருவிகள்.";
    CREATE_KUNDLI = "ஜாதகம் உருவாக்கவும்";
    HOROSCOPE_MATCHING  = "ஜாதக பொருத்தம்";
    SAVE_10_CHARTS_CLOUD  = "க்லௌடில் 10 ஜாதகம் சேவ் செய்யவும்";
    SAVE_UNLTD_CHARTS_DEVICE = "அளவில்லாத ஜாதக கட்டம் உங்கள் கருவியில் சேவ் செய்யுங்கள்";
    SILVERR  = "வெள்ளி";
    SETUP_ASTROLOGICAL_FEATURES = "மிகுந்த ஸ்பேஸ், சிறப்பு அம்சங்கள் என்ஜாய் செய்வதற்கு மேம்படுத்துங்கள்.";
    FIVE_HUND_CHARTS_KUNDLI = "500 ஜாதக கட்டங்கள்";
    SAVE_500_CHARTS_CLOUD = "500 ஜாதக கட்டங்கள் க்லௌடில் சேமிக்கவும்";
    WRITE_NOTES_COMMENTS = "குறிப்பு, விளக்கம் கொடுக்கவும்";
    GOLD = "தங்கம்";
    COMPLETE_EXP_POWERS = "ஒரு முழுமையான அனுபவம் எல்லா ஆற்றலுடன்.";
    BUY_NOW = "உடனே வாங்கவும்";
    GOLD_PLAN = "தங்க பிளான்";
    SAVE = "சேமிக்கவும்";
    UNLTD_CHARTS_KUDLI = "அளவில்லா ஜாதக கட்டங்கள்";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="அளவில்லா ஜாதகங்களை க்லௌடில் சேமிக்கவும்";
    BASIC_PLAN = "எளிய பிளான்";
    FREE = "இலவசம்";
    SELECT_BASIC = "எளியது விரும்பவும்";
    RS_84_PER_MONTH = "85<sub>/மா</sub>";
    RS_999_ANNUALLY = "999 வரு";
    RS_167_PER_MONTH = "176<sub>/மா</sub>";
    RS_1999_ANNUALLY = "2099 வரு";
    SILVER_PLAN = "வெள்ளி பிளான்";
    SAVE_10_CHARTS_CLOUD = "க்லௌடில் 10 கட்டங்கள் செமிக்கவும்";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "சேமிக்கவும் <b>500  கட்டங்கள்</b> க்லௌடில்";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "சேமிக்கவும் <b>அளவில்லா ஜாதகங்களை</b> க்லௌடில்";
    AS_CLOUD = " ஆஸ்ட்ரோஸேஜ் க்லௌட் ";
    WORK_SHEET = "வொர்க்-ஷீட்";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "ஆஸ்ட்ரோசேஜ் க்லௌட் வெள்ளி பிளான் தேர்வு செய்ததற்கு நன்றி. உடனே ஆர்டர் செய்வதற்கு விவரங்கள் கொடுக்கவும்:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "ஆஸ்ட்ரோசேஜ் க்லௌட் தங்க பிளான் தேர்வு செய்ததற்கு நன்றி. உடனே ஆர்டர் செய்வதற்கு விவரங்கள் கொடுக்கவும்:"   ;
    PHONE_NUM = "தொலைபேசி எண்";
    EMAIL_IDD ="ஈ-மெயில் ஐ.டி.";
    BUY_PLAN ="வாங்கவும்";
    DHRUV_PLAN="துருவ";
    RS_999_PER_MONTH = "999<sub>/மா</sub>";
    RS_9999_ANNUALLY = "9999 வரு";
    ALL_BASIC_FEATURES="எல்லா அம்சங்களின்  அடிப்படை  உறுப்பினர்";
    UNLIMITED_COLORED_KUNDLI="200+ வண்ண ஜாதக பக்கம் ஆச்சு";
    NAME_ADDRESS_ON_KUNDLI="உங்கள் பெயர் மற்றும் முகவரி ஒவ்வொரு ஜாதகத்தில்";
    ADS_FREE="இலவச விளம்பரம்";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="வரம்பற்ற வரைபட கட்டங்கள் (ஜாதகம் ) கிளவுட் இல் சேமிக்கவும்";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "ஆஸ்ட்ரோசேஜ் க்லௌட் துருவ பிளான் தேர்வு செய்ததற்கு நன்றி. உடனே ஆர்டர் செய்வதற்கு விவரங்கள் கொடுக்கவும்:";
}

if(langCode_Paid == 4) {
    tagval = "cross-kannada";
    KEEP_IMP_CHARTS_NOTES  = "Keep Your Important Charts & Notes on AstroSage Cloud";
    BASIC  = "BASIC";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "All the simple tools that you need for Kundli (birth-chart) & horoscope matching.";
    CREATE_KUNDLI = "Create Kundli";
    HOROSCOPE_MATCHING  = "Horoscope matching";
    SAVE_10_CHARTS_CLOUD  = "Save 10 charts on cloud";
    SAVE_UNLTD_CHARTS_DEVICE = "Save unlimited charts on your device";
    SILVERR  = "SILVER";
    SETUP_ASTROLOGICAL_FEATURES = "Step up to more space, astrological features, and enjoy every bit of it.";
    FIVE_HUND_CHARTS_KUNDLI = "500 charts(Kundli)";
    SAVE_500_CHARTS_CLOUD = "Save 500 charts on cloud";
    WRITE_NOTES_COMMENTS = "Write your notes and comments";
    GOLD = "GOLD";
    COMPLETE_EXP_POWERS = "The complete experience with all the powers that you need.";
    BUY_NOW = "Buy Now";
    GOLD_PLAN = "GOLD PLAN";
    UNLTD_CHARTS_KUDLI = "unlimited charts(Kundli)";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="Save unlimited charts on cloud";
    BASIC_PLAN = "BASIC PLAN";
    FREE = "FREE";
    SELECT_BASIC = "Select Basic";
    RS_84_PER_MONTH = "85<sub>/mo</sub>";
    RS_999_ANNUALLY = "999 Annually";
    RS_167_PER_MONTH = "176<sub>/mo</sub>";
    RS_1999_ANNUALLY = "2099 Annually";
    SILVER_PLAN = "SILVER PLAN";
    SAVE_10_CHARTS_CLOUD = "Save 10 charts on cloud";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "Save up to <b>500 charts(Kundli)</b> on cloud.";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "Save <b>unlimited charts(Kundli)</b> on cloud";
    AS_CLOUD = " AstroSage Cloud";
    WORK_SHEET = "Work-sheet";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "Thank you for choosing AstroSage Cloud Silver Plan. Please provide details to order now:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "Thank you for choosing AstroSage Cloud Gold Plan. Please provide details to order now:";  
    PHONE_NUM ="Phone No";
    EMAIL_IDD ="Email Id";
    BUY_PLAN ="Buy";
    DHRUV_PLAN="DHRUV";
    RS_999_PER_MONTH = "999<sub>/mo</sub>";
    RS_9999_ANNUALLY = "9999 Annually";
    ALL_BASIC_FEATURES="All the Features of Basic Membership";
    UNLIMITED_COLORED_KUNDLI="200+ Pages COLORED Kundli Print";
    NAME_ADDRESS_ON_KUNDLI="Your NAME & ADDRESS on Every Kundli";
    ADS_FREE="Ads Free";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="Save Unlimited Charts (Kundli) on Cloud";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "Thank you for choosing AstroSage Cloud Dhruv Plan. Please provide details to order now:";
}

if(langCode_Paid  == 5) {
    tagval = "cross-telugu";
    KEEP_IMP_CHARTS_NOTES  = "Keep Your Important Charts & Notes on AstroSage Cloud";
    BASIC  = "BASIC";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "All the simple tools that you need for Kundli (birth-chart) & horoscope matching.";
    CREATE_KUNDLI = "Create Kundli";
    HOROSCOPE_MATCHING  = "Horoscope matching";
    SAVE_10_CHARTS_CLOUD  = "Save 10 charts on cloud";
    SAVE_UNLTD_CHARTS_DEVICE = "Save unlimited charts on your device";
    SILVERR  = "SILVER";
    SETUP_ASTROLOGICAL_FEATURES = "Step up to more space, astrological features, and enjoy every bit of it.";
    FIVE_HUND_CHARTS_KUNDLI = "500 charts(Kundli)";
    SAVE_500_CHARTS_CLOUD = "Save 500 charts on cloud";
    WRITE_NOTES_COMMENTS = "Write your notes and comments";
    GOLD = "GOLD";
    COMPLETE_EXP_POWERS = "The complete experience with all the powers that you need.";
    BUY_NOW = "Buy Now";
    GOLD_PLAN = "GOLD PLAN";
    UNLTD_CHARTS_KUDLI = "unlimited charts(Kundli)";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="Save unlimited charts on cloud";
    BASIC_PLAN = "BASIC PLAN";
    FREE = "FREE";
    SELECT_BASIC = "Select Basic";
    RS_84_PER_MONTH = "85<sub>/mo</sub>";
    RS_999_ANNUALLY = "999 Annually";
    RS_167_PER_MONTH = "176<sub>/mo</sub>";
    RS_1999_ANNUALLY = "2099 Annually";
    SILVER_PLAN = "SILVER PLAN";
    SAVE_10_CHARTS_CLOUD = "Save 10 charts on cloud";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "Save up to <b>500 charts(Kundli)</b> on cloud.";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "Save <b>unlimited charts(Kundli)</b> on cloud";
    AS_CLOUD = " AstroSage Cloud";
    WORK_SHEET = "Work-sheet";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "Thank you for choosing AstroSage Cloud Silver Plan. Please provide details to order now:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "Thank you for choosing AstroSage Cloud Gold Plan. Please provide details to order now:";  
    PHONE_NUM ="Phone No";
    EMAIL_IDD ="Email Id";
    BUY_PLAN ="Buy";
    DHRUV_PLAN="DHRUV";
    RS_999_PER_MONTH = "999<sub>/mo</sub>";
    RS_9999_ANNUALLY = "9999 Annually";
    ALL_BASIC_FEATURES="All the Features of Basic Membership";
    UNLIMITED_COLORED_KUNDLI="200+ Pages COLORED Kundli Print";
    NAME_ADDRESS_ON_KUNDLI="Your NAME & ADDRESS on Every Kundli";
    ADS_FREE="Ads Free";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="Save Unlimited Charts (Kundli) on Cloud";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "Thank you for choosing AstroSage Cloud Dhruv Plan. Please provide details to order now:";
}

if(langCode_Paid == 6) {
    tagval = "cross-bengali";
    KEEP_IMP_CHARTS_NOTES  = "এস্ট্রস্যাজ ক্লাউডে আপনার গুরুত্বপুর্ণ নোট এবং কুষ্ঠিগুলি রাখুন";
    BASIC  = "প্রাথমিক";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "কুষ্ঠি এবং কুষ্ঠি-মিলানের ক্ষেত্রে যেসব প্রয়োজনীয় সরঞ্জাম আপনার লাগবে। ";
    CREATE_KUNDLI = "কুষ্ঠি বানান ";
    HOROSCOPE_MATCHING  = "কুষ্ঠি-মিলান করুন";
    SAVE_10_CHARTS_CLOUD  = "ক্লাউডে 10টি কুষ্ঠি সংরক্ষণ করুন";
    SAVE_UNLTD_CHARTS_DEVICE = "আপনার ডিভাইসে অসীম/অসংখ্য কুষ্ঠি সংরক্ষণ করুন ";
    SILVERR  = "রজত";
    SETUP_ASTROLOGICAL_FEATURES = "আরো কুষ্ঠি সেভ করার জায়গা এবং অন্য মহত্বপূর্ণ সুবিধার মজা নিন। ";
    FIVE_HUND_CHARTS_KUNDLI = "500 কুষ্ঠি";
    SAVE_500_CHARTS_CLOUD = "ক্লাউডে 500 কুষ্ঠি সেভ করুন।";
    WRITE_NOTES_COMMENTS = "কুষ্ঠি সম্বন্ধীয় নোট এবং মন্তব্য লিখুন। ";
    GOLD = "স্বর্ণ";
    COMPLETE_EXP_POWERS = "আরো কুষ্ঠি সেভ করার অসম্পাত/অসংখ্য জায়গার সাথে জ্যোতিষের শক্তির পুরো লাভ উঠান। ";
    BUY_NOW = "এখনি কিনুন ";
    GOLD_PLAN = "স্বর্ণ";
    UNLTD_CHARTS_KUDLI = "অসংখ্য/ অসীম কুষ্ঠি";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="ক্লাউডে অসীম/অসংখ্য কুষ্ঠি সংরক্ষণ করুন ";
    BASIC_PLAN = "সামান্য";
    FREE = "বিনামূল্যে";
    SELECT_BASIC = "সামান্য বাছুন ";
    RS_84_PER_MONTH = "85<sub>/মাস</sub> ";
    RS_999_ANNUALLY = "999<sub>/বর্ষ</sub> ";
    RS_167_PER_MONTH = "176<sub>/মাস</sub> ";
    RS_1999_ANNUALLY = "2099<sub>/বর্ষ </sub>";
    SILVER_PLAN = "রজত";
    SAVE_10_CHARTS_CLOUD = "ক্লাউডে 10টি কুষ্ঠি সংরক্ষণ করুন";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "ক্লাউডে  <b>500 কুষ্ঠি </b> সেভ করুন";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "ক্লাউডে <b>অসংখ্য কুষ্ঠি </b> সেভ করুন ";
    AS_CLOUD = " এস্ট্রস্যাজ ক্লাউড ";
    WORK_SHEET = "ওয়ার্ক-শীট ";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "এস্ট্রস্যাজ ক্লাউড সিলভার প্ল্যান নির্বাচন করার জন্য ধন্যবাদ। অর্ডার করার জন্য দয়া করে নিচের বিবরণগুলি দিন-";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "এস্ট্রস্যাজ ক্লাউড গোল্ড প্ল্যান নির্বাচন করার জন্য ধন্যবাদ। অর্ডার করার জন্য দয়া করে নিচের বিবরণগুলি দিন-";  
    PHONE_NUM ="ফোন নম্বর";
    EMAIL_IDD ="ই-মেল আই.ডি.";
    BUY_PLAN ="কিনুন";
    DHRUV_PLAN="ধ্রুব";
    RS_999_PER_MONTH = "999<sub>/মাস</sub> ";
    RS_9999_ANNUALLY = "9999<sub>/বর্ষ</sub> ";
    ALL_BASIC_FEATURES="বেসিক মেম্বারশিপ এর বিভিন্ন বৈশিষ্ট";
    UNLIMITED_COLORED_KUNDLI="200+ পৃষ্ঠার রঙিন কুন্ডলি";
    NAME_ADDRESS_ON_KUNDLI="আপনার নাম এবং ঠিকানা প্রতিটি কুন্ডলিতে";
    ADS_FREE="বিজ্ঞাপন মুক্ত";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="ক্লাউডে আনলিমিটেড চার্টগুলি (কুন্ডলি) সংরক্ষণ করুন";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "এস্ট্রস্যাজ ক্লাউড ধ্রুব প্ল্যান নির্বাচন করার জন্য ধন্যবাদ। অর্ডার করার জন্য দয়া করে নিচের বিবরণগুলি দিন-";
}

if(langCode_Paid  == 7) {
    tagval = "cross-gujarati";
    KEEP_IMP_CHARTS_NOTES  = "Keep Your Important Charts & Notes on AstroSage Cloud";
    BASIC  = "BASIC";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "All the simple tools that you need for Kundli (birth-chart) & horoscope matching.";
    CREATE_KUNDLI = "Create Kundli";
    HOROSCOPE_MATCHING  = "Horoscope matching";
    SAVE_10_CHARTS_CLOUD  = "Save 10 charts on cloud";
    SAVE_UNLTD_CHARTS_DEVICE = "Save unlimited charts on your device";
    SILVERR  = "SILVER";
    SETUP_ASTROLOGICAL_FEATURES = "Step up to more space, astrological features, and enjoy every bit of it.";
    FIVE_HUND_CHARTS_KUNDLI = "500 charts(Kundli)";
    SAVE_500_CHARTS_CLOUD = "Save 500 charts on cloud";
    WRITE_NOTES_COMMENTS = "Write your notes and comments";
    GOLD = "GOLD";
    COMPLETE_EXP_POWERS = "The complete experience with all the powers that you need.";
    BUY_NOW = "Buy Now";
    GOLD_PLAN = "GOLD PLAN";
    UNLTD_CHARTS_KUDLI = "unlimited charts(Kundli)";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="Save unlimited charts on cloud";
    BASIC_PLAN = "BASIC PLAN";
    FREE = "FREE";
    SELECT_BASIC = "Select Basic";
    RS_84_PER_MONTH = "85<sub>/mo</sub>";
    RS_999_ANNUALLY = "999 Annually";
    RS_167_PER_MONTH = "176<sub>/mo</sub>";
    RS_1999_ANNUALLY = "2099 Annually";
    SILVER_PLAN = "SILVER PLAN";
    SAVE_10_CHARTS_CLOUD = "Save 10 charts on cloud";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "Save up to <b>500 charts(Kundli)</b> on cloud.";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "Save <b>unlimited charts(Kundli)</b> on cloud";
    AS_CLOUD = " AstroSage Cloud";
    WORK_SHEET = "Work-sheet";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "Thank you for choosing AstroSage Cloud Silver Plan. Please provide details to order now:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "Thank you for choosing AstroSage Cloud Gold Plan. Please provide details to order now:";  
    PHONE_NUM ="Phone No";
    EMAIL_IDD ="Email Id";
    BUY_PLAN ="Buy";
    DHRUV_PLAN="DHRUV";
    RS_999_PER_MONTH = "999<sub>/mo</sub>";
    RS_9999_ANNUALLY = "9999 Annually";
    ALL_BASIC_FEATURES="All the Features of Basic Membership";
    UNLIMITED_COLORED_KUNDLI="200+ Pages COLORED Kundli Print";
    NAME_ADDRESS_ON_KUNDLI="Your NAME & ADDRESS on Every Kundli";
    ADS_FREE="Ads Free";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="Save Unlimited Charts (Kundli) on Cloud";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "Thank you for choosing AstroSage Cloud Dhruv Plan. Please provide details to order now:";
}

if(langCode_Paid  == 8){
    tagval = "cross-malayalam";
    KEEP_IMP_CHARTS_NOTES  = "Keep Your Important Charts & Notes on AstroSage Cloud";
    BASIC  = "BASIC";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "All the simple tools that you need for Kundli (birth-chart) & horoscope matching.";
    CREATE_KUNDLI = "Create Kundli";
    HOROSCOPE_MATCHING  = "Horoscope matching";
    SAVE_10_CHARTS_CLOUD  = "Save 10 charts on cloud";
    SAVE_UNLTD_CHARTS_DEVICE = "Save unlimited charts on your device";
    SILVERR  = "SILVER";
    SETUP_ASTROLOGICAL_FEATURES = "Step up to more space, astrological features, and enjoy every bit of it.";
    FIVE_HUND_CHARTS_KUNDLI = "500 charts(Kundli)";
    SAVE_500_CHARTS_CLOUD = "Save 500 charts on cloud";
    WRITE_NOTES_COMMENTS = "Write your notes and comments";
    GOLD = "GOLD";
    COMPLETE_EXP_POWERS = "The complete experience with all the powers that you need.";
    BUY_NOW = "Buy Now";
    GOLD_PLAN = "GOLD PLAN";
    UNLTD_CHARTS_KUDLI = "unlimited charts(Kundli)";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="Save unlimited charts on cloud";
    BASIC_PLAN = "BASIC PLAN";
    FREE = "FREE";
    SELECT_BASIC = "Select Basic";
    RS_84_PER_MONTH = "85<sub>/mo</sub>";
    RS_999_ANNUALLY = "999 Annually";
    RS_167_PER_MONTH = "176<sub>/mo</sub>";
    RS_1999_ANNUALLY = "2099 Annually";
    SILVER_PLAN = "SILVER PLAN";
    SAVE_10_CHARTS_CLOUD = "Save 10 charts on cloud";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "Save up to <b>500 charts(Kundli)</b> on cloud.";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "Save <b>unlimited charts(Kundli)</b> on cloud";
    AS_CLOUD = " AstroSage Cloud";
    WORK_SHEET = "Work-sheet";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "Thank you for choosing AstroSage Cloud Silver Plan. Please provide details to order now:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "Thank you for choosing AstroSage Cloud Gold Plan. Please provide details to order now:";  
    PHONE_NUM ="Phone No";
    EMAIL_IDD ="Email Id";
    BUY_PLAN ="Buy";
    DHRUV_PLAN="DHRUV";
    RS_999_PER_MONTH = "999<sub>/mo</sub>";
    RS_9999_ANNUALLY = "9999 Annually";
    ALL_BASIC_FEATURES="All the Features of Basic Membership";
    UNLIMITED_COLORED_KUNDLI="200+ Pages COLORED Kundli Print";
    NAME_ADDRESS_ON_KUNDLI="Your NAME & ADDRESS on Every Kundli";
    ADS_FREE="Ads Free";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="Save Unlimited Charts (Kundli) on Cloud";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "Thank you for choosing AstroSage Cloud Dhruv Plan. Please provide details to order now:";
}


if(langCode_Paid == 9){
    tagval = "cross-marathi";
    KEEP_IMP_CHARTS_NOTES  = " ऐस्ट्रोसेज क्लाउड पर आपकी महत्वपूर्ण टिप्पणियाँ और कुंडलियाँ रखें";
    BASIC  = "सामान्य";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "कुंडली व कुंडली मिलान के लिए वे सभी ज़रूरी औज़ार जो आपको चाहिए।";
    CREATE_KUNDLI = "कुंडली बनाएँ";
    HOROSCOPE_MATCHING  = "कुंडली मिलान करें";
    SAVE_10_CHARTS_CLOUD  = "क्लाउड पर 10 कुंडलियाँ सहेजें";
    SAVE_UNLTD_CHARTS_DEVICE = "अपनी डिवाइस पर अनगिनत कुंडलियाँ सहेजें";
    SILVERR  = "रजत";
    SETUP_ASTROLOGICAL_FEATURES = "अधिक कुंडलियों के लिए जगह और अन्य महत्वपूर्ण सुविधाओं का मज़ा लें।";
    WRITE_NOTES_COMMENTS = "कुंडलियों से संबंधित टिप्पणियाँ और जानकारियाँ साथ में लिखें";
    GOLD = "स्वर्ण";
    COMPLETE_EXP_POWERS = "अधिक कुंडलियों के लिए असीमित जगह के साथ ज्योतिष की शक्ति का पूरा अनुभव हासिल करें।";
    BUY_NOW = "अभी खरीदें";
    GOLD_PLAN = "स्वर्ण";
    UNLTD_CHARTS_KUDLI = "अनगिनत कुंडलियाँ";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="क्लाउड पर अनगिनत कुंडलियाँ सहेजें";
    BASIC_PLAN = "सामान्य";
    FREE = "मुफ्त";
    SELECT_BASIC = "सामान्य चुनें";
    RS_84_PER_MONTH = "85<sub>/माह</sub>";
    RS_999_ANNUALLY = "999<sub>/वर्ष</sub>";
    RS_167_PER_MONTH = "176<sub>/माह</sub>";
    RS_1999_ANNUALLY = "2099<sub>/वर्ष</sub>";
    SILVER_PLAN = "रजत";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "क्लाउड पर <b>500 कुंडलियाँ</b> सहेजें";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "क्लाउड पर <b>अनगिनत कुंडलियाँ</b> सहेजें";
    AS_CLOUD = " ऐस्ट्रोसेज क्लाउड";
    SAVE_500_CHARTS_CLOUD = "क्लाउड पर 500 कुंडलियाँ सहेजें";
    WORK_SHEET = "वर्क-शीट";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "एस्ट्रोसेज क्लाउड सिल्वर प्लान चुनने के लिए धन्यवाद। कृपया ऑर्डर के लिए निम्न जानकारियाँ दीजिए-";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "एस्ट्रोसेज क्लाउड गोल्ड प्लान चुनने के लिए धन्यवाद। कृपया ऑर्डर के लिए निम्न जानकारियाँ दीजिए-" ;
    PHONE_NUM = "फोन नंबर"   ;
    EMAIL_IDD ="ईमेल आईडी";
    BUY_PLAN ="खरीदें";
    DHRUV_PLAN="ध्रुव";
    RS_999_PER_MONTH = "999<sub>/माह</sub>";
    RS_9999_ANNUALLY = "9999<sub>/वर्ष</sub>";
    ALL_BASIC_FEATURES="बेसिक मेंबरशीपच्या सर्व सुविधा";
    UNLIMITED_COLORED_KUNDLI="200+ पेक्षा जास्त पानांची रंगीत कुंडली प्रिंट करा.";
    NAME_ADDRESS_ON_KUNDLI="प्रत्येक कुंडलीवर तुमचे नाव आणि पत्ता";
    ADS_FREE="जाहिरात फ्री ";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="क्लाउडवर अमर्यादित चार्ट (कुंडली) जतन करा";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "एस्ट्रोसेज क्लाउड ध्रुव प्लान चुनने के लिए धन्यवाद। कृपया ऑर्डर के लिए निम्न जानकारियाँ दीजिए-";
}

if(langCode_Paid  == 10) {
    tagval = "cross-urdu";
    KEEP_IMP_CHARTS_NOTES  = "Keep Your Important Charts & Notes on AstroSage Cloud";
    BASIC  = "BASIC";
    ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING  = "All the simple tools that you need for Kundli (birth-chart) & horoscope matching.";
    CREATE_KUNDLI = "Create Kundli";
    HOROSCOPE_MATCHING  = "Horoscope matching";
    SAVE_10_CHARTS_CLOUD  = "Save 10 charts on cloud";
    SAVE_UNLTD_CHARTS_DEVICE = "Save unlimited charts on your device";
    SILVERR  = "SILVER";
    SETUP_ASTROLOGICAL_FEATURES = "Step up to more space, astrological features, and enjoy every bit of it.";
    FIVE_HUND_CHARTS_KUNDLI = "500 charts(Kundli)";
    SAVE_500_CHARTS_CLOUD = "Save 500 charts on cloud";
    WRITE_NOTES_COMMENTS = "Write your notes and comments";
    GOLD = "GOLD";
    COMPLETE_EXP_POWERS = "The complete experience with all the powers that you need.";
    BUY_NOW = "Buy Now";
    GOLD_PLAN = "GOLD PLAN";
    UNLTD_CHARTS_KUDLI = "unlimited charts(Kundli)";
    SAVE_UNLTD_CHARTS_ON_CLOUD ="Save unlimited charts on cloud";
    BASIC_PLAN = "BASIC PLAN";
    FREE = "FREE";
    SELECT_BASIC = "Select Basic";
    RS_84_PER_MONTH = "85<sub>/mo</sub>";
    RS_999_ANNUALLY = "999 Annually";
    RS_167_PER_MONTH = "176<sub>/mo</sub>";
    RS_1999_ANNUALLY = "2099 Annually";
    SILVER_PLAN = "SILVER PLAN";
    SAVE_10_CHARTS_CLOUD = "Save 10 charts on cloud";
    SAVE_UPTO_500_CHARTS_ON_CLOUD = "Save up to <b>500 charts(Kundli)</b> on cloud.";
    SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD = "Save <b>unlimited charts(Kundli)</b> on cloud";
    AS_CLOUD = " AstroSage Cloud";
    WORK_SHEET = "Work-sheet";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER = "Thank you for choosing AstroSage Cloud Silver Plan. Please provide details to order now:";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold = "Thank you for choosing AstroSage Cloud Gold Plan. Please provide details to order now:";  
    PHONE_NUM ="Phone No";
    EMAIL_IDD ="Email Id";
    BUY_PLAN ="Buy";
    DHRUV_PLAN="DHRUV";
    RS_999_PER_MONTH = "999<sub>/mo</sub>";
    RS_9999_ANNUALLY = "9999 Annually";
    ALL_BASIC_FEATURES="All the Features of Basic Membership";
    UNLIMITED_COLORED_KUNDLI="200+ Pages COLORED Kundli Print";
    NAME_ADDRESS_ON_KUNDLI="Your NAME & ADDRESS on Every Kundli";
    ADS_FREE="Ads Free";
    SAVE_UNLIMITED_CHARTS_ON_CLOUD="Save Unlimited Charts (Kundli) on Cloud";
    THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV = "Thank you for choosing AstroSage Cloud Dhruv Plan. Please provide details to order now:";
}

%>




<div id="overlay3"></div>
 <div id="modal-cloud-plan" class="modal model-bar ui-model-hgt">
         <div class="model-header amber darken-1">
            <h4 class="white-text">
           <%if(!SharedFunction.Is_Mobile(request)){%>&nbsp;<%=KEEP_IMP_CHARTS_NOTES%><%}else{%><%=AS_CLOUD%> <%}%>
            <a href="javascript:closePopup('cancel-paidplan','<%=tagval %>','overlay3','modal-cloud-plan');" class="modal-close waves-effect btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a>  
            </h4>
            
         </div>
         <div class="modal-content full-width mrt-20">
           <div class="plans-container plans-bar row" id="plans">

                  <article class="col s12 m6 l6">
                <div class="card">
                       <div class="card-image cyan waves-effect">
                              <div class="card-title" <%if(Util.isMobileDevice(request)) { %>onClick="showHidePanel('bPlan');"<%} %>><%=BASIC%></div>                            
                           </div>                
                        <div id="bPlan" <%if(Util.isMobileDevice(request)) {%> style="display:none"<%} %>>
                            <div class="card-image cyan waves-effect">
                            <div class="price">
                                 <h4 class="mrt-20 mrb-20"><%=SELECT_BASIC%> </h4>
                              </div>
                              </div>
                           <div class="card-content">
                              <p class="mrt-10 mrb-10"><%=ALL_TOOLS_KUNDLI_AND_HOROSCOPE_MATCHING%></p>
                              <ul class="collection">
                                 <li class="collection-item"><%=CREATE_KUNDLI%></li>
                                 <li class="collection-item"><%=HOROSCOPE_MATCHING%></li>
                                 <li class="collection-item"><%=SAVE_10_CHARTS_CLOUD%></li>
                                 <li class="collection-item"><%=SAVE_UNLTD_CHARTS_DEVICE%></li>                         
                                 <li class="height-152"></li>
                              </ul>
                           </div>
                           <div class="card-action center-align">
                              <button class="waves-effect waves-light btn modal-close" onclick="javascript:closePopup('cancel-paidplan','<%=tagval %>','overlay3','modal-cloud-plan')"><%=SELECT_BASIC%></button>
                           </div>
                        </div>
                        </div>
                     </article>
                  <%-- <article class="col s12 m4 l4 ui-cd">
                  <div class="card">
                           <div class="card-image red waves-effect">
                              <div class="card-title" <%if(Util.isMobileDevice(request)) { %>onClick="showHidePanel('sPlan');"<%} %>><%=SILVERR%></div>                            
                           </div>                      
                       <div id="sPlan">
                           <div class="card-image red accent-2 waves-effect">                            
                              <div class="price">
                                 <sup>&#x20B9;</sup>
                                 <%=RS_84_PER_MONTH%>
                              </div>
                              <div class="price-desc"> (&#x20B9; <%=RS_999_ANNUALLY%>)</div>
                           </div>
                           <div class="card-content">
                              <p class="mrt-10 mrb-10"> <%=SETUP_ASTROLOGICAL_FEATURES%></p>
                              <ul class="collection">
                                 <li class="collection-item"><%=CREATE_KUNDLI%></li>
                                 <li class="collection-item"><%=HOROSCOPE_MATCHING%></li>
                                 <li class="collection-item"><%=SAVE_UPTO_500_CHARTS_ON_CLOUD%></li>                                
                                 <li class="collection-item"><%=SAVE_UNLTD_CHARTS_DEVICE%></li>                                 
                                 <li class="collection-item"><%=WRITE_NOTES_COMMENTS%></li>
                                 <li class="collection-item"><%=WORK_SHEET%></li>
                              </ul>
                           </div>
                           <div class="card-action center-align">
                              <button name="submit" onclick="silverplanservice();" value="" class="waves-effect waves-light btn red accent-2"><%=BUY_NOW%></button>
                           </div>
                        </div>
                        </div>
                     </article> --%>
                  <%-- <article class="col s12 m4 l4 pdr-0 ui-cd ui-R">
                  
                  		<div class="card">
                           <div class="card-image deep-orange accent-2 waves-effect">
                              <div class="card-title" <%if(Util.isMobileDevice(request)) { %>onClick="showHidePanel('gPlan');"<%} %>><%=GOLD%></div>                            
                           </div>
                        <div id="gPlan" <%if(Util.isMobileDevice(request)) {%> style="display:none"<%} %>>
                           <div class="card-image deep-orange accent-2 waves-effect">                             
                              <div class="price">
                                 <sup>&#x20B9;</sup>
                                 <%=RS_167_PER_MONTH%>
                              </div>
                              <div class="price-desc">(&#x20B9; <%=RS_1999_ANNUALLY%>)</div>
                           </div>
                           <div class="card-content">
                              <p class="mrt-10 mrb-10"> <%=COMPLETE_EXP_POWERS%></p>
                              <ul class="collection">
                                 <li class="collection-item"><%=CREATE_KUNDLI%></li>
                                 <li class="collection-item"><%=HOROSCOPE_MATCHING%></li>
                                 <li class="collection-item"><%=SAVE_ULTD_CHARTS_KUNDLI_ON_CLOUD%></li>
                                 <li class="collection-item"><%=SAVE_UNLTD_CHARTS_DEVICE%></li>
                                  <li class="collection-item"><%=WRITE_NOTES_COMMENTS%></li>
                                 <li class="collection-item"><%=WORK_SHEET%></li>
                              </ul>
                           </div>
                           <div class="card-action center-align">
                              <a href="javascript:goldplanservice();" class="waves-effect waves-light btn deep-orange accent-2"><%=BUY_NOW%></a>
                           </div>
                        </div>
                        </div>
                     </article> --%>
                     
                     <article class="col s12 m6 l6 ui-cd">
                  <div class="card">
                           <div class="card-image light-pais-clr accent-2 waves-effect">
                              <div class="card-title" <%if(Util.isMobileDevice(request)) { %>onClick="showHidePanel('dPlan');"<%} %>><%=DHRUV_PLAN%></div>                            
                           </div>                      
                       <div id="sPlan">
                           <div class="card-image light-pais-clr accent-2 waves-effect">                            
                              <div class="price">
                                 <sup>&#x20B9;</sup>
                                 <%=RS_999_PER_MONTH%>
                              </div>
                              <div class="price-desc"> (&#x20B9; <%=RS_9999_ANNUALLY%>)</div>
                           </div>
                           <div class="card-content">
                              <p class="mrt-10 mrb-10"> <%=SETUP_ASTROLOGICAL_FEATURES%></p>
                              <ul class="collection">
                                 <li class="collection-item"><%=ALL_BASIC_FEATURES%></li>
                                 <li class="collection-item"><%=UNLIMITED_COLORED_KUNDLI%></li>
                                 <li class="collection-item"><%=NAME_ADDRESS_ON_KUNDLI%></li>                                
                                 <li class="collection-item"><%=ADS_FREE%></li>                                 
                                 <li class="collection-item"><%=SAVE_UNLIMITED_CHARTS_ON_CLOUD%></li>
                              </ul>
                           </div>
                           <div class="card-action center-align">
                              <button name="submit" onclick="dhruvplanservice();" value="" class="waves-effect waves-light btn light-pais-clr accent-2"><%=BUY_NOW%></button>
                           </div>
                        </div>
                        </div>
                     </article>
                     
                </div>
        
        <div class="model-body" id="loginPanelmanual" style="display:none;">

             <script type="text/javascript">

                 function frmLoginBuyPlanvalidation() {
                     if (document.getElementById("txtEmail").value == "" && document.getElementById('PerInfo_Phone').value == "") {
                         alert('<%=rBLoginBuyPlan.getString("ALL_FORM_FIELDS_ARE_REQUIRED")%>')
                         return false;
                     }
                     if (document.getElementById('txtEmail').value == "") {
                       //  document.getElementById("almsg").innerHTML = '<=GetString("PLEASE_ENTER_EMAIL") %>' 
                         alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_EMAIL") %>')
                         document.getElementById('txtEmail').focus();
                         return false;
                     }

                     if (echeck(document.getElementById("txtEmail").value) == false) {
                         document.getElementById("txtEmail").focus();
                         return (false);
                     }

                     if (document.getElementById('PerInfo_Phone').value == "") {
                         alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_PH") %>')
                         document.getElementById('PerInfo_Phone').focus();
                         return false;
                     }

                     function echeck(str) {
                         var at = "@"
                         var dot = "."
                         var lat = str.indexOf(at)
                         var lstr = str.length
                         var ldot = str.indexOf(dot)

                         if (str.indexOf(at) == -1) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         if (str.indexOf(at, (lat + 1)) != -1) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         if (str.indexOf(dot, (lat + 2)) == -1) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         if (str.indexOf(" ") != -1) {
                             alert('<%=rBLoginBuyPlan.getString("PLEASE_ENTER_VALID_EMAIL") %>')
                             return (false);
                         }

                         return true
                     }

                     document.getElementById("txtEmailConf").value = document.getElementById("txtEmail").value;
                     document.getElementById("txtProblem").value = 'Email: ' + document.getElementById("txtEmail").value + ', Phone No.: ' + document.getElementById('PerInfo_Phone').value;

                     return true;
                 }

                </script>
               
          
  
                <%
             String strEmail="",intPerInfo_Phone="",strRegName="",strPerInfo_gender="male",strProblem="";
            if(session.getAttribute("User_Id")!= null && !session.getAttribute("User_Id").equals("")){
            
              
                UserDAO UD = new UserDAO();
                HashMap<String, String> rsUserData =  UD.getRecordOfUser(String.valueOf(session.getAttribute("User_Id")),null);
                strEmail = rsUserData.get("email");
                intPerInfo_Phone = rsUserData.get("mobile");
                strRegName = rsUserData.get("firstname");
                strProblem = "UserId:" + session.getAttribute("User_Id") + ", Email: " + rsUserData.get("email") + ", Phone No.: " + rsUserData.get("mobile");
            }else{
                strRegName = "AstroSageBuyPlan";
            }

       
%>

          
               <form name="frmLoginBuyPlanmanual" id="frmLoginBuyPlanmanual" method="post"> 
                <input type="hidden" name="txtEmailConf" id="txtEmailConf" value="<%=strEmail %>" />
                <input type="hidden" name="txtRegName" id="txtRegName" value="<%=strRegName %>" />
                <input type="hidden" name="PerInfo_name" id="PerInfo_name" value="<%=strRegName %>" />
                <input type="hidden" name="PerInfo_gender" id="PerInfo_gender" value="<%=strPerInfo_gender %>" />
                <input type="hidden" name="forWhom" id="forWhom" value="other" />
                <input type="hidden" name="cbDate" id="cbDate" value="on" />
                <input type="hidden" name="submitconus" id="submitconus" value="Get This Report" />
                <input type="hidden" name="txtSource" value="AstroSage-Cloud-Buy-Plan" />
                <input type="hidden" name="txtUserAgent" value="<%=request.getHeader("User-Agent")%>" />
                <input type="hidden" name="txtProblem" id="txtProblem" value="<%=strProblem %>" />
                <input type="hidden" name="payMode" id="payMode" value="ICICI" />
                <input type="hidden" name="agreeDisagree" id="agreeDisagree" value="agree" />
                <input type="hidden" name="userIdpaidservice" id="userIdpaidservice" value="<%=session.getAttribute("User_Id")%>" /> 
                 <div id="lblMessagemanual"></div>
                  <div class="row">
                  <div class="input-field s12 l12">
                   <input type="text"  id="txtEmail" name="txtEmail" value="<%=strEmail %>" tabindex="1" size="26" maxlength="50" autocomplete="off"/>
                  <label for="txtEmail"> <%=EMAIL_IDD%>*</label>
                  </div>
                  </div>
                  
                  <div class="row">
                  <div class="input-field s12 l12">
                  <input type="tel" id="PerInfo_Phone" name="PerInfo_Phone" value="<%=intPerInfo_Phone %>" tabindex="2" size="26" />
                  <label for="PerInfo_Phone">   <%=PHONE_NUM%>* </label>
                  </div>
                  </div>
              
<%
               if(session.getAttribute("User_Id") == null || session.getAttribute("User_Id").equals("")) {
%>
                 <div class="center" align="center">
                          <input type="submit" name="submit" id="submit" class="waves-effect waves-light btn amber darken-4 box-shadow" onclick="return frmLoginBuyPlanvalidation();" tabindex="3" value="<%=BUY_NOW%>"  />  
                   </div>
<%
               }
%>
     </form> 

     
  
  <div style="clear:both"></div>
            </div>
        
        </div>
            
      </div>
      
      
      
<script type="text/javascript">
    
    function silverplanservice(){
        
        if (document.getElementById("userIdpaidservice").value == "") {
            // alert("Hi blank silver userId");
            var colorsuccess = "#308014"
            document.getElementById("plans").style.display = 'none';
            document.getElementById('loginPanelmanual').style.display = 'block';
            //document.getElementById('loginpanelidmanual').style.width = '600px';
            document.getElementById('lblMessagemanual').innerHTML = "<font color="+colorsuccess+"><%//=ConstantValues.THANK_YOU_FOR_CHOOSING_PAIDPLAN_SILVER%></font>";
            document.getElementById("frmLoginBuyPlanmanual").action = "http://www.astrocamp.com/service.asp?service_id=68&prtnr_id=1";
            document.getElementById("frmLoginBuyPlanmanual").submit();
        }
        else {
            //alert("hi else silver");
            document.getElementById("frmLoginBuyPlanmanual").action = "http://www.astrocamp.com/service.asp?service_id=68&prtnr_id=1";
            document.getElementById("frmLoginBuyPlanmanual").submit();
            
        }
    }
    function goldplanservice() {

        if (document.getElementById("userIdpaidservice").value == "") {
            //   alert("Hi blank gold userId");
            var colorsuccess = "#308014"
            document.getElementById("plans").style.display = 'none';
            document.getElementById('loginPanelmanual').style.display = 'block';
            //document.getElementById('loginpanelidmanual').style.width = '600px';
            document.getElementById('lblMessagemanual').innerHTML = "<font color=" + colorsuccess + "><%=THANK_YOU_FOR_CHOOSING_PAIDPLAN_Gold%></font>";
            document.getElementById("frmLoginBuyPlanmanual").action = "http://www.astrocamp.com/service.asp?service_id=69&prtnr_id=1";
            document.forms["frmLoginBuyPlanmanual"].submit();
        }
        else {
           // alert("hi else gold");
            document.getElementById("frmLoginBuyPlanmanual").action = "http://www.astrocamp.com/service.asp?service_id=69&prtnr_id=1";
           document.forms["frmLoginBuyPlanmanual"].submit();
        }
    }
    function dhruvplanservice() {

        if (document.getElementById("userIdpaidservice").value == "" || document.getElementById("userIdpaidservice").value == "null") {
            var colorsuccess = "#308014"
            document.getElementById("plans").style.display = 'none';
            document.getElementById('loginPanelmanual').style.display = 'block';
            document.getElementById('lblMessagemanual').innerHTML = "<font color=" + colorsuccess + "><%=THANK_YOU_FOR_CHOOSING_PAIDPLAN_DHRUV%></font>";
            document.getElementById("frmLoginBuyPlanmanual").action = "https://www.astrocamp.com/service.asp?service_id=157&prtnr_id=1";
            document.forms["frmLoginBuyPlanmanual"].submit();
        }
        else {
           document.getElementById("frmLoginBuyPlanmanual").action = "https://www.astrocamp.com/service.asp?service_id=157&prtnr_id=1";
           document.forms["frmLoginBuyPlanmanual"].submit();
        }
    }
        
// Show Hide Div
    var divs = ["bPlan", "sPlan", "gPlan", "dPlan"];
    var visibleDivId = null;
    function showHidePanel(divId) {
      if(visibleDivId === divId) {
        visibleDivId = null;
      } else {
        visibleDivId = divId;
      }
      hideNonVisibleDivs();
    }
    function hideNonVisibleDivs() {
      var i, divId, div;
      for(i = 0; i < divs.length; i++) {
        divId = divs[i];
        div = document.getElementById(divId);
        if(visibleDivId === divId) {
          div.style.display = "block";
        } else {
          div.style.display = "none";
        }
      }
    }
        
</script>

            





