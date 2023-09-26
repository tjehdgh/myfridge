package com.icia.web.model;

import java.io.Serializable;

public class RecipeInfo implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int recipeCode;				//레시피 코드
	private String recipeName;			//레시피 이름
	private String recipeQnt;			//분량(인분)
	private String recipeTime;			//조리시간
	private int nationCode;				//유형분류코드(한식, 중식, 일식, 양식 등등)
	private int foodCode;				//음식분류코드(부침, 밥, 찌개, 밑반찬 등등)
	private String regDate;				//레시피 등록일
	private String recipeIntro;			//레시피 간략소개
	private String recipeImage;			//레시피 이미지(썸네일)
	private String userId;				//사용자 아이디
	private int bbsReadCnt;				//레시피 조회수
	private String nationNm;
	private int rcmCnt;					//레시피 추천수
    
    
    
	//sql문에 넣을려고 작성
	private long startRow;				//시작 rownum
	private long endRow;				//끝 rownum
	private String searchType;
	private String searchValue;
	
	public RecipeInfo()
	{
		recipeCode = 0;				
		recipeName = "";			
		recipeQnt = "";			
		recipeTime = "";			
		nationCode = 0;				
		foodCode = 0;				
		regDate = "";				
		recipeIntro = "";			
		recipeImage = "";			
		userId = "";				
		bbsReadCnt = 0;						
		startRow = 0;				
		endRow = 0;	
		searchType = "";
		searchValue = "";
		nationNm = "";
		rcmCnt = 0;
	}

	public int getRcmCnt() {
		return rcmCnt;
	}

	public void setRcmCnt(int rcmCnt) {
		this.rcmCnt = rcmCnt;
	}

	public String getNationNm() {
		return nationNm;
	}

	public void setNationNm(String nationNm) {
		this.nationNm = nationNm;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public int getRecipeCode() {
		return recipeCode;
	}

	public void setRecipeCode(int recipeCode) {
		this.recipeCode = recipeCode;
	}

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public String getRecipeQnt() {
		return recipeQnt;
	}

	public void setRecipeQnt(String recipeQnt) {
		this.recipeQnt = recipeQnt;
	}

	public String getRecipeTime() {
		return recipeTime;
	}

	public void setRecipeTime(String recipeTime) {
		this.recipeTime = recipeTime;
	}

	public int getNationCode() {
		return nationCode;
	}

	public void setNationCode(int nationCode) {
		this.nationCode = nationCode;
	}

	public int getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(int foodCode) {
		this.foodCode = foodCode;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getRecipeIntro() {
		return recipeIntro;
	}

	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}

	public String getRecipeImage() {
		return recipeImage;
	}

	public void setRecipeImage(String recipeImage) {
		this.recipeImage = recipeImage;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBbsReadCnt() {
		return bbsReadCnt;
	}

	public void setBbsReadCnt(int bbsReadCnt) {
		this.bbsReadCnt = bbsReadCnt;
	}

	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public long getEndRow() {
		return endRow;
	}

	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}
	
	
}
