package com.icia.web.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.common.model.FileData;
import com.icia.common.util.FileUtil;
import com.icia.common.util.StringUtil;
import com.icia.web.model.MyPage;
import com.icia.web.model.Paging;
import com.icia.web.model.QnaBoard;
import com.icia.web.model.RecipeCooking;
import com.icia.web.model.RecipeInfo;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.model.UserOrder;
import com.icia.web.service.MyPageService;
import com.icia.web.service.RecipeService;
import com.icia.web.service.UserOrderService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;


@Controller("myPageController")
public class MyPageController
{
	private static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	
	// 쿠키명userRecentRegRecipe
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
		
	@Autowired
	private UserService userService;
	
	
	@Autowired
	private MyPageService myPageService;
	
	
	@Autowired
	private UserOrderService userOrderService;
	
	@Autowired
	private RecipeService recipeService;
	
	
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	   
	private static final int LIST_COUNT = 5;   //한 페이지의 게시물 수
	private static final int PAGE_COUNT = 5;   //페이징 수
	   
	
	//마이페이지에서 왼쪽 사이드바에 잇는 카테고리들을 눌렀을 때 페이지로 가게 하는 컨트롤러들
	
	//찜한 레시피로 이동
	@RequestMapping(value = "/myPage/bookMark", method={RequestMethod.GET, RequestMethod.POST})
	public String bookMark(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		  //레시피 이름 조회
	      String searchType = HttpUtil.get(request, "searchType", "");
	      //레시피 설명(RECIPE_INTRO)
	      String searchValue = HttpUtil.get(request, "searchValue", "");
	      //현재 페이지
	      long curPage = HttpUtil.get(request, "curPage", (long)1);
	      //내가 찜한 게시물 리스트
	      List<RecipeInfo> bookMarklist = null;
	      //조회 객체
	      RecipeInfo recipeSearch = new RecipeInfo();
	      //총 게시물 수
	      long totalCount = 0;
	      //페이징 객체
	      Paging paging = null;
		
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		  User user = userService.userSelect(cookieUserId);
		  
		  
		  //레시피 코드(INFO)
		  int recipeCode = HttpUtil.get(request, "recipeCode", (int)0);
		  
		  
	  	  //레시피 상세조회(조리과정)
		  List<RecipeCooking> cookingList = null;
		  
		  
		 if(!StringUtil.isEmpty(searchType))
	      {
			 recipeSearch.setSearchType(searchType);
			 recipeSearch.setRecipeName(searchType);
	      }
		 
		 if(!StringUtil.isEmpty(searchValue))
	      {
			 recipeSearch.setSearchValue(searchValue);
			 recipeSearch.setRecipeIntro(searchValue);
	      }
	      
		 recipeSearch.setUserId(cookieUserId);
		
		 
		 
		 totalCount = myPageService.bookMarkTotalCount(recipeSearch); //총 게수는 리스트 보다 먼저 구해 와야함
		 
		 bookMarklist = myPageService.myBookMarkList(recipeSearch);
		 
		 
	      
		 logger.debug("+++++++++++++++++++==");
		  logger.debug("cookieUserId : " + cookieUserId);
		  logger.debug("curPage : " + curPage);
		  logger.debug("totalCount : " + totalCount);
		  logger.debug("++++++++++++++++++++");
		  
		 
	      
	      if(totalCount > 0)
	      {
	         paging = new Paging("/myPage/bookMark", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
	         
	         recipeSearch.setStartRow(paging.getStartRow());
	         recipeSearch.setEndRow(paging.getEndRow());
	         
	         bookMarklist = myPageService.myBookMarkList(recipeSearch);
	      }
	      
	      model.addAttribute("bookMarklist", bookMarklist);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("searchValue", searchValue);
	      model.addAttribute("curPage", curPage);
	      model.addAttribute("paging", paging);
	      model.addAttribute("user", user);
	      
	      model.addAttribute("recipeCode", recipeCode);
	      model.addAttribute("cookingList", cookingList);
	      model.addAttribute("recipeSearch", recipeSearch);
	      
	      return "/myPage/bookMark";
		
	}
	
	
	
	
	//회원정보 수정으로 이동
	@RequestMapping(value ="/myPage/myPageUpdateForm")
	public String myPageUpdateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		User user = userService.userSelect(cookieUserId);
		
		model.addAttribute("user", user) ;  //첫번째 인수는 jsp에서 사용할 이름 , 두번째 인수는 사용된 객체의 이름   (jsp에서 사용할 이름, 사용된 객체의 이름)
		
		
		return "/myPage/myPageUpdateForm";
	}

	
	
	
	
