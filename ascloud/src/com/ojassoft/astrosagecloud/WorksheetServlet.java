package com.ojassoft.astrosagecloud;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.util.Common;
import com.ojassoft.astrosagecloud.util.ConstantValues;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;

public class WorksheetServlet extends AstrosageServlet
{

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			initialize(request, response);
			String methodName = request.getParameter("methodName");
			if(methodName != null)
			{
				try
				{
					Class[] classParams = new Class[2];
					classParams[0] = HttpServletRequest.class;
					classParams[1] = HttpServletResponse.class;
					this.getClass().getMethod(methodName, classParams).invoke(this, request, response);
				}
				catch(Exception ite)
				{
					ite.printStackTrace();
				}
			}
		}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
	

public void getChartCookies(HttpServletRequest request, HttpServletResponse response) throws Exception{
	String storeCookieVal="",addbox="",mycookie="newaddbox",GetChartCookies="";
	HashMap<String, String> hm =  getStoredCookiesValue(request);
	storeCookieVal = hm.get("StoreCookie");
	
		if (storeCookieVal != null && !storeCookieVal.equals(""))
		{
		for (int j=0; j < Integer.parseInt(storeCookieVal); j++){
				String CookiesN = mycookie+String.valueOf(j);
					addbox = addbox+"&"+ hm.get(CookiesN);
			}
      if(!addbox.equals("")) {
        GetChartCookies = "1"+"#"+addbox+"#"+storeCookieVal+"#"+storeCookieVal;
		}else{
        GetChartCookies = "0";
		}
	
	}
	response.getWriter().write(GetChartCookies);//Not Login
  }



public void setgetcookieschart(HttpServletRequest request, HttpServletResponse response) throws Exception{
	String chartval = request.getParameter("chartname");
	String setgetcookies = request.getParameter("setgetcookies");
	String StoredCookieNumber = request.getParameter("cookienum");


if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
 String IsCookiesSet = SetchartCookies(chartval,StoredCookieNumber,response); 

 if(IsCookiesSet.equals(ConstantValues.COOKIES_SET_SUCCESS)){
	 response.getWriter().write(ConstantValues.COOKIES_SET_SUCCESS);
 }else{
	 response.getWriter().write(ConstantValues.COOKIES_SET_FAILURE);
 }
}
}

public String SetchartCookies(String chtName,String StoredCookieNumber,HttpServletResponse response){
String[] StringSplit = chtName.split("@");
String divid = StringSplit[3];
   if(!chtName.equals("")) {

	   Cookie addbox = new Cookie("newaddbox"+divid,chtName);
	   Cookie storeCookie = new Cookie("StoreCookie",StoredCookieNumber);
	   addbox.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
	   addbox.setPath("/");
	   storeCookie.setMaxAge(365*24*60*60*20);  //setting cookies expiry for one year
	   storeCookie.setPath("/");
		response.addCookie(addbox);
		response.addCookie(storeCookie);   
      
   }
   return ConstantValues.COOKIES_SET_SUCCESS;
}


public void getcolid(HttpServletRequest request, HttpServletResponse response) throws Exception{
	String divval = request.getParameter("div");
	String setgetcookies = request.getParameter("setgetcookies");


		if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			  String CookiesVal = setcolid(divval,request); 
			  response.getWriter().write(CookiesVal);
		
		}
}


public String setcolid(String divid,HttpServletRequest request)throws Exception{
String chartid = divid.substring(6);//mid(divid,7)
String cookieSerach = "newaddbox"+chartid;
Cookie[] cookiesObj1 = request.getCookies();
String[] splitcookieval = new String[8];
String storeCookieVal ="",setcolidrs="";

HashMap<String, String> hm =  getStoredCookiesValue(request);

    storeCookieVal = hm.get(cookieSerach);
	if (!cookieSerach.equals("") && storeCookieVal != null){
		splitcookieval = storeCookieVal.split("@");
	    setcolidrs =  splitcookieval[5];
	}
	else{
		setcolidrs =  ConstantValues.COOKIES_SET_FAILURE;
	}
		
	//}
return setcolidrs;
}

