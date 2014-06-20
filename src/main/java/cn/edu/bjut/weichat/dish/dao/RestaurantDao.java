package cn.edu.bjut.weichat.dish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.bjut.weichat.core.bo.Restaurant;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dao.bean.RestraurantInfo;

public interface RestaurantDao {
	
	public List<Restaurant> getRestaurantByRestId(@Param("restId")long restId,@Param("page")PageBean<Restaurant> page);
	
	public List<RestraurantInfo> loadRestraurantInfo(@Param("page")PageBean<RestraurantInfo> page);
	
	public void addRestraurant(Restaurant rest);
}
