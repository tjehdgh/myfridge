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

import com.icia.common.model.FileData;
import com.icia.common.util.StringUtil;

import com.icia.web.model.Paging;
import com.icia.web.model.QnaBoard;
import com.icia.web.model.QnaBoardAns;
import com.icia.web.model.Response;
import com.icia.web.model.User;
import com.icia.web.service.BoardService;
import com.icia.web.service.UserService;
import com.icia.web.util.CookieUtil;
import com.icia.web.util.HttpUtil;

@Controller("boardController")
public class BoardController 
{
		private static Logger logger = LoggerFactory.getLogger(RecipeController.class);
			 
		//쿠키명
		@Value("#{env['auth.cookie.name']}")			
		private String AUTH_COOKIE_NAME;
		
		@Autowired
		private UserService userService;
		
		@Autowired
		private BoardService boardService;
		
		private static final int LIST_COUNT = 5;		//한 페이지의 게시물 수
		private static final int PAGE_COUNT = 5;		//페이징 수
		
		//Q&A게시판 총 게시물
		@RequestMapping(value="/board/qna")
		public String qna(ModelMap model,HttpServletRequest request, HttpServletResponse response)
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
			
			logger.debug("11111111111111111111111");
			
			return "/board/qna";
		}
		
		
		//qna게시판 등록 폼
		@RequestMapping(value="/board/qnaWriteForm")
		public String qnaWriteForm(ModelMap model,HttpServletRequest request, HttpServletResponse response)
		{                                            		
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			//사용자 정보 조회
			User user = userService.userSelect(cookieUserId);
			model.addAttribute("user", user);
			
			return "/board/qnaWriteForm";
		}
	
		//게시물 등록(aJax)
		@RequestMapping(value="/board/qnaWriteProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> qnaWriteProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			String qnaTitle = HttpUtil.get(request, "qnaTitle", "");
			String qnaContent = HttpUtil.get(request, "qnaContent", "");
			
			if(!StringUtil.isEmpty(qnaTitle) && !StringUtil.isEmpty(qnaContent))
			{
				QnaBoard qnaBoard = new QnaBoard();
				
				qnaBoard.setUserId(cookieUserId);
				qnaBoard.setQnaTitle(qnaTitle);
				qnaBoard.setQnaContent(qnaContent);														
				//서비스 호출
				try
				{
					if(boardService.qnaBoardInsert(qnaBoard) > 0)
					{
						ajaxResponse.setResponse(0, "success");
					}
					else
					{
						ajaxResponse.setResponse(500, "Internal server error");
					}
				}
				catch(Exception e)
				{
					logger.error("[BoardController] qnaWriteProc Exception", e);
					ajaxResponse.setResponse(500, "internal server error");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "Bad Request");
			}
			return ajaxResponse;
		}
		
		
		//게시물 조회
		@RequestMapping(value="/board/qnaView")
		public String qnaView(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			//쿠키값
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			//게시물 번호
			long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);			
			//현재 페이지
			long curPage = HttpUtil.get(request, "curPage", (long)1);
			//본인글 여부
			String boardMe = "N";
			
			QnaBoard qnaBoard = null;
			QnaBoardAns qnaBoardAns = null;
			
			logger.debug("넘어왔니????++++++");
			logger.debug("qnaSeq 넘어왔니 : " + qnaSeq);
			logger.debug("넘어왔니????++++++");
			
			
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
			
			return "/board/qnaView";
		}
	
		//게시물 답변 화면
		@RequestMapping(value="/board/qnaReplyForm", method=RequestMethod.POST)
		public String replyForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);
			long curPage = HttpUtil.get(request, "curPage", (long)1);
			
			
			QnaBoard qnaBoard = null;
			User user = null;
			
			if(qnaSeq > 0)
			{
				qnaBoard = boardService.qnaBoardSelect(qnaSeq);
				
				//게시물 정보가 있을 때
				if(qnaBoard != null)
				{
					user = userService.userSelect(cookieUserId);
				}
			}						
			model.addAttribute("curPage", curPage);
			model.addAttribute("qnaBoard", qnaBoard);
			model.addAttribute("user", user);
			
			return "/board/qnaReplyForm";
		}
			
	
		//게시물 수정 화면
		@RequestMapping(value="/board/qnaUpdateForm")
		public String qnaUpdateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
				//쿠키 값
				String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
				//게시물번호
				long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);				
				//현재페이지
				long curPage = HttpUtil.get(request, "curPage", (long)1);
					
				QnaBoard qnaBoard = null;
				User user = null;
					
				if(qnaSeq > 0)
				{
					qnaBoard = boardService.qnaBoardViewUpdate(qnaSeq);
						
					if(qnaBoard != null)
					{
						if(StringUtil.equals(qnaBoard.getUserId(), cookieUserId))
						{
							user = userService.userSelect(cookieUserId);
						}
						else
						{
							qnaBoard = null;
						}
					}
				}
									
					model.addAttribute("curPage", curPage);
					model.addAttribute("qnaBoard", qnaBoard);
					model.addAttribute("user", user);
					
					return "/board/qnaUpdateForm";
				
		}
	
		//게시물 수정
		@RequestMapping(value="/board/qnaUpdateProc", method=RequestMethod.POST)
		@ResponseBody		//ajax통신은 리턴 타입이 객체라 @ResponseBody 어노테이션 선언함
		public Response<Object> qnaUpdateProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
				Response<Object> ajaxResponse = new Response<Object>();
				String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
				long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);
				String qnaTitle = HttpUtil.get(request, "qnaTitle", "");
				String qnaContent = HttpUtil.get(request, "qnaContent", "");
																				
				if(qnaSeq > 0 && !StringUtil.isEmpty(qnaTitle) && !StringUtil.isEmpty(qnaContent))
				{
					QnaBoard qnaBoard = boardService.qnaBoardSelect(qnaSeq);
					//게시글이 있을 경우
					if(qnaBoard != null)
					{
						//다이렉트 경로로 왔을 경우를 대비해서
						if(StringUtil.equals(qnaBoard.getUserId(), cookieUserId))
						{
							//게시글에 있는 제목과 내용을 수정하기 위해 값을 세팅
							qnaBoard.setQnaTitle(qnaTitle);
							qnaBoard.setQnaContent(qnaContent);
									
							
									
							//service에서 트랜잭션이 사용되서 try~catch문을 사용
							try		
							{
								if(boardService.qnaBoardUpdate(qnaBoard) > 0)
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
					
		//게시물 삭제
		@RequestMapping(value="/board/qnaDelete", method=RequestMethod.POST)
		@ResponseBody	//ajax통신은 리턴 타입이 객체라 @ResponseBody 선언
		public Response<Object> qnaDelete(HttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);
			
			if(qnaSeq > 0)
			{
				//다이렉트로 들어왔을 경우를 대비해서
				QnaBoard qnaBoard = boardService.qnaBoardSelect(qnaSeq);
				
				if(qnaBoard != null)
				{
					//게시글이 존재할 때 게시글 작성자와 로그인 사용자가 같은지 체크(로그인 한 사용자 본인 게시글이 맞는지 체크)
					if(StringUtil.equals(qnaBoard.getUserId(), cookieUserId))
					{
						try
						{
							//답글의 유무를 확인(답글이 있을 경우 삭제를 못하게 할려고 함)
							if(boardService.qnaBoardAnswersCount(qnaBoard.getQnaSeq()) > 0)
							{
								//답글이 있으면 삭제 못하도록
								ajaxResponse.setResponse(-999, "answers exist and cannot be deleted");
							}
							else	
							{
								//답글이 없는 경우
								if(boardService.qnaBoardDelete(qnaSeq) > 0)
								{
									ajaxResponse.setResponse(0, "success");
								}
								else
								{
									ajaxResponse.setResponse(500, "server error222");
								}
							}
						}
						catch(Exception e)
						{
							logger.error("[HiBoardController] delete Exception", e);
							ajaxResponse.setResponse(500, "server error");
						}
					}
					else
					{
						//내 게시글이 아닐 경우
						ajaxResponse.setResponse(403, "server error");
					}
					
				}
				else
				{
					//게시물이 존재하지 않을 때
					ajaxResponse.setResponse(404, "not found");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "bad Request");
			}
			
			return ajaxResponse;
		}
	
			
		//게시물 답변
		@RequestMapping(value="/board/qnaReplyProc", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> qnaReplyProc(MultipartHttpServletRequest request, HttpServletResponse response)
		{
			Response<Object> ajaxResponse = new Response<Object>();
			String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			
			long qnaSeq = HttpUtil.get(request, "qnaSeq", (long)0);		
			String ansTitle = HttpUtil.get(request, "ansTitle", "");
			String ansContent = HttpUtil.get(request, "ansContent", "");									
					
			if(qnaSeq > 0 && !StringUtil.isEmpty(ansContent) &&
					!StringUtil.isEmpty(ansTitle))
			{
				//부모 글에 대한 정보
				QnaBoard parentQnaBoard = boardService.qnaBoardSelect(qnaSeq);
						
				if(parentQnaBoard != null)
				{
					if(boardService.qnaBoardAnsCheck(qnaSeq)<=0)
					{
						//게시물 답변은 로그인한 사람의 값을 세팅하기 위해 객체 생성
						QnaBoardAns qnaBoardAns = new QnaBoardAns();
								
						qnaBoardAns.setAnsContent(ansContent);
						qnaBoardAns.setAnsTitle(ansTitle);
						qnaBoardAns.setQnaSeq(qnaSeq);
						
																		
						try 
						{
							logger.debug("1111111111111111111111111111");
							if(boardService.qnaBoardAnsReplyInsert(qnaBoardAns) > 0)
							{
								logger.debug("222222222222222222222222222222");
								ajaxResponse.setResponse(0, "success");
								parentQnaBoard.setAnsStatus("답변완료");
								boardService.qnaStatusUpdate(parentQnaBoard);
								logger.debug("333333333333333333333333333333");
							}
							else
							{
								ajaxResponse.setResponse(500, "internal server error22222");
							}
						}
						catch(Exception e)
						{
							logger.error("[HiBoardController] qnaReplyProc Exception", e);
							ajaxResponse.setResponse(500, "internal server error");
						}
					}
					else
					{
						logger.debug("답글이 존재합니다");
						ajaxResponse.setResponse(300, "internal server error");
					}
				}
				else 
				{
					//부모글이 없을때
					ajaxResponse.setResponse(404, "not found");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "bad request");
			}
					
					
			return ajaxResponse;
		}
		
		
		//공지사항 뷰
		@RequestMapping(value="/board/noticeView")
		public String noticeView(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			return "/board/noticeView";
		}
		
		//공지사항
		@RequestMapping(value="/board/notice" , method=RequestMethod.GET)
	    public String notice(HttpServletRequest request, HttpServletResponse response)
	    {                                                            
	          return "/board/notice";
	    }
		
		//이벤트
		@RequestMapping(value="/admin/event" , method=RequestMethod.GET)
	    public String event(HttpServletRequest request, HttpServletResponse response)
	    {                                                            
	          return "/admin/event";
	    }
		
		
		
			
}
