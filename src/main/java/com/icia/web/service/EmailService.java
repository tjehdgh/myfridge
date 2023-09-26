package com.icia.web.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.icia.common.util.*;
import com.icia.web.dao.*;
import com.icia.web.model.*;

/**
 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.service
 * 파일명     : UserService.java
 * 작성일     : 2021. 1. 20.
 * 작성자     : daekk
 * </pre>
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.web.dao.UserDao;
import com.icia.web.model.Email;
import com.icia.web.model.User;

@Service("emailService")
public class EmailService {
	
	 	private static Logger logger = LoggerFactory.getLogger(UserService.class);
	 
		private int size;
	
	    @Autowired
	    private JavaMailSenderImpl mailSender;
	    
	    @Autowired
	    private UserService userService;
	    
	    @Autowired
	    private UserDao userDao;
	    
	    @Autowired
	    private EmailDao emailDao;
	    //인증키 생성
	    private String getKey(int size) {
	        this.size = size;
	        return getAuthCode();
	    }

	    //인증코드 난수 발생
	    private String getAuthCode() {
	        Random random = new Random();
	        StringBuffer buffer = new StringBuffer();
	        int num = 0;

	        while(buffer.length() < size) {
	            num = random.nextInt(10);
	            buffer.append(num);
	        }

	        return buffer.toString();
	    }

	    //인증메일 보내기
	    public String sendAuthMail(Email email) {
	        //6자리 난수 인증번호 생성
	        String authKey = getKey(6);

	        //인증메일 보내기
	        String setfrom = "MyFridge";             

		    String tomail  = email.getUserEmail();     // 받는 사람 이메일
		    String title   = "MyFridge 사이트 회원가입 인증";      
		    String content = "MyFridge 사이트 회원가입 인증 \n"
		    		+ "인증번호 키 6자리를 회원가입 페이지에 입력하세요. \n "
		    		+ authKey;      
		    try {

		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");

		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용		     

		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    } 
		    //메일 보낸 후 인증키 반환 
		    return authKey;

		  }
	    
	    public String userIdSelect(String emailAddress)
	    {
	    	
	    	if(emailDao.userIdCount(emailAddress)>0)
	    	{
	    		User user = new User();
	    		user = emailDao.userIdSelect(emailAddress);
	    		
	    		String setfrom = "MyFridge";             

	 		    String tomail  = user.getEmail();   // 받는 사람 이메일
	 		    String title   = "MyFridge 아이디 찾기";      
	 		    String content = "MyFridge 사이트 아이디 찾기 \n"
	 		    		+ "당신의 아이디는 " + user.getUserId() + "입니다.";
	 		    
	 		   try {

	 		      MimeMessage message = mailSender.createMimeMessage();
	 		      MimeMessageHelper messageHelper 
	 		                        = new MimeMessageHelper(message, true, "UTF-8");

	 		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	 		      messageHelper.setTo(tomail);     // 받는사람 이메일
	 		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	 		      messageHelper.setText(content);  // 메일 내용		     

	 		      mailSender.send(message);
	 		      return "success";
	 		    } catch(Exception e){
	 		      System.out.println(e);
	 		    } 
	    	}
	    	else
	    	{
	    		return "not find";
	    	}
	    	
	    	return "error";
	    	
	    }
	    
	    public String userPwdSelect(Email email)
	    {
	    	if(emailDao.userPwdCount(email) > 0)
	    	{
	    		User user = new User();
	    		user = emailDao.userPwdSelect(email);
	    		
	    		String setfrom = "MyFridge";             
	 		    String tomail  = user.getEmail();   // 받는 사람 이메일
	 		    String title   = "MyFridge 비밀번호 찾기";      
	 		    String content = "MyFridge 사이트 비밀번호 찾기 \n"
	 		    		+ "당신의 비밀번호는 " + user.getUserPwd() + "입니다.";
	 		    
	 		   try {

		 		      MimeMessage message = mailSender.createMimeMessage();
		 		      MimeMessageHelper messageHelper 
		 		                        = new MimeMessageHelper(message, true, "UTF-8");

		 		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		 		      messageHelper.setTo(tomail);     // 받는사람 이메일
		 		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		 		      messageHelper.setText(content);  // 메일 내용		     

		 		      mailSender.send(message);
		 		      return "success";
		 		      
		 		    } catch(Exception e){
		 		      System.out.println(e);
		 		    } 
	 		   
	    	}
	    	else
	    	{
	    		return "not find";
	    	}
	    	return "error";
	    }
}

	    	
