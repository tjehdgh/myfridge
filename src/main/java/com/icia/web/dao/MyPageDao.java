package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.MyPage;
import com.icia.web.model.RecipeInfo;

@Repository("myPage")
public interface MyPageDao
{
	//내가 찜한 레시피중에서 랜덤으로 3개만 뽑아서 마이페이지 기본 페이지에서 보여줌
	public List<MyPage> randomBookMark(String userId); 
	

}
