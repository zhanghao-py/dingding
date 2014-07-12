package cn.edu.bjut.weichat.dao.bean;


import java.util.List;

import cn.edu.bjut.weichat.core.bo.Tag;
import cn.edu.bjut.weichat.core.bo.Taste;

public class DishTagAndTaste {
	private long dishId;
	
	private List<Tag> tags;

	private List<Taste> tastes;

	public long getDishId() {
		return dishId;
	}

	public void setDishId(long dishId) {
		this.dishId = dishId;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Taste> getTastes() {
		return tastes;
	}

	public void setTastes(List<Taste> tastes) {
		this.tastes = tastes;
	}
	
	
}
