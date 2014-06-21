package cn.edu.bjut.weichat.dish.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dish.dao.DishDao;
import cn.edu.bjut.weichat.dish.service.DishService;


@Service
public class DishServiceImpl implements DishService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private DishDao dishDao;

	@Override
	public List<Dish> selectDishByName(String dishName) {
		if (null != dishName){
			try {
				return dishDao.selectDishByName(dishName);
			} catch (Exception e) {
				logger.warn("", e);
				return null;
			}
		}
		else
			return null;
	}

	@Override
	public List<Dish> selectDishByCategory(int cate, int pageNum, int listNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dish> selectDishById(long dishId) {

		if(dishId > 0){
			try{
				return dishDao.selectDishById(dishId);
			}catch(Exception e){
				logger.warn("", e);
				return null;
			}
		}
		
		return null;
	}

	@Override
	public List<DishDetail> selectDishByRestIdAndCategory(long restId, int cate,int pageNum,int listNum) {
		List<DishDetail> list = null;
		if(restId > 0&&cate > 0){
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				PageBean<Dish> page = new PageBean<Dish>();
				
				page.setCurrentPage(pageNum);
				page.setPageSize(listNum);
				
				map.put("restId", restId);
				map.put("cate", cate);
				
				list = dishDao.selectDishByRestIdAndCategory(map,page);
				return list;
			} catch (Exception e) {
				logger.warn("", e);
				return null;
			}
		}
		return null;
	}

	@Override
	public List<DishDetail> getDishDetail(long dishId) {
		List<DishDetail> list = null;
		PageBean<DishDetail> page = new PageBean<DishDetail>();
		
		if(dishId <= 0)
			return null;
		
		try {
			list = dishDao.getDishDetail(dishId,page);
			return list;
		} catch (Exception e) {
			logger.warn("", e);
			return null;
		}			
	}
}
