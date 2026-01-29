<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ojassoft.astrosagecloud.localization.*" %>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%	
	DesktopHoro ty = new DesktopHoro();
	DesktopHoro tx = new DesktopHoro();  
    ty.setName("Garg");
    tx.setName("Agra");
    session.setAttribute("myobj",ty);
    //ty.setName("Mohit");
    out.println(ty.getName()+"<br>");
    out.println(tx.getName()+"tx<br>");
    DesktopHoro tz = (DesktopHoro)session.getAttribute("myobj");
    out.println(tz.getName());
    tz.setName("mohit");
    //tz.initialize();
    out.println("Insidety "+ty.getName()+"<br>");
    DesktopHoro tt = (DesktopHoro)session.getAttribute("myobj");
    out.println("Inside session "+tt.getName());
    /*
    Test_Obj vo1 = new VO();
    Test_Obj vo2 = new VO();
    Test_Obj vo3;
    Test_Obj vo4 = new VO();

	        vo1.setName("Sourav");
	        vo2.setName("Anil");

	        vo3 = vo1;
	        vo4 = vo1;

	        System.out.println(" " + vo4.getName());

	        vo1.setName("Abhishek.");

	        System.out.println(vo1.getName() + "  " + vo2.getName() + " " + vo3.getName() + " " + vo4.getName());
	    */
    %>