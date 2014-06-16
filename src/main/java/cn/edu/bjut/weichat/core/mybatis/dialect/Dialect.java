package cn.edu.bjut.weichat.core.mybatis.dialect;

public interface Dialect {

	
	public abstract String getPageSQL(String sql,int offset,int limit);
}