public void getrowid(HttpServletRequest request, HttpServletResponse response) throws Exception{
	String divval = request.getParameter("div");
	String setgetcookies = request.getParameter("setgetcookies");


		if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			  String CookiesVal = setrowid(divval,request); 
			  response.getWriter().write(CookiesVal);
		
		}
}

public String setrowid(String divid,HttpServletRequest request)throws Exception{
String chartid = divid.substring(6);//mid(divid,7)
String cookieSerach = "newaddbox"+chartid;
Cookie[] cookiesObj1 = request.getCookies();
String[] splitcookieval = new String[8];
String storeCookieVal ="",setcolidrs="0";

HashMap<String, String> hm =  getStoredCookiesValue(request);

    storeCookieVal = hm.get(cookieSerach);
	if (!cookieSerach.equals("") && storeCookieVal != null){
		splitcookieval = storeCookieVal.split("@");
		if(splitcookieval.length > 6)
	    setcolidrs =  splitcookieval[6];
	}
	else{
		setcolidrs =  ConstantValues.COOKIES_SET_FAILURE;
	}
		
	//}
return setcolidrs;
}


public void drag_cookies(HttpServletRequest request, HttpServletResponse response) throws Exception{
	       String divval = request.getParameter("div");
	       String tocol = request.getParameter("tocol");
	       String fromcol = request.getParameter("fromcol");
	       String row = request.getParameter("row");
	       String prerow = request.getParameter("prerow");
	     
	       HashMap<String, String> hm =  getStoredCookiesValue(request);
		   String cookiestore = hm.get("StoreCookie");
		   String setgetcookies = request.getParameter("setgetcookies");


		if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			String  CookiesVal = arrangechartCookies(request,response,divval,cookiestore,row,tocol,fromcol,prerow); 
				response.getWriter().write(CookiesVal);
		}
}


public String arrangechartCookies(HttpServletRequest request, HttpServletResponse response,String divval,String cookiestore,String row,String tocol,String fromcol,String prerow){
	String dragdiv = "";
	if(!divval.equals("")) {
		
		String srchCookie = "newaddbox"+""+divval+"";
		HashMap<String, String> hm =  getStoredCookiesValue(request);
		dragdiv= hm.get(srchCookie);
		 
	   String[] dragdivsplit = dragdiv.split("@");
       String newcookievaluewithrow= "";
       
	 for(int j= 0 ;j<= dragdivsplit.length-1 ;j++){
	    if(j==6 ){
	    newcookievaluewithrow = newcookievaluewithrow+row;
	    }else if(j==5) {
	    newcookievaluewithrow = newcookievaluewithrow+tocol+"@";
	    }else{
	    newcookievaluewithrow = newcookievaluewithrow+dragdivsplit[j]+"@";
	    }
	    
	 }
	
	
	
	   Cookie newaddboxGenerate = new Cookie(srchCookie,newcookievaluewithrow);
	   newaddboxGenerate.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
	   newaddboxGenerate.setPath("/");
	   response.addCookie(newaddboxGenerate);
	   
	  newcookievaluewithrow = "";

	 
	for(int i= 0 ;i<= (Integer.parseInt(cookiestore))-1 ;i++){ 
	String StrCookieonebyone = "",cookievale="";
	String cookievalesrch = "newaddbox"+""+i+"";
	
	cookievale = hm.get(cookievalesrch);

	String[] splitcookie =cookievale.split("@");
	
	if(fromcol.equals(splitcookie[5]) &&  !divval.equals(splitcookie[3])){
	   if(Integer.parseInt(splitcookie[6]) > Integer.parseInt(prerow)){
	    for(int j= 0 ;j<= splitcookie.length-1 ;j++){
	    if(j==6){
	    newcookievaluewithrow = newcookievaluewithrow+(Integer.parseInt(splitcookie[6])-1);
	    }else{
	    newcookievaluewithrow = newcookievaluewithrow+splitcookie[j]+"@";
	   }
	   }
	  
	    Cookie newaddboxGenerate1 = new Cookie(cookievalesrch,newcookievaluewithrow);
		newaddboxGenerate1.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
		newaddboxGenerate1.setPath("/");
		response.addCookie(newaddboxGenerate1);
	 
	  newcookievaluewithrow = "";
	   }
	}
	}
	

	
	//to Drag Column
	for(int ii= 0 ;ii<= (Integer.parseInt(cookiestore))-1 ;ii++){ 
	String cookievalesrch1 = "newaddbox"+""+ii+"";
	String cookievale1="";
	
	
	cookievale1= hm.get(cookievalesrch1);
	String[] splitcookie =cookievale1.split("@");
	if(tocol.equals(splitcookie[5]) && !divval.equals(splitcookie[3])){
	   if(Integer.parseInt(splitcookie[6]) >= Integer.parseInt(row)){
	  for(int j= 0 ;j<= splitcookie.length-1 ; j++){
	    if(j==6 ){
	    newcookievaluewithrow = newcookievaluewithrow+(Integer.parseInt(splitcookie[6])+1);
	  }else{
	    newcookievaluewithrow = newcookievaluewithrow+splitcookie[j]+"@";
	  }
	}

	  Cookie newaddboxGenerate2 = new Cookie(cookievalesrch1,newcookievaluewithrow);
	  newaddboxGenerate2.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
	  newaddboxGenerate2.setPath("/");
	  response.addCookie(newaddboxGenerate2);
	  
	  newcookievaluewithrow = "";
	   }
	}
	}
    String arrangechartCookies= "";
	return ConstantValues.COOKIES_SET_SUCCESS;
	}else{
	return ConstantValues.COOKIES_SET_FAILURE;
	}
	
}
	
