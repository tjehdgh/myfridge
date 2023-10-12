/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.dao
 * 파일명     : UserDao.java
 * 작성일     : 2021. 1. 19.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.dao;

import org.springframework.stereotype.Repository;

import com.icia.web.model.User;

@Repository("userDao")
public interface UserDao
{
		
	//사용자 조회
	public User userSelect(String userId);
		
	//사용자 등록
	public int userInsert(User user);
		
	//사용자 정보 수정
	public int userUpdate(User user);	
	
	//회원탈퇴
	public int userdropOut(User user);
	
	//회원프로파일 정보 변경
	public int userdFileUpdate(User user);
	
	//회원탈퇴 후 사용자 정보 조회
	public User userDropOutSelect(String userId);
}

	