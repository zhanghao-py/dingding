package cn.edu.bjut.weichat.dish.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.namespace.QName;
import javax.xml.stream.Location;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.DTD;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.Order;
import cn.edu.bjut.weichat.core.bo.OrderOfDishes;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.core.util.Category;
import cn.edu.bjut.weichat.core.util.DateFormat;
import cn.edu.bjut.weichat.core.util.OrderState;
import cn.edu.bjut.weichat.dao.bean.AllOrders;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dish.dao.DishDao;
import cn.edu.bjut.weichat.dish.dao.OrderDao;
import cn.edu.bjut.weichat.dish.dao.OrderOfDishesDao;
import cn.edu.bjut.weichat.dish.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	Logger logger = Logger.getLogger(OrderServiceImpl.class);

	@Autowired
	private DishDao dishDao;

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private OrderOfDishesDao orderOfDishesDao;

	@Override
	public OrderOfDetail getOrderDetail(List<List<String>> list) {

		OrderOfDetail ood = new OrderOfDetail();
		PageBean<DishDetail> page = new PageBean<DishDetail>();
		DishDetail dd = null;

		for (int i = 0; i < list.size(); i++) {
			long dishId = Long.parseLong(list.get(i).get(0));
			int num = Integer.parseInt(list.get(i).get(1));

			try {
				dd = dishDao.getDishDetail(dishId, page).get(0);
			} catch (Exception e) {
				logger.warn("", e);
				return null;
			}

			dd.setNum(num);
			dd.setSubtotal(dd.getPrice() * num);

			String cate = Category.getNameByNum(dd.getCategory());

			ood.setRestId(dd.getRestId());

			if (ood.dishs.containsKey(cate))
				ood.dishs.get(cate).add(dd);
			else {
				List<DishDetail> list2 = new ArrayList<DishDetail>();
				list2.add(dd);
				ood.dishs.put(cate, list2);
			}

			ood.setTotalPrice(ood.getTotalPrice() + dd.getSubtotal());
		}
		return ood;
	}

	@Override
	public int addOrder(OrderOfDetail ood) {

		Order order = null;
		OrderOfDishes ofDishes = null;

		if (null == ood) {
			return -1;
		}

		order = new Order();

		order.setUserId(ood.getUserId());
		order.setTotalPrice(ood.getTotalPrice());
		order.setRestId(ood.getRestId());
		order.setState(OrderState.NOTPAY);
		order.setRemarks(ood.getRemarks());
		order.setCreateTime(DateFormat.getCurrentTime());
		order.setPayTime(DateFormat.getCurrentTime());
		try {
			orderDao.addOrder(order);
			Set<Map.Entry<String, List<DishDetail>>> dishSet = ood.dishs
					.entrySet();

			for (Iterator<Map.Entry<String, List<DishDetail>>> iterator = dishSet
					.iterator(); iterator.hasNext();) {

				List<DishDetail> dishs = iterator.next().getValue();

				for (int i = 0; i < dishs.size(); i++) {
					ofDishes = new OrderOfDishes();
					ofDishes.setDishId(dishs.get(i).getDishId());
					ofDishes.setNum(dishs.get(i).getNum());
					ofDishes.setSubtotal(dishs.get(i).getSubtotal());
					ofDishes.setOrderId(order.getOrderId());
					orderOfDishesDao.addDish(ofDishes);
				}
			}

		} catch (Exception e) {
			logger.warn("", e);
			return -1;
		}

		return 1;

	}

	@Override
	public List<AllOrders> getAllOrders(long userId,int pageNum,int listNum) {
		
		List<AllOrders> list = null;
		PageBean<AllOrders> page = new PageBean<AllOrders>();
		
		if(userId <= 0||pageNum < 0||listNum < 0)
			return null;
		
		try {
			page.setPageSize(listNum);
			page.setCurrentPage(pageNum);
			list = orderDao.getAllOrders(userId, page);
		} catch (Exception e) {
			logger.warn("", e);
			return null;
		}
		
		return list;
	}

}
