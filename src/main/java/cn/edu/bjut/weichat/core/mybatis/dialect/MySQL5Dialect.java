package cn.edu.bjut.weichat.core.mybatis.dialect;

public class MySQL5Dialect implements Dialect {

	@Override
	public String getPageSQL(String sql, int offset, int limit) {

		StringBuffer sb = new StringBuffer();
		sb.append(sql);
		sb.append(" limit ");
		sb.append(offset);
		sb.append(",");
		sb.append(limit);
		return sb.toString();
	}

}