public void arrange_cookies(HttpServletRequest request, HttpServletResponse response) throws Exception{
	        String divval = request.getParameter("div");
	        String col = request.getParameter("col");
	        String row = request.getParameter("row");
	        String setgetcookies = request.getParameter("setgetcookies");
			 HashMap<String, String> hm =  getStoredCookiesValue(request);
			 String cookiestore = hm.get("StoreCookie");


			if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			   String CookiesVal = removearrangechartCookies(request,response,divval,cookiestore,col,row);
			   response.getWriter().write(CookiesVal);
			}

}

public String removearrangechartCookies(HttpServletRequest request,HttpServletResponse response,String divid,String cookiestore,String col,String row){
	        String removearrangechartCookiesVal="",newcookievaluewithrow="",CookiesN ="";
	        String cookievale="";
	        String chartid = divid.substring(6);//mid(divid,7)
	        Cookie[] cookiesObj1 = request.getCookies();
			 if(!chartid.equals("") && cookiesObj1!=null) {

			 for(int i= 0;i<= Integer.parseInt(cookiestore)-1;i++){
				 HashMap<String, String> hm =  getStoredCookiesValue(request);
					    CookiesN = "newaddbox"+String.valueOf(i);
					    cookievale = hm.get(CookiesN);
						
				 if(cookievale!=null && !cookievale.equals("")){
				 
			String[]  splitcookie = cookievale.split("@");
			 if(col.equals(splitcookie[5]) && Integer.parseInt(splitcookie[6]) > Integer.parseInt(row)){

			  for(int jj= 0;jj<= splitcookie.length-1 ;jj++){
			    if(jj==6) {
			    newcookievaluewithrow = newcookievaluewithrow+(Integer.parseInt(splitcookie[6])-1);
			    }else{
			    newcookievaluewithrow = newcookievaluewithrow+splitcookie[jj]+"@";
			    }
			 }

		
			  Cookie newaddboxGenerate = new Cookie(CookiesN,newcookievaluewithrow);
			   newaddboxGenerate.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
			   newaddboxGenerate.setPath("/");
			   response.addCookie(newaddboxGenerate);
			  //hm.put(CookiesN, newcookievaluewithrow);
			  newcookievaluewithrow = "";
			 }
				 }	 

			 }
			    removearrangechartCookiesVal =  ConstantValues.COOKIES_SET_SUCCESS;
			 }else{
			    removearrangechartCookiesVal =  ConstantValues.COOKIES_SET_FAILURE;
			    
}
			 return removearrangechartCookiesVal;
}

/*public String getStoreCookie(HttpServletRequest request){
	Cookie[] cookiesObj1 = request.getCookies();
    String cookiestore ="",cookieSerach="StoreCookie";
    	for (int i=0; i<cookiesObj1.length; i++)
    	{
    			if(cookieSerach.equals(cookiesObj1[i].getName()))
    		{		
    				cookiestore = cookiesObj1[i].getValue();
    		}
    		
    	}
    	return cookiestore;
}
*/

