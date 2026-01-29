package com.ojassoft.astrosagecloud.DO;

public class Services 
{
	public static String[] aryServiceId = {"1","7","81","82","84","80","5","2"};
	public static String[] aryPrice = {"($7)","($16)","($24)","($24)","($16)","($28)","($24)","($50)"};
	public static String[] aryPriceRs = {"299","($16)","($24)","($24)","($16)","($28)","($24)","($50)"};
	public static String[] aryActualPriceRs = {"520","($16)","($24)","($24)","($16)","($28)","($24)","($50)"};
	public static String[] aryServiceName = {"SERVICE_NAME_1","SERVICE_NAME_7","SERVICE_NAME_4","SERVICE_NAME_12","SERVICE_NAME_13","SERVICE_NAME_6","SERVICE_NAME_5","SERVICE_NAME_2"};
	public static String[] aryContent = {"SERVICE_DESC_1","SERVICE_DESC_7","SERVICE_DESC_4","SERVICE_DESC_12","SERVICE_DESC_13","SERVICE_DESC_6","SERVICE_DESC_5","SERVICE_DESC_2"};
	public static String[] aryIconImage = {"ask-a-question.png","icon_health.gif","icon_education.gif","icon_finance.gif","icon_gemstone.gif","icon_love.gif","icon_lalkitab.gif","icon_time.gif"};
	public static String[] aryLargeImage = {"ask-a-question.png","health-fitness.png","career-report.png","finance.png","ic_gemstone.png","ic_weekly_love.png","ic_lalkitab.png","birth-time-rectification.png"};
	
	public String[] getAryServiceId() {
		return aryServiceId;
	}
	public static String[] getAryPriceRs() {
		return aryPriceRs;
	}
	public static void setAryPriceRs(String[] aryPriceRs) {
		Services.aryPriceRs = aryPriceRs;
	}
	public static String[] getAryActualPriceRs() {
		return aryActualPriceRs;
	}
	public static void setAryActualPriceRs(String[] aryActualPriceRs) {
		Services.aryActualPriceRs = aryActualPriceRs;
	}
	public void setAryServiceId(String[] aryServiceId) {
		this.aryServiceId = aryServiceId;
	}
	public String[] getAryPrice() {
		return aryPrice;
	}
	public void setAryPrice(String[] aryPrice) {
		this.aryPrice = aryPrice;
	}
	public String[] getAryServiceName() {
		return aryServiceName;
	}
	public void setAryServiceName(String[] aryServiceName) {
		this.aryServiceName = aryServiceName;
	}
	public String[] getAryContent() {
		return aryContent;
	}
	public void setAryContent(String[] aryContent) {
		this.aryContent = aryContent;
	}
	public String[] getAryIconImage() {
		return aryIconImage;
	}
	public void setAryIconImage(String[] aryIconImage) {
		this.aryIconImage = aryIconImage;
	}
	public String[] getAryLargeImage() {
		return aryLargeImage;
	}
	public void setAryLargeImage(String[] aryLargeImage) {
		this.aryLargeImage = aryLargeImage;
	}
	
	public int getIndexServiceId(String serviceId)
	{
		int index = 0;
		for(int i=0;i<aryServiceId.length;i++)
		{
			if(aryServiceId[i].equals(serviceId))
			{
				index = i;
				break;
			}
		}
		return index;
	}
	
}
