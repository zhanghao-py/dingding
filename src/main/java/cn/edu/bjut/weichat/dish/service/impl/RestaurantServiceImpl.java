package cn.edu.bjut.weichat.dish.service.impl;

import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.ObjectUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.common.util.SphericalDistanceCalculator;
import cn.edu.bjut.weichat.core.bo.Restaurant;
import cn.edu.bjut.weichat.core.except.ServiceException;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dao.bean.RestraurantInfo;
import cn.edu.bjut.weichat.dish.dao.RestaurantDao;
import cn.edu.bjut.weichat.dish.service.RestaurantService;


@Service
public class RestaurantServiceImpl implements RestaurantService {

	Logger logger = Logger.getLogger(RestaurantServiceImpl.class);
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	
	@Override
	public List<Restaurant> getRestaurantByRestId(long restId) {

		if(restId > 0){
			PageBean<Restaurant> page = new PageBean<Restaurant>();
			try {
				return restaurantDao.getRestaurantByRestId(restId,page);
			} catch (Exception e) {
				logger.warn("", e);
				return null;
			}
		}
		
		return null;
	}


	@Override
	public List<RestraurantInfo> loadRestraurantInfo() {
		List<RestraurantInfo> list = null;
		PageBean<RestraurantInfo> page = new PageBean<RestraurantInfo>();
		try {
			list = restaurantDao.loadRestraurantInfo(page);
			return list;
		} catch (Exception e) {
			logger.warn("", e);
			return null;
		}
	}


	@Override
	public List<RestraurantInfo> findRearbyRestaurants(double longitude,
			double latitude) throws ServiceException {
		
		if (ObjectUtils.equals(longitude, null) || ObjectUtils.equals(latitude, null)) {
			throw new ServiceException("longitude/latitude can't be null.");
		}
		
		List<RestraurantInfo> rests = loadRestraurantInfo();
		
		for (RestraurantInfo rest : rests) {
			double distance = SphericalDistanceCalculator.distance(longitude, latitude, rest.getLongitude(), rest.getLatitude());
			rest.setDistance(distance);
		}
		
		Collections.sort(rests);
		
		return rests;
	}
	
	

}
