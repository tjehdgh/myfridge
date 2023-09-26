package com.icia.web.controller;

import java.util.*;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.icia.common.model.FileData;
import com.icia.common.util.StringUtil;
import com.icia.web.model.*;
import com.icia.web.service.*;
import com.icia.web.util.*;

@Controller("fridgeController")
public class FridgeController {
private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
		private static final int LIST_COUNT = 5;		//한 페이지의 게시물 수
		private static final int PAGE_COUNT = 5;
	// 쿠키명
		@Value("#{env['auth.cookie.name']}")
		private String AUTH_COOKIE_NAME;		//USER_ID
		
		@Autowired
		private MyFridgeService myFridgeService;
		
		 @RequestMapping(value="/user/fridge" , method=RequestMethod.GET)
		 public String mainFridge(ModelMap model,HttpServletRequest request, HttpServletResponse response)
		 {	   
			 String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			 
			 //냉장고 , 재료 , 레시피 조회 서치 밸류들 
			 String	myFridgeSearchValue = HttpUtil.get(request,"myFridgeSearch","");
			 String irdntSearchValue = HttpUtil.get(request,"irdntSearch","");
			 String myRecipeSearchValue = HttpUtil.get(request,"myRecipeSearch","");
			 
			 //페이징을 위한 현재페이지
			 long irdntCurPage = HttpUtil.get(request, "irdntCurPage", (long)1);	
			 long myRecipeCurPage = HttpUtil.get(request, "myRecipeCurPage", (long)1);
			 long myFridgeCurPage = HttpUtil.get(request, "myFridgeCurPage", (long)1);
			 
			 //유저 냉장고 , 재료 , 레시피 저장할 리스트
			 List<IrdntInfo> irdntInfoList = new ArrayList<IrdntInfo>();
			 List<MyFridge> myFridgeList = new ArrayList<MyFridge>();
			 List<RecipeInfo> myRecipeList = new ArrayList<RecipeInfo>();
			 
			 //각 페이징을 처리하기 위한 객체들
			 Paging myFridgePaging = null;
			 Paging irdntPaging = null;
			 Paging myRecipePaging = null;
			 
			 //냉장고 , 재료 , 레시피 서칭을 하기 위한 매개변수 객체들 
			 MyFridge fridgeSearch = new MyFridge();
			 IrdntInfo irdntInfoSearch = new IrdntInfo();
			 RecipeInfo RecipeInfoSearch = new RecipeInfo();
			 
			 String msg = HttpUtil.get(request,"msg","");			
			 
			 //냉장고,재료,레시피 총갯수 서칭하기 위한 변수 모두 같은거 사용
			 long totalCount = 0;
			 
			 //쿠키가 없다면(로그인 유무) 홈페이지로 돌려보낸다
			 //냉장고 재료 찾을 매개변수에 유저 아이디 쿠키값으로 셋팅
			 if(!StringUtil.isEmpty(cookieUserId))
			 {	
				 fridgeSearch.setUserId(cookieUserId);
			 } 
			 else
			 {
				 return "/index";
			 }
			 
			 //냉장고 재료서칭 밸류가 비어 있지 않으면 넣음 
			 if(!StringUtil.isEmpty(myFridgeSearchValue) && !StringUtil.isEmpty(cookieUserId))
			 { 	
				 fridgeSearch.setSearchValue(myFridgeSearchValue);	 
			 }
			 
			 //조건에 맞는 냉장고 재료 카운팅
			 totalCount = myFridgeService.myFridgeCount(fridgeSearch);
			
			 //재료가 있다면 
			 if(totalCount > 0)
			 {
				 //페이징 처리
				 myFridgePaging = new Paging("/user/fridge",totalCount,
						 LIST_COUNT,PAGE_COUNT,myFridgeCurPage,"myFridgeCurPage");
				 
				 //페이징 값 넣기
				 fridgeSearch.setStartRow(myFridgePaging.getStartRow());
				 
				 fridgeSearch.setEndRow(myFridgePaging.getEndRow());
				 //냉장고 재료정보 가져오기
				 myFridgeList = myFridgeService.myFridgeList(fridgeSearch);
			 }
			 
			 
			 
			 //재료 서칭 밸류가 있다면 매개변수에 대입 없다면 ""(공백)으로 들어감	 
			 if(!StringUtil.isEmpty(irdntSearchValue))
			 {
				 irdntInfoSearch.setSearchValue(irdntSearchValue);
			 } 			 
			 //재료서칭 밸류에 알맞는 수량 카운팅  	 			 
			 totalCount = myFridgeService.irdntCount(irdntInfoSearch);		
			 //재료서칭이 된다면 	 
			 if(totalCount > 0)
			 {	
				 //재료 정보 페이징 처리
				 irdntPaging = new Paging("/user/fridge",totalCount,
						 LIST_COUNT,PAGE_COUNT,irdntCurPage,"irdntCurPage");
				 irdntInfoSearch.setStartRow(irdntPaging.getStartRow());
				 irdntInfoSearch.setEndRow(irdntPaging.getEndRow());
				 
				 
				 //재료정보 가져오기
				 irdntInfoList = myFridgeService.irdntInfoList(irdntInfoSearch);
			 }
			 
			 
			 
			 
			 
			 if(!StringUtil.isEmpty(cookieUserId))
			 {
				 RecipeInfoSearch.setUserId(cookieUserId);
			 }
			 
			 if(!StringUtil.isEmpty(myRecipeSearchValue))
			 {	 //서칭 밸류 매개변수 객체에 대입
				 RecipeInfoSearch.setSearchValue(myRecipeSearchValue);
			 }
			 	 
			 //가능 레시피 수량 가져오기
			 totalCount = myFridgeService.possibleRecipeCount(RecipeInfoSearch);
			 if(totalCount > 0)
			 {	
				 //재료 정보 페이징 처리
				 myRecipePaging = new Paging("/user/fridge",totalCount,
						 LIST_COUNT,PAGE_COUNT,myRecipeCurPage,"recipeCurPage");
		
					 RecipeInfoSearch.setStartRow(myRecipePaging.getStartRow());
					 RecipeInfoSearch.setEndRow(myRecipePaging.getEndRow());		 				 
				 //재료정보 가져오기
				 myRecipeList = myFridgeService.possibleRecipe(RecipeInfoSearch);
			 }
			 
			 
			 model.addAttribute("myFridgeSearchValue",myFridgeSearchValue);			
			 model.addAttribute("irdntSearchValue",irdntSearchValue);
			 model.addAttribute("myRecipeSearchValue",myRecipeSearchValue);			 
			 
			 model.addAttribute("irdntCurPage", irdntCurPage);
			 model.addAttribute("myRecipeCurPage", myRecipeCurPage);
			 model.addAttribute("myFridgeCurPage",myFridgeCurPage);			 
			 
			 model.addAttribute("irdntInfoList", irdntInfoList);
			 model.addAttribute("myFridgeList",myFridgeList);
			 model.addAttribute("myRecipeList",myRecipeList);
	
			 model.addAttribute("myFridgePaging",myFridgePaging);
			 model.addAttribute("irdntPaging",irdntPaging);
			 model.addAttribute("myRecipePaging",myRecipePaging);
			 			 
			 return "/user/fridge";
		 }
		 
