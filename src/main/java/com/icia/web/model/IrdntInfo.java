package com.icia.web.model;

import java.io.Serializable;


public class IrdntInfo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String irdntName;
	private String irdntImage;
	private String userId;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private String searchValue;

	private long startRow;
	private long endRow;
	
	public IrdntInfo()
	{
		irdntName = "";
		irdntImage = "";
		
		searchValue = "";
		
		startRow =0;
		endRow=0;
		userId = "";
	}
	
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

	public String getIrdntName() {
		return irdntName;
	}

	public void setIrdntName(String irdntName) {
		this.irdntName = irdntName;
	}

	public String getIrdntImage() {
		return irdntImage;
	}

	public void setIrdntImage(String irdntImage) {
		this.irdntImage = irdntImage;
	}
	
}
