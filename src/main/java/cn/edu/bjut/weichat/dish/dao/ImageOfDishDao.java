package cn.edu.bjut.weichat.dish.dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.ImageOfDish;

public interface ImageOfDishDao {

	
	public ImageOfDish getImageByDishId(@Param("dishId")long dishId);
}
