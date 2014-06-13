package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Order;


public interface OrderDao {

	public List<Order> getOrders(long userId);
	
	public void addOrder(Order order);
	
	public void deleteOrder(long orderId);
	
}
