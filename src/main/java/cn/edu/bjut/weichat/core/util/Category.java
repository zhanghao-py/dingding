package cn.edu.bjut.weichat.core.util;

public enum Category {

	COLD("凉菜",1),HOT("热菜",2),STAPLE("主食",3),SOUP("汤",4),WINE("酒水",5);
	
	private String name;
	
	private int num;
	
	private Category(String name,int num){
		
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
