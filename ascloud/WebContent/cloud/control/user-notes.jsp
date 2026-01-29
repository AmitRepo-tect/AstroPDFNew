<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*, java.util.*" %>
<%@page import="com.ojassoft.astrosagecloud.DAO.NoteDAO"%>
<%
int chartid=0;
NoteDAO ntd=new NoteDAO();
if(session.getAttribute("ChartId") == null || session.getAttribute("ChartId").equals(""))
{
      out.print("2");
}   
else{
	
		chartid = Util.safeInt(session.getAttribute("ChartId"));
	  
if(request.getParameter("notes")!=null && !request.getParameter("notes").equals(""))
	{
		
          int  temp = ntd.updatenotes(request.getParameter("notes"),chartid);
            String usercomment = ntd.getnotes(chartid);
           String []usercomments=usercomment.split("|");
            
            if(usercomments[0] == "1")
            {
            	
                usercomment = usercomments[1];
                out.print(usercomment);
            }else
            {
                out.print(usercomment);
                
            }
	}
else{
	       
            String usercomment = ntd.getnotes(chartid);
           String[] usercomments = usercomment.split("|");
            if(usercomments[0] == "1")
            	{
                usercomment = usercomments[1];
                out.print(usercomment);
            	}
            else if(!usercomment.equals(null) && !usercomment.equals("") && !usercomment.equals("null".trim()))
            {
            	
            		out.print(usercomment);
            }
              
      
}
}
%>