package cn.edu.bjut.common.util;

import java.util.regex.PatternSyntaxException;

import org.apache.log4j.Logger;


public class StringUtil {
	
	private static Logger logger = Logger.getLogger(StringUtil.class);
	
	
	/**
	 * 字符串分割函数
	 * @param str  输入待分割的字符串
	 * @param separator  输入分隔符
	 * @return
	 */
	public static String[] splitString(String str,String separator){
		
		//List<String> list = null;
		
		String[] strs = null;
		if(null != str&&null !=separator){
			//list = new ArrayList<String>();
			
			try {
				strs = str.split(separator);	
			} catch (PatternSyntaxException  e) {
				logger.warn("字符串分割出错", e);
				return null;
			}
			
		}
		
		return strs;
	}
}
