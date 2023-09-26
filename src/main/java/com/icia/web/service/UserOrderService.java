package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.web.dao.UserOrderDao;
import com.icia.web.model.UserOrder;

@Service("userOrderService")
public class UserOrderService 
{
	private static Logger logger = LoggerFactory.getLogger(UserOrderService.class);
	
	@Autowired 
	private UserOrderDao userOrderDao;
	
	
	
	//최근 주문내역 3개 마이페이지 홈에서 보여주기
		public List<UserOrder> myRecentOrderlist(String userId)
		{
			List<UserOrder> list = null;
			
			try
			{
				list = userOrderDao.myRecentOrderlist(userId); //찜한 레시피 3개 랜덤으로 가져오기
			}
			catch(Exception e)
			{
				logger.error("[MyPageService] myRecentOrderlist Exception", e);
			}
			
			
			return list;
		}
	
	
}
