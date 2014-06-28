package cn.edu.bjut.weichat.dish.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.Taste;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dish.dao.TasteDao;
import cn.edu.bjut.weichat.dish.service.TasteService;


@Service
public class TasteServiceImpl implements TasteService {

	private Logger logger = Logger.getLogger(TasteServiceImpl.class);
	
	
	@Autowired
	private TasteDao tasteDao;
	
	
	
	
	@Override
	public List<Taste> loadTaste(long dishId) {

		List<Taste> list =  null;
		PageBean<Taste> page = new PageBean<Taste>();
		
		if(dishId < 0)
			return null;
		
		try {
			
			list = tasteDao.loadTastes(dishId, page);
		} catch (Exception e) {
			logger.warn("", e);
			return null;
		}
		
		return list;
	}

}
