package com.icia.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.common.util.StringUtil;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;

@Controller("userController")
public class UserController
{
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;     //USER_ID 랑 같은거임
	
	@Autowired
	private UserService userService;
	
	
		//회원 등록
		@RequestMapping(value="/user/regProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> regProc(HttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
		
			String userId = HttpUtil.get(request,"userId");
			String userPwd = HttpUtil.get(request,"userPwd");
			String userEmail = HttpUtil.get(request,"userEmail");
			String userName = HttpUtil.get(request,"userName");
			String userAddress = HttpUtil.get(request,"userAddress");
			String userGender = HttpUtil.get(request,"userGender");
			int userAge = HttpUtil.get(request,"userAge", 0);
			String userPhoneNumber = HttpUtil.get(request,"userPhoneNumber");
			String userAccount = HttpUtil.get(request,"userAccount");
			String userNickname = HttpUtil.get(request,"userNickname");
			
			logger.debug("-----------------------------------");
			logger.debug("userId : " + userId);
			logger.debug("userPed : " + userPwd);
			logger.debug("userName : " + userName);
			logger.debug("userAddress : " + userAddress);
			logger.debug("userGender : " + userGender);
			logger.debug("userAge : " + userAge);
			logger.debug("userPhoneNumber : " + userPhoneNumber);
			logger.debug("userAccount : " + userAccount);
			logger.debug("userNickname : " + userNickname);
			logger.debug("-----------------------------------");
			
			
			
			
			//제이쿼리에서 입력전부 받도록 처리 해줬지만 한번더 입력값 없는게 있는지 확인
			if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && 
					!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(userAddress) && !StringUtil.isEmpty(userGender)
					&& !StringUtil.isEmpty(userAge) && !StringUtil.isEmpty(userPhoneNumber) && !StringUtil.isEmpty(userAccount)
					&& !StringUtil.isEmpty(userNickname) )
			{
				//넘어온아이디가 중복이 있는지 확인
				if(userService.userSelect(userId) == null)
				{
					//중복아이디가 없을 경우 정상적으로 등록
					User user = new User();
					
						
					user.setUserId(userId);  //user 객체에 값 세팅
					user.setUserPwd(userPwd);
					user.setEmail(userEmail);
					user.setUserName(userName);
					user.setUserAddress(userAddress);
					user.setUserGender(userGender);
					user.setUserAge(userAge);
					user.setUserPhoneNumber(userPhoneNumber);
					user.setUserAccount(userAccount);
					user.setUserNickname(userNickname);
					user.setStatus("Y");
					
					
					//insert 쿼리에 대한 리턴값은 처리 건수 -> 데이터가 있다면 건수가 0보다 큼
					if(userService.userInsert(user) > 0)
					{
						ajaxResponse.setResponse(0, "Success");
					}
					else
					{
						ajaxResponse.setResponse(500, "Internal Server Error");
					}
				}
				else
				{
					//중복아이디가 있는 경우
					ajaxResponse.setResponse(100, "Duplicate ID");
				}
			}
			else
			{
				//만약 한개라도 값이 입력안됬으면
				ajaxResponse.setResponse(400, "Bad Request");
			}
			
			//디버깅용 어디서 오류나는지 확인 하기 위한 로그찍기
			if(logger.isDebugEnabled())
			{
				logger.debug("[UserController]/user/regProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
			}
			
			return ajaxResponse;
		}
	
	
		
