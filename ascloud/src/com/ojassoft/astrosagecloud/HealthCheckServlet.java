package com.ojassoft.astrosagecloud;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;

import com.ojassoft.astrosagecloud.DAO.UserDAO;
import com.ojassoft.astrosagecloud.util.Util;

public class HealthCheckServlet extends AstrosageServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		String methodName = request.getParameter("methodName");
	}
	
	
}
