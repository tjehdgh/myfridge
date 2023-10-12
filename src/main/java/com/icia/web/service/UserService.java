/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.service
 * 파일명     : UserService.java
 * 작성일     : 2021. 1. 20.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.web.dao.UserDao;
import com.icia.web.model.Email;
import com.icia.web.model.User;


@Service("userService")
public class UserService
{
   private static Logger logger = LoggerFactory.getLogger(UserService.class);
   
   
   @Autowired
   private UserDao userDao;
      
   //사용자 조회
   public User userSelect(String userId)
   {
      User user = null;
      
      try
      {
         user = userDao.userSelect(userId);
      }
      catch(Exception e)
      {
         logger.error("[UserService] userSelect Exception", e);
      }
      
      return user;
   }
      
   
   //사용자 등록
   public int userInsert(User user)
   {
      int count = 0;
      
      try
      {
         count = userDao.userInsert(user);
      }
      catch(Exception e)
      {
         logger.error("[UserService]userInsert Exception", e);
      }
      return count;
   }
   
   
      
   //회원정보 수정
   public int userUpdate(User user)
   {
      int count = 0;
      
      try   //어노테이션 레파지 때문에 try catch구문으로 감싸야함.
      {
         count = userDao.userUpdate(user);
      }
      catch(Exception e)
      {
         logger.error("[UserService]userUpdate Exception", e);
      }
      
      return count;
   }
   
   
   //회원탈퇴
   public int userdropOut(User user)
   {
      int count = 0;
      
      try   
      {
         count = userDao.userdropOut(user);
      }
      catch(Exception e)
      {
         logger.error("[UserService]userUpdate Exception", e);
      }
      
      return count;
   }
   
   //회원 프로파일 수정
   public int userdFileUpdate(User user)
   {
      int count = 0;
      
      try  
      {
         count = userDao.userdFileUpdate(user);
      }
      catch(Exception e)
      {
         logger.error("[UserService]userdFileUpdate Exception", e);
      }
      
      return count;
   }
   
   
   
   //회원탈퇴 완료 후 회원정보 가져옴
   public User userDropOutSelect(String userId)
   {
      User user = null;
      
      try
      {
         user = userDao.userDropOutSelect(userId);
      }
      catch(Exception e)
      {
         logger.error("[UserService] userDropOutSelect Exception", e);
      }
      
      return user;
   }
   
}