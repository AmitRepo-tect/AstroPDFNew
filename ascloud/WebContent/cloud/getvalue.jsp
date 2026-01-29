<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%
DesktopHoro ObjHoro = new  DesktopHoro();  
ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
out.println(ObjHoro.getName());

int languageCode=Util.safeInt(session.getAttribute("languageCode"));

out.println(getFullMonthName(ObjHoro.getMonthOfBirth(), languageCode)+"mohit");
%>


<%!
     
public String getFullMonthName(int monthNum,int languageCode){      
String monthName="";

if(languageCode == 1){
  switch(monthNum){
	case 1:
        monthName = "जनवरी";
        break;
	case 2:
   		monthName = "फरवरी";
   		break;
	case 3:
    	monthName = "मार्च";
    	break;
	case 4:
    	monthName = "अप्रैल";
    	break;
	case 5:
    	monthName = "मई";
    	break;
	case 6:
    	monthName = "जून";
    	break;
	case 7:
    	monthName = "जुलाई";
    	break;
	case 8:
    	monthName = "अगस्त";
    	break;
	case 9:
    	monthName = "सितम्बर";
    	break;
	case 10:
		monthName = "अक्टूबर";
		break;
	case 11:
		monthName = "नवम्बर";
		break;
	case 12:
		monthName = "दिसम्बर";   
		break;
	default:
		monthName = "";
}
    return(monthName); 
  }
else if(languageCode == 2){
 switch(monthNum){
	case 1:
   		monthName = "ஜனவரி";
 		break;
	case 2:
   		monthName = "பிப்ரவரி";
   		break;
	case 3:
    	monthName = "மார்ச்";
	case 4:
    	monthName = "ஏப்ரல்";
    	break;
	case 5:
    	monthName = "மே";
    	break;
	case 6:
    	monthName = "ஜூன்";
    	break;
	case 7:
    	monthName = "ஜூலை";
    	break;
	case 8:
    	monthName = "ஆகஸ்ட்";
    	break;
	case 9:
    	monthName = "செப்டம்பர்";
    	break;
	case 10:
		monthName = "அக்டோபர்";
	case 11:
		monthName = "நவம்பர்";
		break;
	case 12:
		monthName = "டிசம்பர்" ;
		break;
	default:
		monthName = "";
}
    return(monthName);
}
else{
switch(monthNum){
   case 1:
   		monthName = "January";
   		break;
   case 2:
   		monthName = "February";
   		break;
   case 3:
    	monthName = "March";
    	break;
   case 4:
    	monthName = "April";
    	break;
   case 5:
    	monthName = "May";
    	break;
   case 6:
    	monthName = "June";
    	break;
   case 7:
    	monthName = "July";
    	break;
   case 8:
    	monthName = "August";
    	break;
   case 9:
    	monthName = "September";
    	break;
   case 10:
		monthName = "October";
		break;
   case 11:
		monthName = "November";
		break;
   case 12:
		monthName = "December"; 
		break;
   default:
		monthName = "";
   
}
    return(monthName);   
}    
    }
      %>