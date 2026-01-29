/*
 * Copyright (c) 2018, 2023, Ojas softech pvt ltd All rights reserved.
 * OJAS PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */


package com.ojassoft.astrosagecloud.api;

/**
 * The {@code MarriageBean} class is used to set and get start and end date of marriage
 * marriage on the basis of your current mahadasha, anterdasha, pretunterdasha
 * 
 * 
 * 
 * 
 * @author Mahtab Hussain
 * 
 */

public class MarriageBean {
	String startDate, endDate;

	public String getEndDate() {
		return endDate;
	}

	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
