<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.Calendar"%>


<script type="text/javascript">
    var overlayid = ["overlay6", "overlay5", "overlay3", "overlay2", "overlay0"];
    var popupid = ["bhModal","tsModal","modal-cloud-plan", "popup2", "popup0"];
    var cookiesname = ["ishowadv6", "ishowadv5", "ishowadv3", "ishowadv2", "ishowadv0"];
    

         var interval = 1000 * 150;
      //var interval = 1000*1;
    var passcookie, currentpopupid;
    //var ovrvalue, popupvalue;

    function setonclickfunction() {
        $("body").click(function (e) {
            if (!$(e.target).closest('.modal').length) {
            	//alert(currentpopupid);
                closePopup("trans", "trans", overlayid[currentpopupid], popupid[currentpopupid]);
            } 
        });
           }
    function setpopuptimer(i) {
    	
               currentpopupid = i;
               var timeOutValue = setTimeout(function () {
            	  //alert(overlayid[i]);
                   ovr = document.getElementById(overlayid[i]);
                   pop = document.getElementById(popupid[i]);
                   // Code for manual and automatic popup overlapping case By Janeshwar Sharma on 20 July 2015
                   if (document.getElementById('modal-cloud-plan').style.display == "block") {
                	   ovr.style.visibility = "hidden"
                       pop.style.display = "none"                       
                   }
                   else {
                	  // alert(ovr+","+pop);
                       ovr.style.visibility = (ovr.style.visibility == "visible") ? "hidden" : "visible";                      
                      
                       
                       $("#"+popupid[i]).modal('open');
                       
                       
                       //pop.style.visibility = (pop.style.visibility == "visible") ? "hidden" : "visible";
                	  // alert("in");
                   }
                  
                   //End by Janeshwar Sharma on 20 July 2015
                   passcookie = cookiesname[i];
                  // alert(ovr.style.visibility + "," + pop.style.visibility);
                   setonclickfunction();
               }, interval);
               return timeOutValue;
           }
    
    function popupvisibility() {
    	$(".modal").modal('close');
    	//alert('ddd');
            //ovr = document.getElementById('paidserviceoverlay');
            //pop = document.getElementById('paidservicepopup');
            //ovr.style.visibility = (ovr.style.visibility == "visible") ? "hidden" : "visible";
            //pop.style.visibility = (pop.style.visibility == "visible") ? "hidden" : "visible";
            $("#modal-cloud-plan").modal('open');
            setonclickfunction();
            
            }
    
    function closePopup(tag, tagvalue, overlayidpass, popupidpass) {
        //alert(tag + "," + tagvalue + "," + overlayidpass + "," + popupidpass);
        document.getElementById(overlayidpass).style.visibility = 'hidden';
        //document.getElementById(popupidpass).style.display = 'none';
        //alert(popupidpass);
        $("#"+popupidpass).modal('close');
        
        _gaq.push(['_trackEvent', tag, tagvalue]);        
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {                
            }
        }
        // Fix the issue if mannual popup opened closed after 2 mins 30 second then automatic popup should visible on the same day  
        //   By Janeshwar Sharma 20 July 2015 
        if (document.getElementById('modal-cloud-plan').style.display == "block" || document.getElementById('modal-cloud-plan').style.display == "none"){
        	//alert("cc")
        	}
        else {
        	//alert("come")
            xmlhttp.open("GET", "/include/create-cookies.jsp?cookiesname=" + passcookie, true);
            xmlhttp.send();
        }
        // End By Janeshwar Sharma 20 July 2015
      }

</script>

<%
String crrentPlanId= "";
if(session.getAttribute("planid")!=null && !session.getAttribute("planid").equals("")){
    crrentPlanId = String.valueOf(session.getAttribute("planid"));
}else{
    crrentPlanId = "";
}


String[] cookiesname = {"ishowadv6","ishowadv5","ishowadv3","ishowadv2", "ishowadv0"};
String[] popuppagenamearr = {"bkpopup.jsp","raj-yoga-popup.jsp","paidservicespopup.jsp","matrimonypopup.jsp","youtubepopup.jsp"};

String popupcounter = checkpopupboxcondition(request,crrentPlanId,cookiesname,popuppagenamearr,out,response);

   
if (!popupcounter.equals("")){
	String includeFile = "/include/"+popuppagenamearr[Integer.parseInt(popupcounter)];
	%>
	<jsp:include page="<%=includeFile%>"/>

	<% 

	 out.println("<script type='text/javascript'>setpopuptimer("+popupcounter+")</script>"); 
}
%>


