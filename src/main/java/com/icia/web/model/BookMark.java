package com.icia.web.model;

import java.io.Serializable;

public class BookMark implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String userId;		//사용자 아이디
	private int recipeCode;		//레시피 코드
	
	public BookMark()
	{
		userId = "";
		recipeCode = 0;
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
}
