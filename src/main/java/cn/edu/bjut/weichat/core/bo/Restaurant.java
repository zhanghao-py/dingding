package cn.edu.bjut.weichat.core.bo;

public class Restaurant {
	
	
	private long restId;   //餐厅id
	  
	private String restName;   // 餐厅名称
	
	private String restIntro; //餐厅介绍
	
	private String restAddress;  //餐厅地址
	 
	private String restTel;  // 联系方式
	
	private int avgPrice;  //人均消费
	 
	private double latitude;  //经度
	
	private double longitude;  //纬度

	
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

	public String getRestTel() {
		return restTel;
	}

	public void setRestTel(String restTel) {
		this.restTel = restTel;
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
	
	
	
}
