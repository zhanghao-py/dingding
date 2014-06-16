package cn.edu.bjut.weichat.dish.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.ImageOfDish;
import cn.edu.bjut.weichat.dish.dao.ImageOfDishDao;
import cn.edu.bjut.weichat.dish.service.ImageOfDishService;


@Service
public class ImageOfDishServiceImpl implements ImageOfDishService {

	@Autowired
	private ImageOfDishDao imageOfDishDao;
	
	Logger logger = Logger.getLogger(ImageOfDishServiceImpl.class);
	
	
	@Override
	public ImageOfDish getImageByDishId(long dishId) {

		if(dishId < 0)
			return null;
		
		try {
			return imageOfDishDao.getImageByDishId(dishId);
		} catch (Exception e) {
			logger.warn("", e);
			return null;
		}
	}

}
