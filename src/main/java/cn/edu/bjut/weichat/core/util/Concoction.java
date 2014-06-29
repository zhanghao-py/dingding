package cn.edu.bjut.weichat.core.util;

public enum Concoction {

	MEAT("荤菜",1),VEGETABLE("素菜",2);
	
	private String name;
	
	private int num;
	
	private Concoction(String name,int num){
		
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
