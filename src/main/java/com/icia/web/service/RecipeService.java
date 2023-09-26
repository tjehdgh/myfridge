package com.icia.web.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.common.util.FileUtil;
import com.icia.web.dao.MyPageDao;
import com.icia.web.dao.RecipeInfoDao;
import com.icia.web.model.BookMark;
import com.icia.web.model.QnaBoard;
import com.icia.web.model.RecipeCooking;
import com.icia.web.model.RecipeInfo;
import com.icia.web.model.RecipeIrdnt;
import com.icia.web.model.RecipeRcm;
import com.icia.web.model.RecipeReply;

@Service("recipeService")
public class RecipeService 
{
   private static Logger logger = LoggerFactory.getLogger(RecipeService.class);
   
   	//파일 저장 경로
 	@Value("#{env['upload.save.dir']}")
 	private String UPLOAD_SAVE_DIR;
   
   @Autowired
   private RecipeInfoDao recipeInfoDao;
   
   	@Autowired
	private MyPageDao myPageDao;
	
   
   
   //게시물 리스트(조회순)
   public List<RecipeInfo> recipeList(RecipeInfo recipeInfo)
   {
	   List<RecipeInfo> list = null;
	   
	   //dao가 레파지토리 어노테이션에서 오류가 발생할 수 있음으로 try~catch구문으로 감싸줘야함
	   try
	   {
		   list = recipeInfoDao.recipeList(recipeInfo);
	   }
	   catch(Exception e)
	   {
		   logger.error("[RecipeService] recipedList Exception", e);
	   }
	   
	   return list;
   }
   
   //총 게시물 수
   public long recipeListCount(RecipeInfo recipeInfo)
   {
	   long count = 0;
	   
	   try
	   {
		   count = recipeInfoDao.recipeListCount(recipeInfo);
	   }
	   catch(Exception e)
	   {
		   logger.error("[RecipeService] recipeListCount Exception", e);
	   }
	   
	   return count;
   }
   
   
   //레시피 리스트(음식분류)
   public List<RecipeInfo> recipeNationList(RecipeInfo recipeInfo)
   {
	   List<RecipeInfo> nationList = null;
	   
	   //dao가 레파지토리 어노테이션에서 오류가 발생할 수 있음으로 try~catch구문으로 감싸줘야함
	   try
	   {
		   nationList = recipeInfoDao.recipeNationList(recipeInfo);
	   }
	   catch(Exception e)
	   {
		   logger.error("[RecipeService] recipeNationList Exception", e);
	   }
	   
	   return nationList;
   }
   
   //레시피 상세조회(INFO)
   public RecipeInfo recipeInfoView(int recipeCode)
   {
      RecipeInfo recipeInfo = null;
      
      try
      {
         recipeInfo = recipeInfoDao.recipeInfoSelect(recipeCode); 
         recipeInfoDao.recipeReadCntPlus(recipeCode);
      }
      catch(Exception e)
      {
         logger.error("[RecipeService] recipeInfoView Exception", e);
      }
      
      return recipeInfo;
   }
   
   //레시피 상세조회(재료)
   public List<RecipeIrdnt> recipeIrdntView(int recipeCode)
   {
	   List<RecipeIrdnt> irdntList = null;
	   
	   try
	   {
		   irdntList = recipeInfoDao.recipeIrdntSelect(recipeCode);
	   }
	   catch(Exception e)
	   {
		   logger.error("[RecipeService] recipeIrdntView Exception", e);
	   }
	   
	   return irdntList;
   }
   
   //레시피 상세조회(조리과정)
   public List<RecipeCooking> recipeCookingView(int recipeCode)
   {
	   List<RecipeCooking> cookingList = null;
	   
	   try
	   {
		   cookingList = recipeInfoDao.recipeCookingSelect(recipeCode);
	   }
	   catch(Exception e)
	   {
		   logger.error("[RecipeService] recipeCookingView Exception", e);
	   }
	   
	   return cookingList;
   }
   
