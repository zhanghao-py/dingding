package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Dish;
import cn.edu.bjut.weichat.core.bo.Taste;
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
	
	
	/**
	 *获取同类型食材的菜品 
	 * @param material 输入的食材
	 * @param restId   餐厅id
	 * @return
	 */
	public List<DishDetail> getSameMatDish(String material,long restId,int pageNum,int pageSize);
	
	
	/**
	 * 获取价格相似的菜品
	 * @param price  菜品价格
	 * @param restId 餐厅id
	 * @return
	 */
	
	public List<DishDetail> getSamePricDish(float price,long restId,int pageNum,int pageSize);
	
	
	
	/**
	 * 获取相似口味的菜品
	 * @param tastes 菜品口味
	 * @param restId 餐厅id
	 * @return
	 */
	
	public List<DishDetail> getSameTasteDish(String taste,long restId,int pageNum,int pageSize);
	
}