		 @RequestMapping(value="/user/fridgeDelete" , method=RequestMethod.POST)
		 @ResponseBody
		 public Response<Object> fridgeDelete(ModelMap model,HttpServletRequest request, HttpServletResponse response)
		 {
			 String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			 String	fridgeIrdntValue = HttpUtil.get(request, "irdntName","");
			 Response<Object> ajaxResponse = new Response<Object>();
			 
			 if(!StringUtil.isEmpty(fridgeIrdntValue) && !StringUtil.isEmpty(cookieUserId))
			 {
				String[] list = fridgeIrdntValue.split(",");
				 
				try
				{
					MyFridge myfridge = new MyFridge();
					 
					for(int i =0; i<list.length;i++)
					 {
						 myfridge.setIrdntName(list[i]);
						 myfridge.setUserId(cookieUserId);
						 
						if(myFridgeService.myFridgeDelete(myfridge)>0)
						{
							ajaxResponse.setResponse(0, "success");
				
						}
						else
						{
							ajaxResponse.setResponse(500, "error");
						}
						
					 }
				}
				catch(Exception e)
				{
					 logger.debug("delete fridge error");
				}		
			 }
			 	
			 return ajaxResponse;
			 		
		 }
		
		 @RequestMapping(value="/user/fridgeUpdate" , method=RequestMethod.POST)
		 @ResponseBody
		 public  Response<Object> fridgeUpdate(HttpServletRequest request, HttpServletResponse response)
		 {
			 Response<Object> ajaxResponse = new Response<Object>();
			 
			 //수정하기 위한 밸류값 jsp에서 가져오기
			 String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			 String	fridgeIrdntAmount = HttpUtil.get(request, "fridgeIrdntAmount","");
			 String	irdntName = HttpUtil.get(request, "irdntName","");
			 //매개변수를 위한 객체 생성
			 MyFridge myfridge = new MyFridge();
			 
			 //재료이름과 양 아이디기 들어왔다면 실행
			 if(!StringUtil.isEmpty(irdntName) && !StringUtil.isEmpty(fridgeIrdntAmount)
					 && !StringUtil.isEmpty(cookieUserId))
			 {	 //매개변수에 밸류 대입
				 myfridge.setFridgeIrdntAmount(Integer.parseInt(fridgeIrdntAmount));
				 myfridge.setUserId(cookieUserId);
				 myfridge.setIrdntName(irdntName);
						 			
				 if(myFridgeService.myFridgeUpdate(myfridge) > 0)
				 {
					 ajaxResponse.setResponse(0, "success");
				 }
				 else
				 {
					 ajaxResponse.setResponse(500, "error");
				 }
				 
			 }
			 return ajaxResponse;
		 }
		 
		 @RequestMapping(value="/user/myFridgeInsert" , method=RequestMethod.POST)
		 @ResponseBody
		 public Response<Object> myFridgeInsert(ModelMap model,HttpServletRequest request, HttpServletResponse response)
		 {			 
			 Response<Object> ajaxResponse = new Response<Object>();
			 
			 String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			 String	fridgeIrdntAmount = HttpUtil.get(request, "fridgeIrdntAmount","");
			 String	irdntName = HttpUtil.get(request, "irdntName","");
			 int count = 0;
			 int check = 0;
			
			 MyFridge myfridge = new MyFridge();
			 if(!StringUtil.isEmpty(irdntName) && !StringUtil.isEmpty(fridgeIrdntAmount)
					 && !StringUtil.isEmpty(cookieUserId))
			 {
				 myfridge.setFridgeIrdntAmount(Integer.parseInt(fridgeIrdntAmount));
				 myfridge.setUserId(cookieUserId);
				 myfridge.setIrdntName(irdntName);
				 
				 check = myFridgeService.irdntDuplicate(myfridge);
				 
				 if(check == 0)
				 {
					 count = myFridgeService.myFridgeInsert(myfridge);
					 
					 if(count > 0)
					 {
						 ajaxResponse.setResponse(0, "success");
					 }
					 else
					 {
						 ajaxResponse.setResponse(300, "error");
					 }
					 
				 }
				 else
				 {
					 ajaxResponse.setResponse(100, "error");
				 }
			 }
			 return ajaxResponse;
		 }
}
