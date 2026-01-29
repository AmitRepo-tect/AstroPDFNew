
<%  String senddata= "";
    if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) {
        senddata = true+"|";        
    }else{
        senddata = false+"|";
    }
    
    if(session.getAttribute("ChartId")!=null && !session.getAttribute("ChartId").equals("")) {
        senddata = senddata+true+"|";        
    }else{
        senddata = senddata+false+"|";
    }
    
    if(session.getAttribute("planid")!=null &&((session.getAttribute("planid").equals("2") || (session.getAttribute("planid").equals("3")) || (session.getAttribute("planid").equals("4")) || (session.getAttribute("planid").equals("5")) || (session.getAttribute("planid").equals("6")) || (session.getAttribute("planid").equals("7"))))){ //Modified by Janeshwar Sharma On 14 Aug. 2015 for comment facility and added new planIds on 20 Jul. 2016
        senddata = senddata+true+"|"; 
    }else{
        senddata = senddata+false+"|";
    }  
    
    if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
        senddata = senddata+true; 
    }else{
        senddata = senddata+false;
    }
   out.println(senddata);
%>