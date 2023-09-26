package com.icia.web.service;


import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.common.util.*;
import com.icia.web.dao.*;
import com.icia.web.model.*;

@Service("myFridgeService")
public class MyFridgeService {
	 private static Logger logger = LoggerFactory.getLogger(MyFridgeService.class);
	   
	   	//파일 저장 경로
	 	@Value("#{env['upload.save.dir']}")
	 	private String UPLOAD_SAVE_DIR;
	   
	   @Autowired
	   private MyFridgeDao myFridgeDao ;
	   
	   
	   //냉장고 내용 리스트
	   public List<MyFridge> myFridgeList(MyFridge myFridge)
	   {
		   List<MyFridge> list = null;
		   
		   try
		   {
			   list = myFridgeDao.myFridgeList(myFridge);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] myFridge Exception", e);
		   }
		   
		   return list;
	   }
	   
	   //냉장고 내용 집어넣기
	   public int myFridgeInsert(MyFridge myFridge)
	   {
		   int count = 0;
		   
		   try
		   {
			   count = myFridgeDao.myFridgeInsert(myFridge);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] myFridgeInsert Exception", e);
		   }
		   return count ;
	   }
	   
	   //냉장고 내용 삭제
	   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	   public int myFridgeDelete(MyFridge myFridge)
	   {
		   int count = 0;

		   count = myFridgeDao.myFridgeDelete(myFridge);
		   
		
		   return count ;
	   }
	  
	   //나만의 냉장고 수정하기
	   @Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	   public int myFridgeUpdate(MyFridge myfridge)
	   {
		   int count = 0;
		   
		   try
		   {
			   count = myFridgeDao.myFridgeUpdate(myfridge);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] myFridgeUpdate Exception", e);
		   }
		   return count ;
	   }
	   
	   //나만의 냉장고 재료 숫자 가져오기
	   public long myFridgeCount(MyFridge myfridge)
	   {
		   long count = 0;
		   
		   try 
		   {	   
			   count = myFridgeDao.myFridgeCount(myfridge);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] countMyfridge Exception", e);
		   }		   
		   return count;		   
	   }
	   
	   //재료 수 카운트 해주기 
	   public long irdntCount(IrdntInfo irdntInfo)
	   {
		   long count = 0;
		   
		   try 
		   {	   
			   count = myFridgeDao.irdntCount(irdntInfo);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] irdntCount Exception", e);
		   }		   
		   return count;		   
	   }
	   
	   //재료 정보 리스트 가져오기
	   public List<IrdntInfo> irdntInfoList (IrdntInfo irdntInfo)
	   {
		   List<IrdntInfo> list = null;
				   
		   try
		   {
			   list = myFridgeDao.irdntInfoList(irdntInfo);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] irdntInfoList Exception", e);
		   }
		   
		   return list;
	   }
	   
	   //유저 가능 레시피 갯수 가져오기
	   public long possibleRecipeCount(RecipeInfo recipeInfo)
	   {
		   long count = 0;
		   
		   try
		   {
			   count =myFridgeDao.possibleRecipeCount(recipeInfo);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] possibleRecipeCount Exception", e);
		   }
		   return count;
	   }
	   
	   //유저 가능 레시피 정보 리스트
	   public List<RecipeInfo> possibleRecipe(RecipeInfo recipeInfo)
	   {
		   List<RecipeInfo> list = null;
		  
		   try
		   {
			   list = myFridgeDao.possibleRecipe(recipeInfo);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] possibleRecipe Exception", e);
		   }
			
		   return list;
	
	   }
	   
	   public int irdntDuplicate(MyFridge myFridge)
	   {
		   int count = 1;
		  
		   try
		   {
			   count = myFridgeDao.irdntDuplicate(myFridge);
		   }
		   catch(Exception e)
		   {
			   logger.error("[MyFridgeService] irdntDuplicate Exception", e);
		   }
		   return count;
	   }
	   
	   
	   
	   
	   
	   
	   


	   
	   
}
