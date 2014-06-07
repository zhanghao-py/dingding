package cn.edu.bjut.weichat.core.bo;

import java.util.Date;

public class Order {

	
	private long orderId;  //订单id
	
	private long restId;  //餐厅id
	
	private long userId;  //用户id
	
	private float totalPrice; //订单总价
	
	private int state;  //是否支付
	
	private String remarks;  // 备注
	
	private Date createTime;  //订单创建时间
	
	private Date payTime;  //支付时间

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

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
	
	
}