   //레시피 상세조회(부재료)
   public List<RecipeIrdnt> recipeIrdntView2(int recipeCode)
   {
      List<RecipeIrdnt> irdntList2 = null;
      
      try
      {
         irdntList2 = recipeInfoDao.recipeIrdntSelect2(recipeCode);
      }
      catch(Exception e)
      {
         logger.error("[RecipeService] recipeIrdntView2 Exception", e);
      }
      
      return irdntList2;
   }
 	
   //마이페이지 홈에서 유저가 최근 등록한 레시피 3개보여줌
 	public List<RecipeInfo> userRecentRegRecipe(String userId)
 	{
 		List<RecipeInfo> recipeInfo = null;
 			
 		try
 		{
 				recipeInfo = recipeInfoDao.userRecentRegRecipe(userId);    //찜한 레시피 3개 랜덤으로 가져오기
 		}
 		catch(Exception e)
 		{
 			logger.error("[MyPageService] userRecentRegRecipe Exception", e);
 		}
 			
 			
 			return recipeInfo;
 		}
 	
 	//레시피 상세조회 댓글 작성
 	 public int recipeReplyInsert(RecipeReply recipeReply) throws Exception
	 {
  	   int count = 0;
 	 	   
 	 	  count = recipeInfoDao.recipeReplyInsert(recipeReply);
 	 	   
 	 	  return count;
	 }
 	 	
 	 //레시피 댓글 리스트(레시피 코드별)
 	 public List<RecipeReply> recipeReplydList(RecipeReply recipeReply)
 	 {
 		 List<RecipeReply> ReplyList = null;
 	 	   
 		 //dao가 레파지토리 어노테이션에서 오류가 발생할 수 있음으로 try~catch구문으로 감싸줘야함
 		 try
 		 {
 			 ReplyList = recipeInfoDao.recipeReplyList(recipeReply);
 		 }
 		 catch(Exception e)
 		 {
 			 logger.error("[RecipeService] recipeReplydList Exception", e);
 		 }
 	 	   
 		 return ReplyList;
 	 }
 	    
 	 //레시피 댓글 수(레시피 코드별)
 	 public long recipeReplyListCount(int recipeCode)
 	 {
 		 long count = 0;
 	 	   
 		 try
 		 {
 			 count = recipeInfoDao.recipeReplyListCount(recipeCode);
 		 }
 		 catch(Exception e)
 		 {
 			 logger.error("[RecipeService] recipeReplyListCount Exception", e);
 		 }
 	 	   
 		 return count;
 	 }
 	    
 	 //레시피 추천수 등록
 	 public int recipeRcmInsert(RecipeRcm recipeRcm) throws Exception
 	 {
 		 int count = 0;
 	   	   
 		 count = recipeInfoDao.recipeRcmInsert(recipeRcm);
 		 
 	   	   
 		 return count;
 	 }
 	   	
 	 //레시피 추천여부 확인
 	 public long recipeRcmCheck(RecipeRcm recipeRcm)
 	 {
	 	long count =0;
 	 	   
 		 try
 		 {
 			count = recipeInfoDao.recipeRcmCheck(recipeRcm);
 		 }
 		 catch(Exception e)
 		 {
 			 logger.error("[RecipeService] recipeRcmCheck Exception", e);
 		 }
 	 	   
 		 return count;
 	 }
 	
 	 //레시피 추천 삭제
 	 public int recipeRcmDelete(RecipeRcm recipeRcm)
 	 {
 		 int count = 0;
 		 
 		 try
 		 {
 			 count = recipeInfoDao.recipeRcmDelete(recipeRcm);
 		 }
 		 catch(Exception e)
 		 {
 			logger.error("[RecipeService] recipeRcmDelete Exception", e);
 		 }
 		 
 		 return count;
 	 }
 	
 	 //레시피 추천시 RECIPE_INFO테이블 추천수 증가
 	 public int recipeInfoRcmUpdate(int recipeCode)
 	 {
 		 int count = 0;
 		 
 		 try
 		 {
 			count = recipeInfoDao.recipeInfoRcmUpdate(recipeCode);
 		 }
 		 catch(Exception e)
 		 {
 			logger.error("[RecipeService] recipeInfoRcmUpdate Exception", e);
 		 }
 		 return count;
 	 }
 	
