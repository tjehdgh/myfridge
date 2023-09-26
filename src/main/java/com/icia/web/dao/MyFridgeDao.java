package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.*;


@Repository("myFridgeDao")
public interface MyFridgeDao 
{
	//나만의 냉장고 관련 메소드 
	//유저 아이디 및 서칭 밸류 기준으로 데이터베이스 정보 가져오기 (ID,NAME,AMOUNT)
	public List<MyFridge> myFridgeList(MyFridge myFridge);
	//ID 기준으로 AMOUNT랑 NAME 삽입
	public int myFridgeInsert(MyFridge myfridge);
	//ID 기준으로 AMOUNT랑 NAME 삭제
	public int myFridgeDelete(MyFridge myfridge);
	//ID 기준으로 AMOUNT랑 NAME 수정
	public int myFridgeUpdate(MyFridge myfridge);
	//서칭 밸류 기준으로 ID 에서 재료가 몇개 있는지 반환 해줌
	public long myFridgeCount(MyFridge myfridge);
	//USER_ID 기준 레시피에서 가능한요리 코드 가져오기

	//재료정보 관련 메소드
	//재료 서칭 밸류로 갯수 가져오기
	public long irdntCount(IrdntInfo irdntInfo);
	//재료 정보 리스트에 저장하기
	public List<IrdntInfo> irdntInfoList(IrdntInfo irdntInfo);	
	
	//유저 가능 레시피 관련 메소드 
	//가능한 레시피 코드 가져오기
	public List<RecipeInfo> possibleRecipe(RecipeInfo recipeInfo);
	//밸류 기준으로 
	public long possibleRecipeCount(RecipeInfo recipeInfo);
	
	public int irdntDuplicate(MyFridge myFridge);
	
}
