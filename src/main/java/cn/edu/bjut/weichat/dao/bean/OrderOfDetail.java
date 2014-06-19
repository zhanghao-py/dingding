package cn.edu.bjut.weichat.dao.bean;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderOfDetail {

	private long restId;

	private long userId = 1;

	private float totalPrice; // 订单总价

	private int state; // 是否支付

	private String remarks = ""; // 备注

	private Date createTime; // 订单创建时间

	private Date payTime; // 支付时间
	
	private String restName;
	
	public Map<String,List<DishDetail>> dishs = new HashMap<String, List<DishDetail>>(); //订单里的菜
	

	public long getRestId() {
		return restId;
	}

	public void setRestId(long restId) {
		this.restId = restId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public Map<String, List<DishDetail>> getDishs() {
		return dishs;
	}

	public void setDishs(Map<String, List<DishDetail>> dishs) {
		this.dishs = dishs;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	
}
