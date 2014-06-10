package cn.edu.bjut.weichat.core.util;

public enum Concoction {

	菜MEAT("荤菜",1),VEGETABLE("素材",2);
	
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
