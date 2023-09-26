package com.icia.web.model;

import java.io.Serializable;

public class NoticeBoard implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private long noticeSeq;					//공지사항 번호
	private String adminId;					//관리자 아이디
	private String noticeTitle;				//공지사항 제목
	private String noticeContent;			//공지사항 내용
	
	public NoticeBoard()
	{
		noticeSeq = 0;
		adminId = "";
		noticeTitle = "";
		noticeContent = "";
	}

	public long getNoticeSeq() {
		return noticeSeq;
	}

	public void setNoticeSeq(long noticeSeq) {
		this.noticeSeq = noticeSeq;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
}
