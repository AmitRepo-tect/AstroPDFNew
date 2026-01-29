package com.ojassoft.astrosagecloud;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.ojassoft.astrosagecloud.DAO.DBConfig;

/**
 * Application Lifecycle Listener implementation class myServletListener
 * 
 */
public class DBServletListener implements ServletContextListener {
	private final static Logger LOGGER = Logger
			.getLogger(DBServletListener.class.getName());

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent event) {
		
		LOGGER.log(Level.INFO, "DBServletListener Initialized");
		
		ServletContext sc = event.getServletContext();
		
		loadDBConfiguration(sc);
		
	
		

	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
/**
 * @author jay
 * @since 5 August 2015
 * @description 
 * This loads the Database configuration from file dbconfig.properties in 
 * WEB-INF folder 
 * all the configuration goes into this file 
 * initially loads and set  constants to DBConfig class
 * IMPORTANT : do not put database configuration in web.xml file 
 * 
 * */
	void loadDBConfiguration(ServletContext sc){
		Properties properties = new Properties();
		try {
		properties.load(sc.getResourceAsStream("//WEB-INF//dbconfig.properties"));
		}
		catch (Exception e) { 
			
			LOGGER.log(Level.SEVERE, "Could not load properties file ");
			
		}
	    DBConfig.cloudPassword= properties.getProperty("cloud.password");
	    DBConfig.cloudURL= properties.getProperty("cloud.url");
	    DBConfig.cloudAtlasURL= properties.getProperty("cloud.atlasurl");
	    DBConfig.cloudUserName= properties.getProperty("cloud.user_name");
	    DBConfig.devURL= properties.getProperty("dev.url");
	    DBConfig.devURL1= properties.getProperty("dev.url1");
	    DBConfig.devUserName= properties.getProperty("dev.user_name");
	    DBConfig.devPassword= properties.getProperty("dev.password");
		
	}
	
	
	
}