<%!public String checkpopupboxcondition (HttpServletRequest request,String crrentPlanId,String[] cookiesname,String[] popuppagenamearr,JspWriter out,HttpServletResponse response){
//todayday = DatePart("d",Now())
//todaymonth = month(Date())
//todayear = Year(Date())
String chkRs = "";
Calendar jCal = Calendar.getInstance();
int todayday = jCal.get(Calendar.DATE);
int todaymonth = jCal.get(Calendar.MONTH)+1;
int todayear = jCal.get(Calendar.YEAR);

if(request.getParameter("todayear")!=null && !request.getParameter("todayear").equals("")) {    
	todayear = 2018;
}     
String lastadvshowonday = readcookies("lastadvshowonday",request);
String lastadvshowonmonth = readcookies("lastadvshowonmonth",request);
String lastadvshowonyear =readcookies("lastadvshowonyear",request); 
    
//if((Not isNull(lastadvshowonyear) And lastadvshowonyear <> "") And (Not isNull(lastadvshowonmonth) And lastadvshowonmonth <> "") And (Not isNull(lastadvshowonday) And lastadvshowonday <> "") Then
  if(lastadvshowonyear!=null && !lastadvshowonyear.equals("")  && (lastadvshowonmonth!=null && !lastadvshowonmonth.equals("")) && (lastadvshowonday!=null && !lastadvshowonday.equals(""))){
    if(SharedFunction.isNumeric(lastadvshowonyear) && SharedFunction.isNumeric(lastadvshowonmonth) && SharedFunction.isNumeric(lastadvshowonday)) {       
     if (todayear > Integer.parseInt(lastadvshowonyear)) {
            //Response.Write "inside year"
            //Response.End     
           
        chkRs =  setUrlCookies(request,crrentPlanId,cookiesname,popuppagenamearr,out,response);
  }else if (todaymonth > Integer.parseInt(lastadvshowonmonth) && todayear == Integer.parseInt(lastadvshowonyear)){
            //Response.Write "inside month"            
            //Response.End          
          chkRs =  setUrlCookies(request,crrentPlanId,cookiesname,popuppagenamearr,out,response);
  }else if (todayday > Integer.parseInt(lastadvshowonday) && todaymonth == Integer.parseInt(lastadvshowonmonth) && todayear == Integer.parseInt(lastadvshowonyear)){
            //Response.Write "inside day"
           //Response.End    
         
          chkRs =  setUrlCookies(request,crrentPlanId,cookiesname,popuppagenamearr,out,response);
  }else{ 
            //Response.Write "Do nothing"            
            //Response.End          
	 
  }
  }  
    }  else{        
    //Response.End     
    chkRs = setUrlCookies(request,crrentPlanId,cookiesname,popuppagenamearr,out,response);        
  }
  
  return  chkRs ;
}



public String setUrlCookies(HttpServletRequest request,String crrentPlanId,String[] cookiesname,String[] popuppagenamearr,JspWriter out,HttpServletResponse response){
	
	String urlRs = "";
String oldurllink = readcookies("oldurl",request);
String old_cookie = oldurllink;
String new_cookie = request.getRequestURI();//request.ServerVariables("SCRIPT_NAME");
//Request

if(old_cookie.equals(new_cookie)){              
	urlRs =   Displaypopup(crrentPlanId,cookiesname,popuppagenamearr,request,out);	
    //Response.Write "<script type='text/javascript'>alert(ovrvalue)</script>"   
}else{
    createcookies("oldurl", "", -1,response);
    createcookies("oldurl", new_cookie, 1,response);        
    urlRs =  Displaypopup(crrentPlanId,cookiesname,popuppagenamearr,request,out);
    //System.out.print("88");
    //Response.Write "<script type='text/javascript'>alert(ovrvalue)</script>"   
}
return urlRs;
}

//#################### Commit By Janeshwar Automatic popup should not show if Gold or Silver Plan Dated : 11 June 2015 ########
public String  Displaypopup(String crrentPlanId,String[] cookiesname,String[] popuppagenamearr,HttpServletRequest request,JspWriter out){
	
	String disRs = "";
	String[] cookiesvalues = new String[10];
	String advcode = "";
if (crrentPlanId.equals("2")|| crrentPlanId.equals("3")){      
    for(int popupcounter = 0 ; popupcounter< cookiesname.length-1; popupcounter++){
        if(!popuppagenamearr[popupcounter].toLowerCase().equals("paidservicespopup.asp")) {
            cookiesvalues[popupcounter] = readcookies(cookiesname[popupcounter],request);             
            if(cookiesvalues[popupcounter].equals("") || cookiesvalues[popupcounter]==null){
                //Response.Write "inside cookie creation"
                advcode = cookiesname[popupcounter];
               // Server.Execute("/include/"&popuppagenamearr(popupcounter));
              /* try{
                out.println("<script type='text/javascript'>setpopuptimer("+popupcounter+")</script>"); 
               }
               catch(Exception e)
               {
            	   
               }
              */
                  //out.  
                  disRs = String.valueOf(popupcounter);
                break;
            }           
    }
}    
}else{
    for(int  popupcounter = 0 ;popupcounter<= cookiesname.length-1;popupcounter++){
    cookiesvalues[popupcounter] = readcookies(cookiesname[popupcounter],request);
    if(cookiesvalues[popupcounter].equals("") || cookiesvalues[popupcounter]==null){
        
        advcode = cookiesname[popupcounter];  
       
       // Server.Execute("/include/"&popuppagenamearr(popupcounter));
       
      /*
      String includeFile = "/include/"+popuppagenamearr[popupcounter];
        try
        {
         
         out.println("<jsp:include page='"+includeFile+"'/>");
         <script type='text/javascript'>setpopuptimer("+popupcounter+")</script>
         
        }
        catch(Exception e)
        {
     	   
        }
*/
     disRs = String.valueOf(popupcounter);
                 
       break;
    }

}
}
return disRs;
}


//##################### End By Janeshwar Sharma Dated : 11 June 2015 ###############
/*public void Displaypopup1(){                
        Server.Execute("/include/new_paidservicespopup.asp");
 
        
       
}
*/%>
<%@include file = '/include/get-set-cookies.jsp'%>
<%@include file = '/include/new_paidservicespopup.jsp'%>
