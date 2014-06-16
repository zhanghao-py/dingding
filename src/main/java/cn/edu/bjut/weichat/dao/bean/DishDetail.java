package cn.edu.bjut.weichat.dao.bean;

public class DishDetail {

	private long dishId;

	private long restId;

	private String dishName;

	private String material;

	private int concoction;

	private int category;

	private int cuisine;

	private float price;

	private int support;

	private String imageUrl;
	
	private int salesOfMonth;
	
	private String tasteName;
	
	private String tagName;

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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getSalesOfMonth() {
		return salesOfMonth;
	}

	public void setSalesOfMonth(int salesOfMonth) {
		this.salesOfMonth = salesOfMonth;
	}

	public String getTasteName() {
		return tasteName;
	}

	public void setTasteName(String tasteName) {
		this.tasteName = tasteName;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	

}