public void removecookie(HttpServletRequest request, HttpServletResponse response) throws Exception
{
	        //count = 0
			String divval = request.getParameter("div");
			String col = request.getParameter("col");
	        String row = request.getParameter("row");
	        String setgetcookies = request.getParameter("setgetcookies");
			//cookiestore = request.Cookies("StoreCookie")

			if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			   String CookiesVal = removechartCookies(divval,request,response);
			   response.getWriter().write(CookiesVal);
			}

}

public String removechartCookies(String divval,HttpServletRequest request,HttpServletResponse response)
{
	 String chartid = divval.substring(6);//mid(divid,7)
	 String newcookievaluewithrow = "",removechartCookies="";
	 if(!chartid.equals("")) {
	    String key = chartid ;
	    HashMap<String, String> hm =  getStoredCookiesValue(request);
	    String cookiestore = hm.get("StoreCookie");
	    
	    Cookie newaddboxGenerate = new Cookie("StoreCookie",String.valueOf(Integer.parseInt(cookiestore)-1));
		newaddboxGenerate.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
		newaddboxGenerate.setPath("/");
		response.addCookie(newaddboxGenerate);
		
	    //Response.Cookies("StoreCookie")= cookiestore-1
	   // Response.Cookies("StoreCookie").Expires = DateAdd("yyyy",20,date)
	   String cookieval = String.valueOf(Integer.parseInt(cookiestore)-1);
	   String deletecookie = chartid;

	 for(int i= Integer.parseInt(chartid)+1 ;i<= Integer.parseInt(cookiestore)-1 ; i++){
	 String cookievale = hm.get("newaddbox"+""+i+"");//request.Cookies("newaddbox"&""&i&"")
	 String[] splitcookie = cookievale.split("@");
    
	  for(int j= 0 ;j<= splitcookie.length-1;j++){
	    if(j==3) {
	    newcookievaluewithrow = newcookievaluewithrow+(Integer.parseInt(splitcookie[3])-1)+"@";
	    }else if(j== 6) {
	    newcookievaluewithrow = newcookievaluewithrow+splitcookie[6];
	    }else{
	    newcookievaluewithrow = newcookievaluewithrow+splitcookie[j]+"@";
	    }
	  }
	 // String SetCookie = "newaddbox"+""+(i-1)+"";
	    Cookie newaddboxGenerate1 = new Cookie("newaddbox"+""+(i-1)+"",newcookievaluewithrow);
		newaddboxGenerate1.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
		newaddboxGenerate1.setPath("/");
		response.addCookie(newaddboxGenerate1);
	  //response.Cookies("newaddbox"&""&i-1&"") = newcookievaluewithrow
	  //response.Cookies("newaddbox"&""&i-1&"").Expires = DateAdd("yyyy",20,date)

	  newcookievaluewithrow = "";

	 }
	    Cookie newaddboxGenerate2 = new Cookie("newaddbox"+""+(Integer.parseInt(cookiestore)-1)+"","");
		newaddboxGenerate2.setMaxAge(-1);    //setting cookies expiry for one year
		newaddboxGenerate2.setPath("/");
		response.addCookie(newaddboxGenerate2);
	   //Response.Cookies("newaddbox"&""&cookiestore-1&"") = ""
	   //response.Cookies("newaddbox"&""&cookiestore-1&"") = DateAdd("d",-1,Now())
	   removechartCookies =  cookieval+"#"+deletecookie;
	    
	 }else{
	    removechartCookies =  ConstantValues.COOKIES_SET_FAILURE;
	    
	 }
	 return removechartCookies;
	 
}
public HashMap<String, String> getStoredCookiesValue(HttpServletRequest request){
	Cookie[] cookies = request.getCookies();
	HashMap<String, String> hm = new HashMap<String, String>();
	for(Cookie cookie : cookies)
	{
		hm.put(cookie.getName(), cookie.getValue());
	}
	return hm;
}

public void executepage(HttpServletRequest request, HttpServletResponse response) throws Exception{
response.getWriter().write("hhi");
}

