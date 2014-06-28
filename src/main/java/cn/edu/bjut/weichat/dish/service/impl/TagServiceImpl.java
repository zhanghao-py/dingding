package cn.edu.bjut.weichat.dish.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.bjut.weichat.core.bo.Tag;
import cn.edu.bjut.weichat.core.mybatis.pagination.PageBean;
import cn.edu.bjut.weichat.dish.dao.TagDao;
import cn.edu.bjut.weichat.dish.service.TagService;

@Service
public class TagServiceImpl implements TagService {

	private Logger logger = Logger.getLogger(TagServiceImpl.class);
	
	@Autowired
	private TagDao tagDao;
	
	@Override
	public List<Tag> loadTags(long dishId) {

		List<Tag> list = null;
		PageBean<Tag> page = new PageBean<Tag>();
		if(dishId < 0)
			return null;
		
		try{
			list = tagDao.loadTags(dishId, page);
		}catch(Exception e){
			logger.warn("", e);
			return null;
		}
		
		return list;
	}

}
