package cn.edu.bjut.weichat.core.bo;

public class Dish {

	private long dishId; // 菜品id
	private long restId; // 餐厅id
	private String dishName; // 菜品名称
	private String material; // 食材
	private int concoction; // 荤素，使用枚举来代替
	private int category; // 菜品种类，使用枚举来代替
	private int cuisine; // 所属菜系，使用枚举代替
	private float price; // 单价
	private int support; // 赞

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
		return category;
	}

	public void setCategor(int categor) {
		this.category = categor;
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
