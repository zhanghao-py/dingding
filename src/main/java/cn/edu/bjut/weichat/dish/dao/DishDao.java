package cn.edu.bjut.weichat.dish.dao;

import java.util.List;
import java.util.Map;


import cn.edu.bjut.weichat.core.bo.Dish;

public interface DishDao {

	public List<Dish> selectDishByName(String dishName);

	public List<Dish> selectDishByCategory(int cate, int pageNum, int listNum); // 根据菜品的类别来显示菜品

	public List<Dish> selectDishById(long dishId); // 根据菜品的id来显示菜品
	
	public List<Dish> selectDishByRestId(long restId);  //根据餐厅的id来显示菜品
	
	public List<Dish> selectDishByRestIdAndCategory(Map<String,Object> map); //根据餐厅id和菜品种类来显示菜品
	
}
