package com.ojassoft.astrosagecloud.localization;

import java.io.UnsupportedEncodingException;
import java.util.ResourceBundle;


public class MyResourceBundle {

	public MyResourceBundle(ResourceBundle rb) {
		super();
		this.rb = rb;
	}

	public MyResourceBundle() {
	}

	private java.util.ResourceBundle rb;
	
	public String getString(String key) {
		String bytekey = null;
		String keyval=null;
		try{	
			keyval = rb.getString(key);
			bytekey = new String(keyval.getBytes("ISO-8859-1"), "UTF-8");	
			return bytekey;
			}
			catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		    }
		return bytekey;
	}

	public java.util.ResourceBundle getRb() {
		return rb;
	}

	public void setRb(java.util.ResourceBundle rb) {
		this.rb = rb;
	}
	
	

}
