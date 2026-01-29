<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
    UserDAO UD =  new UserDAO();
    if(session.getAttribute("User_Id") != null && !session.getAttribute("User_Id").equals("")){
        if(session.getAttribute("HoroscopeObj") != null && !session.getAttribute("HoroscopeObj").equals("")){
        	//Object objHoroName = session.getAttribute("HoroscopeObj");
        	DesktopHoro objHoroName = (DesktopHoro) session.getAttribute("HoroscopeObj");
            String username = objHoroName.getName();
            String yob = String.valueOf(objHoroName.getYearOfBirth());
            
            String randomchartname = UD.getrandomchartname(username,yob);            
            if(!randomchartname.equals("0")){
                out.println(randomchartname);
            }else{
            	out.println("1");
            }                        
        }else{
        	out.println("0");
        }
    }  else{
        out.println("You are not authorized to view this page.");
    }
    
    

%>