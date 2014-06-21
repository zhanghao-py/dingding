package cn.edu.bjut.weichat.dao.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class HistoryDishs {

	private long restId;
	
	private long userId;
	
	private int num;   //判断数据是否加载完。
	
	private List<DishDetail> list;

	private Map<String, HistoryDish> maps = new HashMap<String, HistoryDish>();
	
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

	public List<DishDetail> getList() {
		return list;
	}

	public void setList(List<DishDetail> list) {
		this.list = list;
	}

	public Map<String, HistoryDish> getMaps() {
		return maps;
	}

	public void setMaps(Map<String, HistoryDish> maps) {
		this.maps = maps;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
	
	
}
