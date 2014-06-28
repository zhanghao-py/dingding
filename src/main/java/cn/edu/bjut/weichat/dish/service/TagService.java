package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Tag;

public interface TagService {
	
	public List<Tag> loadTags(long dishId);
}