 	 //레시피 추천시 RECIPE_INFO테이블 추천수 취소
 	 public int recipeInfoRcmUpdateCancel(int recipeCode)
 	 {
 		 int count = 0;
 		 
 		 try
 		 {
 			 count = recipeInfoDao.recipeInfoRcmUpdateCancel(recipeCode);
 		 }
 		 catch(Exception e)
 		 {
 			logger.error("[RecipeService] recipeInfoRcmUpdateCancel Exception", e);
 		 }
 		 return count;
 	 }
 	 
 	 
 	 //레시피 리스트(추천순)
 	 public List<RecipeInfo> recipeListRcm(RecipeInfo recipeInfo)
 	 {
 		List<RecipeInfo> listRcm = null;
 		
 		try
 		{
 			listRcm = recipeInfoDao.recipeListRcm(recipeInfo);
 		}
 		catch(Exception e)
 		{
 			logger.error("[RecipeService] recipeListRcm Exception", e);
 		}
 		
 		return listRcm;
 	 }
 	 
 	 //레시피 즐겨찾기 등록
 	 public int recipeBookMarkInsert(BookMark bookMark)
 	 {
 		 int count = 0;
 		 
 		 try
 		 {
 			 count = recipeInfoDao.recipeBookMarkInsert(bookMark);
 		 }
 		 catch(Exception e)
 		 {
 			logger.error("[RecipeService] recipeBookMarkInsert Exception", e);
 		 }
 		 
 		 return count;
 	 }
 	 
 	 //레시피 즐겨찾기 여부 확인
 	 public long recipeBookMarkSelect(BookMark bookMark)
 	 {
 		long count = 0;
 		 
 		 try
 		 {
 			 count = recipeInfoDao.recipeBookMarkSelect(bookMark);
 		 }
 		 catch(Exception e)
 		 {
 			logger.error("[RecipeService] recipeBookMarkSelect Exception", e);
 		 }
 		 
 		 return count;
 	 }
 	 
 	 //레시피 즐겨찾기 취소
 	 public int recipeBookMarkDelete(BookMark bookMark)
 	 {
 		 int count = 0;
 		 
 		 try
 		 {
 			 count = recipeInfoDao.recipeBookMarkDelete(bookMark);
 		 }
 		 catch(Exception e)
 		 {
 			logger.error("[RecipeService] recipeBookMarkDelete Exception", e);
 		 }
 		 
 		 return count;
 	 }
 	 
 	 
  	//인덱스 페이지 베스트 레시피 1~8등
   	public List<RecipeInfo> indexBestRecipeList(RecipeInfo recipeInfo)
   	{
   		List<RecipeInfo> indexBestLeftList = null;
   		
   		try
  		 {
   			indexBestLeftList = recipeInfoDao.indexBestRecipeList(recipeInfo);
  		 }
  		 catch(Exception e)
  		 {
  			 logger.error("[RecipeService] indexBestRecipeList Exception", e);
  		 }
   		
   		return indexBestLeftList;
   	}
   	
   	
   	 
   	//인덱스페이지 디저트리스트 8개 
   	public List<RecipeInfo> indexDessertList(RecipeInfo recipeInfo)
   	{
   		List<RecipeInfo> indexDessertList = null;
   		
   		try
  		 {
   			indexDessertList = recipeInfoDao.indexDessertList(recipeInfo);
  		 }
  		 catch(Exception e)
  		 {
  			 logger.error("[RecipeService] indexDessertList Exception", e);
  		 }
   		
   		return indexDessertList;
   		
   	}
   	
   	
   	//인텍스페이지 메인요리 1~8등 
   	public List<RecipeInfo> indexMainDishesList(RecipeInfo recipeInfo)
   	{
   		List<RecipeInfo> indexMainDishesList = null;
   		
   		try
  		 {
   			indexMainDishesList = recipeInfoDao.indexMainDishesList(recipeInfo);
  		 }
  		 catch(Exception e)
  		 {
  			 logger.error("[RecipeService] indexDessertList Exception", e);
  		 }
   		
   		return indexMainDishesList;
   		
   	}
 	 
   	
 	
   
}