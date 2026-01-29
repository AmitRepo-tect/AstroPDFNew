<%@page import="com.ojassoft.astrosagecloud.DAO.AtlasDAO"%>
<% 
String PlaceName = request.getParameter("place");

if(!PlaceName.equals("")) {
	AtlasDAO AD = new AtlasDAO();
	String returnString = AD.getCityDetails(PlaceName);
	out.println(returnString);
	
}
%>