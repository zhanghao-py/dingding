package cn.edu.bjut.weichat.dish.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.bo.ImageOfDish;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.core.util.Category;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.OrderList;
import cn.edu.bjut.weichat.dao.bean.OrderOfDetail;
import cn.edu.bjut.weichat.dish.dao.DishDao;
import cn.edu.bjut.weichat.dish.service.ImageOfDishService;
import cn.edu.bjut.weichat.dish.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	
	Logger logger = Logger.getLogger(OrderServiceImpl.class);
	
	@Autowired
	private DishDao dishDao;

	@Override
	public OrderOfDetail getOrderDetail(List<List<String>> list) {
		
		OrderOfDetail ood = new OrderOfDetail();
		PageBean<DishDetail> page = new PageBean<DishDetail>();
		DishDetail dd = null;
		
		
		
		for(int i= 0;i < list.size();i++){
			long dishId = Long.parseLong(list.get(i).get(0));
			int num = Integer.parseInt(list.get(i).get(1));
			
			try {
				dd = dishDao.getDishDetail(dishId, page).get(0);
			} catch (Exception e) {
				logger.warn("", e);
				return null;
			}
			
			dd.setNum(num);
			dd.setSubtotal(dd.getPrice()*num);
			
			String cate = Category.getNameByNum(dd.getCategory());
			
			if(ood.dishs.containsKey(cate))
				ood.dishs.get(cate).add(dd);
			else {
				List<DishDetail> list2 = new ArrayList<DishDetail>();
				list2.add(dd);
				ood.dishs.put(cate,list2);
			}
				
			ood.setTotalPrice(ood.getTotalPrice()+dd.getSubtotal());
		}
		return ood;
	}

}
