package com.icia.web.controller;

import java.util.List;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.common.util.StringUtil;
import com.icia.web.model.Admin;
import com.icia.web.model.Paging;
import com.icia.web.model.QnaBoard;
import com.icia.web.model.QnaBoardAns;
import com.icia.web.model.RecipeInfo;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.AdminService;
import com.icia.web.service.BoardService;
import com.icia.web.service.RecipeService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;
import com.icia.web.util.JsonUtil;
import com.sun.org.apache.xml.internal.resolver.helpers.Debug;

@Controller("adminController")
public class AdminController 
{
		private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	
		@Autowired
		private AdminService adminService;
		
		// 쿠키명
		@Value("#{env['auth.admincookie.name']}")
		private String AUTH_ADMINCOOKIE_NAME;
		
		@Autowired
		private BoardService boardService;
		@Autowired
		private RecipeService recipeService;
		
		
		@Autowired
		private UserService userService;
		
		private static final int LIST_COUNT = 5;		//한 페이지의 게시물 수
		private static final int PAGE_COUNT = 5;		//페이징 수
	
			  //관리자 로그인
			@RequestMapping(value="/user/adminLoginProc", method=RequestMethod.POST)
			@ResponseBody   
			public Response<Object> adminLoginProc(HttpServletRequest request, HttpServletResponse response)
			{
				String adminId = HttpUtil.get(request, "adminId");
				String adminPwd = HttpUtil.get(request, "adminPwd");
				Response<Object> ajaxResponse = new Response<Object>();
		        
				if(!StringUtil.isEmpty(adminId) && !StringUtil.isEmpty(adminPwd))
				{
					Admin admin = adminService.adminSelect(adminId);
		            
					if(admin != null)
		            {
						if(StringUtil.equals(admin.getAdminPwd(), adminPwd))
						{
							// AUTH_COOKIE_NAME: 변수명, CookieUtil.stringToHex(userId):값
							CookieUtil.addCookie(response, "/", -1, AUTH_ADMINCOOKIE_NAME, CookieUtil.stringToHex(adminId));
							
		                  
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
					logger.debug("[AdminController] /user/adminLoginProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
				}
		         
				return ajaxResponse;
			}

			
			@RequestMapping(value = "/admin/adminIndex", method=RequestMethod.GET)
			public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			{
				//베스트 레시피 리스트
				List<RecipeInfo> indexBestRecipeList = null;
				//조회 객체
				RecipeInfo list = new RecipeInfo();
				
				//디저트 리스트
				List<RecipeInfo> indexDessertList = null;
				//메인요리 리스트
				List<RecipeInfo> indexMainDishesList = null;
				
				indexBestRecipeList = recipeService.indexBestRecipeList(list);  //베스트 레시피
				indexDessertList = recipeService.indexDessertList(list);		//디저트 리스트
				indexMainDishesList = recipeService.indexMainDishesList(list);	//메인요리 리스트
			
				
				model.addAttribute("indexBestRecipeList", indexBestRecipeList);
				model.addAttribute("indexDessertList", indexDessertList);
				model.addAttribute("indexMainDishesList", indexMainDishesList);
				model.addAttribute("list", list);
				
				return "/admin/adminIndex";
			}
			
			//로그아웃
			@RequestMapping(value="/adminLoginOut", method=RequestMethod.GET)
			public String adminLoginOut(HttpServletRequest request, HttpServletResponse response)
			{
				if(CookieUtil.getCookie(request, AUTH_ADMINCOOKIE_NAME) != null)
				{
					CookieUtil.deleteCookie(request, response, "/", AUTH_ADMINCOOKIE_NAME);
				}
		         
				return "redirect:/";      //재접속
			}
			//Q&A게시판 총 게시물
			@RequestMapping(value="/admin/adminQna")
			public String adminQna(ModelMap model,HttpServletRequest request, HttpServletResponse response)
			{                        	                                    
				//현재 페이지
				long curPage = HttpUtil.get(request, "curPage", (long)1);
				//게시물 리스트
				List<QnaBoard> qnaList = null;	
				//객체
				QnaBoard search = new QnaBoard();
				//총 게시물 수
				long totalCount = 0;
				//페이징 객체
				Paging paging = null;
				
				totalCount = boardService.qnaBoardListCount(search);
				
				if(totalCount > 0)
				{
					//페이징 객체 생성	
					paging = new Paging("/board/qna", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					
					search.setStartRow(paging.getStartRow());
					search.setEndRow(paging.getEndRow());
					
					qnaList = boardService.qnaBoardList(search);
				}		
								
				model.addAttribute("qnaList", qnaList);		
				model.addAttribute("curPage", curPage);		
				model.addAttribute("paging",paging);
				
			
				
				return "/admin/adminQna";
			}
			
			//게시물답변 조회
			@RequestMapping(value="/admin/adminQnaView")
			public String adminQnaView(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			{
				//쿠키값
				String cookieUserId = CookieUtil.getHexValue(request, AUTH_ADMINCOOKIE_NAME);
				//게시물 번호
				long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);			
				//현재 페이지
				long curPage = HttpUtil.get(request, "curPage", (long)1);
				//본인글 여부
				String boardMe = "N";
				
				QnaBoard qnaBoard = null;
				QnaBoardAns qnaBoardAns = null;
				
				//상세페이지 조회
				if(qnaSeq > 0)
				{
					qnaBoard = boardService.qnaBoardView(qnaSeq);
					
					if(StringUtil.equals(qnaBoard.getAnsStatus(), "답변완료"))
					{
						qnaBoardAns = boardService.qnaBoardAnsSelect(qnaSeq);
					}
					
					//본인 게시글인지 여부를 확인하고 게시글의 수정과 삭제를 추가 할려고 조건을 줌
					if(qnaBoard != null && StringUtil.equals(qnaBoard.getUserId(), cookieUserId))
					{
						boardMe = "Y";
					}
				}
				
				model.addAttribute("boardMe", boardMe);
				model.addAttribute("qnaSeq", qnaSeq);
				model.addAttribute("qnaBoard", qnaBoard);	
				model.addAttribute("qnaBoardAns", qnaBoardAns);
				model.addAttribute("curPage", curPage);			
				
				return "/admin/adminQnaView";
			}
			
			//답변게시물 수정 화면
			@RequestMapping(value="/admin/adminQnaUpdateForm")
			public String adminQnaUpdateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			{
					//쿠키 값
					String cookieUserId = CookieUtil.getHexValue(request, AUTH_ADMINCOOKIE_NAME);
					
					//게시물번호
					long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);				
					//현재페이지
					long curPage = HttpUtil.get(request, "curPage", (long)1);
						
					QnaBoardAns qnaBoardAns = null;
					User user = null;
						
					if(qnaSeq > 0)
					{
						qnaBoardAns = boardService.adminQnaBoardViewUpdate(qnaSeq);
							
						if(qnaBoardAns != null)
						{
							if(StringUtil.equals(qnaBoardAns.getAdminId(), cookieUserId))
							{
								user = userService.userSelect(cookieUserId);
							}
							
						}
					}
					else
					{
						return"/admin/adminQna";
					}
										
						model.addAttribute("curPage", curPage);
						model.addAttribute("qnaBoardAns", qnaBoardAns);
						model.addAttribute("user", user);
						
						return "/admin/adminQnaUpdateForm";
					
			}
		
			//답변게시물 수정
			@RequestMapping(value="/admin/adminQnaUpdateProc", method=RequestMethod.POST)
			@ResponseBody		//ajax통신은 리턴 타입이 객체라 @ResponseBody 어노테이션 선언함
			public Response<Object> qnaUpdateProc(MultipartHttpServletRequest request, HttpServletResponse response)
			{
					Response<Object> ajaxResponse = new Response<Object>();
					String cookieUserId = CookieUtil.getHexValue(request, AUTH_ADMINCOOKIE_NAME);
					
					long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);
					String ansTitle = HttpUtil.get(request, "ansTitle", "");
					String ansContent = HttpUtil.get(request, "ansContent", "");
						System.out.println(qnaSeq);
						System.out.println("11111111111111111111111111");
					if(qnaSeq > 0 && !StringUtil.isEmpty(ansTitle) && !StringUtil.isEmpty(ansContent))
					{
						QnaBoardAns qnaBoardAns = boardService.qnaBoardAnsSelect(qnaSeq);
						//게시글이 있을 경우
						if(qnaBoardAns != null)
						{
							//다이렉트 경로로 왔을 경우를 대비해서
							if(StringUtil.equals(qnaBoardAns.getAdminId(), cookieUserId))
							{
								//게시글에 있는 제목과 내용을 수정하기 위해 값을 세팅
								qnaBoardAns.setAnsTitle(ansTitle);
								qnaBoardAns.setAnsContent(ansContent);
								qnaBoardAns.setQnaSeq(qnaSeq);
										
								
										System.out.println("qnaBoardAnsqnaBoardAnsqnaBoardAns");
										System.out.println(qnaBoardAns.getAdminId());
										System.out.println(qnaBoardAns.getQnaSeq());
										System.out.println(qnaBoardAns.getAnsTitle());
								//service에서 트랜잭션이 사용되서 try~catch문을 사용
								try		
								{
									if(boardService.qnaBoardAnsUpdate(qnaBoardAns) > 0)
									{
										ajaxResponse.setResponse(0, "success");
									}
									else
									{
										ajaxResponse.setResponse(500, "internal server error222");
									}
								}
								catch(Exception e)
								{
									logger.error("[BoardCotroller] qnaUpdateProc Exception", e);
									ajaxResponse.setResponse(500, "internal server error");
								}
							}
							else
							{
								ajaxResponse.setResponse(403, "server error");
							}
						}
						else
						{
							//조회를 했는데 데이터가 없는 경우
							ajaxResponse.setResponse(404, "not found");
						}
									
					}
					else
					{
						ajaxResponse.setResponse(400, "Bad request");
					}

						return ajaxResponse;
				}
			
			//관리자 레시피 랭킹(조회순)
			@RequestMapping(value="/admin/adminBestRecipe")			
			public String list(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			{
				//현재 페이지
				long curPage = HttpUtil.get(request, "curPage", (long)1);
				//게시물 리스트
				List<RecipeInfo> list = null;
				//조회 객체
				RecipeInfo search = new RecipeInfo();
				
				//총 게시물 수
				long totalCount = 0;
				//페이징 객체
				Paging paging = null;
				
				totalCount = recipeService.recipeListCount(search);
				//totalCount 디버깅용
				logger.debug("===============================");
				logger.debug("totalCount : " + totalCount);
				logger.debug("===============================");
				
				//BoardList호출
				if(totalCount > 0)
				{
					//페이징 객체 생성	
					paging = new Paging("/admin/adminBestRecipe", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					
					search.setStartRow(paging.getStartRow());
					search.setEndRow(paging.getEndRow());
					
					list = recipeService.recipeList(search);
				}
				
				//jsp에 사용할 모델맵에 담아줌
				model.addAttribute("list", list);
				model.addAttribute("curPage", curPage);
				//모델맵에서 페이징 처리를 해줌
				model.addAttribute("paging",paging);
				
				return "/admin/adminBestRecipe";
			}
			
			//관리자 레시피 랭킹(추천순)
			@RequestMapping(value="/admin/adminBestRecipe2")
			public String listRcm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			{
				//현재 페이지
				long curPage = HttpUtil.get(request, "curPage", (long)1);
				//게시물 리스트
				List<RecipeInfo> list = null;
				//조회 객체
				RecipeInfo search = new RecipeInfo();
				
				//총 게시물 수
				long totalCount = 0;
				//페이징 객체
				Paging paging = null;
				
				totalCount = recipeService.recipeListCount(search);
				//totalCount 디버깅용
				logger.debug("===============================");
				logger.debug("totalCount : " + totalCount);
				logger.debug("===============================");
				
				//BoardList호출
				if(totalCount > 0)
				{
					//페이징 객체 생성	
					paging = new Paging("/admin/adminBestRecipe2", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					
					search.setStartRow(paging.getStartRow());
					search.setEndRow(paging.getEndRow());
					
					list = recipeService.recipeListRcm(search);
				}
				
				//jsp에 사용할 모델맵에 담아줌
				model.addAttribute("list", list);
				model.addAttribute("curPage", curPage);
				//모델맵에서 페이징 처리를 해줌
				model.addAttribute("paging",paging);
				
				return "/admin/adminBestRecipe2";
			}
			
			
			//관리자 레시피 찾기
			@RequestMapping(value="/admin/adminRecipeSearch")				
			public String adminRecipeSearch(ModelMap model, HttpServletRequest request, HttpServletResponse response)
			{
				//조회항목(1:작성자, 2:제목, 3:내용)
				String searchType = HttpUtil.get(request, "searchType", "");
				//조회값
				String searchValue = HttpUtil.get(request, "searchValue", "");
				//현재 페이지
				long curPage = HttpUtil.get(request, "curPage", (long)1);
				//게시물 리스트
				List<RecipeInfo> nationList = null;
				//조회 객체
				RecipeInfo search = new RecipeInfo();
				//총 게시물 수
				long totalCount = 0;
				//페이징 객체
				Paging paging = null;
								
				
				if(!StringUtil.isEmpty(searchType) || !StringUtil.isEmpty(searchValue))
				{
					search.setSearchType(searchType);
					search.setSearchValue(searchValue);
				}
				
				totalCount = recipeService.recipeListCount(search);						
				
				//BoardList호출
				if(totalCount > 0)
				{
					//페이징 객체 생성	
					paging = new Paging("/recipe/recipeSearch", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					
					search.setStartRow(paging.getStartRow());
					search.setEndRow(paging.getEndRow());
					
					nationList = recipeService.recipeNationList(search);
				}
			
				
				
				//jsp에 사용할 모델맵에 담아줌
				model.addAttribute("nationList", nationList);
				model.addAttribute("searchType", searchType);
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("curPage", curPage);
				//모델맵에서 페이징 처리를 해줌
				model.addAttribute("paging",paging);
				
				return "/admin/adminRecipeSearch";
			}

}
