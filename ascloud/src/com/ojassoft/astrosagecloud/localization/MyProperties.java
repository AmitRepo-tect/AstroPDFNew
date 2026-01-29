package com.ojassoft.astrosagecloud.localization;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;

public class MyProperties extends Properties 
{
	private Properties properties;
	
	/**
	 * This constructor returns MyProperties Object.
	 * @param bundle
	 */
	public MyProperties(ResourceBundle bundle)
	{
		properties = convertResourceBundleToProperties(bundle);
	}
	
	public String getString(String key)
	{
		
		return this.properties.getProperty(key);
	}
	
	/**
	 * It converts the ResourceBundle to Properties.
	 * @param resource
	 * @return Properties
	 */
	public Properties convertResourceBundleToProperties(ResourceBundle resource) {
	    Properties properties = new Properties();

	    Enumeration<String> keys = resource.getKeys();
	    while (keys.hasMoreElements()) {
	      String key = keys.nextElement();
	      try
	      {
		      String keyVal = new String(resource.getString(key).getBytes("ISO-8859-1"), "UTF-8");	
		      properties.put(key, keyVal);
	      }
	      catch(UnsupportedEncodingException uee)
	      {
	    	  uee.printStackTrace();
	      }
	    }

	    return properties;
	  }

}
