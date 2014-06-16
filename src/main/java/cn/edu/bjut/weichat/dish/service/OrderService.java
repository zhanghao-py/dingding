package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import cn.edu.bjut.weichat.dao.bean.OrderList;

public interface OrderService {

	public List<OrderList> getOrderDetail(List<List<String>> list);
}
