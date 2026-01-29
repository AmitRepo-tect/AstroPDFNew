package com.ojassoft.astrosagecloud.DO;

import java.util.Date;

public class HealthFeedback 
{
	private String name;
	private String userId;
	private Date dateOfBirth;
	private String place;
	private String calcImmunity;
	private String actualImmunity;
	private boolean agree;
	private String feedback;
	private int longdeg;
	private int longmin;
	private String longew;
	private int latdeg;
	private int latmin;
	private String latns;
	private String timezone;
	
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
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getCalcImmunity() {
		return calcImmunity;
	}
	public void setCalcImmunity(String calcImmunity) {
		this.calcImmunity = calcImmunity;
	}
	public String getActualImmunity() {
		return actualImmunity;
	}
	public void setActualImmunity(String actualImmunity) {
		this.actualImmunity = actualImmunity;
	}
	public boolean isAgree() {
		return agree;
	}
	public void setAgree(boolean agree) {
		this.agree = agree;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public int getLongdeg() {
		return longdeg;
	}
	public void setLongdeg(int longdeg) {
		this.longdeg = longdeg;
	}
	public int getLongmin() {
		return longmin;
	}
	public void setLongmin(int longmin) {
		this.longmin = longmin;
	}
	public String getLongew() {
		return longew;
	}
	public void setLongew(String longew) {
		this.longew = longew;
	}
	public int getLatdeg() {
		return latdeg;
	}
	public void setLatdeg(int latdeg) {
		this.latdeg = latdeg;
	}
	public int getLatmin() {
		return latmin;
	}
	public void setLatmin(int latmin) {
		this.latmin = latmin;
	}
	public String getLatns() {
		return latns;
	}
	public void setLatns(String latns) {
		this.latns = latns;
	}
	public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	
}
