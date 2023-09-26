package com.icia.web.model;

import java.io.Serializable;


public class Email implements Serializable {

	private static final long serialVersionUID = 1L;

	private String emailCode;
	private String userEmail;
	private String userId;
	private String authKey;
	
	public Email()
	{
		emailCode = "";
		userEmail = "";
		userId="";
		authKey ="";
	}

	public String getEmailCode() {
		return emailCode;
	}

	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAuthKey() {
		return authKey;
	}

	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
}
