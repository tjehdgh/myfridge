/**

 * <pre>
 * 프로젝트명 : HiBoard
 * 패키지명   : com.icia.web.controller
 * 파일명     : IndexController.java
 * 작성일     : 2021. 1. 21.
 * 작성자     : daekk
 * </pre>
 */
package com.icia.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icia.web.model.RecipeInfo;
import com.icia.web.service.RecipeService;



/**
 * <pre>
 * 패키지명   : com.icia.web.controller
 * 파일명     : IndexController.java
 * 작성일     : 2021. 1. 21.
 * 작성자     : daekk
 * 설명       : 인덱스 컨트롤러
 * </pre>
 */
@Controller("indexController")
public class IndexController
{
	private static Logger logger = LoggerFactory.getLogger(IndexController.class);

	/**
	 * <pre>
	 * 메소드명   : index
	 * 작성일     : 2021. 1. 21.
	 * 작성자     : daekk
	 * 설명       : 인덱스 페이지 
	 * </pre>
	 * @param request  HttpServletRequest
	 * @param response HttpServletResponse
	 * @return String
	 */
	
	
	
	@Autowired
	private RecipeService recipeService;
	
	
	
	@RequestMapping(value = "/index", method=RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		//베스트 레시피 리스트
		List<RecipeInfo> indexBestRecipeList = null;
		//조회 객체
		RecipeInfo list = new RecipeInfo();
		
		//디저트 리스트
		List<RecipeInfo> indexDessertList = null;
		//메인요리 리스트
		List<RecipeInfo> indexMainDishesList = null;
		
		indexBestRecipeList = recipeService.indexBestRecipeList(list);  //베스트 레시피
		indexDessertList = recipeService.indexDessertList(list);		//디저트 리스트
		indexMainDishesList = recipeService.indexMainDishesList(list);	//메인요리 리스트
	
		
		model.addAttribute("indexBestRecipeList", indexBestRecipeList);
		model.addAttribute("indexDessertList", indexDessertList);
		model.addAttribute("indexMainDishesList", indexMainDishesList);
		model.addAttribute("list", list);
		
		return "/index";
	}
}


