package com.icia.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.UserOrder;



@Repository("userOrderDao")
public interface UserOrderDao
{
	//마이페이지 홈 최근 주문내역 3개 보여줌
	public List<UserOrder> myRecentOrderlist(String userId);
	
	//마이페이지 나의 주문 내역 리스트 총개수
	public int myOrderListTotalCount(String userId);
	
	//마이페이지 나의 주문 내역 리스트
	public List<UserOrder> myOrderList(UserOrder userOrder);
	
	
}
