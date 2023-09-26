package com.icia.web.model;

import java.io.Serializable;

public class UserOrder implements Serializable
{
	private static final long serialVersionUID = 8638989512396268543L;
	
	//사용자 주문내역 테이블 객체
	
	private int orderCode;
	private String orderProductName;
	private String oderDate;
	private String orderState;
	private String orderProductPrice;
	private String payState;
	private int  productCode;	
	private String userId;
	
	//sql 정렬에 쓰일 변수(DESC, ASC)
	private String orederByDate;
	private String searchType;
	private String searchValue;
	   
	
	//페이징 처리 변수
	private long startRow;            //시작 rownum
	private long endRow;            //끝 rownum
	   
	
	//생성자
		public UserOrder()
		{
			orderCode = 0;
			orderProductName = "";
			oderDate = "";
			orderState = "";
			orderProductPrice = "";
			payState = "";
			productCode =0;
			userId = "";
			
			orederByDate = "";
			searchType = "";
			searchValue = "";
			startRow = 0;
			endRow = 0;
		}
		
	
	
	
	public int getOrderCode() {
		return orderCode;
	}



	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}



	public String getOrderProductName() {
		return orderProductName;
	}



	public void setOrderProductName(String orderProductName) {
		this.orderProductName = orderProductName;
	}



	public String getOderDate() {
		return oderDate;
	}



	public void setOderDate(String oderDate) {
		this.oderDate = oderDate;
	}



	public String getOrderState() {
		return orderState;
	}



	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}



	public String getOrderProductPrice() {
		return orderProductPrice;
	}



	public void setOrderProductPrice(String orderProductPrice) {
		this.orderProductPrice = orderProductPrice;
	}



	public String getPayState() {
		return payState;
	}



	public void setPayState(String payState) {
		this.payState = payState;
	}



	public int getProductCode() {
		return productCode;
	}



	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getOrederByDate() {
		return orederByDate;
	}




	public void setOrederByDate(String orederByDate) {
		this.orederByDate = orederByDate;
	}




	public String getSearchType() {
		return searchType;
	}




	public void setSearchType(String searchType) {
		this.searchType = searchType;
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



	
	
	
}
