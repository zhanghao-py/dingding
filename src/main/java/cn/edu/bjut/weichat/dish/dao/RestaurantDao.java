package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Restaurant;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;

public interface RestaurantDao {
	
	public List<Restaurant> getRestaurantByRestId(@Param("restId")long restId,@Param("page")PageBean<Restaurant> page);
}
