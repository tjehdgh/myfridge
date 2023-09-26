/**
 * <pre>
 * 프로젝트명 : BasicBoard
 * 패키지명   : com.icia.web.model
 * 파일명     : User.java
 * 작성일     : 2021. 1. 12.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.model;

import java.io.Serializable;

public class User implements Serializable
{
	private static final long serialVersionUID = 8638989512396268543L;
	
	private String userId;    			//사용자 아이디
	private String userPwd;   			//비밀번호
	private String userAddress;			//주소
	private int userAge;				//나이
	private String userGender;			//성별
	private String userPhoneNumber;		//전화번호
	private String status;    			//상태 ("Y":사용, "N":정지)
	private String regDate;   			//등록일
	private String userAccount; 		//계좌번호 
	private String userName;   			//이름
	private String userNickname;   		//닉네임
	private String fileExt;		//첨부파일 확장자
	private String email;
	
	public User()
	{
		userId = "";
		userPwd = "";
		userAddress = "";
		userAge = 0;
		userGender = "";
		userPhoneNumber = "";		
		status = "";
		regDate = "";
		userAccount = "";
		userName = "";
		userNickname = "";
		fileExt = "";
		email = "";
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public int getUserAge() {
		return userAge;
	}


	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}


	public String getUserGender() {
		return userGender;
	}


	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}


	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}


	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getUserAccount() {
		return userAccount;
	}


	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserNickname() {
		return userNickname;
	}


	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}


	public String getFileExt() {
		return fileExt;
	}


	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}	
	
	
	
}
