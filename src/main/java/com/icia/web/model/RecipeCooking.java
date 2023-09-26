package com.icia.web.model;

import java.io.Serializable;

public class RecipeCooking implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int cookingOrder;			//요리설명순서
	private String cookingImage;		//요리과정 이미지
	private int recipeCode;				//레시피 코드
	private String cookingExplan;		//요리과정 설명
	
	public RecipeCooking()
	{
		cookingOrder = 0;
		cookingImage = "";
		recipeCode = 0;
		cookingExplan = "";
	}

	public int getCookingOrder() {
		return cookingOrder;
	}

	public void setCookingOrder(int cookingOrder) {
		this.cookingOrder = cookingOrder;
	}

	public String getCookingImage() {
		return cookingImage;
	}

	public void setCookingImage(String cookingImage) {
		this.cookingImage = cookingImage;
	}

	public int getRecipeCode() {
		return recipeCode;
	}

	public void setRecipeCode(int recipeCode) {
		this.recipeCode = recipeCode;
	}

	public String getCookingExplan() {
		return cookingExplan;
	}

	public void setCookingExplan(String cookingExplan) {
		this.cookingExplan = cookingExplan;
	}
	
	
}
