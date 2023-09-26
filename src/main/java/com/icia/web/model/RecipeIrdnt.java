package com.icia.web.model;

import java.io.Serializable;

public class RecipeIrdnt implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String irdntAmount;		//재료용량(g)
	private String irdntName;		//재료명
	private int recipeCode;			//레시피 코드
	private int irdntTypeCode;		//재료타입 코드
	
	public RecipeIrdnt()
	{
		irdntAmount = "";
		irdntName = "";
		recipeCode = 0;
		irdntTypeCode = 0;
	}

	public String getIrdntAmount() {
		return irdntAmount;
	}

	public void setIrdntAmount(String irdntAmount) {
		this.irdntAmount = irdntAmount;
	}

	public String getIrdntName() {
		return irdntName;
	}

	public void setIrdntName(String irdntName) {
		this.irdntName = irdntName;
	}

	public int getRecipeCode() {
		return recipeCode;
	}

	public void setRecipeCode(int recipeCode) {
		this.recipeCode = recipeCode;
	}

	public int getIrdntTypeCode() {
		return irdntTypeCode;
	}

	public void setIrdntTypeCode(int irdntTypeCode) {
		this.irdntTypeCode = irdntTypeCode;
	}
}
