package com.icia.web.model;

import java.io.Serializable;

public class Admin implements Serializable
{
	private static final long serialVersionUID = 8638989512396268543L;
	
	private String adminId;
	private String adminPwd;
	private String adminEmail;
	private String adminName;
	private String regDate;
	private String status;
	
	
	public Admin()
	{
		adminId = "";
		adminPwd = "";
		adminEmail = "";
		adminName = "";
		regDate = "";
		status = "";
	}


	public String getAdminId() {
		return adminId;
	}


	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	public String getAdminPwd() {
		return adminPwd;
	}


	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}


	public String getAdminEmail() {
		return adminEmail;
	}


	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}


	public String getAdminName() {
		return adminName;
	}


	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
}
