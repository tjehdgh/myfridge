package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.web.dao.BoardDao;
import com.icia.web.dao.MyPageDao;
import com.icia.web.dao.RecipeInfoDao;
import com.icia.web.dao.UserOrderDao;
import com.icia.web.model.MyPage;
import com.icia.web.model.QnaBoard;
import com.icia.web.model.RecipeInfo;
import com.icia.web.model.UserOrder;

@Service("myPageService")
public class MyPageService
{
	private static Logger logger = LoggerFactory.getLogger(MyPageService.class);
	
	@Autowired 
	private MyPageDao myPageDao;
	
	@Autowired 
	private UserOrderDao userOrderDao;
	
	
	@Autowired 
	private RecipeInfoDao recipeInfoDao;
	
	
	@Autowired 
	private BoardDao boardDao;
	
	//내가 찜한 레시피중에서 랜덤으로 3개만 뽑아서 마이페이지 기본 페이지에서 보여줌
	public List<MyPage> randomBookMark(String userId)
	{
		List<MyPage> myPage = null;
		
		
		try
		{
			myPage = myPageDao.randomBookMark(userId); //찜한 레시피 3개 랜덤으로 가져오기
			
			
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] randomBookMark Exception", e);
		}
		
		
		return myPage;
	}
	
	
	
	//찜한 레시피 리스트 모두 가져오기
	public List<RecipeInfo> myBookMarkList(RecipeInfo recipeInfo1)
	{
		List<RecipeInfo> recipeInfo = null;
		
		try
		{
			recipeInfo = recipeInfoDao.myBookMarkList(recipeInfo1); 
			
			
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] myBookMarkList Exception", e);
		}
		
		return recipeInfo;
	}
	
	
	
	
	
	//마이페이지 내가 찜한 레시피 총 게시물 수
	public int bookMarkTotalCount(RecipeInfo recipeInfo)
	{
		int count = 0;
		
		try
		{
			count = recipeInfoDao.bookMarkTotalCount(recipeInfo); 
	    }
		catch(Exception e)
		{
			logger.error("[MyPageService] bookMarkTotalCount Exception", e);
		}
		
		return count;
	}
	
	
	
	
	//마이페이지 나만의 레시피 총 개시물 수
	public int myRecipeTotalCount(RecipeInfo recipeInfo)
	{
		int count = 0;
		
		try
		{
			count = recipeInfoDao.myRecipeTotalCount(recipeInfo);
	    }
		catch(Exception e)
		{
			logger.error("[MyPageService] myRecipeTotalCount Exception", e);
		}
		
		return count;
	}
	
	
	
	//마이페이지 나만의 레시피 리스트 가져오기
	public List<RecipeInfo> myRecipeList(RecipeInfo recipeInfo)
	{
		List<RecipeInfo> myRecipeList = null;
		
		try
		{
			myRecipeList = recipeInfoDao.myRecipeList(recipeInfo);
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] myRecipeList Exception", e);
		}
		
		return myRecipeList;
	}
	
	
	
	//마이페이지 문의내역 리스트 가져오기
	public List<QnaBoard> myQnaList(QnaBoard qnaBoard)
	{
		List<QnaBoard> myQnaList = null;
		
		
		try
		{
			myQnaList = boardDao.myQnaList(qnaBoard);
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] myQnaList Exception", e);
		}
		
		
		return myQnaList;
	}
	
	
	//마이페이지 문의내역 총 게시물 수
	public int myQnaListTotalCount(QnaBoard qnaBoard)
	{
		int count = 0;
		
		try
		{
			count = boardDao.myQnaListTotalCount(qnaBoard);
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] myQnaListTotalCount Exception", e);
		}
		
		
		return count;
	}
	
	
	//마이페이지 주문내역 총 게시물 수
	public int myOrderListTotalCount(String userId)
	{
		int count = 0;
		
		try
		{
			count = userOrderDao.myOrderListTotalCount(userId);
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] myOrderListTotalCount Exception", e);
		}
		
		return count;
	}
	
	
	//마이페이지 주문 내역 리스트
	public List<UserOrder> myOrderList(UserOrder userOrder)
	{
		List<UserOrder> UserOrderList = null;
		
		try
		{
			UserOrderList = userOrderDao.myOrderList(userOrder);
		}
		catch(Exception e)
		{
			logger.error("[MyPageService] myOrderList Exception", e);
		}
		
		
		return UserOrderList;
	}
	
	
}
