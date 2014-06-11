package cn.edu.bjut.weichat.core.bo;

public class Dish {
	private long dishId;
	
	private long restId;
	
	private String dishName;
	
	private String material;
	
	private int concoction;
	
	private int categor;
	
	private int cuisine;
	
	private float price;
	
	private int support;

	public long getDishId() {
		return dishId;
	}

	public void setDishId(long dishId) {
		this.dishId = dishId;
	}

	public long getRestId() {
		return restId;
	}

	public void setRestId(long restId) {
		this.restId = restId;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public int getConcoction() {
		return concoction;
	}

	public void setConcoction(int concoction) {
		this.concoction = concoction;
	}

	public int getCategor() {
		return categor;
	}

	public void setCategor(int categor) {
		this.categor = categor;
	}

	public int getCuisine() {
		return cuisine;
	}

	public void setCuisine(int cuisine) {
		this.cuisine = cuisine;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getSupport() {
		return support;
	}

	public void setSupport(int support) {
		this.support = support;
	}
	
	
}