	//나의 문의내역(QnA)로 이동
	@RequestMapping(value = "/myPage/userQnA")
	public String userQnA(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		  //제목 조회
	      String searchValue = HttpUtil.get(request, "searchValue", "");
	     //작성일 기준 최신순, 오래된순
	      String orderByRegDate = HttpUtil.get(request, "orderByRegDate", "");
	      
	      //현재 페이지
	      long curPage = HttpUtil.get(request, "curPage", (long)1);
	      //내 QnA 게시물 리스트
	      List<QnaBoard> myQnaList = null;
	      //조회 객체
	      QnaBoard myQnaSearch = new QnaBoard();
	      //총 게시물 수
	      long totalCount = 0;
	      //페이징 객체
	      Paging paging = null;
		
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		  User user = userService.userSelect(cookieUserId);
		  
		  
		  if(!StringUtil.isEmpty(searchValue))
	      {
			  myQnaSearch.setSearchValue(searchValue);
	      }
		 
		 if(!StringUtil.isEmpty(orderByRegDate))
	      {
			 myQnaSearch.setOrderByRegDate(orderByRegDate);
	      }
	      
		 
		 myQnaSearch.setUserId(cookieUserId);
		 
		 
		 totalCount = myPageService.myQnaListTotalCount(myQnaSearch); //totalCount 가져온다음에 리스트를 가져와야지 이 바보야
		
		 
		  if(totalCount > 0)
	      {
	         paging = new Paging("/myPage/userQnA", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
	         
	         myQnaSearch.setStartRow(paging.getStartRow());
	         myQnaSearch.setEndRow(paging.getEndRow());
	         
	         myQnaList = myPageService.myQnaList(myQnaSearch);
	      }
		  
		 
		  //logger.debug("리스트페이지 seqNo : " + myQnaList.get(0).getQnaSeq());
		 
		  
		
		  model.addAttribute("myQnaList", myQnaList);
	      model.addAttribute("searchValue", searchValue);
	      model.addAttribute("orderByRegDate", orderByRegDate);
	      model.addAttribute("curPage", curPage);
	      model.addAttribute("paging", paging);
	      model.addAttribute("user", user);
	      model.addAttribute("myQnaSearch", myQnaSearch);
	      
	      
		return "/myPage/userQnA";
	}
		
		
	
	
	
	//주문 정보 페이지로 이동
	@RequestMapping(value = "/myPage/userOrder")
	public String userOrder(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		//상품명 조회
	    String searchValue = HttpUtil.get(request, "searchValue", "");
	    //작성일 기준 최신순, 오래된순
	    String orederByDate = HttpUtil.get(request, "orederByDate", "");
		//현재 페이지
	    long curPage = HttpUtil.get(request, "curPage", (long)1);
	    //총 게시물 수
	    long totalCount = 0;
	    //페이징 객체
	    Paging paging = null;
	    //조회 객체
	    UserOrder userOrderSearch = new UserOrder();
	    //내가 주문 리스트
	    List<UserOrder> userOrderList = null;
	    
	    
	    User user = userService.userSelect(cookieUserId);
		
	    
	    
	    if(!StringUtil.isEmpty(searchValue))
	      {
	    	userOrderSearch.setSearchValue(searchValue);
	    	userOrderSearch.setOrderProductName(searchValue);
	      }
		 
		 if(!StringUtil.isEmpty(orederByDate))
	      {
			 userOrderSearch.setOrederByDate(orederByDate);
	      }
		 
		 
		 userOrderSearch.setUserId(cookieUserId);
		 
		 
		 totalCount = myPageService.myOrderListTotalCount(cookieUserId); //totalCount 가져온다음에 리스트를 가져와야지 이 바보야
		
		 
	    
		 if(totalCount > 0)
	      {
	         paging = new Paging("/myPage/userQnA", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
	         
	         userOrderSearch.setStartRow(paging.getStartRow());
	         userOrderSearch.setEndRow(paging.getEndRow());
	         
	         userOrderList = myPageService.myOrderList(userOrderSearch);
	      }
		
		
    	model.addAttribute("searchValue", searchValue);
	    model.addAttribute("orederByDate", orederByDate);
	    model.addAttribute("curPage", curPage);
	    model.addAttribute("paging", paging);
	    model.addAttribute("user", user);
	    model.addAttribute("userOrderSearch", userOrderSearch);
	    model.addAttribute("userOrderList", userOrderList);
		
	    
		return "/myPage/userOrder";
	}
	

	
	
	//나만의 레시피 내역(내가 올린 레시피들만 나오는)페이지로 이동 (이전에 MY레시피라고 되어있어요)
	@RequestMapping(value = "/myPage/myRecipe")
	public String myRecipe(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		
		//레시피 이름 조회
	      String searchType = HttpUtil.get(request, "searchType", "");
	      //레시피 설명(RECIPE_INTRO)
	      String searchValue = HttpUtil.get(request, "searchValue", "");
	      
	      //레시피 등록일 순
	     // String searchRegDate = HttpUtil.get(request, "searchRegDate", "");
	      
	      //현재 페이지
	      long curPage = HttpUtil.get(request, "curPage", (long)1);
	      //게시물 리스트
	      List<RecipeInfo> myRecipeList = null;
	      //조회 객체
	      RecipeInfo recipeSearch = new RecipeInfo();
	      //총 게시물 수
	      long totalCount = 0;
	      //페이징 객체
	      Paging paging = null;
		
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			
		  User user = userService.userSelect(cookieUserId);
		
		  
		 if(!StringUtil.isEmpty(searchType))
	      {
			 recipeSearch.setSearchType(searchType);
			 recipeSearch.setRecipeName(searchType);
	      }
		 
		 if(!StringUtil.isEmpty(searchValue))
	      {
			 recipeSearch.setSearchValue(searchValue);
			 recipeSearch.setRecipeIntro(searchValue);
	      }
	      
		 
		 
		 recipeSearch.setUserId(cookieUserId);
		 
		 totalCount = myPageService.myRecipeTotalCount(recipeSearch);
	      
	      logger.debug("============================");
	      logger.debug("totalCount : " + totalCount);
	      logger.debug("============================");
	      
	      if(totalCount > 0)
	      {
	         paging = new Paging("/myPage/myRecipe", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
	         
	         recipeSearch.setStartRow(paging.getStartRow());
	         recipeSearch.setEndRow(paging.getEndRow());
	         
	         myRecipeList = myPageService.myRecipeList(recipeSearch);
	      }
	      
	      model.addAttribute("user", user);
	      model.addAttribute("myRecipeList", myRecipeList);
	      model.addAttribute("searchType", searchType);
	      model.addAttribute("searchValue", searchValue);
	      model.addAttribute("curPage", curPage);
	      model.addAttribute("paging", paging);
	      
		
		return "/myPage/myRecipe";
	}

			
	
	//QnA카테고리 누르면 QnA게시판으로 이동
	@RequestMapping(value = "/board/QnA", method=RequestMethod.GET)
	public String QnA(HttpServletRequest request, HttpServletResponse response)
	{
		return "/board/QnA";
	}
	
			
			
				
//왼쪽 사이드바 카테고리의 공지사항, 이벤트 누르면 공지사항 게시판 페이지로 이동
		//MY 레시피 내역(내가 올린 레시피들만 나오는)페이지로 이동
	@RequestMapping(value = "/board/Notice", method=RequestMethod.GET)
	public String Notice(HttpServletRequest request, HttpServletResponse response)
	{
		return "/board/Notice";
	}
		
	
		
	//네비에서 마이페이지 누르면 마이페이지로 이동
	@RequestMapping(value = "/myPage/myPage")
	public String myPage(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		
		User user = userService.userSelect(cookieUserId);
		
		if(user != null)
		{
	      
		    //조회 객체
		    RecipeInfo recipeSearch = new RecipeInfo();
		    //총 게시물 수
		    long totalCount = 0;
			
		    //레시피 코드(INFO)
			int recipeCode = HttpUtil.get(request, "recipeCode", (int)0);
			
		   //레시피 상세조회(조리과정)
    	   List<RecipeCooking> cookingList = null;
    	   
    	   //프로필 사진
    	   //FileData fileData = HttpUtil.getFile(request, "hiBbsFile", UPLOAD_SAVE_DIR);
		    
			List<MyPage> myPage = myPageService.randomBookMark(cookieUserId);	//찜 한레시피
			
			List<UserOrder> userOrder = userOrderService.myRecentOrderlist(cookieUserId); //최근주문내역
			
			List<RecipeInfo> recipeInfo = recipeService.userRecentRegRecipe(cookieUserId); //최근마이레시피
			
			
			model.addAttribute("user", user);   //프로필에 넣을 사용자 이름 가져오기 위해 user객체 model에 담기
			model.addAttribute("myPage", myPage);			//찜 한레시피
			model.addAttribute("userOrder", userOrder); 	//최근주문내역
			model.addAttribute("recipeInfo", recipeInfo);   //최근 등록한 마이레시피
			
			model.addAttribute("recipeSearch", recipeSearch);
			model.addAttribute("recipeCode", recipeCode);
			
		    model.addAttribute("cookingList", cookingList);
		      
		      
			
			return "/myPage/myPage";
		}
		else
		{
			return "redirect:/"; 
		}
		
		
	}
		
	
	
	//마이페이지 프로필 이미지 변경 /myPage/userFileProc
		@RequestMapping(value = "/myPage/userFileProc")
		@ResponseBody
		public Response<Object>  userFileProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
			 Response<Object> ajaxResponse = new Response<Object>();
			 String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			 
			 User user = userService.userSelect(cookieUserId);
			 
			 if(user != null)
			 {
				 logger.debug("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				 logger.debug("user.getFileExt() : [" + user.getFileExt() + "]");
				 logger.debug("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
				 
				 if(!StringUtil.equals(user.getFileExt(), ""))
				 {
					 logger.debug("11111111111111111111111111111111111111111");
					 logger.debug("11111111111111111111111111111111111111111");
					 
					 FileUtil.deleteFile(UPLOAD_SAVE_DIR + 
		                        FileUtil.getFileSeparator() + (user.getUserId() + "." + user.getFileExt()));
				 }
				 
				 FileData fileData = HttpUtil.getFile(request, "userFile", UPLOAD_SAVE_DIR, user.getUserId());
				 
				 if(fileData != null && fileData.getFileSize() > 0)
	             {
					 
					 user.setFileExt(fileData.getFileExt());
					 
					 if(userService.userdFileUpdate(user) > 0)
					 {
						 ajaxResponse.setResponse(0, "success");
					 }
					 else
					 {
						 ajaxResponse.setResponse(500, "fail 2");
					 }
	             }
				 else
				 {
					 ajaxResponse.setResponse(400, "fail 1");
				 }
				 
			 }
			 else
			 {
				 ajaxResponse.setResponse(404, "fail 3");
			 }
 
			 
			return ajaxResponse;
		}
	
		
	
}
