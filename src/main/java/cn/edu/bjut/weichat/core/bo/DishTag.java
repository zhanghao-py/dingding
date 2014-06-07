package cn.edu.bjut.weichat.core.bo;

public class DishTag {

	private long DishTagId;
	
	private long dishId;
	
	private long tagId;

	public long getDishTagId() {
		return DishTagId;
	}

	public void setDishTagId(long dishTagId) {
		DishTagId = dishTagId;
	}

	public long getDishId() {
		return dishId;
	}

	public void setDishId(long dishId) {
		this.dishId = dishId;
	}

	public long getTagId() {
		return tagId;
	}

	public void setTagId(long tagId) {
		this.tagId = tagId;
	}
	
	
	
}
