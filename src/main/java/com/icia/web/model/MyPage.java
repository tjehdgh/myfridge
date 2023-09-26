package com.icia.web.model;

import java.io.Serializable;

public class MyPage  implements Serializable
{
	private static final long serialVersionUID = 8638989512396268543L;
	
	
	
	
	//북마크 테이블에 있는 두개컬럼
	private String userId;
	private int recipeCode;
	
	private String recipeIntro;
	private String recipeImage;
	private String recipeName;
	
	
	//생성자
	public MyPage()
	{
		userId = "";
		recipeCode = 0;
		recipeIntro = "";
		recipeName = "";
		recipeImage ="";
		
		
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


	public String getRecipeName() {
		return recipeName;
	}


	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}


	
}
