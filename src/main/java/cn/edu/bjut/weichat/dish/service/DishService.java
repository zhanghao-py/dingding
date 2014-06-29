package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.web.action.dto.StatusInfo;
import cn.edu.bjut.weichat.dao.bean.DishDetail;
import cn.edu.bjut.weichat.dao.bean.SmartChoice;

public interface DishService {

	public List<Dish> selectDishByName(String dishName);
	
	public List<Dish> selectDishByCategory (int cate, int pageNum, int listNum); 
	
	public List<Dish> selectDishById(long dishId);
	
	public List<DishDetail> selectDishByRestIdAndCategory(long restId,int cate,int pageNum,int listNum);

	public List<DishDetail> getDishDetail(long dishId);
	
	
	/**
	 * 智能点餐部分
	 */
	public List<DishDetail> getDishSmart(SmartChoice smartChoice);
}