public void add_cookies(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      String divval = request.getParameter("div");
	      String col = request.getParameter("col");
	      String rowinc = request.getParameter("row");
	      String row = request.getParameter("row");
			//cookiestore = request.Cookies("StoreCookie")
	      String setgetcookies = request.getParameter("setgetcookies");


			if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			 String  CookiesVal = arrangechartCookiesOfAdd(request,response,divval,col,row); 
			 response.getWriter().write(CookiesVal);
			}
}
 public String arrangechartCookiesOfAdd(HttpServletRequest request, HttpServletResponse response,String divval,String col,String row){
	 String newcookievaluewithrow= "",arrangechartCookies="";

	 if(!divval.equals("")){
     HashMap<String, String> hm =  getStoredCookiesValue(request);
     int cookiestore = Integer.parseInt(hm.get("StoreCookie"));
	 String chkcol = col;
	 for(int i= 0 ; i<= cookiestore-1 ; i++){ 
	  
	 String cookievale = hm.get("newaddbox"+""+i+"");//request.Cookies("newaddbox"&""&i&"")
	 String[] splitcookie = cookievale.split("@");

	 if(chkcol.equals(splitcookie[5])){
	   if(!divval.equals(splitcookie[3]) && Integer.parseInt(row) <= Integer.parseInt(splitcookie[6])) {
	   for(int j= 0 ;j<= splitcookie.length-1 ;j++){
	     if(j==6) {
	     newcookievaluewithrow = newcookievaluewithrow+(Integer.parseInt(splitcookie[6])+1);
	     }else{
	     newcookievaluewithrow = newcookievaluewithrow+splitcookie[j]+"@";
	     }
	     
	   }
	   
	   Cookie newaddboxGenerate = new Cookie("newaddbox"+""+i+"",newcookievaluewithrow);
		newaddboxGenerate.setMaxAge(365*24*60*60*20);    //setting cookies expiry for one year
		newaddboxGenerate.setPath("/");
		response.addCookie(newaddboxGenerate);
	  // response.Cookies("newaddbox"&""&i&"") = newcookievaluewithrow
	  // response.Cookies("newaddbox"&""&i&"").Expires = DateAdd("yyyy",20,date)
	  // rowinc = Integer.parseInt(rowinc)) +1 ;
	   newcookievaluewithrow = "";
	   }
	   }

	 }

	 arrangechartCookies = ConstantValues.COOKIES_SET_SUCCESS;
	 }else{
	 arrangechartCookies = ConstantValues.COOKIES_SET_FAILURE;
	 }
	 return arrangechartCookies;
 }

 
 public void reset_cookies(HttpServletRequest request, HttpServletResponse response) throws Exception{
	 String setgetcookies = request.getParameter("setgetcookies");
	 //HashMap<String, String> hm =  getStoredCookiesValue(request);
	  //  String cookiestore = hm.get("StoreCookie");
	    if(setgetcookies.equals(ConstantValues.SETTING_COOKIES)){
			 String  CookiesVal = resetchartCookies(request,response); 
			 response.getWriter().write(CookiesVal);
			}
 }
 
 public String resetchartCookies(HttpServletRequest request, HttpServletResponse response)
 {
	 String resetchartCookiesval = "";
	HashMap<String, String> hm =  getStoredCookiesValue(request);
	String cookiestore = hm.get("StoreCookie");
	
	if(!cookiestore.equals("")) {
	for(int  i= 0 ; i<= Integer.parseInt(cookiestore)-1 ; i++){
		
		Cookie newaddboxGenerate = new Cookie("newaddbox"+""+i+"","");
		newaddboxGenerate.setMaxAge(-1);    //setting cookies expiry for one year
		newaddboxGenerate.setPath("/");
		response.addCookie(newaddboxGenerate);
		
		Cookie newaddboxGenerate1 = new Cookie("StoreCookie","");
		newaddboxGenerate1.setMaxAge(-1);    //setting cookies expiry for one year
		newaddboxGenerate1.setPath("/");
		response.addCookie(newaddboxGenerate1);
		
	//response.Cookies("newaddbox"&""&i&"") = ""
	//response.Cookies("StoreCookie") = ""
	}

	resetchartCookiesval = ConstantValues.COOKIES_SET_SUCCESS;
    }else{
    	resetchartCookiesval = ConstantValues.COOKIES_SET_FAILURE;
    }
	return resetchartCookiesval;
 }
  
}

	
