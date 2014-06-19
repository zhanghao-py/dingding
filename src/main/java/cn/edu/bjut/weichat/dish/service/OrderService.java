package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import cn.edu.bjut.weichat.dao.bean.OrderList;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;

public interface OrderService {

	public OrderOfDetail getOrderDetail(List<List<String>> list);

	public int addOrder(OrderOfDetail ood);
}
