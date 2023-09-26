package com.icia.web.dao;

import org.springframework.stereotype.Repository;

import com.icia.web.model.Admin;
import com.icia.web.model.User;

@Repository("adminDao")
public interface AdminDao 
{
	//관리자 조회
	public Admin adminSelect(String adminId);
}
