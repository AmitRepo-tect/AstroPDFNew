
<%@page import="com.ojassoft.astrosagecloud.util.WebKeys"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%!public void createcookies(String cookiename,String cookievalue,int cookieexpiretime,HttpServletResponse response){
	if(cookiename != null && !cookiename.equals(""))
	{
		Cookie cookieSet = new Cookie(cookiename,cookievalue);
		cookieSet.setMaxAge((cookieexpiretime-1)*24*60*60);    //setting cookies expiry for one year
		cookieSet.setPath("/");
		//cookieSet.setDomain(Refac.COOKIE_DOMAIN);
		cookieSet.setDomain(WebKeys.COOKIE_DOMAIN);
		response.addCookie(cookieSet);
	}
		
		/*Cookie cookie = new Cookie ("username","neha");
		cookie.setMaxAge(365 * 24 * 60 * 60);
		response.addCookie(cookie);
		*/
//Response.Cookies(cookiename) = cookievalue;
//Response.Cookies(cookiename).Expires = DateAdd("d",cookieexpiretime,Date);
}



public String readcookies(String cookiename,HttpServletRequest request){
 String readcookievalue = "";
 Cookie[] cookieObj=null;               
 cookieObj = request.getCookies();
 if(cookieObj != null)
 {
	 for(int cookieCount=0;cookieCount<cookieObj.length;cookieCount++){
	     if(cookieObj[cookieCount].getName().compareToIgnoreCase(cookiename)==ConstantValues.COOKIES_FOUND){
	   	  	//uidCookie = cookieObj[cookieCount].getValue();
	   	    readcookievalue = cookieObj[cookieCount].getValue();
	     }
	 }
 }
//readcookies = readcookievalue;
return readcookievalue;
}%>