		//회원가입시 아이디 중복있는지 체크
		@RequestMapping(value="/user/idCheck", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> idCheck(HttpServletRequest request, HttpServletResponse response)
		{
			
			Response<Object> ajaxResponse = new Response<Object>();  
			
			String userId = HttpUtil.get(request,"userId");
			String userPwd = HttpUtil.get(request,"userPwd");
			String userName = HttpUtil.get(request,"userName");
			String userAddress = HttpUtil.get(request,"userAddress");
			String userGender = HttpUtil.get(request,"userGender");
			int userAge = HttpUtil.get(request,"userAge", 0);
			String userPhoneNumber = HttpUtil.get(request,"userPhoneNaumber");
			String userAccount = HttpUtil.get(request,"userAccount");
			String userNickname = HttpUtil.get(request,"userNickname");
			String regDate = HttpUtil.get(request,"regDate");
			
			
			if(!StringUtil.isEmpty(userId))
			{
				if(userService.userSelect(userId) == null) //userSelect(userId)는 리턴타입이 user 객체
				{
					//객체가 null 이면 없는거 이므로 사용가능한 아이디
					ajaxResponse.setResponse(0, "Success");  // 0번 : 정상
				}
				else
				{
					ajaxResponse.setResponse(100, "Deplicate ID"); //100: 중복아이디 
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "Bad Request"); //400: 잘못된 통신
			}
			
			//디버깅용 으로 찍음
			if(logger.isDebugEnabled())
			{
				logger.debug("[UserController]/user/idCheck response\n" + JsonUtil.toJsonPretty(ajaxResponse));
			}
			
			return ajaxResponse;
		}
		
		
		
		//회원정보 수정(ajax 통신용)
		@RequestMapping(value="/user/updateProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> updateProc(HttpServletRequest request, HttpServletResponse response)
		{
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME); //쿠키아이디를 헥사코드로 바꿔서 가지고옴
			
			User user = new User();
			
			String userId = HttpUtil.get(request,"userId");
			String userPwd = HttpUtil.get(request,"userPwd");
			String userName = HttpUtil.get(request,"userName");
			String userAddress = HttpUtil.get(request,"userAddress");
			String userGender = HttpUtil.get(request,"userGender");
			int userAge = HttpUtil.get(request,"userAge", 0);
			String userNickname = HttpUtil.get(request,"userNickname");
			
			
			
			logger.debug("++++++++ jsp에서 컨트롤러로 왔니?? +++++++++=");
			logger.debug("userId:" +userId);
			logger.debug("userPwd: "+userPwd);
			logger.debug("userName: "+userName);
			logger.debug("userAddress: "+userAddress);
			logger.debug("userGender : " +userGender);
			logger.debug("userNickname : " + userNickname);
			logger.debug("userAge : " + userAge);
			logger.debug("++++++++++++++++++++++=");
			
			
			
			
			Response<Object> ajaxResponse = new Response<Object>();
			
			if(!StringUtil.isEmpty(cookieUserId))
			{
				 user = userService.userSelect(cookieUserId);
				 
				 
				 
				 logger.debug("++++++++ if 안으로 값 들어왓니?  +++++++++=");
					logger.debug("userId:" +userId);
					logger.debug("userPwd: "+userPwd);
					logger.debug("userName: "+userName);
					logger.debug("userAddress: "+userAddress);
					logger.debug("userGender : " +userGender);
					logger.debug("userNickname : " + userNickname);
					logger.debug("userAge : " + userAge);
					logger.debug("++++++++++++++++++++++=");
					
				 

				if(user != null)
				{
					//고객정보가 있으면 업데이터 정상처리
					//사용자 페이지에서 확인 했지만 다시한번더 확인
					if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && 
							!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(userAddress) && !StringUtil.isEmpty(userGender)
							&& !StringUtil.isEmpty(userAge) && !StringUtil.isEmpty(userNickname))
					{
						
						String regDate = HttpUtil.get(request,"regDate");
						
						
						user.setUserId(userId);  //user 객체에 값 세팅
						user.setUserPwd(userPwd);
						user.setUserName(userName);
						user.setUserAddress(userAddress);
						user.setUserGender(userGender);
						user.setUserAge(userAge);
						user.setUserNickname(userNickname);

						
						if(userService.userUpdate(user) > 0)
						{
							ajaxResponse.setResponse(0, "Success");
						}
						else
						{
							//실패 - 하다가 난 오류 이기 떄문에 500
							ajaxResponse.setResponse(500, "Internal Server error");
						}
						
					}
					else
					{
						//입력 파라미터가 올바르지 않을 경우
						//입력값이 하나도 비어있음
						ajaxResponse.setResponse(400, "Bad Request");
					}
					
				}
				else
				{
					//사용자 정보 없을 경우 -> 쿠키 날리기
					CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
					ajaxResponse.setResponse(404, "Not Found");
				}
				
			}
			else
			{
				
				logger.debug("++++++++400번 오류 뜨는곳 어디서 값이 없는거+++++++++=");
				logger.debug("userId:" +userId);
				logger.debug("userPwd: "+userPwd);
				logger.debug("userName: "+userName);
				logger.debug("userAddress: "+userAddress);
				logger.debug("userGender : " +userGender);
				logger.debug("userNickname : " + userNickname);
				logger.debug("userAge : " + userAge);
				logger.debug("++++++++++++++++++++++=");
				
				
				
				//비어있음 ==로그인 안되어있음
				ajaxResponse.setResponse(400, "Bad Request");
			}
			
			
			
			//디버깅용 어디서 오류나는지 확인 하기 위한 로그찍기 -> ajax 통신에만 넣음
			if(logger.isDebugEnabled())
			{
				logger.debug("[UserController]/user/updateProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
			}
			
			
			return ajaxResponse;
			
		}
		
		
		

		//회원탈퇴 페이지로 이동
		@RequestMapping(value = "/user/dropOut", method=RequestMethod.GET)
		public String dropOut(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
				String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
				
				User user = userService.userSelect(cookieUserId);
				
				model.addAttribute("user", user) ; 
			
			return "/user/dropOut";
		}
		
		
		//회원탈퇴 하기
		@RequestMapping(value = "/user/dropoutProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> dropoutProc(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			String userPwd = HttpUtil.get(request, "userPwd");
			
			Response<Object> ajaxResponse = new Response<Object>();
			
			
			if(!StringUtil.isEmpty(cookieUserId) && !StringUtil.isEmpty(userPwd))
			{
				User user = userService.userSelect(cookieUserId);
				
				if(user != null)
				{
					//비밀번호 일치하는지 확인
					if(StringUtil.equals(user.getUserPwd(), userPwd))
					{
						
						user.setStatus("N");  //값 세팅 먼저 해주고 서비스 호출해서 값 세팅해줘야함
						
						userService.userdropOut(user);
						
						//회원 탈퇴하면 쿠키도 없애줘서 자동으로 로그아웃 되게 하기
						if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
				         {
				            CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
				         }
						
						
						ajaxResponse.setResponse(0, "Success"); //성공
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
				logger.debug("[UserController] /user/dropoutProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
			}
			
			
			return ajaxResponse;
		}
						
		
		
		//회원 탈퇴 완료 페이지 
		@RequestMapping(value = "/user/dropoutSuccess", method=RequestMethod.POST)
		public String dropoutSuccess(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
				String userId = HttpUtil.get(request, "userId");
				
				User user = userService.userDropOutSelect(userId); //userId로 쿼리에서 정보 다 가져옴
				
				model.addAttribute("user", user); 
			
			return "/user/dropoutSuccess";
		}
		
		
}
