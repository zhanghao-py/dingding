package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Order;


public interface OrderDao {

	public List<Order> getOrders(long userId);
	
	public int addOrder(Order order); //类型改为long就报错
	
	public void deleteOrder(long orderId);
	
}
