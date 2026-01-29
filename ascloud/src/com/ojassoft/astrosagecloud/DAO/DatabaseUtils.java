package com.ojassoft.astrosagecloud.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

/**
 * @author j@y
 * @since 05-August-2015
 * @discription A Utility class to use the database in this application DBConfig
 *              class loaded with the constants from the dbconfig.properties at
 *              the deployment time .
 * 
 * @HowToUseThis <code>
 * 
 *  DatabaseUtils dbutil = new DatabaseUtils();
 *  dbutil.runSql(queryString,args);
 *  //performing resultset operation close connection 
 *  
 *  dbutil.closeConnection();
 * 
 * 
 * </code>
 * 
 * */
public class DatabaseUtils {
	//private static final BasicDataSource dataSource = new BasicDataSource();

    static {
        
    }

	private final static Logger LOGGER = Logger
			.getLogger(DatabaseUtils.class.getName());

	Connection conn;
	Connection connAtlas;

	public DatabaseUtils() {
		
	}

	/**
	 * @deprecated Use {@link #closeConnection(Connection,Statement,ResultSet)} instead
	 */
	public void closeConnection() {
		closeConnection(null, null, null);
	}

	public void closeConnection(Connection conn, Statement stmt, ResultSet rst) {

       	
       		try
       		{
	       		if(rst!=null)
	       		{
	       			rst.close();
	       		}
       		}
       		catch(Exception e)
       		{
       			
       		}
       		try
       		{
	       		if(stmt!=null)
	       		{
	       			stmt.close();
	       		}
       		}
       		catch(Exception e)
       		{
       			
       		}
       		try
       		{
	       		if(conn!=null)
	       		{
	       			conn.close();
	       		}
	       		if(this.conn != null)
	       		{
	       			this.conn.close();
	       			
	       		}
	       		if(connAtlas != null)
	       		{
	       			this.connAtlas.close();
	       		}
       		}
       		catch(Exception e)
       		{
       			
       		}
	       			
       				
	}
	
     /**
	 * this create connection for both local or cloud-sql on the basis of
	 * environment from the dbconfig loaded
	 * */
	public Connection getConnection() {
		try {
			
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//this.conn = DriverManager.getConnection(DBConfig.devURL1,DBConfig.devUserName, DBConfig.devPassword);

			//this.conn = DriverManager.getConnection("jdbc:sqlserver://localhost\\sqlexpress:50808;database=astrosage;integratedSecurity=true");
			//this.conn = DriverManager.getConnection("jdbc:sqlserver://50.23.151.13:1433;database=astrosage","sarw","OS#1408os");

			//this.conn = DriverManager.getConnection("jdbc:sqlserver://localhost\\sqlexpress:50808;database=astrosage;integratedSecurity=true");
			//this.conn = DriverManager.getConnection("jdbc:sqlserver://50.23.151.13:1433;database=astrosage","sarw","OS#1408os");

			//this.conn = DriverManager.getConnection("jdbc:sqlserver://localhost\\sqlexpress:1654;database=astrosage;integratedSecurity=true");
			//this.conn = DriverManager.getConnection("jdbc:sqlserver://50.23.151.13:1433;database=astrosage","sarw","OS#1408os");
			//dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	        //dataSource.setUrl("jdbc:sqlserver://50.23.151.13:1433;database=astrosage");
	       // dataSource.setUsername("sarw");
	       // dataSource.setPassword("OS#1408os");
	      // this.conn=dataSource.getConnection();
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/astrosage");
			
			this.conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// LOGGER.log(Level.INFO, "DBServletListener : getConnection !");
		return this.conn;
	}
	public Connection getConnectionPool() {
		try {
			System.out.print("connection polling");
			//manoj//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//this.conn = DriverManager.getConnection(DBConfig.devURL1,DBConfig.devUserName, DBConfig.devPassword);
			//this.conn = DriverManager.getConnection("jdbc:sqlserver://localhost\\sqlexpress:1654;database=astrosage;integratedSecurity=true");
			//manoj//this.conn = DriverManager.getConnection("jdbc:sqlserver://50.23.151.13:1433;database=astrosage","sarw","OS#1408os");
			//dataSource.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	        //dataSource.setUrl("jdbc:sqlserver://50.23.151.13:1433;database=astrosage");
	        //dataSource.setUsername("sarw");
	        //dataSource.setPassword("OS#1408os");
	        //this.conn=dataSource.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		// LOGGER.log(Level.INFO, "DBServletListener : getConnection !");
		return this.conn;
	}

	public Connection getAtlasConnection() {
		try {
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//this.conn = DriverManager.getConnection(DBConfig.devURL1,DBConfig.devUserName, DBConfig.devPassword);
			//this.connAtlas = DriverManager.getConnection("jdbc:sqlserver://localhost\\sqlexpress:50808;database=atlas;integratedSecurity=true");
			//this.connAtlas = DriverManager.getConnection("jdbc:sqlserver://50.23.151.13:1433;database=atlas","sarw","OS#1408os");
			
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/atlas");
			this.connAtlas = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

		// LOGGER.log(Level.INFO, "DBServletListener : getConnection !");
		return this.connAtlas;
	}
	
	
	/*public ResultSet runSql(String preSql, String[] args) throws SQLException {

		// LOGGER.log(Level.INFO, "DBServletListener : runsql method 2");
		PreparedStatement ps = (PreparedStatement) conn
				.prepareStatement(preSql);
		for (int i = 0; i < args.length; i++) {
			// starts from 1
			ps.setString(i + 1, args[i]);

		}

		return ps.executeQuery();

	}*/

}
