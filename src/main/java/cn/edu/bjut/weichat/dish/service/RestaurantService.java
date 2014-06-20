package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Restaurant;
import cn.edu.bjut.weichat.dao.bean.RestraurantInfo;

public interface RestaurantService {
	public List<Restaurant> getRestaurantByRestId(long restId);
	
	public List<RestraurantInfo> loadRestraurantInfo();
}
