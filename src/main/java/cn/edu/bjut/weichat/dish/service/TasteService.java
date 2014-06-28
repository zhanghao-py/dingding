package cn.edu.bjut.weichat.dish.service;

import java.util.List;

import cn.edu.bjut.weichat.core.bo.Taste;


public interface TasteService {

	
	public List<Taste> loadTaste(long dishId);
}
