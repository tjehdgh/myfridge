package com.icia.web.model;

import java.io.Serializable;

public class RecipeRcm implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String userId;			//유저 아이디
	private int recipeCode;			//레시피 코드
	private String regDate;			//추천수 등록일
	
	public RecipeRcm()
	{
		userId = "";
		recipeCode = 0;
		regDate = "";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRecipeCode() {
		return recipeCode;
	}

	public void setRecipeCode(int recipeCode) {
		this.recipeCode = recipeCode;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
