package com.ojassoft.astrosagecloud.DO;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class UserBean 
{
	private String name;
	private String userId;
	private String password;
	private String day;
	private String month;
	private String year;
	private String hrs;
	private String min;
	private String sec;
	private String email;
	private boolean status;
	private String regSource;
	private String regdate;	
	
	public UserBean()
	{
		
	}
	
	public UserBean(String emailId, String password, String name, String regSource, boolean status)
	{
		this.name = name;
		this.userId = emailId;
		this.password = password;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		this.regdate = sdf.format(cal.getTime());
		this.day = cal.get(Calendar.DAY_OF_MONTH) + "";
		this.month = cal.get(Calendar.MONTH) + 1 + "";
		this.year = cal.get(Calendar.YEAR) + "";
		this.hrs = cal.get(Calendar.HOUR_OF_DAY) + "";
		this.min = cal.get(Calendar.MINUTE) + "";
		this.sec = cal.get(Calendar.SECOND) + "";
		this.email = emailId;
		this.status = status;
		this.regSource = regSource;
	}
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getHrs() {
		return hrs;
	}
	public void setHrs(String hrs) {
		this.hrs = hrs;
	}
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getSec() {
		return sec;
	}
	public void setSec(String sec) {
		this.sec = sec;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getRegSource() {
		return regSource;
	}
	public void setRegSource(String regSource) {
		this.regSource = regSource;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
