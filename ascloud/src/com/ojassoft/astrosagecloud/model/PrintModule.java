package com.ojassoft.astrosagecloud.model;
/**
 * 
 * @author amit
 *
 */
public class PrintModule {
	String category;
	String categoryItem;

	public PrintModule(String category,String categoryItem) {
		this.category=category;
		this.categoryItem=categoryItem;
	}

	public String getCategory() {
		return category;
	}

	public String getCategoryItem() {
		return categoryItem;
	}

	
}
