package cn.edu.bjut.weichat.core.util;

public enum Cuisine {
	ONE("鲁菜",1),TWO("苏菜",2),THREE("粤菜",3),FOUR("川菜",4),FIVE("浙菜",5),SIX("闽菜",6),SEVEN("湘菜",7),EIGHT("徽菜",8);
	
	private String name;
	
	private int num;
	
	private Cuisine(String name,int num){
		this.name = name;
		this.num = num;
	}
	
	public String getName(){
		return this.name;
	}
	
	public int getNum(){
		return this.num;
	}
}
