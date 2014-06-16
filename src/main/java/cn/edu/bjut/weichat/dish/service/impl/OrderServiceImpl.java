package cn.edu.bjut.weichat.dish.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.bo.ImageOfDish;
import cn.edu.bjut.weichat.core.util.Category;
import cn.edu.bjut.weichat.dao.bean.OrderList;
import cn.edu.bjut.weichat.dish.dao.DishDao;
import cn.edu.bjut.weichat.dish.service.ImageOfDishService;
import cn.edu.bjut.weichat.dish.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private DishDao dishDao;
	
	@Autowired
	private ImageOfDishService imageOfDishService;
	
	
	@Override
	public List<OrderList> getOrderDetail(List<List<String>> list) {

		List<OrderList> list2 = new ArrayList<OrderList>();
		OrderList orderList = null;
		
		for(List<String> l:list){
			orderList = new OrderList();
			long dishId = Long.parseLong(l.get(0));
			int num = Integer.parseInt(l.get(1));
			Dish dish = dishDao.selectDishById(100000).get(0);			
			orderList.setCategory(Category.getNameByNum(dish.getCategory()));
			orderList.setCount(num);
			orderList.setDishId(dish.getDishId());
			orderList.setDishName(dish.getDishName());
			orderList.setSubtotal(dish.getPrice()*num);
			
			ImageOfDish imageOfDish = imageOfDishService.getImageByDishId(dishId);
			orderList.setImageUrl(imageOfDish.getImageUrl());
		}
		
		
		
		return null;
	}

}
