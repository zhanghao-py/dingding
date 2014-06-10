package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Dish;


public interface DishDao {
	
	public List<Dish> selectDishByName(String dishName);
}
