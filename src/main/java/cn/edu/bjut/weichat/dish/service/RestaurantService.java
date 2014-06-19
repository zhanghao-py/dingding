package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Restaurant;

public interface RestaurantService {
	public List<Restaurant> getRestaurantByRestId(long restId);
}
