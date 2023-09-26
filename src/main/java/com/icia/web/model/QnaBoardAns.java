package com.icia.web.model;

import java.io.Serializable;

public class QnaBoardAns implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private long qnaSeq;				//게시물 번호 
	private String ansTitle;			//답변 제목
	private String ansContent;			//답변 내용
	private String adminId;				//관리자아이디
	private String regDate;				//게시물 등록일
	
	public QnaBoardAns()
	{
		qnaSeq = 0;
		ansTitle = "";
		ansContent = "";
		adminId = "";
		regDate = "";
	}

	public long getQnaSeq() {
		return qnaSeq;
	}

	public void setQnaSeq(long qnaSeq) {
		this.qnaSeq = qnaSeq;
	}

	public String getAnsTitle() {
		return ansTitle;
	}

	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
	
}
