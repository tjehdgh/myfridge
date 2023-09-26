package com.icia.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.icia.common.util.StringUtil;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;
@Controller("loginController")
public class LoginController 
{
   private static Logger logger = LoggerFactory.getLogger(LoginController.class);
   
   	  //쿠키명 
      @Value("#{env['auth.cookie.name']}")
      private String AUTH_COOKIE_NAME;      //USER_ID
      
      @Autowired
      private UserService userService;
   
      //로그인 페이지
      @RequestMapping(value="/user/login" , method=RequestMethod.GET)
      public String login(HttpServletRequest request, HttpServletResponse response)
      {                                                            
            return "/user/login";
      }
      //로그인
      @RequestMapping(value="/user/loginProc", method=RequestMethod.POST)
      @ResponseBody   
      public Response<Object> loginProc(HttpServletRequest request, HttpServletResponse response)
      {
         String userId = HttpUtil.get(request, "userId");
         String userPwd = HttpUtil.get(request, "userPwd");
         Response<Object> ajaxResponse = new Response<Object>();
         if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))
         {
            User user = userService.userSelect(userId);
            
            if(user != null)
            {
               if(StringUtil.equals(user.getUserPwd(), userPwd))
               {
                  // AUTH_COOKIE_NAME: 변수명, CookieUtil.stringToHex(userId):값
                  CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_NAME, CookieUtil.stringToHex(userId));
                  
                  ajaxResponse.setResponse(0, "Success"); // 로그인 성공
               }
               else
               {
                  ajaxResponse.setResponse(-1, "Passwords do not match"); // 비밀번호 불일치
               }
            }
            else
            {
               ajaxResponse.setResponse(404, "Not Found"); // 사용자 정보 없음 (Not Found)
            }
         }
         else
         {
            ajaxResponse.setResponse(400, "Bad Request"); // 파라미터가 올바르지 않음 (Bad Request)
         }
         
         if(logger.isDebugEnabled())
         {
            logger.debug("[UserController] /user/login response\n" + JsonUtil.toJsonPretty(ajaxResponse));
         }
         
         return ajaxResponse;
      }
      
      
      //로그아웃
      @RequestMapping(value="/loginOut", method=RequestMethod.GET)
      public String loginOut(HttpServletRequest request, HttpServletResponse response)
      {
         if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
         {
            CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
         }
         
         return "redirect:/";      //재접속
      }
   
      
      //회원가입
      @RequestMapping(value="/user/regForm", method=RequestMethod.GET)
      public String regForm(HttpServletRequest request, HttpServletResponse response)   //리턴타입을 String으로 한 이유 .jsp로 이동해야함으로
      {
         String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
         
         if(!StringUtil.isEmpty(cookieUserId))
         {
            CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
            
            return "redirect:/";
         }
         else
         {
            return "/user/regForm";
         }
         
      }
      
}