package cn.edu.bjut.weichat.core.bo;

public class OrderOfDishes {

	
	private long orderFoodId;  //订单菜品表
	
	private long orderId;   //订单id
	
	private long dishId;  //菜品id
	
	private int num;    //数量
	
	private float subtotal;  //小记

	public long getOrderFoodId() {
		return orderFoodId;
	}

	public void setOrderFoodId(long orderFoodId) {
		this.orderFoodId = orderFoodId;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public long getDishId() {
		return dishId;
	}

	public void setDishId(long dishId) {
		this.dishId = dishId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public float getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	
	
}
