package com.icia.web.dao;

import org.springframework.stereotype.Repository;

import com.icia.web.model.Email;
import com.icia.web.model.User;

@Repository("emailDao")
public interface EmailDao {
	public int userIdCount(String emailAddress);
	public User userIdSelect(String emailAddress);
	
	public User userPwdSelect (Email email);
	public int userPwdCount (Email email);
}


