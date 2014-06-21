package cn.edu.bjut.weichat.dao.bean;

import java.util.ArrayList;
import java.util.List;

import cn.edu.bjut.weichat.core.bo.Dish;

public class RestraurantInfo {
	private long restId;   //餐厅id
	  
	private String restName;   // 餐厅名称
	
	private String restIntro; //餐厅介绍
	
	private String restAddress;  //餐厅地址
	 
	private String restContact;  // 联系方式
	
	private int avgPrice;  //人均消费
	
	private String imageOfRest;
	 
	private double latitude;  //经度
	
	private double longitude;  //纬度
	
	private List<DishDetail> recommendDishs = new ArrayList<DishDetail>();

	public long getRestId() {
		return restId;
	}

	public void setRestId(long restId) {
		this.restId = restId;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getRestIntro() {
		return restIntro;
	}

	public void setRestIntro(String restIntro) {
		this.restIntro = restIntro;
	}

	public String getRestAddress() {
		return restAddress;
	}

	public void setRestAddress(String restAddress) {
		this.restAddress = restAddress;
	}

	public String getRestContact() {
		return restContact;
	}

	public void setRestContact(String restContact) {
		this.restContact = restContact;
	}

	public int getAvgPrice() {
		return avgPrice;
	}

	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public List<DishDetail> getRecommendDishs() {
		return recommendDishs;
	}

	public void setRecommendDishs(List<DishDetail> recommendDishs) {
		this.recommendDishs = recommendDishs;
	}

	public String getImageOfRest() {
		return imageOfRest;
	}

	public void setImageOfRest(String imageOfRest) {
		this.imageOfRest = imageOfRest;
	}
	
	
}
