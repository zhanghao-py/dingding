package cn.edu.bjut.weichat.dao.bean;

import java.util.List;

public class SmartCommonDishs {

	private String smartType;
	
	private int smartTypeNum;
	
	private long restId;
	
	private List<DishDetail> dishs;

	public String getSmartType() {
		return smartType;
	}

	public void setSmartType(String smartType) {
		this.smartType = smartType;
	}

	public int getSmartTypeNum() {
		return smartTypeNum;
	}

	public void setSmartTypeNum(int smartTypeNum) {
		this.smartTypeNum = smartTypeNum;
	}

	public long getRestId() {
		return restId;
	}

	public void setRestId(long restId) {
		this.restId = restId;
	}

	public List<DishDetail> getDishs() {
		return dishs;
	}

	public void setDishs(List<DishDetail> dishs) {
		this.dishs = dishs;
	}
	
	
	
}
