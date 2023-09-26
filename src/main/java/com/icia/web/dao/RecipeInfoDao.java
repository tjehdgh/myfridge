package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.BookMark;
import com.icia.web.model.RecipeCooking;
import com.icia.web.model.RecipeInfo;
import com.icia.web.model.RecipeIrdnt;
import com.icia.web.model.RecipeRcm;
import com.icia.web.model.RecipeReply;


@Repository("recipeInfo")
public interface RecipeInfoDao 
{
	//게시물 리스트(조회수)
	public List<RecipeInfo> recipeList(RecipeInfo recipeInfo);
	
	//총 게시물 수
	public long recipeListCount(RecipeInfo recipeInfo);
	
	//게시물 리스트(음식분류코드)
	public List<RecipeInfo> recipeNationList(RecipeInfo recipeInfo);
	
	//레시피 상세조회(INFO)
	public RecipeInfo recipeInfoSelect(int recipeCode);
		
	//레시피 상세조회(재료)
	public List<RecipeIrdnt> recipeIrdntSelect(int recipeCode);
		
	//레시피 상세조회(조리과정)
	public List<RecipeCooking> recipeCookingSelect(int recipeCode);
	
	//레시피 상세조회(부재료)
	public List<RecipeIrdnt> recipeIrdntSelect2(int recipeCode);
	
	//레시피 상세조회시 조회수 증가
	public int recipeReadCntPlus(int recipeCode);
	
	
	//마이페이지 홈에 보여주는 유저가 최근 등록한 레시피 3개
	public List<RecipeInfo> userRecentRegRecipe(String userId);

	//마이페이지 내가 찜한 레시피 리스트
	public List<RecipeInfo> myBookMarkList(RecipeInfo recipeInfo1);
	
	//마이페이지 내가 찜한 레시피 리스트 페이징 처리 하기 위한 찜한거 총개수
	public int bookMarkTotalCount(RecipeInfo recipeInfo);
	//레시피 상세페이지 댓글 등록
	public int recipeReplyInsert(RecipeReply recipeReply);
		
	//레시피 댓글 리스트(레시피 코드별)
	public List<RecipeReply> recipeReplyList(RecipeReply recipeReply);
		
	//레시피 댓글 수(레시피 코드별)
	public long recipeReplyListCount(int recipeCode);
		
	//레시피 추천 등록
	public int recipeRcmInsert(RecipeRcm recipeRcm);
		
	//레시피 추천 여부 확인
	public long recipeRcmCheck(RecipeRcm recipeRcm);
	
	//마이페이지 나만의 레시피 총 게시물 수
	public int myRecipeTotalCount(RecipeInfo recipeInfo);
		
	//마이페이지 나만의 레시피 리스트
	public List<RecipeInfo> myRecipeList(RecipeInfo recipeInfo);
	
	//레시피 추천 삭제
	public int recipeRcmDelete(RecipeRcm recipeRcm);
	
	//레시피 추천시 RECIPE_INFO테이블 추천수 증가
	public int recipeInfoRcmUpdate(int recipeCode);
	
	//레시피 추천시 RECIPE_INFO테이블 추천수 취소
	public int recipeInfoRcmUpdateCancel(int recipeCode);
	
	//레시피 리스트(추천순)
	public List<RecipeInfo> recipeListRcm(RecipeInfo recipeInfo);
	
	//레시피 즐겨찾기 등록
	public int recipeBookMarkInsert(BookMark bookMark);
	
	//레시피 즐겨찾기 여부 확인
	public long recipeBookMarkSelect(BookMark bookMark);
	
	//레시피 즐겨찾기 취소
	public int recipeBookMarkDelete(BookMark bookMark);
	
	//인덱스페이지 베스트 레시피 1~8등  
	public List<RecipeInfo> indexBestRecipeList(RecipeInfo recipeInfo);
	
	//인덱스페이지 디저트리스트 8개
	public List<RecipeInfo> indexDessertList(RecipeInfo recipeInfo);
	
	//인덱스페이지  메인 요리 리스트 8개
	public List<RecipeInfo> indexMainDishesList(RecipeInfo recipeInfo);
		
	
}
