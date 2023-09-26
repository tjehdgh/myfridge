package com.icia.web.model;

import java.io.Serializable;

public class MyFridge implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String userId;
	private int fridgeIrdntAmount;
	private String irdntName;
	
	private long startRow;
	private long endRow;
	
	private String searchValue ;



	public String getSearchValue() {
		return searchValue;
	}


	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}


	public long getStartRow() {
		return startRow;
	}


	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}


	public long getEndRow() {
		return endRow;
	}


	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}


	public MyFridge()
	{
		userId = "";
		fridgeIrdntAmount = 0;
		irdntName = "";
		
		startRow = 0;
		endRow = 0;
		
		searchValue ="";
	}
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getFridgeIrdntAmount() {
		return fridgeIrdntAmount;
	}
	public void setFridgeIrdntAmount(int fridgeIrdntAmount) {
		this.fridgeIrdntAmount = fridgeIrdntAmount;
	}
	public String getIrdntName() {
		return irdntName;
	}
	public void setIrdntName(String irdntName) {
		this.irdntName = irdntName;
	}
	

}
