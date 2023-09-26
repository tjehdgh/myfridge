package com.icia.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.YamlProcessor.ResolutionMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.common.util.StringUtil;
import com.icia.web.model.Email;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.EmailService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;

@Controller("emailController")
public class EmailController
{
	private static Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailService emailService;
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;		//USER_ID
	
	@RequestMapping(value = "/user/email", method=RequestMethod.GET)
	public String email(HttpServletRequest request, HttpServletResponse response)
	{
		return "/user/email";
	}
	
	@RequestMapping(value = "/user/emailChk", method=RequestMethod.GET)
	@ResponseBody
	public Response<Object> emailChk (ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
	        
		Response<Object> ajaxResponse = new Response<Object>();
		
		String email = HttpUtil.get(request, "email");
		String authKey ="";
		Email sendEmail = new Email();	
		if(!StringUtil.isEmpty(email))
		{
			sendEmail.setUserEmail(email);
			authKey = emailService.sendAuthMail(sendEmail);
			if(!StringUtil.isEmpty(authKey))
			{
				ajaxResponse.setResponse(0, "success",authKey);
			}
			else 
			{
				ajaxResponse.setResponse(100,"parameter Error");
			}
		}
		return ajaxResponse;
	  	}
	
	@RequestMapping(value = "/user/keyCheck", method=RequestMethod.GET)
	@ResponseBody
	public Response<Object> keyChk (HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String authKey = HttpUtil.get(request, "authKey");
		String chkAuthKey = HttpUtil.get(request, "chkAuthKey");
		
		if(!StringUtil.isEmpty(chkAuthKey) && !StringUtil.isEmpty(authKey))
		{
			if(StringUtil.equals(authKey, chkAuthKey))
			{
				ajaxResponse.setResponse(0,"success");
			}
			else
			{
				ajaxResponse.setResponse(100,"not equals");
			}
		}
		else
		{
			ajaxResponse.setResponse(400,"parameter not found");
		}
		
		return ajaxResponse;
	}
	
	//아이디 찾기 
	@RequestMapping(value = "/user/idFind", method=RequestMethod.GET)
	@ResponseBody
	public Response<Object> idfind(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		String email = HttpUtil.get(request, "email","");
		
		if(!StringUtil.isEmpty(email)) // 이메일 밸류가 존재 할때
		{
			String res = emailService.userIdSelect(email);
			
			if(StringUtil.equals("success", res))
			{
				ajaxResponse.setResponse(0, res);
			}
			else if(StringUtil.equals("not find", res))
			{
				ajaxResponse.setResponse(200, "not find");
			}
			else if(StringUtil.equals("error", res))
			{
				ajaxResponse.setResponse(100, res);
			}
		}
		else // 이메일 밸류가 없을 때 
		{
			ajaxResponse.setResponse(500,"parameter error");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/user/pwdFind", method=RequestMethod.GET)
	@ResponseBody
	public Response<Object> pwdFind(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		String email = HttpUtil.get(request, "email","");
		String userId = HttpUtil.get(request, "userId");
		
		if(!StringUtil.isEmpty(email) && !StringUtil.isEmpty(userId)) // 이메일 밸류가 존재 할때
		{
			Email sendEmail = new Email();
			
			sendEmail.setUserId(userId);
			sendEmail.setUserEmail(email);
			String res = emailService.userPwdSelect(sendEmail);
			
			if(res.equals("success"))
			{
				ajaxResponse.setResponse(0, res);
			}
			else if (res.equals("not find"))
			{
				ajaxResponse.setResponse(200, "not find");
			}
			else if(res.equals("error"))
			{
				ajaxResponse.setResponse(100, res);
			}
		}
		else // 이메일 밸류가 없을 때 
		{
			ajaxResponse.setResponse(500,"parameter error");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/user/idFindPage", method=RequestMethod.GET)
	public String idFind(HttpServletRequest request, HttpServletResponse response)
	{
		return "/user/idFindPage";
	}
}
