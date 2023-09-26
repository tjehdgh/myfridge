package com.icia.web.model;

import java.io.Serializable;

public class QnaBoard implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private long qnaSeq;				//게시물 번호
	private String userId;				//사용자 아이디
	private String qnaTitle;			//게시물 제목
	private String qnaContent;			//게시물 내용
	private String regDate;				//게시물 등록일
	private long qnaGroup;			//게시물 그룹번호
	private int qnaOrder;				//게시물 그룹 내 순서
	private int qnaIndent;			//게시물 들여쓰기 
	private long qnaParent;			//부모 게시물 번호
	private String userName;
	private String ansStatus;
	//sql문에 넣을려고 작성
	private long startRow;				//시작 rownum
	private long endRow;				//끝 rownum
	
	//sql 검색조건 정렬 위해 넣음
	private String orderByRegDate;   //등록일로 최신순,오래된순 정렬
	private String searchType;
	private String searchValue;
	
	public QnaBoard()
	{
		qnaSeq = 0;
		userId = "";
		qnaTitle = "";
		qnaContent = "";
		regDate = "";
		startRow = 0;
		endRow = 0;
		qnaGroup = 0;
		qnaOrder = 0;
		qnaIndent = 0;
		qnaParent = 0;
		userName = "";
		ansStatus = "대기중";
		
		orderByRegDate = "";
		searchType = "";
		searchValue = "";
	}



	



	public String getOrderByRegDate() {
		return orderByRegDate;
	}







	public void setOrderByRegDate(String orderByRegDate) {
		this.orderByRegDate = orderByRegDate;
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







	public String getAnsStatus() {
		return ansStatus;
	}







	public void setAnsStatus(String ansStatus) {
		this.ansStatus = ansStatus;
	}







	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public long getQnaGroup() {
		return qnaGroup;
	}



	public void setQnaGroup(long qnaGroup) {
		this.qnaGroup = qnaGroup;
	}



	public int getQnaOrder() {
		return qnaOrder;
	}



	public void setQnaOrder(int qnaOrder) {
		this.qnaOrder = qnaOrder;
	}



	public int getQnaIndent() {
		return qnaIndent;
	}



	public void setQnaIndent(int qnaIndent) {
		this.qnaIndent = qnaIndent;
	}



	public long getQnaParent() {
		return qnaParent;
	}



	public void setQnaParent(long qnaParent) {
		this.qnaParent = qnaParent;
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



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}



	public long getQnaSeq() {
		return qnaSeq;
	}



	public void setQnaSeq(long qnaSeq) {
		this.qnaSeq = qnaSeq;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getQnaTitle() {
		return qnaTitle;
	}



	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}



	public String getQnaContent() {
		return qnaContent;
	}



	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}



	
	
	
}
